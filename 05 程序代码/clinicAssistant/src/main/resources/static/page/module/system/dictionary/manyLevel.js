/** 菜单管理 */
//@ sourceURL=manyLevel.js
layui.use(['form', 'utils', 'jquery', 'layer', 'table', 'ajax'], function () {
    var $ = layui.jquery;
    var eleTree = layui.eleTree;
    var form = layui.form;
    var layer = layui.layer;
    var table = layui.table;
    var ajax = layui.ajax;
    var utils = layui.utils;
    var leftTableId = 'left-table';
    var rootMapping = '/system/dictionary/manyLevel';

    // 初始化表格
    table.render({
        elem: '#left-table',
        url: rootMapping + '/selectAllLazy',
        limit: 300,// 每个字典类型最多可以录入30个字典项
        cols: [[
            {field: 'dictTypeName', title: '多级字典'}
        ]],
        done: function (res, curr, count) {
            // 选中当前行
            var dictTypeId = $('#dictionary-info input[name="dictTypeId"]').val();
            if (utils.isNotNull(dictTypeId)) {
                var tableData = table.cache[leftTableId];
                if (utils.isNotEmpty(tableData)) {
                    for (var i = 0; i < tableData.length; i++) {
                        if (parseInt(tableData[i].dictTypeId) == parseInt(dictTypeId)) {
                            var rowIndex = tableData[i][table.config.indexName];
                            $('.left-panel .layui-table tbody tr[data-index="' + rowIndex + '"]').find('div').addClass('select');
                        }
                    }
                } 
            }
            
        }
    });

    // ztree 设置
    var setting = {
        view: {
            showLine: false,
            showIcon: false,
            expandSpeed: "normal"
        },
        data: {
            key: {
                name: "nodeName"
            },
            simpleData: {
                enable: true,
                idKey: "nodeId",
                pIdKey: "parentNodeId",
                rootPId: null
            }
        },
        edit: {
            drag: {},
            editNameSelectAll: true,
            enable: true,
            removeTitle: BTN.delete,
            renameTitle: BTN.edit
        },
        callback: {
            onClick: function (event, treeId, treeNode) {
                var treeObj = $.fn.zTree.getZTreeObj(treeId);
                if (treeObj != null) treeObj.expandNode(treeNode);
            }
        }
    };
    // 初始化ztree 字典内容树
    $.fn.zTree.init($("#dict-node-tree"), setting, []);


    // 新增 多级字典
    $('#add-btn').click(function () {
        utils.clearForm('#dictionary-info');// 清空表单
        $.fn.zTree.init($('#dict-node-tree'), setting, null);
    });

    // 删除 多级字典
    $('#del-btn').click(function () {
        layer.confirm(MSG.delete_confirm + '该多级字典吗？',{icon: 0}, function () {
            var dictTypeId = $('#dictionary-info input[name="dictTypeId"]').val();
            if (dictTypeId != null && dictTypeId != undefined && dictTypeId != '') {
                ajax.delete(rootMapping + '/delete/' + dictTypeId, function (success) {
                    if (success) {
                        layer.msg(MSG.delete_success);
                        table.reload(leftTableId, {});
                        utils.clearForm('#dictionary-info');
                        $.fn.zTree.init($('#dict-node-tree'), setting, null);
                    } else {
                        layer.msg(MSG.delete_fail);
                    }
                });
            }
        });
    });

    // 字典内容 新增节点
    $('#add-node-btn').click(function () {
        var treeObj = $.fn.zTree.getZTreeObj('dict-node-tree');
        if (treeObj == null) return;
        var selectedNodes = treeObj.getSelectedNodes();
        var newNode = {
            dictItemId: null,
            nodeId: null,
            parentNodeId: null,
            nodeName: '新增节点',
            sequenceNumber: null
        };
        var addNode = '';
        if (selectedNodes == null || selectedNodes.length <= 0) {
            addNode = treeObj.addNodes(null, newNode);
        } else {
            addNode = treeObj.addNodes(selectedNodes[0], newNode);
        }
        treeObj.editName(addNode[0]);
    });

    // 表单自定义校验规则
    form.verify({
        repeat: function (value, item) { //value：表单的值、item：表单的DOM对象
            var inputName = $(item).attr('name');
            var url = '';
            var msg = '';
            var data = {};
            data[inputName] = value.trim();
            data.dictTypeId = $('#dictionary-info input[name="dictTypeId"]').val();
            if (inputName === 'dictTypeName') {
                url = rootMapping + '/repeatTypeName';
                msg = '字典名称已被占用，请重新填写！';
            } else if (inputName === 'dictTypeKey') {
                url = rootMapping + '/repeatTypeKey';
                msg = '字典键已被占用，请重新填写！';
            }
            if (utils.isNotNull(url)) {
                ajax.getJSONAsync(url, data, function (result) {
                    if (result) msg = '';
                }, false);
            }
            return msg;
        },
        regExp: function (value, item) {
            var inputName = $(item).attr('name');
            var msg = '';
            var reg = '';
            if (inputName === 'dictTypeKey') {
                reg = /^[a-zA-Z][a-zA-Z_]*$/;
                msg = '字典键以英文字母开头，只能输入字母和下划线，请重新填写！';
            }
            if (!!msg && !reg.test(value)) {
                return msg;
            }
        }
    });

    // 保存
    form.on('submit(submit-btn)', function (data) {
        var formData = data.field;
        var treeObj = $.fn.zTree.getZTreeObj('dict-node-tree');
        if (treeObj != null) {
            var nodes = treeObj.getNodes();
            if (utils.isNotEmpty(nodes)) {
                var manyLevelNodeList = transformToArray(nodes, '');
                formData.manyLevelNodeList = manyLevelNodeList;
                ajax.postJSON(rootMapping + '/save', formData, function (dictManyLevelType) {
                    if (dictManyLevelType != null && utils.isNotNull(dictManyLevelType.dictTypeId)) {
                        getById(dictManyLevelType.dictTypeId);
                        layer.msg(MSG.save_success);
                        table.reload(leftTableId,{});
                    } else {
                        layer.msg(MSG.save_fail);
                    }
                }, data.elem);
            } else {
                layer.msg('字典内容不能为空！', {icon: 5, shift: 6});
            }
        } else {
            layer.msg('字典内容不能为空！', {icon: 5, shift: 6});
        }
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });

    // 递归获取多级字典树节点数据
    function transformToArray(nodes, parentNodeId) {
        if (!nodes) return [];
        var r = [];
        if (Array.isArray(nodes)) {
            for (var i = 0, l = nodes.length; i < l; i++) {
                var node = nodes[i];
                _do(node, parentNodeId);
            }
        } else {
            _do(nodes, parentNodeId);
        }
        return r;

        function _do(_node, parentNodeId) {
            var dictItem = {};
            dictItem.dictItemId = _node.dictItemId;
            dictItem.sequenceNumber = _node.getIndex();
            dictItem.nodeId = parentNodeId + (dictItem.sequenceNumber + 1) + '|';
            dictItem.parentNodeId = parentNodeId;
            dictItem.nodeName = _node.nodeName;
            r.push(dictItem);
            var children = node.children;
            if (children) {
                r = r.concat(transformToArray(children, dictItem.nodeId));
            }
        }
    }

    // 取消
    $('#cancel-btn').click(function () {
        var dictTypeId = $('#dictionary-info input[name="dictTypeId"]').val();
        if (dictTypeId !== null && dictTypeId !== undefined && dictTypeId !== '') {
            getById(dictTypeId);// 重新查询
        } else {
            utils.clearForm('#dictionary-info');// 清空表单
        }
    });

    // 监听行单击事件
    table.on('row(left-table)', function (obj) {
        $('.left-panel .layui-table tbody tr div').removeClass('select');
        $(obj.tr).find('div').addClass('select');
        // 获取id，根据ID查询多级字典，表单设置值
        var dictTypeId = obj.data.dictTypeId;
        getById(dictTypeId);

    });

    // 根据id查询多级字典
    function getById(dictTypeId) {
        if (utils.isNotNull(dictTypeId)) {
            $.getJSON(rootMapping + '/getById', {dictTypeId: dictTypeId}, function (dictManyLevelType) {
                if (dictManyLevelType != null) {
                    console.log(dictManyLevelType);
                    form.val('dictionary-form', {
                        dictTypeId: dictManyLevelType.dictTypeId,
                        dictTypeName: dictManyLevelType.dictTypeName,
                        dictTypeKey: dictManyLevelType.dictTypeKey
                    });
                    // 重新加载树 字典内容
                    $.fn.zTree.init($('#dict-node-tree'), setting, dictManyLevelType.manyLevelNodeList);
                    var treeObj = $.fn.zTree.getZTreeObj('dict-node-tree');
                    treeObj.expandAll(true);
                }
            });
        }
    }
});