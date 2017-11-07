<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:inp1="http://www.kpei.co.id/schema/tradinglimit/TradingLimitAllocationSet" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:ns0="http://kpei.co.id/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:inp2="http://kpei.co.id/MDwsReply.xsd" xmlns:s1="http://localhost/ARMSServiceLimit/TradingLimitAllocationSet.xsd" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:s3="http://www.kpei.co.id/middleware/ExpandableVariable" xmlns:s2="http://www.kpei.co.id/middleware/MiddlewareHeader" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:tns="http://www.kpei.co.id/service/tradinglimit/TradingLimitAllocationSet" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://schemas.oracle.com/bpel/extension" xmlns:s4="http://192.168.52.206/ServiceLimit/MDwsReply.xsd" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl inp1 wsdl inp2 tns xsd ns1 tm soap12 ns0 soapenc soap mime s1 s3 s2 http s4 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:template match="/">
      <ns0:wsReplyMarketLimit>
         <s1:tlas>
            <s1:header>
               <xsl:if test="/inp1:tradingLimitAllocationSet/inp1:header/@id">
                  <xsl:attribute name="id">
                     <xsl:value-of select="/inp1:tradingLimitAllocationSet/inp1:header/@id"/>
                  </xsl:attribute>
               </xsl:if>
               <s2:asAt>
                  <xsl:value-of select="/inp1:tradingLimitAllocationSet/inp1:header/inp1:asAt"/>
               </s2:asAt>
               <s2:source>
                  <xsl:value-of select="/inp1:tradingLimitAllocationSet/inp1:header/inp1:source"/>
               </s2:source>
            </s1:header>
            <s1:body>
               <xsl:for-each select="/inp1:tradingLimitAllocationSet/inp1:body/inp1:clearingMemberAllocation">
                  <xsl:if test="oraext:compare-ignore-case(inp1:market,&quot;Pool&quot;) != 0">
                     <s1:clearingMemberAllocation>
                        <s1:clearingMember>
                           <xsl:value-of select="inp1:clearingMember"/>
                        </s1:clearingMember>
                        <s1:market>
                           <xsl:value-of select="inp1:market"/>
                        </s1:market>
                        <s1:tradingMemberAllocationCollection>
                           <xsl:for-each select="inp1:tradingMemberAllocationCollection/inp1:tradingMemberAllocation">
                              <s1:tradingMemberAllocation>
                                 <s1:tradingMember>
                                    <xsl:value-of select="inp1:tradingMember"/>
                                 </s1:tradingMember>
                                 <s1:percentage>
                                    <xsl:value-of select="format-number(inp1:percentage,'0')"/>
                                 </s1:percentage>
                                 <xsl:if test="inp1:min">
                                    <xsl:choose>
                                       <xsl:when test="inp1:min/@xsi:nil">
                                          <s1:min>
                                             <xsl:attribute name="xsi:nil">
                                                <xsl:value-of select="inp1:min/@xsi:nil"/>
                                             </xsl:attribute>
                                          </s1:min>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <s1:min>
                                             <xsl:value-of select="format-number(inp1:min,'0')"/>
                                          </s1:min>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="inp1:max">
                                    <xsl:choose>
                                       <xsl:when test="inp1:max/@xsi:nil">
                                          <s1:max>
                                             <xsl:attribute name="xsi:nil">
                                                <xsl:value-of select="inp1:max/@xsi:nil"/>
                                             </xsl:attribute>
                                          </s1:max>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <s1:max>
                                             <xsl:value-of select="format-number(inp1:max,'0')"/>
                                          </s1:max>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </xsl:if>
                                 <xsl:if test="inp1:replacement">
                                    <xsl:choose>
                                       <xsl:when test="inp1:replacement/@xsi:nil">
                                          <s1:replacement>
                                             <xsl:attribute name="xsi:nil">
                                                <xsl:value-of select="inp1:replacement/@xsi:nil"/>
                                             </xsl:attribute>
                                          </s1:replacement>
                                       </xsl:when>
                                       <xsl:otherwise>
                                          <s1:replacement>
                                             <xsl:value-of select="format-number(inp1:replacement,'0')"/>
                                          </s1:replacement>
                                       </xsl:otherwise>
                                    </xsl:choose>
                                 </xsl:if>
                              </s1:tradingMemberAllocation>
                           </xsl:for-each>
                        </s1:tradingMemberAllocationCollection>
                     </s1:clearingMemberAllocation>
                  </xsl:if>
               </xsl:for-each>
            </s1:body>
            <s1:ext>
               <xsl:if test="/inp1:tradingLimitAllocationSet/inp1:ext/inp1:value">
                  <xsl:for-each select="/inp1:tradingLimitAllocationSet/inp1:ext/inp1:value">
                     <s3:value>
                        <xsl:if test="@id">
                           <xsl:attribute name="id">
                              <xsl:value-of select="@id"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="."/>
                     </s3:value>
                  </xsl:for-each>
               </xsl:if>
            </s1:ext>
         </s1:tlas>
      </ns0:wsReplyMarketLimit>
   </xsl:template>
</xsl:stylesheet>
