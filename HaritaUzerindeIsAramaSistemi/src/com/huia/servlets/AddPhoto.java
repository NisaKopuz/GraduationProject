package com.huia.servlets;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class AddPhoto
 */
@WebServlet("/AddPhoto")
@MultipartConfig(maxFileSize = 16177215)
public class AddPhoto extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		InputStream inputStream = null;

		HttpSession session = request.getSession();
		int adid = Integer.parseInt((String) session.getAttribute("AdId"));
		Part filePart = request.getPart("photo");
		String username = (String) session.getAttribute("username");
		String url = request.getHeader("referer");
		AdDAOImp addao = new AdDAOImp();
		if (filePart != null) {

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			/// Resizing
			BufferedImage originalImage = ImageIO.read(inputStream);
			int targetWidth = 150;
			int targetHeight = 150;
			if (originalImage != null) {
				int type = (originalImage
						.getTransparency() == Transparency.OPAQUE)
								? BufferedImage.TYPE_INT_RGB
								: BufferedImage.TYPE_INT_ARGB;
				BufferedImage ret = (BufferedImage) originalImage;
				int w, h;
				boolean higherQuality = true;
				if (higherQuality) {
					// Use multi-step technique: start with original size, then
					// scale down in multiple passes with drawImage()
					// until the target size is reached
					w = originalImage.getWidth();
					h = originalImage.getHeight();
				} else {
					// Use one-step technique: scale directly from original
					// size to target size with a single drawImage() call
					w = targetWidth;
					h = targetHeight;
				}

				do {
					if (higherQuality && w > targetWidth) {
						w /= 2;
						if (w < targetWidth) {
							w = targetWidth;
						}
					}

					if (higherQuality && h > targetHeight) {
						h /= 2;
						if (h < targetHeight) {
							h = targetHeight;
						}
					}
					BufferedImage tmp = new BufferedImage(w, h, type);
					Graphics2D g2 = tmp.createGraphics();
					g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
							RenderingHints.VALUE_ANTIALIAS_ON);

					g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
							RenderingHints.VALUE_INTERPOLATION_BICUBIC);
					g2.setRenderingHint(RenderingHints.KEY_RENDERING,
							RenderingHints.VALUE_RENDER_QUALITY);

					g2.drawImage(ret, 0, 0, w, h, null);
					g2.dispose();

					ret = tmp;
				} while (w != targetWidth || h != targetHeight);

				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				ImageIO.write(ret, "png", baos);
				InputStream is = new ByteArrayInputStream(baos.toByteArray());

				if (is != null) {
					addao.addPhoto(is, adid, username);
					session.setAttribute("AddPhoto", true);
				}
			}
			session.setAttribute("Photo", true);
			response.sendRedirect(url);
		}
	}

}
