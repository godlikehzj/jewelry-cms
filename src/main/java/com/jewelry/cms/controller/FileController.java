package com.jewelry.cms.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jewelry.cms.bean.entity.Response;
import com.jewelry.cms.dao.CPictureRespository;
import com.jewelry.cms.utils.ApiStatus;
import com.jewelry.cms.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Controller
public class FileController {
    @Autowired
    private CPictureRespository cPictureRespository;

    @RequestMapping("/img/upload")
    @ResponseBody
    public JSONObject handleImgUpload(@RequestParam("file_data") MultipartFile file) {
        JSONObject result = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        if (!file.isEmpty()) {
            try {
                DateFormat df =  new SimpleDateFormat("yyyyMMddHHmmss");
                Date now = new Date();
                String[] temp = file.getOriginalFilename().split("\\.");
                String filename = df.format(now) + new Random().nextInt(100) + "." + temp[temp.length - 1];
                BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(FileUtils.upload_img_path + filename)));
                out.write(file.getBytes());
                out.flush();
                out.close();
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("caption", FileUtils.img_path + filename);
                jsonObject.put("key", FileUtils.img_path + filename);
                jsonObject.put("size", file.getSize());
                jsonArray.add(jsonObject);
                result.put("initialPreviewConfig", jsonArray);
                JSONArray pre = new JSONArray();
                pre.add(FileUtils.img_url + filename);
                result.put("initialPreview", pre);
            } catch (Exception e) {
                e.printStackTrace();
                result.put("error", "excption");
                return result;
            }

            return result;

        } else {
            result.put("error", "file not exist");
            return result;
        }
    }

    @RequestMapping("img/delete")
    @ResponseBody
    public JSONObject deleteImg(String key){
        cPictureRespository.deleteByPicName(key);
        return new JSONObject();
    }

    @RequestMapping("/rich/img/upload")
    @ResponseBody
    public JSONObject handleRichImgUpload(@RequestParam("file_data") MultipartFile file) {
        JSONObject result = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        if (!file.isEmpty()) {
            try {
                DateFormat df =  new SimpleDateFormat("yyyyMMddHHmmss");
                Date now = new Date();
                String[] temp = file.getOriginalFilename().split("\\.");
                String filename = df.format(now) + new Random().nextInt(100) + "." + temp[1];
                BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(FileUtils.upload_img_path + filename)));
                out.write(file.getBytes());
                out.flush();
                out.close();
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("errno", 0);
                jsonArray.add(FileUtils.img_url + filename);
                result.put("data", jsonArray);
            } catch (Exception e) {
                e.printStackTrace();
                result.put("errno", "1");
                return result;
            }

            return result;

        } else {
            result.put("errno", "2");
            return result;
        }
    }
}
