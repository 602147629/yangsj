<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">                          
 <html>
 <body>
 <h2>ʡ�����</h2><br />
   
      <table border="1">
       <tr>
           <td>ʡ��</td>
           <td>ʡ�ݳ���</td>
       </tr>
       <xsl:for-each select="country/province">  
       <tr>
           <td><xsl:value-of select="province_name"/></td>
           <td><xsl:value-of select="province_city"/></td>
       </tr>
    </xsl:for-each> 
     </table>   
 </body>
 </html>
</xsl:template>
</xsl:stylesheet>

