package com.xxx.demo.query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonQuery {
    private Integer page;
    private Integer rows;
    private String keywords;
}
