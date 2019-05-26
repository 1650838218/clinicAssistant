layui.define(['lodash', 'axios', 'jquery', 'form'], function (exports) {
    var _ = layui.lodash,
        axios = layui.axios,
        form = layui.form;
        $ = layui.jquery;
    var utils = {
        error: function (msg) {
            console.error(msg);
        },
        oneOf: function (value, validList) {
            var flag = false;
            _.forEach(validList, function (item, index) {
                if (item === value) {
                    flag = true;
                }
            })
            return flag;
        },
        // 本地存储相关
        localStorage: {
            getItem: function (key) {
                return JSON.parse(localStorage.getItem(key));
            },
            setItem: function (key, data) {
                var d = (typeof data === 'object' || typeof data === 'array') ?
                    JSON.stringify(data) : data;
                localStorage.setItem(key, d);
            },
            removeItem: function (key) {
                localStorage.removeItem(key);
            },
            clear: function () {
                localStorage.clear();
            }
        },
        /**
         * 在一个数组里面查询一个对象
         * var r = 1;
         * var arr = [{name:'a',id:1},{name:'b',id:2}]
         * var result = utils.find(arr,function(item){
         *   return r === item.id;
         * });
         *  // result : {name:'a',id:1}
         */
        find: function (arr, callback) {
            return arr[_.findKey(arr, callback)];
        },
        // 读取模板
        tplLoader: function (url, callback, onerror) {
            var that = this;
            var data = '';
            // TODO 跨域未实现
            axios.get(url + '?v=' + new Date().getTime())
                .then(function (res) {
                    data = res.data;
                    var regList = [];
                    // 重置id 防止冲突
                    var ids = data.match(/id=\"\w*\"/g);
                    ids !== null && _.forEach(ids, function (item) {
                        regList.push(item);
                    });
                    // 重置lay-filter 防止冲突
                    var filters = data.match(/lay-filter=\"\w*\"/g);
                    filters !== null && _.forEach(filters, function (item) {
                        regList.push(item);
                    });

                    if (regList.length > 0) {
                        // 循环替换
                        _.forEach(regList, function (item) {
                            var matchResult = item.match(/\"\w*\"/);
                            if (matchResult !== undefined && matchResult != null && matchResult.length > 0) {
                                var result = matchResult[0];
                                var regStr = result.substring(1, result.length - 1);
                                var reg = new RegExp(regStr, 'g');
                                data = data.replace(reg, that.randomCode());
                            }
                        });
                    }
                })
                .catch(function (error) {
                    var request = error.request;
                    var errorMsg = '读取模板出现异常，异常代码：' + request.status + '、 异常信息：' + request.statusText;
                    console.log(errorMsg);
                    typeof onerror === 'function' && onerror(errorMsg);
                });

            var interval = setInterval(function () {
                if (data !== '') {
                    clearInterval(interval);
                    callback(data);
                }
            }, 50);
        },
        setUrlState: function (title, url) {
            history.pushState({}, title, url);
        },
        // 获取随机字符
        randomCode: function () {
            return 'r' + Math.random().toString(36).substr(2);
        },
        isFunction: function (obj) {
            return typeof obj === 'function';
        },
        isString: function (obj) {
            return typeof obj === 'string';
        },
        isObject: function (obj) {
            return typeof obj === 'object';
        },
        isNotNull: function (obj) {
            // 判断字符串不为空
            return obj !== null && obj !== undefined && obj !== '';
        },
        isNotEmpty: function (obj) {
            // 判断数组不空
            return obj !== null && obj !== undefined && obj.length > 0;
        },
        clearForm: function (elem) {
            $(elem).find(":input[type!='button'][type!='file'][type!='image'][type!='radio'][type!='checkbox'][type!='reset'][type!='submit']").val("");
            $(elem).find(":checkbox,:radio").prop("checked",false);
            $(elem).filter(":input[type!='button'][type!='file'][type!='image'][type!='radio'][type!='checkbox'][type!='reset'][type!='submit']").val("");
            $(elem).filter(":checkbox,:radio").prop("checked",false);
        },
        // 拼接下拉框option，数据来源于数据字典；elem：select JQuery对象，dictTypekey：字典键
        splicingOption: function (param) {
            var config = {
                elem: '',//select JQuery对象
                tips: '',// 提示信息
                realValueName: 'dictItemValue',
                displayValueName: 'dictItemName',
                url: '/system/dictionary/oneLevel/getItemByKey',
                where: {},
                defaultValue: ''
            };
            config = $.extend({}, config, param);
            if (!this.isNotNull(config.elem) || !(config.elem instanceof $)) return;
            if (!this.isNotNull(config.url)) return;
            $.getJSON(config.url, config.where, function (list) {
                var optionHtml = '';
                if (config.tips)  optionHtml += '<option value="">' + config.tips + '</option>';
                if (list != null && list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        if (list[i][config.realValueName] == config.defaultValue) {
                            optionHtml += '<option value="' + list[i][config.realValueName] + '" selected>' + list[i][config.displayValueName] + '</option>';
                        } else {
                            optionHtml += '<option value="' + list[i][config.realValueName] + '">' + list[i][config.displayValueName] + '</option>';
                        }
                    }
                }
                config.elem.html(optionHtml);
                form.render('select');
            });
        }
    };

    //输出utils接口
    exports('utils', utils);
});