package com.littledoctor.clinicassistant.module.login;

/**
 * @Auther: 周俊林
 * @Date: 2018-12-04
 * @Description:
 */
/*@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)*/
public class SecurityConfig /*extends WebSecurityConfigurerAdapter*/ {

    /*@Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                // 配置URL权限
                .antMatchers("/static/**","/login").permitAll() // 匹配器 匹配Url 不需要登录验证
                .anyRequest().authenticated() // 其他所有的url都需要验证权限
                .and()
                .formLogin().loginPage("").permitAll() // 配置登录页面
                .failureUrl("").permitAll() // 登录失败的跳转页面
                .defaultSuccessUrl("") // 默认的系统首页
                .and()
                .logout() //  添加退出
                .logoutSuccessUrl("").permitAll(); // 退出成功后跳转页面

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        super.configure(auth);
    }
*/

}
