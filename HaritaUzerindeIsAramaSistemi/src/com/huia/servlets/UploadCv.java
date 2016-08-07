package com.huia.servlets;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class upload
 */
@WebServlet("/upload")
@MultipartConfig
public class UploadCv extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger
			.getLogger(UploadCv.class.getCanonicalName());

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// Create path components to save the file
		/* final String path = request.getParameter("destination"); */

		UserDAOImp user = new UserDAOImp();
		HttpSession session = request.getSession();
		final Part filePart = request.getPart("file");
		if (filePart != null) {
			String username = (String) session.getAttribute("username");
			final int adid = Integer.parseInt(request.getParameter("AdId"));
			final String path = "C:/uploadfiles";

			final String fileName = getFileName(filePart);
			final String filepath = "C:/uploadfiles" + "/" + adid + username
					+ fileName;

			OutputStream out = null;
			InputStream filecontent = null;

			try {
				out = new FileOutputStream(new File(
						path + File.separator + adid + username + fileName));
				filecontent = filePart.getInputStream();

				int read = 0;
				final byte[] bytes = new byte[1024];

				while ((read = filecontent.read(bytes)) != -1) {
					out.write(bytes, 0, read);
				}

				LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
						new Object[] { fileName, path });
				user.AddUserCV(adid, username, filepath);
			} catch (FileNotFoundException fne) {

				LOGGER.log(Level.SEVERE,
						"Problems during file upload. Error: {0}",
						new Object[] { fne.getMessage() });
			} finally {
				if (out != null) {
					out.close();
				}
				if (filecontent != null) {
					filecontent.close();
				}

			}
		}
		session.setAttribute("errorMessage", "Everthing is okey");
		response.sendRedirect(
				"http://localhost:8080/HaritaUzerindeIsArama/userhome.jsp");
	}

	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");
		LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
		for (String content : part.getHeader("content-disposition")
				.split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}
}
