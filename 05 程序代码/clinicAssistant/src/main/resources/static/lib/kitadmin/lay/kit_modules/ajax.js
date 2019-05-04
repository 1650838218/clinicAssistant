/*jquery 自定义ajax*/

layui.define(["jquery", "layer"], function (exports) {
    var $ = layui.jquery;
    var layer = layui.layer;

    var MOD_NAME = "ajax";

    //外部接口
    var ajax = {
        // ajax发送get请求，可设置非异步，返回JSON数据
        getJSONAsync: function (url, data, callback, isAsync) {
            // shift arguments if data argument was omitted
            if ($.isFunction(data)) {
                isAsync = isAsync || callback;
                callback = data;
                data = undefined;
            }

            return $.ajax({
                type: 'GET',
                url: url,
                data: data,
                success: callback,
                async: isAsync,
                dataType: "JSON"
            });
        },
        // ajax发送post请求，返回JSON数据
        postJSON: function (url, data, callback, elem) {
            // shift arguments if data argument was omitted
            if ($.isFunction(data)) {
                elem = elem || callback;
                callback = data;
                data = undefined;
            }
            
            if (!(elem instanceof $)) {
                elem = $(elem);
            }
            elem.addClass('layui-btn-disabled');// 按钮禁用，防止重复提交
            elem.attr('disabled', 'disabled');

            return $.ajax({
                type: 'POST',
                url: url,
                data: JSON.stringify(data),
                success: callback,
                dataType: "JSON",
                contentType: 'application/json',
                error: function (e) {
                    layer.msg(MSG.save_fail);
                    console.log(e);
                },
                complete: function () {
                    elem.removeClass('layui-btn-disabled');// 按钮可用
                    elem.removeAttr('disabled');
                }
            });
        },
        // 发送delete请求，参数一般绑定到url中
        delete: function (url, callback) {
            return $.ajax({
                type: 'DELETE',
                url: url,
                success: callback,
                error: function () {
                    layer.msg(MSG.delete_fail);
                }
            });
        }
    }

    exports(MOD_NAME, ajax);
});
