<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/bizflow-tags.tld" prefix="bizflow"%>
<%@ taglib uri="/WEB-INF/bizflownode-tags.tld" prefix="BizFlowNode"%>
<%@ taglib uri="/WEB-INF/workflow-tags.tld" prefix="WorkFlow"%>
<%@ taglib uri="/WEB-INF/currencyrate-tags.tld" prefix="currencyrate"%>
<%@ taglib uri="/WEB-INF/doc-tags.tld" prefix="doc"%>
<%@ taglib uri="/WEB-INF/fundprojectpay-tags.tld" prefix="fpcheck"%>


<html lang="en">
<head>
    <head>
        <meta charset="UTF-8">
        <%@ include file="/commons/pages/include.jsp" %>
        <link rel="stylesheet" href="${base }/commons/css/jquery.validator.css">
        <link rel="stylesheet" href="${base }/commons/css/zTreeStyle.css">
        <script src="${base }/commons/js/jquery.validator.js"></script>
        <script src="${base }/commons/js/autocomplete/jquery.autocomplete.js"></script>
        <script src="${base }/commons/js/autocomplete/jquery.mockjax.js"></script>
        <script src="${base }/commons/laydate-v1.1/laydate-v1.1/laydate/laydate.js"></script>
        <script src="${base }/commons/js/belong.js"></script>
        <script src="${base }/commons/js/util.js"></script>
        <script src="${base }/commons/js/company.js"></script>
        <script src="${base }/commons/js/jquery.ztree.core.js"></script>
        <script src="${base }/commons/js/jquery.ztree.excheck.js"></script>
        <script src="${base }/commons/js/region-domain-util.js"></script>
        <script src="${base }/commons/js/searchTree.js"></script>
        <script src="${base }/commons/js/Tool.js"></script>
    </head>
</head>
<body>
<div class="wapper">
    <div class="head"></div>
    <%@ include file="/commons/pages/menu.jsp" %>
    <%@ include file="/views/directinvestproject/direct_project_tabs.jsp" %>
    <div class="content">
        <div class="con-main">
            <div class="marg10 fundfont" id="home">
                <table class="table_list ">
                    <tbody align="center">
                    <tr>
                        <td rowspan="2">类别</td>
                        <td rowspan="2">指标项</td>
                        <c:forEach items="${headTerm.paperPeriodics}" var="pp" varStatus="_index">
                            <c:if test="${pp.quarter!=5}">
                                <td>${pp.year}年${pp.quarter}季度</td>
                            </c:if>

                        </c:forEach>
                       <%-- <td>预警规则</td>--%>
                       <%-- <td>2019年度</td>--%>
                    </tr>
                    <tr>

                            <c:if test="${not empty headTerm}">
                                <c:if test="${not empty headTerm.termScores}">
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty headTerm.paperPeriodics[0].year and not empty headTerm.paperPeriodics[0].quarter}">
                                                <c:choose>
                                                    <c:when test="${headTerm.paperPeriodics[1].year<sysYear}">
                                                        <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','${headTerm.paperPeriodics[0].year}','${ headTerm.paperPeriodics[0].quarter}')"> 编辑  </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${sysMonth>=1}">
                                                                <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','${headTerm.paperPeriodics[0].year}','${ headTerm.paperPeriodics[0].quarter}')"> 编辑  </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                编辑
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','',3)">
                                                    编辑
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty headTerm.paperPeriodics[1].year and not empty headTerm.paperPeriodics[1].quarter}">
                                                <c:choose>
                                                    <c:when test="${headTerm.paperPeriodics[1].year<sysYear}">
                                                        <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','${headTerm.paperPeriodics[1].year}','${ headTerm.paperPeriodics[1].quarter}')"> 编辑  </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${sysMonth>=4}">
                                                                <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','${headTerm.paperPeriodics[1].year}','${ headTerm.paperPeriodics[1].quarter}')"> 编辑  </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                编辑
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','',3)">
                                                    编辑
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                    <c:choose>
                                        <c:when test="${not empty headTerm.paperPeriodics[2].year and not empty headTerm.paperPeriodics[2].quarter}">
                                            <c:choose>
                                                <c:when test="${headTerm.paperPeriodics[1].year<sysYear}">
                                                        <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','${headTerm.paperPeriodics[2].year}','${ headTerm.paperPeriodics[2].quarter}')"> 编辑  </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${sysMonth>=7}">
                                                            <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','${headTerm.paperPeriodics[2].year}','${ headTerm.paperPeriodics[2].quarter}')"> 编辑  </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            编辑
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','',3)">
                                                编辑
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty headTerm.paperPeriodics[3].year and not empty headTerm.paperPeriodics[3].quarter}">
                                                <c:choose>
                                                    <c:when test="${headTerm.paperPeriodics[1].year<sysYear}">
                                                        <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','${headTerm.paperPeriodics[3].year}','${ headTerm.paperPeriodics[3].quarter}')"> 编辑  </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${sysMonth>=10}">
                                                                <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','${headTerm.paperPeriodics[3].year}','${ headTerm.paperPeriodics[3].quarter}')"> 编辑  </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                编辑
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:void(0)" onclick="getTermProcid('${entity.id}','',4)">
                                                    编辑
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </c:if>
                            </c:if>

                       <%-- <td><a href="javascript:void(0)">配置</a></td>--%>
                       <%-- <td>/</td>--%>
                    </tr>
                    <c:if test="${not empty headTerm and not empty headTerm.termScores}">
                        <c:forEach items="${headTerm.termScores}" var="ht">
                            <tr>
                                <td><entry:entry name="" code="request_status" clazz="exam-td" value="${ht.term.type}"
                                                 type="text"/></td>
                                <td>${ht.term.name}</td>
                                <td>${ht.firstScore.score}</td>
                                <td>${ht.secondScore.score}</td>
                                <td>${ht.threeScore.score}</td>
                                <td>${ht.fourScore.score}</td>
                               <%-- <td></td>--%>
                            </tr>
                        </c:forEach>
                        <tr>
                        <td>其他</td>
                        <td>备注</td>
                        <c:if test="${not empty headTerm.paperPeriodics}">
                                    <c:forEach items="${headTerm.paperPeriodics}" var="pp">
                                        <c:if test="${headTerm.termScores[0].firstScore.periodicId == pp.id}">
                                        <td>
                                                ${pp.remark}
                                        </td>
                                        </c:if>
                                        <c:if test="${headTerm.termScores[0].secondScore.periodicId == pp.id}">
                                            <td>
                                                    ${pp.remark}
                                            </td>
                                        </c:if>
                                        <c:if test="${headTerm.termScores[0].threeScore.periodicId == pp.id}">
                                            <td>
                                                    ${pp.remark}
                                            </td>
                                        </c:if>
                                        <c:if test="${headTerm.termScores[0].fourScore.periodicId == pp.id}">
                                            <td>
                                                    ${pp.remark}
                                            </td>
                                        </c:if>
                                    </c:forEach>
                              <%--  <td>备注</td>--%>
                               <%-- <td></td>--%>
                        </c:if>
                        <c:if test="${empty headTerm.paperPeriodics}">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>备注</td>
                        </c:if>
                        </tr>
                       <%-- <tr>
                            <td>文档</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>--%>
                    </c:if>
                    </tbody>
                </table>
            </div>
            <%@ include file="/views/note/include_note_lib.jsp" %>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    function getTermProcid(fipId,year,quarter){
       if(null == year || undefined == year || year ==''){
           var date = new Date();
           year = date.getFullYear();
       }
       $.ajax({
           type:'post',
           url:'${base}/funddirectproject/getTermPeriods',
           data:{'fipId':fipId,'year':year,'quarter':quarter,'paperId':'${paperId}'},
           dataType:'json',
           success:function (data) {
               console.log(typeof  data);
               console.log(data);
               layer.open({
                   type: 1,
                   title: '编辑运营报告',
                   skin: 'layui-layer-demo',
                   shadeClose: false,
                   shade: [0.3, '#000'],
                   resize:false,
                   scrollbar:false,
                   area: ['400px', '450px'],
                   content: '<div id="edit_paper_div"></div>',
                   btn: ['确定','取消'],
                   yes: function(index){
                        var data = $("#editPaperForm").serializeObject();
                       var datStr = JSON.stringify(data);
                       eidtPaperTm(datStr,fipId,year,quarter);
                   }
               });
               var termPeriods = data.termPeriods;
               var paperPeriodic = data.paperPeriodic;
               var obj = {"termPeriods":termPeriods,"paperPeriodic":paperPeriodic,"year":year,"quarter":quarter};
                $("#paperTmpl").tmpl(obj).appendTo("#edit_paper_div");
           }
       })
    }
    
    function eidtPaperTm(datStr,fipId,year,quarter) {
        $.ajax({
            type:'post',
            url:'${base}/entitypaperitem/insertOrUpdatePaperValue',
            data:{"datStr":datStr,"fipId":fipId,"year":year,"quarter":quarter},
            dataType:'json',
            success:function (data) {
               location.href="${base}/funddirectproject/runReportDetails?id=${entity.id}"+"&year="+year;
            }
        })
    }
</script>
<script type="text/x-jquery-tmpl" id="paperTmpl">
	<div class="edit-box">
		<form  method="post" id="editPaperForm" class="form-horizontal">
		<table boder="1" class="paper-table">
            <tr>
                <td>指标项</td>
                <td>{{= year}}年{{= quarter}}季度</td>
           </tr>
            {{each(m,n) termPeriods}}
             <tr>
               <%--  <td><input type="text"  readonly="true" value="" ></td>--%>
                 <td>{{= n.termName}}</td>
                 <td>
                   <input type="text" name="{{= n.entityTermId}}" value="{{= n.termScore}}">
                 </td>
              </tr>
			{{/each}}
             <tr>
                <td>备注</td>
                <td> {{if paperPeriodic!=null}}<textarea name="remark" >{{= paperPeriodic.remark}}
                </textarea>
                {{/if}}
                {{if null == paperPeriodic}}
                        <textarea name="remark" >  </textarea>
                {{/if}}
                </td>
            </tr>
          <%--   <tr>
                <td>文档<td>
                <td><td>
                <td><input type="file"/><td>
            </tr>--%>
        </table>
		</form>
	</div>
</script>
<style>
    .paper-table{
        width:100%;
        border-collapse: collapse;
        border-top:1px solid #ddd;
        border-left:1px solid #ddd;
    }
    .paper-table tr td{
        border-right:1px solid #ddd;
        border-bottom:1px solid #ddd;
        line-height:22px;
        padding:5px 10px;
    }
    .paper-table tr td input,
    .paper-table tr td textarea{
        width:100%;
        border:1px solid #f2f2f2;
        border-radius:4px;
    }
</style>
