<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- java -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!-- hibernate -->
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.AnnotationConfiguration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.*, org.hibernate.cfg.*"%>

<!-- projeto -->
<%@page import="dao.Despesas"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Despesas</title>
    </head>
    <body>
        <h1>Lista Despesas</h1>

        <%


                    SessionFactory sf;
                    try {
                        //SessionFactory deve ser criado uma ъnica vez durante a execuзгo
                        //da aplicaзгo
                        sf = new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();
                        Session sessao = sf.openSession();
                        //session.beginTransaction();
                        List relDespesas = sessao.createQuery("from Despesas").list();
                        //session.getTransaction().commit();

                        for (int i = 0; i < relDespesas.size(); i++) {
                            Despesas oDespesas = (Despesas) relDespesas.get(i);
                            out.print("<BR><BR>Descrição Despesa: " + oDespesas.getDescricao_despesa()
                                    + "<BR> Tipo Despesa: " + oDespesas.getTipo_despesa()
                                    + "<BR> Valor Despesa: " + oDespesas.getValor_despesa()
                                    + "<BR> Data Despesa: " + oDespesas.getData_despesa());
                        }
                        //tx.commit(); //Fecha transaзгo
                        sessao.close(); //Fecha sessгo
                    } catch (Throwable ex) {
                        // Make sure you log the exception, as it might be swallowed
                        System.err.println("Initial SessionFactory creation failed." + ex);
                        throw new ExceptionInInitializerError(ex);
                    }


        %>

    </body>
</html>