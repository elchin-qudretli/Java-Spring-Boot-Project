package com.bilgeadam.BilgeAdamSpringBoot.dto;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@SuppressWarnings({ "serial", "unused" })
public class ProjectDTO implements Serializable {


    public Long id;
    public String project_name;
    public String project_code;
    public Date insert_date;
   

}