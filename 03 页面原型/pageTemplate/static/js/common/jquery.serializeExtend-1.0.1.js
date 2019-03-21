(function($){
	
	/*
	 *  参数说明：
	 *  multi：默认值'string'，checkbox 多选时，将选中的值拼接至一个字符串。可设置为'arry'，将多选的数据存入数组
	 *  separator：默认值","，checkbox 多选时，字符串拼接分隔符，只有multi='string'才起作用
	 *  prefix：前缀，默认值","，例如：设定prefix='index_'，获取表单 <input name="123index_username"> 时，会过滤掉name属性'index_'之前的内容，所以最终取值为{username:''}
	 *  Suffix：后缀，默认值","，例如：设定Suffix='_index'，获取表单 <input name="username_index123"> 时，会过滤掉name属性'index_'之后的内容，所以最终取值为{username:''}
	 *  reset：默认值true，执行 fillData 填充表单数据时，是否先清空表单，默认清空，该参数只对函数 fillData 有效
	 */
	var defaultSetting = {
		multi:'string',
		separator:',',
		prefix:'',
		Suffix:'',
		'reset':true
	}
	
	/*
	 * jquery对象拓展
	 */
	$.fn.extend({
		// 将某个容器内的表单元素重置，清空
		'reset': function() {
			$(this).find(":input[type!='button'][type!='file'][type!='image'][type!='radio'][type!='checkbox'][type!='reset'][type!='submit']").val("");
			$(this).find(":checkbox,:radio").prop("checked",false);
			$(this).filter(":input[type!='button'][type!='file'][type!='image'][type!='radio'][type!='checkbox'][type!='reset'][type!='submit']").val("");
			$(this).filter(":checkbox,:radio").prop("checked",false);
			return $(this);
		},
		// 返回某个容器内的表单 Json 数据
		'getJsonData': function(setting) {
			// 参数设置
			setting = generateSetting(setting); 
			// 返回数据
			var jsonData = {};
			// 获取表单元素
			var formElements = $(this).find(":input:not(:file):not(:image):not(:reset):not(:button):not(:submit)[name]");
			// 遍历所有表单元素
			formElements.each(function(){
				// 表单元素名称
				var name = $(this).attr("name");
				// key 值（移除 name 的前缀和后缀）
				var key = generateKey(name,setting);
				// 表单元素值
				var val = $.trim($(this).val());
				// 当为 checkbox 时
				if ($(this).is(":checkbox")) {
					// checkbox 为多选时（有多个相同 name 的 checkbox）,将选中的值存入数组或拼接字符串
					if (formElements.filter(":checkbox[name='"+name+"']").length > 1){
						// 将选中的值拼接至字符串，以逗号分割
						if (setting.multi == 'string'){
							var str = jsonData.hasOwnProperty(key) ? jsonData[key] : "";
							jsonData[key] = str;
							
							if ($(this).is(":checked")){
								str += (str.length > 0) ? (setting.separator + val) : val;
								jsonData[key] = str;
							}
						}
						// 将选中的值加入数组
						else {
							var arry = jsonData[key] ? jsonData[key] : [];
							jsonData[key] = arry;
							
							if ($(this).is(":checked")){
								arry.push(val);
								jsonData[key] = arry;
							}
						}
					}
					// checkbox 为单选时
					else {
						jsonData[key] = "";
						if ($(this).is(":checked")){
							jsonData[key] = val;
						}
					}
				}
				// 当为 radio 时
				else if ($(this).is(":radio")){
					// 所有相同name的radio均为选中时，设置默认值""
					if (formElements.filter(":radio:checked[name='"+name+"']").length == 0){
						jsonData[key] = "";
					}
					if ($(this).is(":checked")){
						jsonData[key] = val;
					}
				}
				// 其他情况
				else {
					jsonData[key] = val;
				}
			});
		
			return jsonData;
		},
		// 逐行获取 table 内的数据 
		'getTableData':function(setting){
			// 参数设置
			setting = generateSetting(setting); 
			var tableData = []; 
			// 遍历 table 下的每一个 tr
			$(this).find("tbody:first tr").each(function(){
				// 获取每一个tr中的数据
				var trData = $(this).getJsonData(setting);
				// tr中数据不为空时，将数据添加至数组 tableData
				if (!$.isEmptyObject(trData)) {
					tableData.push(trData);
				}
			});
			return tableData;
		},
		// 填充数据
		'fillData':function(jsonData,setting){
			// 获取表单元素
			var formElements = $(this).find(":input:not(:file):not(:image):not(:reset):not(:button):not(:submit)[name]");
			// 参数设置
			setting = generateSetting(setting); 
			// 是否清空表单，默认自动清空
			if (setting['reset']){
				$(this).reset();
			}
			// 传入的json数据非空时
			if (jsonData && $.type(jsonData) == 'object' && !$.isEmptyObject(jsonData)) {
				
				var repeatJson = {};
				// 遍历容器内所有表单元素
				formElements.each(function(){
					// 表单元素名称
					var name = $(this).attr("name");
					// jsonData key 值（移除 name 的前缀和后缀）
					var key = generateKey(name,setting);
					
					if (repeatJson[name]) {
						return true;
					}
					
					if (jsonData.hasOwnProperty(key)){
						// 当表单元素为 radio 时
						if ($(this).is(":radio")) {
							// 取消 radio 选中状态
							formElements.filter(":radio[name='"+name+"']").prop("checked",false);
							// 选中 radio
							formElements.filter(":radio[name='"+name+"'][value="+jsonData[key]+"]").prop("checked",true);
						}
						// 当表单元素为 checkbox 时
						else if ($(this).is(":checkbox")){
							// 取消 checkbox 选中状态
							formElements.filter(":checkbox[name='"+name+"']").prop("checked",false);
							var checkBoxData = jsonData[key];
							if ($.type(checkBoxData) == 'array'){
								$.each(checkBoxData, function(i, val){
									formElements.filter(":checkbox[name='"+name+"'][value="+val+"]").prop("checked",true);
								});
							}
							else if($.type(checkBoxData) == 'string'){
								$.each(checkBoxData.split(setting.separator), function(i, val){
									formElements.filter(":checkbox[name='"+name+"'][value="+val+"]").prop("checked",true);
								});
							}
							else {
								formElements.filter(":checkbox[name='"+name+"'][value="+checkBoxData+"]").prop("checked",true);
							}
						}
						// 其他情况
						else {
							$(this).val(jsonData[key]);
						}
						
						repeatJson[name] = true;
					}
				});
			}
			return $(this);
		}
	});
	
	// 生成 setting，合并 defaultSetting 与 setting
	function generateSetting(setting){
		setting = ($.type(setting) == 'object' && !$.isEmptyObject(setting)) ? setting : {};
		return $.extend({},defaultSetting, setting); ;
	}
	
	/*
	 * 内部函数区块
	 */
	// 生成 Json key，移除 name 的前缀和后缀
	function generateKey(name,setting){
		// 前缀不为空时，移除前缀
		if (setting.prefix != '') {
			name = name.substring(name.indexOf(setting.prefix) + 1);
		}
		// 后缀不为空时，移除后缀
		if (setting.Suffix != '') {
			var lastIndex = name.lastIndexOf(setting.Suffix);
			if (lastIndex != -1){
				name = name.substring(0,name.lastIndexOf(setting.Suffix));
			}
		}
		return name;
	}
	
})(jQuery);