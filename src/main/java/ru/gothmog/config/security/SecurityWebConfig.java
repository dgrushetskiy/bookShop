package ru.gothmog.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import ru.gothmog.util.SecurityUtility;

@Configuration
@EnableWebSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityWebConfig extends WebSecurityConfigurerAdapter {
    private static final String[] PUBLIC_MATCHERS = {
            "/static/**",
            "/",
            "/newUser",
            "/forgetPassword",
            "/password/**",
            "/login"
    };
    @Autowired
    private UserDetailsService userDetailsService;

    private BCryptPasswordEncoder passwordEncoder() {
        return SecurityUtility.passwordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    /**
     * In Memory
     *
     * @Override protected void configure(AuthenticationManagerBuilder auth) throws Exception {
     * auth.inMemoryAuthentication().withUser("admin").password("apass").authorities("ROLE_ADMIN").and()
     * .withUser("user").password("upass").authorities("ROLE_USER");
     * }
     */

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers(PUBLIC_MATCHERS).permitAll()
                .anyRequest().authenticated();
        http
                .csrf().disable().cors().disable()
                .formLogin().loginPage("/login").defaultSuccessUrl("/")
                .failureUrl("/login?error")
                .usernameParameter("username")
                .passwordParameter("password")
                .and()
                .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/?logout").deleteCookies("remember-me").permitAll()
                .and()
                .rememberMe();

        /** 1 вариант
         http.authorizeRequests().antMatchers(PUBLIC_MATCHERS).permitAll()
         .anyRequest().authenticated();

         http.formLogin().and().httpBasic();
         */
        /** 2 вариант
         http
         .authorizeRequests()
         .anyRequest().authenticated()
         .and()
         .formLogin()
         .and()
         .httpBasic();
         */
    }
}
