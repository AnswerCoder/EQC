/*
 * @(#) ConsumableNoticeDto.java
 *
 * Copyright ⓒ 2024 rebound
 */
package com.eqc.system.domain.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * ConsumableNoticeDto 耗材到期通知Dto对象
 *
 * @author yunpeng.zhang
 * @version 1.0 2024/1/4
 */
@Data
public class ConsumableNoticeDto implements Serializable {
    /**
     * 主键
     */
    private Long consumableId;
    /**
     * 设备
     */
    private Long equipmentId;
    private String equipmentNo;
    private String equipmentName;
    private String equipmentDept;
    private String equipmentLocation;
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
     * 到期时间
     */
    private Date dueTime;
    /**
     * 负责人，到期后通知其更换
     */
    private Long chargeUser;
    private String chargeUserName;
    private String chargeNickName;
    private String chargeUserEmail;
    private String chargeUserPhonenumber;
    /**
     * 状态 0正在使用，1已报废 2未使用过
     */
    private String status;
    /**
     * 备注
     */
    private String remark;
}
