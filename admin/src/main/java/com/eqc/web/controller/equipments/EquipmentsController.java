package com.eqc.web.controller.equipments;

import java.util.List;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

import com.eqc.common.core.domain.entity.SysDictType;
import com.eqc.system.domain.Equipments;
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
import com.eqc.system.domain.vo.EquipmentsVo;
import com.eqc.system.domain.bo.EquipmentsBo;
import com.eqc.system.service.IEquipmentsService;
import com.eqc.common.core.page.TableDataInfo;

/**
 * 设备
 *
 * @author yunpeng.zhang
 * @date 2023-12-29
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/equipments")
public class EquipmentsController extends BaseController {

    private final IEquipmentsService iEquipmentsService;

    /**
     * 查询设备列表
     */
    @SaCheckPermission("equipments:list")
    @GetMapping("/list")
    public TableDataInfo<EquipmentsVo> list(EquipmentsBo bo, PageQuery pageQuery) {
        return iEquipmentsService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出设备列表
     */
    @SaCheckPermission("equipments:export")
    @Log(title = "设备", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(EquipmentsBo bo, HttpServletResponse response) {
        List<EquipmentsVo> list = iEquipmentsService.queryList(bo);
        ExcelUtil.exportExcel(list, "设备", EquipmentsVo.class, response);
    }

    /**
     * 获取设备详细信息
     *
     * @param equipmentId 主键
     */
    @SaCheckPermission("equipments:query")
    @GetMapping("/{equipmentId}")
    public R<EquipmentsVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long equipmentId) {
        return R.ok(iEquipmentsService.queryById(equipmentId));
    }

    /**
     * 新增设备
     */
    @SaCheckPermission("equipments:add")
    @Log(title = "设备", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody EquipmentsBo bo) {
        return toAjax(iEquipmentsService.insertByBo(bo));
    }

    /**
     * 修改设备
     */
    @SaCheckPermission("equipments:edit")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody EquipmentsBo bo) {
        return toAjax(iEquipmentsService.updateByBo(bo));
    }

    /**
     * 删除设备
     *
     * @param equipmentIds 主键串
     */
    @SaCheckPermission("equipments:remove")
    @Log(title = "设备", businessType = BusinessType.DELETE)
    @DeleteMapping("/{equipmentIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] equipmentIds) {
        return toAjax(iEquipmentsService.deleteWithValidByIds(Arrays.asList(equipmentIds), true));
    }

    /**
     * 获取设备选择框列表
     */
    @GetMapping("/optionSelect")
    public R<List<EquipmentsVo>> optionSelect() {
        List<EquipmentsVo> equipmentAll = iEquipmentsService.queryList(new EquipmentsBo());
        return R.ok(equipmentAll);
    }
}
