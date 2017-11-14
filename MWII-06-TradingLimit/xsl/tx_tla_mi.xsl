<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:inp1="http://www.kpei.co.id/schema/tradinglimit/TradingLimitAllocationSet" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:inp2="http://kpei.co.id/MDwsReply.xsd" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:ns0="http://www.kpei.co.id/MemberInterface" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://www.kpei.co.id/service/tradinglimit/TradingLimitAllocationSet" xmlns:ns1="http://schemas.oracle.com/bpel/extension" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl inp1 wsdl inp2 xsd tns ns1 tm soap12 soapenc soap mime ns0 http xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:template match="/">
      <ns0:SetTradingLimitAllocation>
         <ns0:header>
            <ns0:asAt>
               <xsl:value-of select="/inp1:tradingLimitAllocationSet/inp1:header/inp1:asAt"/>
            </ns0:asAt>
            <ns0:source>
               <xsl:value-of select="/inp1:tradingLimitAllocationSet/inp1:header/inp1:source"/>
            </ns0:source>
            <xsl:if test="/inp1:tradingLimitAllocationSet/inp1:header/@id">
               <ns0:id>
                  <xsl:value-of select="/inp1:tradingLimitAllocationSet/inp1:header/@id"/>
               </ns0:id>
            </xsl:if>
         </ns0:header>
         <ns0:body>
            <ns0:ClearingMemberAllocationCOllection>
               <xsl:for-each select="/inp1:tradingLimitAllocationSet/inp1:body/inp1:clearingMemberAllocation">
                  <ns0:allocation>
                     <ns0:clearingMember>
                        <xsl:value-of select="inp1:clearingMember"/>
                     </ns0:clearingMember>
                     <ns0:market>
                        <xsl:value-of select="inp1:market"/>
                     </ns0:market>
                     <ns0:tradingMemberAllocationCollection>
                        <xsl:for-each select="inp1:tradingMemberAllocationCollection/inp1:tradingMemberAllocation">
                           <ns0:tradingMemberAllocation>
                              <ns0:tradingMember>
                                 <xsl:value-of select="inp1:tradingMember"/>
                              </ns0:tradingMember>
                              <ns0:allocationPercentage>
                                 <xsl:value-of select="inp1:percentage"/>
                              </ns0:allocationPercentage>
                              <xsl:if test="inp1:max">
                                 <ns0:allocationLimit>
                                    <xsl:value-of select="inp1:max"/>
                                 </ns0:allocationLimit>
                              </xsl:if>
                           </ns0:tradingMemberAllocation>
                        </xsl:for-each>
                     </ns0:tradingMemberAllocationCollection>
                  </ns0:allocation>
               </xsl:for-each>
            </ns0:ClearingMemberAllocationCOllection>
         </ns0:body>
      </ns0:SetTradingLimitAllocation>
   </xsl:template>
</xsl:stylesheet>