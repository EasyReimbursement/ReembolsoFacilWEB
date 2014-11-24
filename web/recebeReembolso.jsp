<%-- 
    Document   : recebeReembolso
    Created on : Nov 25, 2010, 2:10:35 PM
    Author     : caio
--%>

<%@page import="java.sql.Statement"%>

<%@page import="java.util.List"%>
<%@page import="conexao.Conexao"%>


<%

// http://10.69.25.55:8084/ReembolsoFacilWEB/faces/recebeReembolso.jsp?valor=34&descricao=Robalson&datadespesa=23/10/2010&tipo=Alimenta%C3%A7%C3%A3o

            // create database reembolsofacilweb;

            // create table
            /*

            CREATE TABLE tb_despesa (
            id_despesa INTEGER  NOT NULL AUTO_INCREMENT COMMENT 'Chave unica da despesa',
            descricao_despesa VARCHAR(100) NOT NULL COMMENT 'Descricao da Despesa',
            tipo_despesa VARCHAR(50) NOT NULL COMMENT 'Tipo da Despesa (Taxi, Hotel, etc)',
            valor_despesa NUMERIC NOT NULL,
            data_despesa DATE NOT NULL,
            id_usuario INTEGER NOT NULL COMMENT 'Chave única do usuário da despesa',
            data_hora TIMESTAMP NOT NULL,
            PRIMARY KEY (id_despesa)
            )
            ENGINE = MyISAM;


            // insert exemplo

            INSERT INTO tb_despesa(descricao_despesa
            , tipo_despesa
            , valor_despesa
            , data_despesa
            , id_usuario
            , data_hora)
            VALUES ('Hotel de Casa até ho'
            ,'Hotel'
            ,'34.34'
            , '23/11/2010'
            , '23'
            , '23/11/2010');


             */



            String androidValor = request.getParameter("valor");

            String androidDescricao = request.getParameter("descricao");

            String androidTipo = request.getParameter("tipo");

            String androidDataDespesa = request.getParameter("datadespesa");


            //  out.print(formData+"Juntou");

            //  out.print(formData.replace("&estados=", ","));

//        String Decodificado = URLDecoder.decode((formData.replace("&estados=", ",")), "UTF-8");

           // out.print("Data da despesa: " + androidDataDespesa);

            //out.print("<BR>");

         //   out.print("Valor da Despesa: " + androidValor);

           // out.print("<BR>");

           // out.print("Tipo da Despesa: " + androidTipo);

           // out.print("<BR>");

           // out.print("Descrição da Despesa: " + androidDescricao);

           // out.print("<BR>");


%>




<%
            //          Conexao con = new Conexao();
            //           con.conecta();
//            con.executeSQL("INSERT INTO tb_despesa (descricao_despesa, tipo_despesa, valor_despesa, data_despesa)"
            //              + " VALUES ('"+androidDescricao.toUpperCase()+"', '" + androidTipo.toUpperCase() + "', '" + androidValor + "', '"
            //            + androidDataDespesa + "');");


//inserir no banco de dados
//fazer a conexao com o mysql
            java.sql.Connection con;

               // mysql21.it4biz.com.br (187.45.196.207)
    // senha: dcfvgbhn3423
    // usuario: it4biz23
    // bd: it4biz23


            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = java.sql.DriverManager.getConnection(
                        "jdbc:mysql://mysql21.it4biz.com.br:3306/it4biz23", "it4biz23", "dcfvgbhn3423");
//                        "jdbc:mysql://localhost:3306/reembolsofacilweb", "root", "it4biz");
            } catch (Exception e) {
                e.printStackTrace();
                throw new java.lang.RuntimeException("erro ao conectar");
            }
            

            String comando;
            comando = "INSERT INTO tb_despesa (descricao_despesa, tipo_despesa, valor_despesa, data_despesa)"
                    + " VALUES ('Hotel de Casa até ho', 'Hotel', '34.34', '23/11/2010')";

            //comando = "INSERT INTO tb_despesa (descricao_despesa, tipo_despesa, valor_despesa, data_despesa)"
              //            + " VALUES ('"+androidDescricao.toUpperCase()+"', '" + androidTipo.toUpperCase() + "', '" + androidValor + "', '"
                //        + androidDataDespesa + "')";


            try {
                java.sql.Statement stmt = con.createStatement();
                stmt.executeUpdate(comando);

            } catch (java.sql.SQLException e) {
                e.printStackTrace();
            }


//Fechando a Conexão:
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                throw new java.lang.RuntimeException("erro fechar");
            }


            //con.executeSQL("INSERT INTO tb_despesa (descricao_despesa, tipo_despesa, valor_despesa, data_despesa)"
            //  + " VALUES ('Hotel de Casa até ho', 'Hotel', '34.34', '23/11/2010')");

            //out.print("INSERT INTO tb_despesa (descricao_despesa, tipo_despesa, valor_despesa, data_despesa)"
              //      + " VALUES ('Hotel de Casa até ho', 'Hotel', '34.34', '23/11/2010')");

//            while (con.resultset.next()) {
            //              out.println(con.resultset.getString("desc_vendedor"));
//
            //          }
            //con.desconecta();


            //


%>