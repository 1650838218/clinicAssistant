/** 菜单管理 */
//@ sourceURL=oneLevel.js
layui.use(['form', 'eleTree', 'jquery', 'layer', 'table', 'ajax'], function () {
    var $ = layui.jquery;
    var eleTree = layui.eleTree;
    var form = layui.form;
    var layer = layui.layer;
    var table = layui.table;
    var ajax = layui.ajax;
    var leftTableId = 'left-table';
    var currentDictId = '';
    var rootMapping = '/system/dictionary/manyLevel';

    // 初始化表格
    table.render({
        elem: '#left-table',
        url: rootMapping + '/selectAllLazy',
        limit: 30,// 每个字典类型最多可以录入30个字典项
        cols: [[
            {field: 'manyLevelTypeName', title: '多级字典'}
        ]]
    });
});