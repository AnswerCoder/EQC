package com.eqc.web.controller.equipments;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.eqc.common.annotation.RepeatSubmit;
import com.eqc.common.annotation.Log;
import com.eqc.common.core.controller.BaseController;
import com.eqc.common.core.domain.PageQuery;
import com.eqc.common.core.domain.R;
import com.eqc.common.core.validate.AddGroup;
import com.eqc.common.core.validate.EditGroup;
import com.eqc.common.core.validate.QueryGroup;
import com.eqc.common.enums.BusinessType;
import com.eqc.common.utils.poi.ExcelUtil;
import com.eqc.system.domain.vo.EquipmentConsumablesVo;
import com.eqc.system.domain.bo.EquipmentConsumablesBo;
import com.eqc.system.service.IEquipmentConsumablesService;
import com.eqc.common.core.page.TableDataInfo;

/**
 * 设备耗材
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/equipment/consumables")
public class EquipmentConsumablesController extends BaseController {

    private final IEquipmentConsumablesService iEquipmentConsumablesService;

    /**
     * 查询设备耗材列表
     */
    @SaCheckPermission("equipments:list")
    @GetMapping("/list")
    public TableDataInfo<EquipmentConsumablesVo> list(EquipmentConsumablesBo bo, PageQuery pageQuery) {
        return iEquipmentConsumablesService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出设备耗材列表
     */
    @SaCheckPermission("equipments:export")
    @Log(title = "设备耗材", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(EquipmentConsumablesBo bo, HttpServletResponse response) {
        List<EquipmentConsumablesVo> list = iEquipmentConsumablesService.queryList(bo);
        ExcelUtil.exportExcel(list, "设备耗材", EquipmentConsumablesVo.class, response);
    }

    /**
     * 获取设备耗材详细信息
     *
     * @param consumableId 主键
     */
    @SaCheckPermission("equipments:query")
    @GetMapping("/{consumableId}")
    public R<EquipmentConsumablesVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long consumableId) {
        return R.ok(iEquipmentConsumablesService.queryById(consumableId));
    }

    /**
     * 新增设备耗材
     */
    @SaCheckPermission("equipments:add")
    @Log(title = "设备耗材", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody EquipmentConsumablesBo bo) {
        return toAjax(iEquipmentConsumablesService.insertByBo(bo));
    }

    /**
     * 修改设备耗材
     */
    @SaCheckPermission("equipments:edit")
    @Log(title = "设备耗材", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody EquipmentConsumablesBo bo) {
        return toAjax(iEquipmentConsumablesService.updateByBo(bo));
    }

    /**
     * 删除设备耗材
     *
     * @param consumableIds 主键串
     */
    @SaCheckPermission("equipments:remove")
    @Log(title = "设备耗材", businessType = BusinessType.DELETE)
    @DeleteMapping("/{consumableIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] consumableIds) {
        return toAjax(iEquipmentConsumablesService.deleteWithValidByIds(Arrays.asList(consumableIds), true));
    }
}
