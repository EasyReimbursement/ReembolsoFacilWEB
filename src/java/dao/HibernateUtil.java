package dao;

import org.hibernate.*;
import org.hibernate.cfg.*;


public class HibernateUtil {
    private static final SessionFactory sessionFactory;
        static {
        try {
            sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log exception!
            throw new ExceptionInInitializerError(ex);
        }
    }
    public static Session getSession()
        throws HibernateException {
        return sessionFactory.openSession();
    }
    public static final ThreadLocal session = new ThreadLocal();

    public static Session currentSession() throws HibernateException {
      Session s = (Session) session.get();
      // Open a new Session, if this thread has none yet
      if (s == null) {
        s = sessionFactory.openSession();
        // Store it in the ThreadLocal variable
        session.set(s);
      }
      return s;
    }

    public static void closeSession() throws HibernateException {
      Session s = (Session) session.get();
      if (s != null)
        s.close();
      session.set(null);
    }
}