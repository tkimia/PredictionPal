package predictionpal

import grails.transaction.Transactional

@Transactional
class MailService {

	static transactional = false

    def serviceMethod(recipient, emailSubject, emailBody) {
        sendMail {
            async true
            to "testabc@yopmail.com"
            subject "hello"
            body "world"
            /*to params.recipient;
            from "predictionpal@gmail.com"
            subject params.emailSubject
            body params.emailBody*/
        }	
    }
}
