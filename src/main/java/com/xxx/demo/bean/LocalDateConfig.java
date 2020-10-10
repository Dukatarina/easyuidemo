package com.xxx.demo.bean;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class LocalDateConfig implements Converter<String, Date> {

    @Override
    public Date convert(String source) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return sdf1.parse(source);
        } catch (Exception e) {
            try {
                return sdf2.parse(source);
            } catch (ParseException ex) {
                return null;
            }
        }
    }
}