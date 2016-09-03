/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.support.email;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sun.mail.pop3.POP3Store;
import java.io.IOException;
import javax.mail.Folder;
import javax.mail.NoSuchProviderException;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class support_email extends HttpServlet {

    // 환경 설정 변수
    private String contentType = "text/html";
    private String endcoding = "UTF-8";

    private static String username = "server@nyang.kr";
    private final String password = "ilove2silvi";

    private static final String smtp = "smtp.worksmobile.com";
    private static final String pop = "pop.worksmobile.com";

    private static final support_email instance = new support_email();
    private static Properties props;

    public static final support_email getInstance() {
        return instance;
    }

    public static final String getServer() {
        return username;
    }

    public static final String toName(String email, String name) { //이름이 비어있으면 이메일의 앞부분을 사용
        if (name.isEmpty() || name == null) {
            return email.substring(0, email.indexOf("@"));
        }
        return name;
    }

    static {
        props = System.getProperties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", smtp);
        props.put("mail.smtp.port", "587");
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("Email Load");
        getInstance().received();
    }

    //보내는사람,받는사람,보내는사람이름,제목,내용
    public void send(String from, String to, String name, String subjectz, String content) {
        try {
            Session sess = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
            MimeMessage msg = new MimeMessage(sess);
            // 보낸 시간
            msg.setSentDate(new Date());
            // 발신자
            msg.setFrom(new InternetAddress(username, name, "UTF-8"));
            // 수신자
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            // 제목
            msg.setSubject(subjectz, endcoding);
            // 내용
            msg.setContent(content, "text/html; charset=UTF-8");
            // 헤더
            msg.setHeader("Content-Type", contentType);
            // 전송
            Transport.send(msg);
        } catch (AddressException ae) {
            System.out.println("Error : " + ae.getMessage());
            ae.printStackTrace(System.err);
        } catch (MessagingException me) {
            System.out.println("Error : " + me.getMessage());
            me.printStackTrace(System.err);
        } catch (UnsupportedEncodingException ue) {
            System.out.println("Error : " + ue.getMessage());
            ue.printStackTrace(System.err);
        }
    }

    public void received() {
        try {
            Properties properties = new Properties();
            properties.put("mail.pop3.host", pop);
            Session emailSession = Session.getDefaultInstance(properties);

            POP3Store emailStore = (POP3Store) emailSession.getStore("pop3");
            emailStore.connect(username, password);

            Folder emailFolder = emailStore.getFolder("INBOX");
            emailFolder.open(Folder.READ_ONLY);

            Message[] messages = emailFolder.getMessages();

            Message message = messages[messages.length - 1]; //가장 마지막에 온 메일(문의)

            System.out.println("Subject: " + message.getSubject()); //제목 = 문의 type
            System.out.println("From: " + message.getFrom()[0]); //보낸사람 = member e-mail

            if (message.getContent() instanceof MimeMultipart) {
                MimeMultipart mimeMultipart = (MimeMultipart) message.getContent();
//                System.out.println("type: " + mimeMultipart.getBodyPart(0).getContentType() + ":");
                System.out.println("Text:" + mimeMultipart.getBodyPart(0).getContent()); //문의 내용
            } else {
                System.out.println();
                System.out.println("Text:" + message.getContent()); //문의 내용
            }

            emailFolder.close(false);
            emailStore.close();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
