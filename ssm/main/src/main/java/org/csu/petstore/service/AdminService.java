package org.csu.petstore.service;


import org.csu.petstore.vo.AdminVO;

public interface AdminService {

    AdminVO getAdmin(String username,String password);

}
