package com.aishang.service.impl;

import com.aishang.dao.IUserDao;
import com.aishang.po.User;
import com.aishang.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService implements IUserService {
    @Resource
    private IUserDao userDao;
    
    @Override
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    //ajax校验用户名是否重复
    @Override
    public Integer checkUserName(String userName) {
        return userDao.checkUserName(userName);
    }

    //注册用户
    @Override
    public void doRegister(User user) {
        userDao.doRegister(user);
    }

    //登录用户
    @Override
    public User loginok(User user) {
        return userDao.loginok(user);
    }

    //修改用户信息
    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);

    }
}
