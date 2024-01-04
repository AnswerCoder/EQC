package com.eqc.system.domain.bo;

import com.eqc.common.core.validate.AddGroup;
import com.eqc.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.eqc.common.core.domain.BaseEntity;

/**
 * 设备耗材业务对象 equipment_consumables
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class EquipmentConsumablesBo extends BaseEntity {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空", groups = { EditGroup.class })
    private Long consumableId;

    /**
     * 设备id
     */
    @NotNull(message = "设备id不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long equipmentId;

    /**
     * 耗材名称
     */
    @NotBlank(message = "耗材名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String consumableName;

    /**
     * 耗材编号
     */
    //@NotBlank(message = "耗材编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String consumableNo;

    /**
     * 开始使用时间
     */
    //@NotNull(message = "开始使用时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date activationTime;

    /**
     * 使用期效
     */
    //@NotNull(message = "使用期效不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long validity;

    /**
     * 使用期效单位
     */
    //@NotBlank(message = "使用期效单位不能为空", groups = { AddGroup.class, EditGroup.class })
    private String validityUint;

    /**
     * 负责人，到期后通知其更换
     */
    //@NotNull(message = "负责人，到期后通知其更换不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long chargeUser;

    /**
     * 状态 0正在使用，1已报废 2未使用过
     */
    @NotNull(message = "状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 备注
     */
    private String remark;


}
