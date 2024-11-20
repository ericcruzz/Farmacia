using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Xsl;

public partial class _Default : System.Web.UI.Page
{
    public String TipoFarmacia = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null) 
        {
            TipoFarmacia = "0";
        }
        else
        {
            TipoFarmacia = Request.QueryString["id"];
        }
        TransformaXML();
    }

    private void TransformaXML()
    {
        string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/inventario.xml";
        string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xslt/template.xslt";
        XmlTextReader trMenu = new XmlTextReader(xmlPath);

        //credenciales
        XmlUrlResolver resolver = new XmlUrlResolver();
        resolver.Credentials = CredentialCache.DefaultCredentials;

        /*Crear la configuracion para poder acceder al XSLT los parametros true son para poder tratar 
         al xslt como documento y poder transformarlo*/
        XsltSettings settings = new XsltSettings(true,true);

        //Leer xslt
        XslCompiledTransform xslt = new XslCompiledTransform();
        xslt.Load(xsltPath, settings, resolver);

        //creamos a donde enviar la transformacion
        StringBuilder sBuilder = new StringBuilder();
        TextWriter tWriter = new StringWriter(sBuilder);
        XsltArgumentList xslArgs = new XsltArgumentList();
        xslArgs.AddParam("TipoFarmacia", "", TipoFarmacia);
        xslt.Transform(trMenu, xslArgs, tWriter);
        string resultado = sBuilder.ToString();
        Response.Write(resultado);
    }
}