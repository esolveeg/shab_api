(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-a98c7852"],{"0bc6":function(t,e,a){},"1f09":function(t,e,a){},3129:function(t,e,a){"use strict";var s=a("3835"),i=a("5530"),n=(a("ac1f"),a("1276"),a("d81d"),a("a630"),a("3ca3"),a("5319"),a("1f09"),a("c995")),r=a("24b2"),o=a("7560"),l=a("58df"),c=a("80d2");e["a"]=Object(l["a"])(n["a"],r["a"],o["a"]).extend({name:"VSkeletonLoader",props:{boilerplate:Boolean,loading:Boolean,tile:Boolean,transition:String,type:String,types:{type:Object,default:function(){return{}}}},computed:{attrs:function(){return this.isLoading?this.boilerplate?{}:Object(i["a"])({"aria-busy":!0,"aria-live":"polite",role:"alert"},this.$attrs):this.$attrs},classes:function(){return Object(i["a"])(Object(i["a"])({"v-skeleton-loader--boilerplate":this.boilerplate,"v-skeleton-loader--is-loading":this.isLoading,"v-skeleton-loader--tile":this.tile},this.themeClasses),this.elevationClasses)},isLoading:function(){return!("default"in this.$scopedSlots)||this.loading},rootTypes:function(){return Object(i["a"])({actions:"button@2",article:"heading, paragraph",avatar:"avatar",button:"button",card:"image, card-heading","card-avatar":"image, list-item-avatar","card-heading":"heading",chip:"chip","date-picker":"list-item, card-heading, divider, date-picker-options, date-picker-days, actions","date-picker-options":"text, avatar@2","date-picker-days":"avatar@28",heading:"heading",image:"image","list-item":"text","list-item-avatar":"avatar, text","list-item-two-line":"sentences","list-item-avatar-two-line":"avatar, sentences","list-item-three-line":"paragraph","list-item-avatar-three-line":"avatar, paragraph",paragraph:"text@3",sentences:"text@2",table:"table-heading, table-thead, table-tbody, table-tfoot","table-heading":"heading, text","table-thead":"heading@6","table-tbody":"table-row-divider@6","table-row-divider":"table-row, divider","table-row":"table-cell@6","table-cell":"text","table-tfoot":"text@2, avatar@2",text:"text"},this.types)}},methods:{genBone:function(t,e){return this.$createElement("div",{staticClass:"v-skeleton-loader__".concat(t," v-skeleton-loader__bone")},e)},genBones:function(t){var e=this,a=t.split("@"),i=Object(s["a"])(a,2),n=i[0],r=i[1],o=function(){return e.genStructure(n)};return Array.from({length:r}).map(o)},genStructure:function(t){var e=[];t=t||this.type||"";var a=this.rootTypes[t]||"";if(t===a);else{if(t.indexOf(",")>-1)return this.mapBones(t);if(t.indexOf("@")>-1)return this.genBones(t);a.indexOf(",")>-1?e=this.mapBones(a):a.indexOf("@")>-1?e=this.genBones(a):a&&e.push(this.genStructure(a))}return[this.genBone(t,e)]},genSkeleton:function(){var t=[];return this.isLoading?t.push(this.genStructure()):t.push(Object(c["t"])(this)),this.transition?this.$createElement("transition",{props:{name:this.transition},on:{afterEnter:this.resetStyles,beforeEnter:this.onBeforeEnter,beforeLeave:this.onBeforeLeave,leaveCancelled:this.resetStyles}},t):t},mapBones:function(t){return t.replace(/\s/g,"").split(",").map(this.genStructure)},onBeforeEnter:function(t){this.resetStyles(t),this.isLoading&&(t._initialStyle={display:t.style.display,transition:t.style.transition},t.style.setProperty("transition","none","important"))},onBeforeLeave:function(t){t.style.setProperty("display","none","important")},resetStyles:function(t){t._initialStyle&&(t.style.display=t._initialStyle.display||"",t.style.transition=t._initialStyle.transition,delete t._initialStyle)}},render:function(t){return t("div",{staticClass:"v-skeleton-loader",attrs:this.attrs,on:this.$listeners,class:this.classes,style:this.isLoading?this.measurableStyles:void 0},[this.genSkeleton()])}})},"36f6":function(t,e,a){},"6f29":function(t,e,a){"use strict";a.r(e);var s=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-container",{staticClass:"container"},[a("v-row",[a("v-col",{attrs:{cols:"3"}},[a("v-card",{staticClass:"mx-auto",attrs:{"max-width":"500"}},[a("v-list",{attrs:{subheader:""}},[a("v-subheader",[t._v(t._s(t.$t("chats")))]),t._l(t.chats,(function(e){return a("v-list-item",{key:e.title,staticClass:"cursor-pointer",on:{click:function(a){return a.preventDefault(),t.selectChat(e)}}},[a("v-list-item-avatar",[a("v-img",{attrs:{alt:""+e.Name,src:e.Img}})],1),a("v-list-item-content",[a("v-list-item-title",{domProps:{textContent:t._s(e.Name)}})],1),a("v-list-item-icon",[a("v-icon",{attrs:{color:e.active?"deep-purple accent-4":"grey"}},[t._v(" mdi-message-outline ")])],1)],1)}))],2)],1)],1),a("v-col",{attrs:{cols:"9"}},[null!=t.currentChat?a("v-card",{staticClass:"chat-card",attrs:{elevation:1}},[a("v-card-title",{staticClass:"chat-title"},[a("v-list-item",[a("v-list-item-avatar",[a("v-img",{attrs:{alt:t.currentChat.Name,src:t.currentChat.Img}})],1),a("v-list-item-content",[a("v-list-item-title",{domProps:{textContent:t._s(t.currentChat.Name)}})],1)],1)],1),a("v-card-text",{staticClass:"p-0"},[t.loading?a("div",{staticClass:"view-list"},t._l(10,(function(t){return a("v-skeleton-loader",{key:t,attrs:{type:"list-item-two-line"}})})),1):t._e(),a("v-list",{ref:"msgs",staticClass:"chat-msgs",attrs:{rounded:""}},t._l(t.msgs,(function(e){return a("div",{key:e.Id,staticClass:"msg-wrapper",class:e.Mine?"mine":"his"},[a("div",{staticClass:"chat-name",domProps:{textContent:t._s(e.Name)}}),a("v-list-item",{staticClass:"chat-msg"},[a("v-list-item-content",[a("v-list-item-title",{attrs:{color:"primary"},domProps:{textContent:t._s(e.Msg)}})],1)],1)],1)})),0)],1),a("v-card-actions",{staticClass:"actions"},[a("div",{staticClass:"d-flex flex-row align-center w-full"},[a("v-text-field",{attrs:{label:"الرسالة"},on:{keypress:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.send.apply(null,arguments)}},model:{value:t.msg,callback:function(e){t.msg=e},expression:"msg"}}),a("v-btn",{staticClass:"ml-4",attrs:{icon:""},on:{click:t.send}},[a("v-icon",[t._v("mdi-send")])],1)],1)])],1):a("v-card",{staticClass:"chat-empty"},[t._v(" no chat selected ")])],1)],1)],1)},i=[],n=a("5530"),r=(a("ac1f"),a("5319"),a("d3b7"),a("25f0"),a("a026")),o=a("57b4"),l=a("2f62"),c=a("afbc"),d=a("28f3"),u=r["default"].extend({name:"users-list",components:{},data:function(){return{loading:!1,msg:"",chatLoading:!1,chatsLoading:!1,chats:[],currentChat:null,msgs:[]}},computed:Object(n["a"])({},Object(l["b"])({user:"user/user"})),methods:{edit:function(){var t=c["a"].currentRoute.path,e=t.replace("view","edit");c["a"].push(e)},listChats:function(){var t=this;this.chatsLoading=!0,Object(o["b"])().then((function(e){t.chats=e,t.chatsLoading=!1}))},selectChat:function(t){this.currentChat=t,Object(d["a"])({id:t.Id},c["a"].currentRoute.path),this.findChatMsgs(t.Id)},findChatMsgs:function(t){var e=this;this.chatLoading=!0,Object(o["c"])(t).then((function(t){e.msgs=t,e.chatLoading=!1;var a=document.querySelector(".chat-msgs");a.scrollTop=a.scrollHeight}))},send:function(){var t=this,e={ToId:this.currentChat.Id,Msg:this.msg};Object(o["a"])(e).then((function(e){var a={Id:e,Msg:t.msg,Mine:!0,Name:"",CreatedAt:(new Date).toString(),Seen:!1};t.msgs.push(a),t.msg=""}))}},mounted:function(){this.listChats(),c["a"].currentRoute.query.id&&this.findChatMsgs(parseInt(c["a"].currentRoute.query.id))}}),h=u,v=(a("db58"),a("2877")),m=a("6544"),p=a.n(m),f=a("8336"),g=a("b0af"),b=a("99d9"),y=a("62ad"),C=a("a523"),x=a("132d"),k=a("adda"),S=a("8860"),_=a("da13"),L=a("8270"),w=a("5d23"),O=a("34c3"),V=a("0fd9"),j=a("3129"),B=a("e0c7"),I=a("8654"),$=Object(v["a"])(h,s,i,!1,null,null,null);e["default"]=$.exports;p()($,{VBtn:f["a"],VCard:g["a"],VCardActions:b["a"],VCardText:b["b"],VCardTitle:b["c"],VCol:y["a"],VContainer:C["a"],VIcon:x["a"],VImg:k["a"],VList:S["a"],VListItem:_["a"],VListItemAvatar:L["a"],VListItemContent:w["a"],VListItemIcon:O["a"],VListItemTitle:w["b"],VRow:V["a"],VSkeletonLoader:j["a"],VSubheader:B["a"],VTextField:I["a"]})},db58:function(t,e,a){"use strict";a("36f6")},e0c7:function(t,e,a){"use strict";var s=a("5530"),i=(a("0bc6"),a("7560")),n=a("58df");e["a"]=Object(n["a"])(i["a"]).extend({name:"v-subheader",props:{inset:Boolean},render:function(t){return t("div",{staticClass:"v-subheader",class:Object(s["a"])({"v-subheader--inset":this.inset},this.themeClasses),attrs:this.$attrs,on:this.$listeners},this.$slots.default)}})}}]);
//# sourceMappingURL=chunk-a98c7852.b1f884e8.js.map