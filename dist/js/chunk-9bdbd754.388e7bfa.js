(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-9bdbd754"],{"0d11":function(t,n,e){"use strict";e.d(n,"a",(function(){return d}));var a=e("c7eb"),i=e("1da1"),r=e("d4ec"),c=e("bee2"),s=(e("7db0"),e("d3b7"),e("99af"),e("159b"),e("b0c0"),e("032a")),o=e("cd49"),u=s["a"].getInstance(),d=function(){function t(n){Object(r["a"])(this,t),this.loading=!1,this.error=!1,this.isEdit=!1,this.title=n.title,this.table=n.table,this.form=n.form,this.id=n.id,this.isEdit&&this.find()}return Object(c["a"])(t,[{key:"find",value:function(){var t=this;return new Promise((function(n,e){t.loading=!0;var a="".concat(t.table,"/").concat(t.id);u.get(a).then((function(e){t.form.state=e,t.form.inputs.forEach((function(t){t.field.value=e[t.field.name]})),t._reset(),n(e)})).catch((function(n){t.loading=!1,t.error=!0,e(n)}))}))}},{key:"setId",value:function(){var t=Object(i["a"])(Object(a["a"])().mark((function t(n){return Object(a["a"])().wrap((function(t){while(1)switch(t.prev=t.next){case 0:return this.id=n,this.isEdit=!0,t.next=4,this.find();case 4:case"end":return t.stop()}}),t,this)})));function n(n){return t.apply(this,arguments)}return n}()},{key:"submit",value:function(){var t=this,n="".concat(this.table,"/editadd"),e="post";return this.isEdit&&(n+="/".concat(this.id),e="put"),new Promise((function(a,i){u[e](n,t.form.state).then((function(t){return o["bus"].$emit("getTableData"),a(t)})).catch((function(t){return i(t)}))}))}},{key:"_reset",value:function(){this.loading=!1,this.error=!1}}]),t}()},2609:function(t,n,e){"use strict";var a=e("370f"),i=e("35f6"),r=e("ae4f"),c=[new a["a"](Object(r["g"])(r["v"])),new a["a"](Object(r["g"])(r["N"])),new a["a"](Object(r["g"])(r["L"])),new a["a"](r["q"]),new a["a"](Object(r["g"])(r["d"]))],s={inputs:c},o=new i["a"](s),u=o,d=e("0d11"),f={title:"consultunts",table:"consultunts",form:u},l=new d["a"](f);n["a"]=l},d92c:function(t,n,e){"use strict";e.r(n);var a=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"py-12"},[e("v-container",[e("v-card",[e("EditAddComponent",{attrs:{d:t.d}})],1)],1)],1)},i=[],r=e("0d11"),c=e("2609"),s=e("de10"),o={components:{EditAddComponent:s["a"]},computed:{d:function(){var t=new r["a"](c["a"]);return t}}},u=o,d=e("2877"),f=e("6544"),l=e.n(f),b=e("b0af"),h=e("a523"),p=Object(d["a"])(u,a,i,!1,null,null,null);n["default"]=p.exports;l()(p,{VCard:b["a"],VContainer:h["a"]})},de10:function(t,n,e){"use strict";var a=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"py-12"},[t.loading?t._e():e("v-container",[e("Form",{attrs:{form:t.d.form}}),e("v-btn",{staticClass:"submit-btn mt-8",attrs:{color:"primary"},on:{click:function(n){return n.preventDefault(),t.submit.apply(null,arguments)}}},[t._v(t._s(t.$t("submit")))])],1)],1)},i=[],r=e("c7eb"),c=e("1da1"),s=e("2d19"),o=e("0d11"),u=e("afbc"),d={data:function(){return{loading:!0}},props:{d:{required:!0,type:o["a"]}},methods:{submit:function(){var t=this;return Object(c["a"])(Object(r["a"])().mark((function n(){return Object(r["a"])().wrap((function(n){while(1)switch(n.prev=n.next){case 0:t.d.submit().then((function(t){u["a"].back()})).catch((function(t){console.log(t)}));case 1:case"end":return n.stop()}}),n)})))()}},components:{Form:s["a"]},created:function(){var t=this;return Object(c["a"])(Object(r["a"])().mark((function n(){return Object(r["a"])().wrap((function(n){while(1)switch(n.prev=n.next){case 0:if(t.d.form.resetState(),!u["a"].currentRoute.params.id){n.next=4;break}return n.next=4,t.d.setId(parseInt(u["a"].currentRoute.params.id));case 4:t.loading=!1;case 5:case"end":return n.stop()}}),n)})))()}},f=d,l=e("2877"),b=e("6544"),h=e.n(b),p=e("8336"),m=e("a523"),v=Object(l["a"])(f,a,i,!1,null,null,null);n["a"]=v.exports;h()(v,{VBtn:p["a"],VContainer:m["a"]})}}]);
//# sourceMappingURL=chunk-9bdbd754.388e7bfa.js.map