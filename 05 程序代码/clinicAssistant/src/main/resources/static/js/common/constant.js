/*js常量*/

/**
 * button名称
 * @type {{}}
 */
var BTN = {
    add: '添加',
    create: '新建',
    edit: '编辑',
    delete: '删除',
    download: '下载',
    upload: '上传',
    save: '保存',
    save_and_create: '保存并新建',
    cancel: '取消',
    reset: '重置',
    close: '关闭',
    operation: '操作'
};

var TABLE_COLUMN = {
    numbers: '序号',
    operation: '操作'
}

/**
 * 提示信息
 * @type
 */
var MSG = {
    system_exception: '系统异常，请联系系统管理员！',
    select_one: '请先选择一条记录！',
    save_success: '保存成功！',
    save_fail: '保存失败！',
    delete_confirm: '确认删除',
    delete_success: '删除成功！',
    delete_fail: '删除失败！',
    query_success: '查询成功！',
    query_fail: '查询失败！'
};

// 用来计算右侧面板高度，右侧面板高度与窗口高度的差值
var RIGHT_PANEL_HIGHT_DIFF = 92;
// 用来计算左侧表格高度，左侧表格高度与窗口高度的差值
var LEFT_TABLE_HIGHT_DIFF = 140;