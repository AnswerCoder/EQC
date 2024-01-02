package com.eqc.system.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.eqc.common.core.domain.BaseEntity;

/**
 * 设备对象 equipments
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("equipments")
public class Equipments extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键
     */
    @TableId(value = "equipment_id")
    private Long equipmentId;
    /**
     * 设备名称
     */
    private String equipmentName;
    /**
     * 设备序列号
     */
    private String equipmentNo;
    /**
     * 设备供应商
     */
    private String equipmentSupplier;
    /**
     * 所属科室
     */
    private Long department;
    /**
     * 所在位置
     */
    private String location;
    /**
     * 备注
     */
    private String remark;

}
