package com.eqc.system.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.eqc.common.annotation.ExcelDictFormat;
import com.eqc.common.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;

import java.io.Serializable;

/**
 * 设备视图对象 equipments
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
@Data
@ExcelIgnoreUnannotated
public class EquipmentsVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ExcelProperty(value = "主键")
    private Long equipmentId;

    /**
     * 设备名称
     */
    @ExcelProperty(value = "设备名称")
    private String equipmentName;

    /**
     * 设备序列号
     */
    @ExcelProperty(value = "设备序列号")
    private String equipmentNo;

    /**
     * 设备供应商
     */
    @ExcelProperty(value = "设备供应商")
    private String equipmentSupplier;

    /**
     * 所属科室
     */
    @ExcelIgnore
    private Long department;

    /**
     * 所属科室
     */
    @ExcelProperty(value = "所属科室")
    private String departmentName;

    /**
     * 所在位置
     */
    @ExcelProperty(value = "所在位置")
    private String location;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
