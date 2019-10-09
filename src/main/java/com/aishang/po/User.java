package com.aishang.po;

import lombok.Data;

@Data
public class User {
    private Integer uid;
    private String userName;
    private String passWord;
    private String name;
    private String email;
    private String phone;
    private String addr;
    private Integer state;
    private String code;
}
