package com.bilgeadam.BilgeAdamSpringBoot.service;
import com.bilgeadam.BilgeAdamSpringBoot.entity.Project;

import java.util.List;

public interface ProjectService {

    List<Project> getAll();

    Project getById(Long id);

    Project save(Project projectDTO);

    Project update(Project project);

    Boolean delete(Long id);
}