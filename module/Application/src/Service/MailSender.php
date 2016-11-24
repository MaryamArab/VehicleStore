<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Application\Service;

use Zend\Mail;
use Zend\Mail\Message;
use Zend\Mail\Transport\Sendmail;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mail\Transport\SmtpOptions;
/**
 * Description of MailSender
 *
 * @author 8560p
 */
class MailSender {
    /**
     * Sends the mail message.
     */
    public function sendMail($sender, $recipient, $subject, $text) 
    {
        $result = false;
        try {        
            // Create E-mail message
            $mail = new Message();
            $mail->setBody($text);
            $mail->setFrom($sender);
            $mail->addTo($recipient);
            $mail->setSubject($subject);
            // Send E-mail message
            $transport = new Sendmail('-f'.$sender);
            $transport->send($mail);
            $result = true;
        } catch(\Exception $e) {
            $result = false;
        }
        
        return $result;
    }
    public function sendSMTPMail($sender, $recipient, $subject, $text) {
        $result = false;
        try {
	     $message = new Message();
	     $message->addTo($recipient)
		->addFrom('meysamabl@yahoo.com')
		->setSubject($subject)
		->setBody($text);

	    // Setup SMTP transport using LOGIN authentication
	    $transport = new SmtpTransport();
	    $options   = new SmtpOptions(array(
	        'name'              => 'smtp.mail.yahoo.com',
	        'host'              => 'smtp.mail.yahoo.com',
	        'port' => 587,
	        'connection_class'  => 'plain',
	        'connection_config' => array(
		    'username' => 'meysamabl@yahoo.com',
		    'password' => 'aA!mey6960',
		    'ssl'      => 'tls',
	        ),
	    ));
	    $transport->setOptions($options);
	    $transport->send($message);


	    $result = true;
        } catch(\Exception $e) {
	    $result = false;
        }

	return $result;
    }
}
