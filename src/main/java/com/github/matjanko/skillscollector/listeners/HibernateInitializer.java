package com.github.matjanko.skillscollector.listeners;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.Properties;
import java.util.logging.Level;

import static com.github.matjanko.skillscollector.listeners.RequestAttributesLogger.logger;

@WebListener
public class HibernateInitializer implements ServletContextListener {
    public static final String SESSION_FACTORY = "hibernateSessionFactory";

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Configuration configuration = new Configuration();

            Properties hbnProperties = new Properties();
            hbnProperties.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
            hbnProperties.put(Environment.URL, "jdbc:mysql://localhost:3306/skills_collector?useSSL=false&serverTimezone=UTC");
            hbnProperties.put(Environment.USER, "skills_collector_admin");
            hbnProperties.put(Environment.PASS, "skills123");
            hbnProperties.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
            hbnProperties.put(Environment.SHOW_SQL, "true");
            hbnProperties.put(Environment.FORMAT_SQL, "true");
            hbnProperties.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
            hbnProperties.put(Environment.HBM2DDL_AUTO, "validate");
            configuration.setProperties(hbnProperties);

            // Odkomentuj poniższe instrukcje po utworzeniu klas encji (kolejne zadania)

            //configuration.addAnnotatedClass(User.class);
            //configuration.addAnnotatedClass(Source.class);
            //configuration.addAnnotatedClass(Skill.class);

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();
            SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);

            sce.getServletContext().setAttribute(SESSION_FACTORY, sessionFactory);

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Błąd konfiguracji Hibernate!", e);
        }
    }
}
