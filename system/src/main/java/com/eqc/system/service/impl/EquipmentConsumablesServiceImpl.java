package com.eqc.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.eqc.common.utils.StringUtils;
import com.eqc.common.core.page.TableDataInfo;
import com.eqc.common.core.domain.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.eqc.system.domain.bo.EquipmentConsumablesBo;
import com.eqc.system.domain.vo.EquipmentConsumablesVo;
import com.eqc.system.domain.EquipmentConsumables;
import com.eqc.system.mapper.EquipmentConsumablesMapper;
import com.eqc.system.service.IEquipmentConsumablesService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

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
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setConsumableId(add.getConsumableId());
        }
        return flag;
    }

    /**
     * 修改设备耗材
     */
    @Override
    public Boolean updateByBo(EquipmentConsumablesBo bo) {
        EquipmentConsumables update = BeanUtil.toBean(bo, EquipmentConsumables.class);
        validEntityBeforeSave(update);
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
}
