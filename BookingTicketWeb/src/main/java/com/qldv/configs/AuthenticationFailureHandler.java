/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.configs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AccountStatusException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

/**
 *
 * @author Admin
 */
public class AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler{
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String errorParameter = getFailureParameter(exception);

        if ("inactive".equals(errorParameter)) {
            setDefaultFailureUrl("/login?error=inactive");
            super.onAuthenticationFailure(request, response, exception);
        } else {
            setDefaultFailureUrl("/login?error");
            super.onAuthenticationFailure(request, response, exception);
        }
    }

    private String getFailureParameter(AuthenticationException exception) {
        if (exception instanceof DisabledException) {
            return "inactive";
        } else {
            return "error";
        }
    }
}
