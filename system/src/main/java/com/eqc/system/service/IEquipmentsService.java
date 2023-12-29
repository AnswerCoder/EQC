package com.eqc.system.service;

import com.eqc.system.domain.Equipments;
import com.eqc.system.domain.vo.EquipmentsVo;
import com.eqc.system.domain.bo.EquipmentsBo;
import com.eqc.common.core.page.TableDataInfo;
import com.eqc.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 设备Service接口
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
public interface IEquipmentsService {

    /**
     * 查询设备
     */
    EquipmentsVo queryById(Long equipmentId);

    /**
     * 查询设备列表
     */
    TableDataInfo<EquipmentsVo> queryPageList(EquipmentsBo bo, PageQuery pageQuery);

    /**
     * 查询设备列表
     */
    List<EquipmentsVo> queryList(EquipmentsBo bo);

    /**
     * 新增设备
     */
    Boolean insertByBo(EquipmentsBo bo);

    /**
     * 修改设备
     */
    Boolean updateByBo(EquipmentsBo bo);

    /**
     * 校验并批量删除设备信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
