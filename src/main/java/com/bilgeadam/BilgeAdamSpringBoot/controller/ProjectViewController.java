package com.bilgeadam.BilgeAdamSpringBoot.controller;

import com.bilgeadam.BilgeAdamSpringBoot.entity.Project;
import com.bilgeadam.BilgeAdamSpringBoot.service.impl.ProjectServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;
import java.util.List;

@Controller
public class ProjectViewController {

    private final ProjectServiceImpl projectServiceImpl;

    //Constructor Dependency Injection
    public ProjectViewController(ProjectServiceImpl projectServiceImpl) {
        this.projectServiceImpl = projectServiceImpl;
    }

    @RequestMapping("/newproject")
    public ModelAndView showform(){
        return new ModelAndView("newproject","command",new Project());
    }

    @RequestMapping(value="/addNewProject",method = RequestMethod.POST)
    public ModelAndView  submit( @ModelAttribute("project")Project project,
                         BindingResult result, ModelMap model) {

        Date date = new Date();
        project.setInsertDate(date);
      
        projectServiceImpl.save(project);
        return new ModelAndView("redirect:/allprojects");
    }

    @RequestMapping(value="/editproject/{id}")
    public String edit(@PathVariable Long id, Model m){
        Project project=projectServiceImpl.getById(id);
        m.addAttribute("command",project);
        return "editproject";
    }

    @RequestMapping(value="/editsave",method = RequestMethod.POST)
    public String editsave(@ModelAttribute("project") Project project){

        projectServiceImpl.update(project);
        return "redirect:/allprojects";
    }

    @RequestMapping(value="/deleteproject/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable Long id){
        projectServiceImpl.delete(id);
        return "redirect:/allprojects";
    }



    @RequestMapping(value = "/allprojects", method = RequestMethod.GET)
    public ModelAndView getdata() {
        List<Project> list = projectServiceImpl.getAll();
        ModelAndView model = new ModelAndView("projects");
        model.addObject("lists", list);
        return model;

    }

}