
package conexao;

import java.sql.*;
import javax.swing.*;

public class Conexao {

    // mysql21.it4biz.com.br (187.45.196.207)
    // senha: dcfvgbhn3423
    // usuario: it4biz23
    // bd: it4biz23

    final private String driver = "com.mysql.jdbc.Driver";
    final private String url = "jdbc:mysql://localhost:3306/reembolsofacilweb";
    final private String usuario = "root";
    final private String senha = "it4biz";
    private Connection conexao;
    public Statement statement;
    public ResultSet resultset;

    public boolean conecta() {
        boolean result = true;
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, usuario, senha);
            System.out.println("conectou");
        } catch (ClassNotFoundException Driver) {
            JOptionPane.showMessageDialog(null, "Driver não localizado: " + Driver);
            result = false;
        } catch (SQLException Fonte) {
            JOptionPane.showMessageDialog(null, "Deu erro na conexão " +
                    "com a fonte de dados: " + Fonte);
            result = false;
        }
        return result;
    }

    public void desconecta() {
        boolean result = true;
        try {
            conexao.close();
            System.out.println("Desconectou");
        } catch (SQLException fecha) {
            JOptionPane.showMessageDialog(null, "Não foi possivel " +
                    "fechar o banco de dados: " + fecha);
            result = false;
        }

    }

    public void executeSQL(String sql) {
        try {
            statement = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = statement.executeQuery(sql);
        } catch (SQLException sqlex) {
            JOptionPane.showMessageDialog(null, "Não foi possível " + "executar o comando sql," + sqlex + ", o sql passado foi " + sql);
        }

    }

    public static void main(String args[]) {
        Conexao obj = new Conexao();
        obj.conecta();
        obj.desconecta();
    }
}
