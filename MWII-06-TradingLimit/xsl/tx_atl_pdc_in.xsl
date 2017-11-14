<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns2="http://www.example.org" xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/KPEIMID/TL_ALLOC_PKG/GET_ALLOC2/" xmlns:inp1="http://www.kpei.co.id/GE03-XMLUtility/types" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:ns1="http://www.kpei.co.id/schema/tradinglimit/RAZORTradingLimit" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns4="http://www.kpei.co.id/middleware/outbound/tradingLimit" xmlns:inp2="http://kpei.co.id/MDwsReply.xsd" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns3="kpeimid/TradingLimitService-v1" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns0="http://www.kpei.co.id/service/tradinglimit/AllocatedTradingLimitSet" xmlns:tns="http://oracle.com/sca/soapservice/kpei/GE03-XMLUtility/GE03_XMLUtility" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns2 db inp1 ns1 wsdl inp2 xsd ns0 tns ns4 ns3 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="pdcMarketReply.reply"/>
   <xsl:param name="inputVariable.request"/>
   <xsl:template match="/">
      <ns4:kpeiOutbound>
         <ns4:header>
            <xsl:attribute name="id">
               <xsl:value-of select="$inputVariable.request/ns1:kpeiOutbound/ns1:header/@id"/>
            </xsl:attribute>
            <ns4:asAt>
               <xsl:value-of select="$inputVariable.request/ns1:kpeiOutbound/ns1:header/ns1:asAt"/>
            </ns4:asAt>
            <ns4:sourceSystem>
               <xsl:value-of select="$inputVariable.request/ns1:kpeiOutbound/ns1:header/ns1:sourceSystem"/>
            </ns4:sourceSystem>
         </ns4:header>
         <ns4:body>
            <xsl:attribute name="type">
               <xsl:value-of select="$inputVariable.request/ns1:kpeiOutbound/ns1:body/@type"/>
            </xsl:attribute>
            <xsl:for-each select="/db:OutputParameters/db:POUT/db:PIN_ITEM">
               <xsl:if test="$pdcMarketReply.reply/inp1:getXMLDataReply/inp1:xmlData[((inp1:XPath = &quot;pdc/market&quot;) and (oraext:compare-ignore-case(inp1:Value,current()/db:TLA_MARKET) = 0))]">
                  <xsl:for-each select="db:TLA_TM_COL/db:TLA_TM_COL_ITEM">
                     <xsl:variable name="vp" select="(0.01 * ../../db:TLA_VALUE) * db:TLA_PERCENTAGE"/>
                     <ns4:response>
                        <xsl:attribute name="market">
                           <xsl:value-of select="../../db:TLA_MARKET"/>
                        </xsl:attribute>
                        <xsl:attribute name="memberId">
                           <xsl:value-of select="db:TLA_TM"/>
                        </xsl:attribute>
                        <xsl:choose>
                           <xsl:when test="not(db:TLA_REPLACEMENT/@xsi:nil)">
                              <ns4:value>
                                 <xsl:value-of select="db:TLA_REPLACEMENT"/>
                              </ns4:value>
                           </xsl:when>
                           <xsl:when test="not(db:TLA_MIN/@xsi:nil) and ($vp &lt; db:TLA_MIN)">
                              <ns4:value>
                                 <xsl:value-of select="db:TLA_MIN"/>
                              </ns4:value>
                           </xsl:when>
                           <xsl:when test="not(db:TLA_MAX/@xsi:nil) and ($vp > db:TLA_MAX)">
                              <ns4:value>
                                 <xsl:value-of select="db:TLA_MAX"/>
                              </ns4:value>
                           </xsl:when>
                           <xsl:otherwise>
                              <ns4:value>
                                 <xsl:value-of select="$vp"/>
                              </ns4:value>
                           </xsl:otherwise>
                        </xsl:choose>
                     </ns4:response>
                  </xsl:for-each>
               </xsl:if>
            </xsl:for-each>
         </ns4:body>
      </ns4:kpeiOutbound>
   </xsl:template>
</xsl:stylesheet>