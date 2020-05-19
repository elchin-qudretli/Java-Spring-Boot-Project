package com.bilgeadam.BilgeAdamSpringBoot.repository;

import com.bilgeadam.BilgeAdamSpringBoot.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectRepository extends JpaRepository<Project,Long> {
}

