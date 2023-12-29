package com.eqc.system.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.eqc.common.core.domain.BaseEntity;

/**
 * 设备耗材对象 equipment_consumables
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("equipment_consumables")
public class EquipmentConsumables extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "consumable_id")
    private Long consumableId;
    /**
     * 设备id
     */
    private Long equipmentId;
    /**
     * 耗材名称
     */
    private String consumableName;
    /**
     * 耗材编号
     */
    private String consumableNo;
    /**
     * 开始使用时间
     */
    private Date activationTime;
    /**
     * 使用期效
     */
    private Long validity;
    /**
     * 使用期效单位
     */
    private String validityUint;
    /**
     * 负责人，到期后通知其更换
     */
    private Long chargeUser;
    /**
     * 状态 0正在使用，1已报废 2未使用过
     */
    private Long status;
    /**
     * 备注
     */
    private String remark;

}
