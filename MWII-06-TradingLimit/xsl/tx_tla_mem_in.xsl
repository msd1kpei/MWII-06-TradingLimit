<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:inp1="http://www.kpei.co.id/schema/tradinglimit/TradingLimitAllocationSet" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:tns="http://www.kpei.co.id/service/tradinglimit/TradingLimitAllocationSet" xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/KPEIMID/MW_MEMBERSHIP_PKG/GET_MEMBERSHIP/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:inp2="http://kpei.co.id/MDwsReply.xsd" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl inp1 tns xsd ns1 wsdl inp2 db bpws xp20 mhdr bpel oraext dvm hwf med ids bpm xdk xref ora socket ldap">
   <xsl:template match="/">
      <db:InputParameters>
         <db:CIN>
            <xsl:for-each select="/inp1:tradingLimitAllocationSet/inp1:body/inp1:clearingMemberAllocation">
               <db:CIN_ITEM>
                  <db:MEMBER_CODE>
                     <xsl:value-of select="inp1:clearingMember"/>
                  </db:MEMBER_CODE>
                  <db:MEMBER_TYPE>
                     <xsl:text disable-output-escaping="no">GCM</xsl:text>
                  </db:MEMBER_TYPE>
                  <db:MEMBER_PARENT>
                     <xsl:text disable-output-escaping="no">%</xsl:text>
                  </db:MEMBER_PARENT>
               </db:CIN_ITEM>
            </xsl:for-each>
         </db:CIN>
      </db:InputParameters>
   </xsl:template>
</xsl:stylesheet>
