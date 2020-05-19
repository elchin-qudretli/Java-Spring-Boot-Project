package com.bilgeadam.BilgeAdamSpringBoot.service.impl;

import com.bilgeadam.BilgeAdamSpringBoot.entity.Project;
import com.bilgeadam.BilgeAdamSpringBoot.repository.ProjectRepository;
import com.bilgeadam.BilgeAdamSpringBoot.service.ProjectService;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    private final ProjectRepository projectRepository;
    @SuppressWarnings("unused")
	private final ModelMapper modelMapper;

    public ProjectServiceImpl(ProjectRepository projectRepository, ModelMapper modelMapper) {
        this.projectRepository = projectRepository;
        this.modelMapper = modelMapper;
    }



    @Override
    public List<Project> getAll() {
        List<Project> data = projectRepository.findAll();
       // ProjectDTO projectDTOList = modelMapper.map(data, ProjectDTO.class);

       // return Arrays.asList(modelMapper.map(data, ProjectDTO[].class));

        return data;
        //return (List<ProjectDTO>) projectDTOList;
    }

    @Override
    public Project getById(Long id) {
        Project p = projectRepository.getOne(id);
        return p;
    }

    @Override
    public Project save(Project project) {
        if(project.getProjectCode()==null)
        {
            throw  new IllegalArgumentException("hatali kayit");
        }
       // Project projectdb = modelMapper.map(projectDTO,Project.class);
        Project projectdb =  projectRepository.save(project);
        return projectdb;
       // return modelMapper.map(projectdb,ProjectDTO.class);
    }


    @Override
    public Project update(Project project) {
        Project projectDb = projectRepository.getOne(project.getId());
        if (projectDb == null)
            throw new IllegalArgumentException("Project Does Not Exist ID:" + project.getId());


       projectDb.setProjectCode(project.getProjectCode());
       projectDb.setProjectName(project.getProjectName());
      // projectDb.setInsertDate(project.);
       Project projectUpd = projectRepository.save(projectDb);
       return projectUpd;
    }

    @Override
    public Boolean delete(Long id) {
        projectRepository.deleteById(id);
        return true;
    }


}
