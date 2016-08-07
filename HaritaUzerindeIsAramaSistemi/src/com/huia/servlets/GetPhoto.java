package com.huia.servlets;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class GetPhoto
 */
@WebServlet("/GetPhoto")
public class GetPhoto extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int len;
		int size = 1024;
		byte[] imageBytes;

		int adid = Integer.parseInt((String) request.getParameter("adid"));

		AdDAOImp addao = new AdDAOImp();
		InputStream inputStream2 = addao.getPhoto(adid);

		if (inputStream2 != null) {
			BufferedImage bf = ImageIO.read(inputStream2);
			bf = rotate(bf, 0);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(bf, "png", baos);
			InputStream inputStream = new ByteArrayInputStream(
					baos.toByteArray());
			if (inputStream instanceof ByteArrayInputStream) {
				size = inputStream.available();
				imageBytes = new byte[size];
				len = inputStream.read(imageBytes, 0, size);
			} else {
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				imageBytes = new byte[size];
				while ((len = inputStream.read(imageBytes, 0, size)) != -1)
					bos.write(imageBytes, 0, len);
				imageBytes = bos.toByteArray();
			}

			response.setContentType("image/jpeg");
			response.setContentLength(imageBytes.length);

			response.getOutputStream().write(imageBytes);
		}
	}

	private static BufferedImage rotate(BufferedImage bf, double degs) {
		int width = bf.getWidth(null);
		int height = bf.getHeight(null);
		BufferedImage temp = new BufferedImage(height, width,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = temp.createGraphics();
		g2.rotate(Math.toRadians(degs), height / 2, height / 2);
		g2.drawImage(bf, 0, 0, Color.WHITE, null);
		g2.dispose();
		return temp;
	}
}
