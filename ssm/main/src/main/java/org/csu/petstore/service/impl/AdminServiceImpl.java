package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.Admin;
import org.csu.petstore.persistence.AdminMapper;
import org.csu.petstore.service.AdminService;
import org.csu.petstore.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;


    @Override
    public AdminVO getAdmin(String username, String password) {
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("adminname", username).eq("adminpassword", password);
        Admin admin = adminMapper.selectOne(queryWrapper);
        if (admin == null) {
            return null;
        }
        AdminVO adminVO = new AdminVO();
        adminVO.setUsername(admin.getUsername());
        adminVO.setPassword(admin.getPassword());
        return adminVO;
    }


}

