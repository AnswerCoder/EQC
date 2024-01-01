package com.eqc.system.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.eqc.common.annotation.ExcelDictFormat;
import com.eqc.common.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;

import java.io.Serializable;

/**
 * 设备耗材视图对象 equipment_consumables
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
@Data
@ExcelIgnoreUnannotated
public class EquipmentConsumablesVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long consumableId;

    /**
     * 设备id
     */
    @ExcelProperty(value = "设备id")
    private Long equipmentId;

    /**
     * 耗材名称
     */
    @ExcelProperty(value = "耗材名称")
    private String consumableName;

    /**
     * 耗材编号
     */
    @ExcelProperty(value = "耗材编号")
    private String consumableNo;

    /**
     * 开始使用时间
     */
    @ExcelProperty(value = "开始使用时间")
    private Date activationTime;

    /**
     * 使用期效
     */
    @ExcelProperty(value = "使用期效")
    private Integer validity;

    /**
     * 使用期效单位
     */
    @ExcelProperty(value = "使用期效单位")
    private String validityUint;

    /**
     * 负责人，到期后通知其更换
     */
    @ExcelProperty(value = "负责人，到期后通知其更换")
    private Long chargeUser;

    /**
     * 状态 0正在使用，1已报废 2未使用过
     */
    @ExcelProperty(value = "状态 0正在使用，1已报废 2未使用过")
    private Integer status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
