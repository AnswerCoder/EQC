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
import com.eqc.system.domain.bo.EquipmentsBo;
import com.eqc.system.domain.vo.EquipmentsVo;
import com.eqc.system.domain.Equipments;
import com.eqc.system.mapper.EquipmentsMapper;
import com.eqc.system.service.IEquipmentsService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 设备Service业务层处理
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
@RequiredArgsConstructor
@Service
public class EquipmentsServiceImpl implements IEquipmentsService {

    private final EquipmentsMapper baseMapper;

    /**
     * 查询设备
     */
    @Override
    public EquipmentsVo queryById(Long equipmentId){
        return baseMapper.selectVoById(equipmentId);
    }

    /**
     * 查询设备列表
     */
    @Override
    public TableDataInfo<EquipmentsVo> queryPageList(EquipmentsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Equipments> lqw = buildQueryWrapper(bo);
        Page<EquipmentsVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询设备列表
     */
    @Override
    public List<EquipmentsVo> queryList(EquipmentsBo bo) {
        LambdaQueryWrapper<Equipments> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<Equipments> buildQueryWrapper(EquipmentsBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Equipments> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getEquipmentName()), Equipments::getEquipmentName, bo.getEquipmentName());
        lqw.eq(StringUtils.isNotBlank(bo.getEquipmentNo()), Equipments::getEquipmentNo, bo.getEquipmentNo());
        lqw.eq(StringUtils.isNotBlank(bo.getEquipmentSupplier()), Equipments::getEquipmentSupplier, bo.getEquipmentSupplier());
        lqw.eq(StringUtils.isNotBlank(bo.getDepartment()), Equipments::getDepartment, bo.getDepartment());
        lqw.eq(StringUtils.isNotBlank(bo.getLocation()), Equipments::getLocation, bo.getLocation());
        return lqw;
    }

    /**
     * 新增设备
     */
    @Override
    public Boolean insertByBo(EquipmentsBo bo) {
        Equipments add = BeanUtil.toBean(bo, Equipments.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setEquipmentId(add.getEquipmentId());
        }
        return flag;
    }

    /**
     * 修改设备
     */
    @Override
    public Boolean updateByBo(EquipmentsBo bo) {
        Equipments update = BeanUtil.toBean(bo, Equipments.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(Equipments entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除设备
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
