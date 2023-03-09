
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import controller.*;
import java.io.Serializable;

/**
 *
 * @author The Anh
 */

public class Student implements Serializable{
    private int id;
    private String name, dob;
    private boolean gender;

    public Student() {
    }

    public Student(int id, String name, String dob, boolean gender) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

   
    public String getStudent() {
        return id + "-" +(gender?"FeMale":"Male")+name + "-" + dob + "-" + gender;
    }
    
    
}
                                                                             