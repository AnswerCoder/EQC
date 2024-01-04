package com.eqc.system.service;

import com.eqc.system.domain.EquipmentConsumables;
import com.eqc.system.domain.vo.EquipmentConsumablesVo;
import com.eqc.system.domain.bo.EquipmentConsumablesBo;
import com.eqc.common.core.page.TableDataInfo;
import com.eqc.common.core.domain.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 设备耗材Service接口
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
public interface IEquipmentConsumablesService {

    /**
     * 查询设备耗材
     */
    EquipmentConsumablesVo queryById(Long consumableId);

    /**
     * 查询设备耗材列表
     */
    TableDataInfo<EquipmentConsumablesVo> queryPageList(EquipmentConsumablesBo bo, PageQuery pageQuery);

    /**
     * 查询设备耗材列表
     */
    List<EquipmentConsumablesVo> queryList(EquipmentConsumablesBo bo);

    /**
     * 新增设备耗材
     */
    Boolean insertByBo(EquipmentConsumablesBo bo);

    /**
     * 修改设备耗材
     */
    Boolean updateByBo(EquipmentConsumablesBo bo);

    /**
     * 校验并批量删除设备耗材信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 设备到期提醒
     */
    void dueNotice();

}
