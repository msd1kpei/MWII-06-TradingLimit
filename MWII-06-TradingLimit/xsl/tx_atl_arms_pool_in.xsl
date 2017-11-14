<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns1="http://www.example.org" xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/KPEIMID/TL_ALLOC_PKG/GET_ALLOC2/" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:ns0="http://kpei.co.id/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:inp1="http://www.kpei.co.id/schema/tradinglimit/RAZORTradingLimit" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:inp2="http://kpei.co.id/MDwsReply.xsd" xmlns:s1="http://localhost/ARMSServiceLimit/TradingLimitAllocationSet.xsd" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:s3="http://www.kpei.co.id/middleware/ExpandableVariable" xmlns:s2="http://www.kpei.co.id/middleware/MiddlewareHeader" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://www.kpei.co.id/service/tradinglimit/AllocatedTradingLimitSet" xmlns:s4="http://192.168.52.206/ServiceLimit/MDwsReply.xsd" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns1 db inp1 wsdl inp2 xsd tns tm soap12 ns0 soapenc soap mime s1 s3 s2 http s4 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="inputVariable.request"/>
   <xsl:template match="/">
      <ns0:wsReplyPoolLimit>
         <s1:tlas>
            <s1:header>
               <xsl:attribute name="id">
                  <xsl:value-of select="$inputVariable.request/inp1:kpeiOutbound/inp1:header/@id"/>
               </xsl:attribute>
               <s2:asAt>
                  <xsl:value-of select="$inputVariable.request/inp1:kpeiOutbound/inp1:header/inp1:asAt"/>
               </s2:asAt>
               <s2:source>
                  <xsl:value-of select="$inputVariable.request/inp1:kpeiOutbound/inp1:header/inp1:sourceSystem"/>
               </s2:source>
            </s1:header>
            <s1:body>
               <xsl:for-each select="/db:OutputParameters/db:POUT/db:PIN_ITEM">
                  <xsl:if test="oraext:compare-ignore-case(db:TLA_MARKET,&quot;Pool&quot;) = 0">
                     <s1:clearingMemberAllocation>
                        <s1:clearingMember>
                           <xsl:value-of select="db:TLA_CM"/>
                        </s1:clearingMember>
                        <s1:market>
                           <xsl:value-of select="db:TLA_MARKET"/>
                        </s1:market>
                        <s1:tradingMemberAllocationCollection>
                           <xsl:for-each select="db:TLA_TM_COL/db:TLA_TM_COL_ITEM">
                              <xsl:variable name="vp" select="(db:TLA_PERCENTAGE * ../../db:TLA_VALUE) * 0.01"/>
                              <s1:tradingMemberAllocation>
                                 <s1:tradingMember>
                                    <xsl:value-of select="db:TLA_TM"/>
                                 </s1:tradingMember>
                                 <xsl:choose>
                                    <xsl:when test="not(db:TLA_REPLACEMENT/@xsi:nil)">
                                       <s1:value>
                                          <xsl:value-of select="format-number(db:TLA_REPLACEMENT,'0')"/>
                                       </s1:value>
                                    </xsl:when>
                                    <xsl:when test="not(db:TLA_MIN/@xsi:nil) and ($vp &lt; db:TLA_MIN)">
                                       <s1:value>
                                          <xsl:value-of select="format-number(db:TLA_MIN,'0')"/>
                                       </s1:value>
                                    </xsl:when>
                                    <xsl:when test="not(db:TLA_MAX/@xsi:nil) and ($vp > db:TLA_MAX)">
                                       <s1:value>
                                          <xsl:value-of select="format-number(db:TLA_MAX,'0')"/>
                                       </s1:value>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <s1:value>
                                          <xsl:value-of select="format-number($vp,'0')"/>
                                       </s1:value>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </s1:tradingMemberAllocation>
                           </xsl:for-each>
                        </s1:tradingMemberAllocationCollection>
                     </s1:clearingMemberAllocation>
                  </xsl:if>
               </xsl:for-each>
            </s1:body>
         </s1:tlas>
      </ns0:wsReplyPoolLimit>
   </xsl:template>
</xsl:stylesheet>