package com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.http.Part;

public class FileHandel {

    public static boolean saveFile(Part filePart, String newFileName, String uploadPath) {
        if (filePart == null || newFileName == null || uploadPath == null) {
            return false; // Prevent null values
        }

        // Extract the file extension
        String originalFileName = filePart.getSubmittedFileName();
        String fileExtension = "";
        int lastDot = originalFileName.lastIndexOf(".");
        if (lastDot > 0) {
            fileExtension = originalFileName.substring(lastDot); // Keep the original extension
        } else {
            return false; // No valid extension
        }

        // Create full file name with extension
        String finalFileName = newFileName + ".jpg";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs(); // Create directory if not exists

        // Save file
        File finalFile = new File(uploadPath, finalFileName);
        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(finalFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
            return true; // File saved successfully
        } catch (IOException e) {
            e.printStackTrace();
            return false; // File saving failed
        }
    }
}

