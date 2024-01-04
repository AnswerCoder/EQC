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
     * 获取即将到期需要提醒的耗材
     * @param date 与到期时间相比较，查询出距离到期时间还有一段时间的耗材
     * @return
     */
    List<ConsumableNoticeDto> selectNoticeList(@Param("date") Date date);

}
