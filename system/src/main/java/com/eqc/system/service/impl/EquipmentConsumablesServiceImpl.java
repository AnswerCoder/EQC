package com.eqc.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.eqc.common.utils.DateUtils;
import com.eqc.common.utils.StreamUtils;
import com.eqc.common.utils.StringUtils;
import com.eqc.common.core.page.TableDataInfo;
import com.eqc.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.eqc.common.utils.email.MailUtils;
import com.eqc.system.domain.dto.ConsumableNoticeDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.eqc.system.domain.bo.EquipmentConsumablesBo;
import com.eqc.system.domain.vo.EquipmentConsumablesVo;
import com.eqc.system.domain.EquipmentConsumables;
import com.eqc.system.mapper.EquipmentConsumablesMapper;
import com.eqc.system.service.IEquipmentConsumablesService;

import java.time.LocalDate;
import java.util.*;

/**
 * 设备耗材Service业务层处理
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
@RequiredArgsConstructor
@Service
public class EquipmentConsumablesServiceImpl implements IEquipmentConsumablesService {

    private final EquipmentConsumablesMapper baseMapper;

    /**
     * 查询设备耗材
     */
    @Override
    public EquipmentConsumablesVo queryById(Long consumableId){
        return baseMapper.selectVoById(consumableId);
    }

    /**
     * 查询设备耗材列表
     */
    @Override
    public TableDataInfo<EquipmentConsumablesVo> queryPageList(EquipmentConsumablesBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<EquipmentConsumables> lqw = buildQueryWrapper(bo);
        Page<EquipmentConsumablesVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询设备耗材列表
     */
    @Override
    public List<EquipmentConsumablesVo> queryList(EquipmentConsumablesBo bo) {
        LambdaQueryWrapper<EquipmentConsumables> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<EquipmentConsumables> buildQueryWrapper(EquipmentConsumablesBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<EquipmentConsumables> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getEquipmentId() != null, EquipmentConsumables::getEquipmentId, bo.getEquipmentId());
        lqw.like(StringUtils.isNotBlank(bo.getConsumableName()), EquipmentConsumables::getConsumableName, bo.getConsumableName());
        lqw.eq(StringUtils.isNotBlank(bo.getConsumableNo()), EquipmentConsumables::getConsumableNo, bo.getConsumableNo());
        lqw.eq(bo.getActivationTime() != null, EquipmentConsumables::getActivationTime, bo.getActivationTime());
        lqw.eq(bo.getValidity() != null, EquipmentConsumables::getValidity, bo.getValidity());
        lqw.eq(StringUtils.isNotBlank(bo.getValidityUint()), EquipmentConsumables::getValidityUint, bo.getValidityUint());
        lqw.eq(bo.getChargeUser() != null, EquipmentConsumables::getChargeUser, bo.getChargeUser());
        lqw.eq(bo.getStatus() != null, EquipmentConsumables::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增设备耗材
     */
    @Override
    public Boolean insertByBo(EquipmentConsumablesBo bo) {
        EquipmentConsumables add = BeanUtil.toBean(bo, EquipmentConsumables.class);
        validEntityBeforeSave(add);
        //计算到期时间
        add.setDueTime(calDueTime(add.getActivationTime(),add.getValidity(), add.getValidityUint()));
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setConsumableId(add.getConsumableId());
        }
        return flag;
    }

    /**
     * 计算到期时间 忽略开始时间的时分秒 计算后时间的当天0点设为到期时间
     * @param activationTime 开始使用时间
     * @param validity 使用期效
     * @param validityUint 使用期效单位 Y年 M月 D天
     * @return
     */
    private Date calDueTime(Date activationTime, Long validity, String validityUint){
        if (activationTime == null || validity == null || StringUtils.isBlank(validityUint)){
            return null;
        }
        Date dueTime;
        switch (validityUint) {
            case "Y":
                dueTime = DateUtils.addYears(activationTime, validity.intValue());
                break;
            case "M":
                dueTime =  DateUtils.addMonths(activationTime, validity.intValue());
                break;
            case "D":
                dueTime =  DateUtils.addDays(activationTime, validity.intValue());
                break;
            default:
                return null;
        }
        return DateUtils.beginOfDay(dueTime);
    }

    /**
     * 修改设备耗材
     */
    @Override
    public Boolean updateByBo(EquipmentConsumablesBo bo) {
        EquipmentConsumables update = BeanUtil.toBean(bo, EquipmentConsumables.class);
        validEntityBeforeSave(update);
        update.setDueTime(calDueTime(update.getActivationTime(),update.getValidity(), update.getValidityUint()));
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(EquipmentConsumables entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除设备耗材
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 设备到期提醒 提前七天开始提醒
     */
    @Override
    public void dueNotice() {
        //当前时间+7天
        String subject = "设备耗材即将到期提醒";
        Date date = DateUtils.addDays(DateUtils.beginOfDay(DateUtils.getNowDate()), 7);
        List<ConsumableNoticeDto> consumableNotices = baseMapper.selectNoticeList(date);
        Map<Long, List<ConsumableNoticeDto>> userNoticeMap = StreamUtils.groupByKey(consumableNotices, ConsumableNoticeDto::getChargeUser);

    }
}
