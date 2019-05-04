$(function(){
    var setting = {
        data:{//表示tree的数据格式
            simpleData:{
                enable:true,//表示使用简单数据模式
                idKey:"id",//设置之后id为在简单数据模式中的父子节点关联的桥梁
                pidKey:"pId",//设置之后pid为在简单数据模式中的父子节点关联的桥梁和id互相对应
                rootId:"null"//pid为null的表示根节点
            }
        },
        view:{//表示tree的显示状态
            selectMulti:false,//表示禁止多选
            addHoverDom: addHoverDom, //当鼠标移动到节点上时，显示用户自定义控件  
            removeHoverDom: removeHoverDom, //离开节点时的操作
			showLine:false,
			showIcon:false
        },
        check:{//表示tree的节点在点击时的相关设置
            enable:true,//是否显示radio/checkbox
            chkStyle:"checkbox",//值为checkbox或者radio表示
            checkboxType:{ "Y": "p", "N": "s" },//表示父子节点的联动效果
            radioType:"level"//设置tree的分组
        },
        edit:{
            enable: true, //单独设置为true时，可加载修改、删除图标  
            editNameSelectAll: false,  
        },
        callback:{//表示tree的一些事件处理函数
            beforeDrag:null,
            beforeDragOpen:null,
            beforeDrop:null,
            beforeEditName:null,
            beforeRename:zTreeBeforeRename,
            onDrag:null,
            onDragMove:null,
            onDrop:null,
            onRename:null,
            beforeRemove: zTreeBeforeRemove           
        },
        usericon:{
            // 折叠icon
            OPEN: "open fa ftopen fa-folder-open", // 打开文件图标
            CLOSE: "close fa ftclose fa-folder",   // 折叠文件图标
            OPENDK:'open fa fa-caret-right tree-minus',  // 打开状态图标
            CLOSEZD:'close fa fa-caret-down tree-plus', // 折叠状态图标
            DOCU: "docu",
            // 子节点图标
            CHILDRENNODE: "fa-book",
            // 复选框图标
            UNFACHECK: "fa fa-check",
            FACHECKED: "fa fa-times",
            // 编辑图标
            EDIT: "fa-pencil-square-o",
            // 移除图标
            REMOVE: "fa-eraser",
            // 增加节点图标
            ADDNODE: "fa-plus-square",
            DOCU: "docu"
        }
    };
    var data = {
        teacher:[
            {id:0,name:"数学系",sex:"小班",open:true},
            {id:1,name:"语文系",sex:"中班",open:true},
            {id:2,name:"小说文",sex:"大班",open:true}
        ],
        student:[
            {id:0,name:"几何",sex:"小班",tId:0},
            {id:0,name:"微积分",sex:"小班",tId:0,open:true},
            {id:2,name:"文言文",sex:"中班",tId:1},
            {id:3,name:"唐诗",sex:"中班",tId:1},
            {id:4,name:"燃烧的男孩",sex:"大班",tId:2},
            {id:5,name:"直到最后一句文",sex:"大班",tId:2}
        ]
    }
    function initTree(){
        var teacherList = data.teacher;
        var studentList = data.student;
        var treeData = [
        ];
        treeData.push({id:"root",name:"书架",pId:null,open:true});
        treeData.push({id:"111",name:"微小分",pId:"s0",tId: "", level: 0});
        treeData.push({id:"111",name:"微小分2",pId:"s0",tId: "", level: 0});
        treeData.push({id:"111",name:"微小分3",pId:"s0",tId: "", level: 0});
        treeData.push({id:"111",name:"微积分分",pId:"s0",tId: "", level: 0});
        for(var i=0,il=teacherList.length;i<il;i++){
            teacherList[i].pId = "root";
            treeData.push(teacherList[i]);
        }
        for(var i=0,il=studentList.length;i<il;i++){
    　　　　studentList[i].id = "s"+studentList[i].id;
            studentList[i].pId = studentList[i].tId;
            treeData.push(studentList[i]);
        }
        
        $.fn.zTree.init($("#homeTree"),setting,treeData);
    }
    initTree();

    function zTreeBeforeRename(treeId, treeNode, newName, isCancel) {
        var n = newName.length;
        var isTrue;
        newName.length>0?null:alert("节点名称不能为空！");
        return newName.length>0;
    }
    function zTreeBeforeRemove(treeId, treeNode) {
       var thisTxt = $("#" + treeNode.tId + "_span").text();
       var isDel =  confirm("确认删除“" + thisTxt  + "”吗？");
       return isDel;
    }
    var newCount = 1;
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");

        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).index()>0) return;
        var addStr = "<span class='button add fa "+setting.usericon.ADDNODE+"' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();' style='position: relative;font-size:15px;padding-left: 8px;color: #9ec508;top: 9px;'></span>"; //定义添加按钮  
        sObj.after(addStr); //加载添加按钮  
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) btn.bind("click", function(){
            var zTree = $.fn.zTree.getZTreeObj("tree");
            zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
            console.log(treeNode.id);
            return false;
        });  
    };
    // 移除增加节点按钮  
    function removeHoverDom(treeId, treeNode) {  
        $("#addBtn_"+treeNode.tId).unbind().remove();  
    };


    // 地区搜索
    var parentArray = [];
    var childArray = [];

    // 递归获取目标节点所有父节点
    function getParentsNode(treeNode){
        var thisParentNode = treeNode.getParentNode(); //得到该节点的父节点
        if( thisParentNode != null ){ // 父节点存在
            parentArray.push(thisParentNode); // 储存至数组
            getParentsNode(thisParentNode); // 重调 
        }else{
            return false;
        }           
    }
    // 递归获取目标节点所有子节点
    function getChildrenNode(treeNode){
        var thisIsParent = treeNode.isParent; // 获取目标节点 isParent 属性，判断是否为父节点
        if( thisIsParent == true ){
            var thisChildrenNode = treeNode.children; // 得到该节点的子节点集合
            for(var i=0;i<thisChildrenNode.length;i++){
                childArray.push(thisChildrenNode[i]); // 将该子节点加入数组中
                getChildrenNode(thisChildrenNode[i]); // 重调       
            }
        }else{
            return false;
        }
    }
    //匹配节点
    function matchNode(treeNode,num){
        var inputArea = $("input[name='searchArea']");
        var name = treeNode.name;
        var entityCode = treeNode.entity_code|| '';
        var val = inputArea.val(); // 获取检索值
        var numName = name.indexOf(val);
        var numCode = entityCode.indexOf(val);
        var num = -1;
        if( numName != -1 || numCode !=-1 ){
            num = 1;
        }
        if( numName == -1 && numCode == -1 ){
            num = -1;   
        }
        return num;
    }
    // 节点匹配成功
    function checkTrueArray(arr,treeNode){
        var thisTid = treeNode.tId;
        var thisLi = $("#"+thisTid);
        for(var n=0;n<arr.length;n++){
            var thisNodeId = arr[n].tId;
            var thisNodeLi = $("#"+thisNodeId);
            thisLi.show();
            thisNodeLi.show();
        }
    }
    // 节点匹配失败
    function checkFalseArray(arr,treeNode){
        var result = [];
        var result2 = [];
        var thisTid = treeNode.tId;
        var thisLi = $("#"+thisTid);
        var val = inputArea.val(); // 获取检索值
        var thisParent =  treeNode.getParentNode();  // 获取目标节点父节点
        if( thisParent != null ){  // 有父节点
            var thisBrotherArr =  treeNode.getParentNode().children; // 得到包含自身的兄弟数组
            for(var m=0;m<arr.length;m++){ // 匹配父节点
                var num = matchNode(arr[m]);
                if( num != -1 ){
                    result.push(arr[m]);
                }
            }
            var resultLength = result.length;
            for( var m=0;m<thisBrotherArr.length;m++ ){ // 匹配兄弟节点
                var num = matchNode(thisBrotherArr[m]);
                if( num != -1 ){
                    result2.push(thisBrotherArr[m]);
                }
            }
            var resultLength2 = result2.length;
            // 对于自身匹配失败的节点，要显示必须满足有父节点匹配成功，且兄弟级节点都匹配失败
            if( (resultLength == 0 && resultLength2 == 0) || resultLength2 != 0 ){
                thisLi.hide();
            }
            if( resultLength !=0 && resultLength2 == 0 ){
                thisLi.show();
            }
        }else{
            thisLi.hide();
        }    
    }
    // 目标节点匹配失败 目标节点即有父节点又有子节点
    function checkAllArray(arr,arr2,treeNode){
        var result = [];
        var result2 = [];
        var thisTid = treeNode.tId;
        var thisLi = $("#"+thisTid);
        var val = inputArea.val(); // 获取检索值
        for(var m=0;m<arr.length;m++){ // 匹配子节点或父节点
            var num = matchNode(arr[m]);
            if( num != -1 ){
                result.push(arr[m]); // 匹配成功储存至数组
            }
        }
        var resultLength = result.length; // 获取匹配成功后返回的数组长度
        for(var m=0;m<arr2.length;m++){ // 匹配子节点或父节点
            var num = matchNode(arr2[m]);
            if( num != -1 ){
                result2.push(arr2[m]); // 匹配成功储存至数组
            }
        }
        var resultLength2 = result2.length; // 获取匹配成功后返回的数组长度
        if( resultLength == 0 && resultLength2 == 0 ){ // 子节点和父节点都匹配失败
            thisLi.hide();
        }else{ 
            thisLi.show(); // 有一种匹配成功或都匹配成功
        }
    }
    function searchArea(treeId, treeNode){ // 定义搜索方法
        var inputArea = $("input[name='searchArea']");
        var val = inputArea.val(); // 获取检索值
        var treeObj=$.fn.zTree.getZTreeObj("homeTree"); // 设置根节点
        var node = treeObj.getNodes(); // 获取根节点
        var nodes = treeObj.transformToArray(node); // 获取所有节点
        console.log(nodes);
        for(var i=0;i<nodes.length;i++){
            var thisNodePid = nodes[i].pId;
            var thisParentNode =  
            parentArray = [];
            childArray = [];
            getParentsNode(nodes[i]); // 获取目标节点所有父节点 返回数组
            getChildrenNode(nodes[i]); // 获取目标节点所有子节点 返回数组
            var num = matchNode(nodes[i]);
            if( nodes[i].isParent == false ){ 
                if( num != -1 ){
                    checkTrueArray(parentArray,nodes[i]);
                }else{
                    checkFalseArray(parentArray,nodes[i]);
                }
            }
            if( nodes[i].isParent == true ){
                if( num != -1 ){
                    checkTrueArray(parentArray,nodes[i]);  
                    checkTrueArray(childArray,nodes[i]);                  
                }else{
                    checkAllArray(parentArray,childArray,nodes[i]);
                }
            }            
        }
       
    }
    // 调用搜索方法
    $(".searchAreaBtn").click(function(treeId, treeNode){
        searchArea(treeId, treeNode);
    });
    var inputArea = $("input[name='searchArea']");
    inputArea.keyup(function(treeId, treeNode,e){
        var e = event || window.event;
        var val = inputArea.val();
        if( e.keyCode == 13 || val == "" ){
            searchArea(treeId, treeNode);
        }
    });
})
