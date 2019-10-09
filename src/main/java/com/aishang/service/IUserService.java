package com.aishang.service;

import com.aishang.po.User;

import java.util.List;

public interface IUserService {
    //所有用户
    List<User> getAllUser();

    //ajax校验用户名是否重复
    Integer checkUserName(String userName);

    //注册用户
    void doRegister(User user);

    //登录用户
    User loginok(User user);

    //修改用户信息
    void updateUser(User user);
}
