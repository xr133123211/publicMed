package com.pubmed.common;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.tags.RequestContextAwareTag;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import javax.servlet.jsp.JspWriter;


@Component
public class PaginateTag extends RequestContextAwareTag {
    private FreeMarkerConfigurer freeMarkerConfigurer;
    private String nextLabel;
    private String previousLabel;
    private String template;
    private JspWriter out;
    private String url;

    public PaginateTag() {
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    protected int doStartTagInternal() throws Exception {
        this.initData();
        Paginate paginate = (Paginate)this.pageContext.findAttribute("paginate");
        this.adjustPageNo(paginate);
        HashMap map = new HashMap();
        map.put("paginate", paginate);
        map.put("nextLabel", this.nextLabel);
        map.put("previousLabel", this.previousLabel);
        map.put("url", this.url);
        if(Strings.isEmpty(this.template)) {
            this.template = "pagenate";
        }

        Template t = this.freeMarkerConfigurer.getConfiguration().getTemplate(this.template + ".ftl");

        try {
            String e = FreeMarkerTemplateUtils.processTemplateIntoString(t, map);
            this.out.print(e);
        } catch (TemplateException var5) {
            var5.printStackTrace();
        }

        return 6;
    }

    private void initData() {
        this.freeMarkerConfigurer = (FreeMarkerConfigurer)this.getRequestContext().getWebApplicationContext().getBean("freeMarkerConfigurer");
        this.nextLabel = "上一页";
        this.previousLabel = "下一页";
        this.out = this.pageContext.getOut();
        this.url = this.getURL();
    }

    private String getURL() {
        HttpServletRequest request = (HttpServletRequest)this.pageContext.getRequest();
        String baseUrl = (String)request.getAttribute("javax.servlet.forward.request_uri");
        if(baseUrl == null) {
            baseUrl = request.getRequestURI();
        }

        String q = this.getQueryString(request);
        return baseUrl + q;
    }

    private String getQueryString(HttpServletRequest request) {
        StringBuffer q = new StringBuffer();
        Map params = request.getParameterMap();
        q.append("?");
        Iterator i$ = params.keySet().iterator();

        while(true) {
            String key;
            do {
                if(!i$.hasNext()) {
                    q.append("pageNo=<1>");
                    return q.toString();
                }

                key = (String)i$.next();
            } while(key.equalsIgnoreCase("pageNo"));

            String[] values = (String[])params.get(key);

            for(int i = 0; i < values.length; ++i) {
                q.append(key);
                q.append("=");
                q.append(Strings.encodeUTF(values[i]));
                q.append("&");
            }
        }
    }

    private void adjustPageNo(Paginate paginate) {
        if(paginate.getPageNo() > paginate.getTotalPage()) {
            paginate.setPageNo(paginate.getTotalPage());
        }

        if(paginate.getPageNo() <= 0) {
            paginate.setPageNo(1);
        }

    }
}
