<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        table {
            border-top: 1px solid #333;
            border-left: 1px solid #333;
            border-spacing: 0;
            background-color: #fff;
            width: 100%
        }
        table tr td, th {
            border-bottom: 1px solid #333;
            border-right: 1px solid #333;
            font-size: 13px;
            padding: 5px;
            text-align: left;
        }
        table tr {
            height: 18px
        }
        .xl69 {
            background: #e74c3c
        }
    </style>
</head>
<body style="padding: 10px;">
Dear ${nickName} :
<div style="padding-left: 20px;">
<p><strong>以下设备耗材即将到达使用效期或已过使用效期，请及时处理！</strong></p>
<table style="width:833pt">
    <thead>
        <tr style="background:#3498db;">
            <th>耗材编号</th>
            <th>耗材名称</th>
            <th>所属设备</th>
            <th>所属设备序列号</th>
            <th>设备所属科室</th>
            <th>设备所在位置</th>
            <th>开始使用时间</th>
            <th>到期时间</th>
        </tr>
    </thead>
    <tbody>
    <#if overDueNotices ?? && (overDueNotices ?size > 0) >
        <tr>
            <th colspan="8" style="background:#f56c6c;text-align: center;">已过期</th>
        </tr>
        <#list overDueNotices as consumable >
            <tr>
                <td>${consumable.consumableNo}</td>
                <td>${consumable.consumableName}</td>
                <td>${consumable.equipmentName}</td>
                <td>${consumable.equipmentNo}</td>
                <td>${consumable.equipmentDept}</td>
                <td>${consumable.equipmentLocation}</td>
                <td>${consumable.activationTime?string("yyyy-MM-dd")}</td>
                <td style="background: #e74c3c">${consumable.dueTime?string("yyyy-MM-dd")}</td>
            </tr>
        </#list>
    </#if>
    <#if dueNotices ?? && (dueNotices ?size > 0) >
        <tr>
            <th colspan="8" style="background:#e6a23c;text-align: center;">即将到期</th>
        </tr>
        <#list dueNotices as consumable >
            <tr>
                <td>${consumable.consumableNo}</td>
                <td>${consumable.consumableName}</td>
                <td>${consumable.equipmentName}</td>
                <td>${consumable.equipmentNo}</td>
                <td>${consumable.equipmentDept}</td>
                <td>${consumable.equipmentLocation}</td>
                <td>${consumable.activationTime?string("yyyy-MM-dd")}</td>
                <td style="background: #ebb768">${consumable.dueTime?string("yyyy-MM-dd")}</td>
            </tr>
        </#list>
    </#if>
    </tbody>
</table>
</div>
<hr>
<p style="font-size: 13px;"><i>该邮件为系统自动发送，请勿回复</i></p>
</body>
</html>
