package com.eqc.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.eqc.common.annotation.DataColumn;
import com.eqc.common.annotation.DataPermission;
import com.eqc.common.core.domain.entity.SysDept;
import com.eqc.common.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 部门管理 数据层
 *
 * @author Lion Li
 */
public interface SysDeptMapper extends BaseMapperPlus<SysDeptMapper, SysDept, SysDept> {

    /**
     * 查询部门管理数据
     *
     * @param queryWrapper 查询条件
     * @return 部门信息集合
     */
    @DataPermission({
        @DataColumn(key = "deptName", value = "dept_id")
    })
    List<SysDept> selectDeptList(@Param(Constants.WRAPPER) Wrapper<SysDept> queryWrapper);

    /**
     * 根据角色ID查询部门树信息
     *
     * @param roleId            角色ID
     * @param deptCheckStrictly 部门树选择项是否关联显示
     * @return 选中部门列表
     */
    List<Long> selectDeptListByRoleId(@Param("roleId") Long roleId, @Param("deptCheckStrictly") boolean deptCheckStrictly);

    /**
     * 查询部门树结构信息
     * (不做数据权限校验，查询全部部门，用于下拉列表展示)
     *
     * @param queryWrapper 查询条件
     * @return 部门信息集合
     */
    List<SysDept> selectDeptOption(@Param(Constants.WRAPPER) Wrapper<SysDept> queryWrapper);
}
