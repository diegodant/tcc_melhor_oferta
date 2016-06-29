<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
            <form action="nova_solicitacao.asp" method="post">
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td class="titu_eu"><img src="imagens/busca/titu_eu-quero.jpg" width="89" height="14" alt="Eu quero" title="Eu quero" border="0" /></td>
                          </tr>
                          <tr>
                            <td>
							<input name="Produto" type="text" class="form_bu"  /></td>
                          </tr>
                        </table>
                    </td>
                    <td>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td class="titu_ca"><img src="imagens/busca/titu_categoria.jpg" width="116" height="15" alt="Eu quero" title="Eu quero" border="0" /></td>
                          </tr>
                          <tr>
                            <td><select name="Categoria" class="form_bu2" >
									 <option>Selecione</option>
<%
//Set loConexaoInc = Server.CreateObject("ADODB.Connection")
//Set loRSInc = Server.CreateObject("ADODB.Recordset")

//loConexaoInc.Open Application("BD")
//loRSInc.Open "SELECT NCategoria, Nome FROM Categorias WHERE Ativa=1 ORDER BY Nome" , loConexaoInc

//While Not loRSInc.Eof
%>

					<option value=<%//=loRSInc("NCategoria")%>"><%//=loRSInc("Nome")%></option>

<%
   // loRSInc.MoveNext
//WEnd

//loRSInc.Close
//loConexaoInc.Close

//Set loRSInc = Nothing
//Set loConexaoInc = Nothing
%>
                              
                              </select>
                          </td>
                          </tr>
                        </table>
                    </td>
                    <td>
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="10"></td>
                          </tr>
                          <tr>
                            <td><input type="image" src="imagens/busca/bt_continuar.jpg" width="207" height="44" alt="Continuar" border="0" /></td>
                          </tr>
                        </table>
                    </td>
                  </tr>
                </table>
            </form>
            </td>
            <td width="248">&nbsp;</td>
          </tr>
        </table>