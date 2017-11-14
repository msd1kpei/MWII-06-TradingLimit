<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:inp1="http://www.kpei.co.id/schema/tradinglimit/TradingLimitAllocationSet" xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/KPEIMID/MW_MEMBERSHIP_PKG/GET_MEMBERSHIP/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:inp2="http://kpei.co.id/MDwsReply.xsd" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/tla_merge" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://www.kpei.co.id/service/tradinglimit/TradingLimitAllocationSet" xmlns:ns1="http://schemas.oracle.com/bpel/extension" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl inp1 db wsdl inp2 xsd tns ns1 ns0 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
   <xsl:param name="memReply.OutputParameter"/>
   <xsl:template match="/">
      <ns0:TradingLimitAllocationCollection>
         <xsl:for-each select="/inp1:tradingLimitAllocationSet/inp1:body/inp1:clearingMemberAllocation">
            <xsl:variable name="cm" select="xp20:upper-case(inp1:clearingMember)"/>
            <xsl:for-each select="inp1:tradingMemberAllocationCollection/inp1:tradingMemberAllocation">
               <ns0:TradingLimitAllocation>
                  <ns0:tlaCm>
                     <xsl:value-of select="../../inp1:clearingMember"/>
                  </ns0:tlaCm>
                  <ns0:tlaTm>
                     <xsl:value-of select="inp1:tradingMember"/>
                  </ns0:tlaTm>
                  <ns0:tlaMarket>
                     <xsl:value-of select="../../inp1:market"/>
                  </ns0:tlaMarket>
                  <ns0:tlaPercentage>
                     <xsl:value-of select="inp1:percentage"/>
                  </ns0:tlaPercentage>
                  <xsl:if test="inp1:min">
                     <ns0:tlaMin>
                        <xsl:if test="inp1:min/@xsi:nil">
                           <xsl:attribute name="xsi:nil">
                              <xsl:value-of select="inp1:min/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="inp1:min"/>
                     </ns0:tlaMin>
                  </xsl:if>
                  <xsl:if test="inp1:max">
                     <ns0:tlaMax>
                        <xsl:if test="inp1:max/@xsi:nil">
                           <xsl:attribute name="xsi:nil">
                              <xsl:value-of select="inp1:max/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="inp1:max"/>
                     </ns0:tlaMax>
                  </xsl:if>
                  <xsl:if test="inp1:replacement">
                     <ns0:tlaReplacement>
                        <xsl:if test="inp1:replacement/@xsi:nil">
                           <xsl:attribute name="xsi:nil">
                              <xsl:value-of select="inp1:replacement/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="inp1:replacement"/>
                     </ns0:tlaReplacement>
                  </xsl:if>
               </ns0:TradingLimitAllocation>
            </xsl:for-each>
            <xsl:for-each select="inp1:tradingMemberAllocationCollection">
               <xsl:if test="$memReply.OutputParameter/db:OutputParameters/db:COUT/db:CIN_ITEM[(xp20:upper-case(db:MEMBER_CODE) = $cm)]">
                  <ns0:TradingLimitAllocation>
                     <ns0:tlaCm>
                        <xsl:value-of select="../inp1:clearingMember"/>
                     </ns0:tlaCm>
                     <ns0:tlaTm>
                        <xsl:value-of select="../inp1:clearingMember"/>
                     </ns0:tlaTm>
                     <ns0:tlaMarket>
                        <xsl:value-of select="../inp1:market"/>
                     </ns0:tlaMarket>
                     <ns0:tlaPercentage>
                        <xsl:text disable-output-escaping="no">100</xsl:text>
                     </ns0:tlaPercentage>
                  </ns0:TradingLimitAllocation>
               </xsl:if>
            </xsl:for-each>
         </xsl:for-each>
      </ns0:TradingLimitAllocationCollection>
   </xsl:template>
</xsl:stylesheet>