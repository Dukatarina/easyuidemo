package com.xxx.demo.rest;

import com.alibaba.excel.EasyExcel;
import com.xxx.demo.vo.DownloadData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/button")
    public String button() {
        return "button";
    }

    @GetMapping("/panel")
    public String panel() {
        return "panel";
    }

    @GetMapping("/window")
    public String window() {
        return "window";
    }

    @GetMapping("/form")
    public String form() {
        return "form";
    }

    @GetMapping("/demo")
    public String demo() {
        return "demo";
    }

    @GetMapping("/combobox")
    public String combobox() {
        return "combobox";
    }

    @GetMapping("/datagrid2")
    public String datagrid2() {
        return "datagrid2";
    }

    @GetMapping("/datagrid3")
    public String datagrid3() {
        return "datagrid3";
    }

    @GetMapping("/down")
    public String down() {
        return "excelDown";
    }

    @GetMapping("/project")
    public String project() {
        return "project";
    }

}