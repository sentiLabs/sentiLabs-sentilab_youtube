package com.kplo.samplesenti.news;

import java.io.Serializable;

/**
 * Created by KPlo on 2018. 11. 3..
 */

public class NewsData implements Serializable {
    private String title;
    private String urlToImage;
    private String content;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrlToImage() {
        return urlToImage;
    }

    public void setUrlToImage(String urlToImage) {
        this.urlToImage = urlToImage;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
