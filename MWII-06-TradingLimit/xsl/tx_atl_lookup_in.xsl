<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:db="http://xmlns.oracle.com/pcbpel/adapter/db/KPEIMID/TL_ALLOC_PKG/GET_ALLOC2/" xmlns:ns1="http://www.example.org" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:inp1="http://www.kpei.co.id/schema/tradinglimit/RAZORTradingLimit" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:tns="http://www.kpei.co.id/service/tradinglimit/AllocatedTradingLimitSet" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:inp2="http://kpei.co.id/MDwsReply.xsd" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsi xsl ns1 xsd inp1 wsdl tns inp2 db xp20 bpws bpel mhdr oraext dvm hwf med ids bpm xdk xref ora socket ldap">
   <xsl:template match="/">
      <db:InputParameters>
         <db:PIN>
            <xsl:for-each select="/inp1:kpeiOutbound/inp1:body/inp1:response">
               <db:PIN_ITEM>
                  <db:TLA_CM>
                     <xsl:value-of select="@memberId"/>
                  </db:TLA_CM>
                  <db:TLA_MARKET>
                     <xsl:value-of select="@market"/>
                  </db:TLA_MARKET>
                  <db:TLA_VALUE>
                     <xsl:value-of select="inp1:value"/>
                  </db:TLA_VALUE>
               </db:PIN_ITEM>
            </xsl:for-each>
         </db:PIN>
      </db:InputParameters>
   </xsl:template>
</xsl:stylesheet>