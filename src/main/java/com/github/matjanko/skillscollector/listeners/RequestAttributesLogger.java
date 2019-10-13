package com.github.matjanko.skillscollector.listeners;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.annotation.WebListener;
import java.util.logging.Logger;

@WebListener
public class RequestAttributesLogger implements ServletRequestAttributeListener {

    public static final Logger log = Logger.getLogger(RequestAttributesLogger.class.getName());

    @Override
    public void attributeAdded(ServletRequestAttributeEvent event) {
        String attrName = event.getName();
        Object attrValue = event.getValue();

        log.info(String.format("Dodano atrybut %s o wartości %s", attrName, attrValue));
    }

    @Override
    public void attributeRemoved(ServletRequestAttributeEvent event) {
        String attrName = event.getName();

        log.info(String.format("Usunięto atrybut %s", attrName));
    }

    @Override
    public void attributeReplaced(ServletRequestAttributeEvent event) {
        String attrName = event.getName();
        Object attrValue = event.getValue();

        log.info(String.format("Zmieniono atrybut %s na wartość %s", attrName, attrValue));
    }
}
