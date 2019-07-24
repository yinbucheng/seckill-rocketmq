package org.apache.rocketmq.gateway.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author ：yinchong
 * @create ：2019/7/24 14:15
 * @description：
 * @modified By：
 * @version:
 */
@Configuration
public class DruidConfig {

    @Bean
    @SuppressWarnings("all")
    public ServletRegistrationBean druidServlet(@Value("${spring.datasource.druid.stat-view-servlet.login-username}") String username, @Value("${spring.datasource.druid.stat-view-servlet.login-password}") String password) {

        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
        //登录查看信息的账号密码.
        servletRegistrationBean.addInitParameter("loginUsername", username);
        servletRegistrationBean.addInitParameter("loginPassword", password);
        return servletRegistrationBean;
    }

    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new WebStatFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }
}
