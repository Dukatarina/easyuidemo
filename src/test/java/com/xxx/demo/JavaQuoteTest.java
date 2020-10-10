package com.xxx.demo;

import com.xxx.demo.vo.Person;

public class JavaQuoteTest {
    public static void main(String[] args) {
        int a = 1;
        Person person = new Person();
        person.setName("ashe");
        increase(a, person);
        System.out.println(a);
        System.out.println(person);
    }

    private static void increase(int a, Person person) {
        a=5;
        person.setName("lulu");
        person=new Person();
        person.setName("jinx");
    }
}
