package com.eqc.system.mapper;

import com.eqc.system.domain.EquipmentConsumables;
import com.eqc.system.domain.dto.ConsumableNoticeDto;
import com.eqc.system.domain.vo.EquipmentConsumablesVo;
import com.eqc.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 设备耗材Mapper接口
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
public interface EquipmentConsumablesMapper extends BaseMapperPlus<EquipmentConsumablesMapper, EquipmentConsumables, EquipmentConsumablesVo> {

    /**
     * 获取即将到期需要提醒的耗材 到期时间处于 beginDate 和 endDate 之间的耗材
     * @param beginDate
     * @param endDate
     * @return
     */
    List<ConsumableNoticeDto> selectNoticeList(@Param("beginDate") Date beginDate,@Param("endDate") Date endDate);

}
