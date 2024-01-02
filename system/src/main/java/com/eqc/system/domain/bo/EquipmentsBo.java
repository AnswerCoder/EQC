package com.eqc.system.domain.bo;

import com.eqc.common.core.validate.AddGroup;
import com.eqc.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.eqc.common.core.domain.BaseEntity;

/**
 * 设备业务对象 equipments
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class EquipmentsBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long equipmentId;

    /**
     * 设备名称
     */
    @NotBlank(message = "设备名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String equipmentName;

    /**
     * 设备序列号
     */
    //@NotBlank(message = "设备序列号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String equipmentNo;

    /**
     * 设备供应商
     */
    //@NotBlank(message = "设备供应商不能为空", groups = { AddGroup.class, EditGroup.class })
    private String equipmentSupplier;

    /**
     * 所属科室
     */
    //@NotBlank(message = "所属科室不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long department;

    /**
     * 所在位置
     */
    //@NotBlank(message = "所在位置不能为空", groups = { AddGroup.class, EditGroup.class })
    private String location;

    /**
     * 备注
     */
    //@NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;


}
