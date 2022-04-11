package com.codeup.retrolister.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String console;
    private String description;
    private String imageUrl;
    private String postType;

    public Ad(long id, long userId, String title, String console, String description, String imageUrl, String postType) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.console = console;
        this.description = description;
        this.imageUrl = imageUrl;
        this.postType = postType;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getConsole() {
        return console;
    }

    public void setConsole(String console) {
        this.console = console;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }
}
