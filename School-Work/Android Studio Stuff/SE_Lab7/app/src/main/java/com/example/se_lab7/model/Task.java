package com.example.se_lab7.model;
public class Task {
    private long taskID;
    private String description;
    public Task(long taskID, String description) {
        this.taskID = taskID;
        this.description = description;
    }
    public long getTaskID() {
        return taskID;
    }
    public void setTaskID(long taskID) {
        this.taskID = taskID;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    @Override
    public String toString() {
        return "[" + taskID +"]- " + description ;
    }
}
