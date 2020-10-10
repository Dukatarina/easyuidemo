package com.xxx.demo.vo;

import com.xxx.demo.Enum.Status;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Person {

    private String id;
    private String name;
    private Integer age;
//    private LocalDateTime birthday;
    private Date birthday;
    private String address;
    private Status status ;
    private List<Integer> list;
}
