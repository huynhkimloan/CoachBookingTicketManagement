/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.configs;

import com.qldv.pojo.User;
import com.qldv.service.UserService;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

/**
 *
 * @author Admin
 */
@Component
public class ActiveUserAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserService userDetailService;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = null;
        if (authentication.getCredentials() != null) {
            password = authentication.getCredentials().toString();
        }

        UserDetails userDetails = userDetailService.loadUserByUsername(username);

        if (userDetails != null && userDetails.isEnabled()) {
            // Kiểm tra trạng thái active của người dùng
            if (isActiveUser(userDetails) && passwordEncoder.matches(password, userDetails.getPassword())) {
                return new UsernamePasswordAuthenticationToken(username, password, userDetails.getAuthorities());
            } else if(!isActiveUser(userDetails)){
                throw new DisabledException("Tài khoản của bạn bị khóa hoặc chưa được kích hoạt.");
            }
        }
        throw new BadCredentialsException("Tên đăng nhập hoặc mật khẩu không hợp lệ.");
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

    private boolean isActiveUser(UserDetails userDetails) {
        if (userDetails instanceof User) {
            User user = (User) userDetails;
            return user.getActive();
        }
        return true;
    }

}
