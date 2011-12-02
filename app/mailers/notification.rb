class Notification < ActionMailer::Base

  def ticket_criado(ticket)
    bcc         User.emails
    from       "leilao@leilaodeseminovos.com.br"
    subject    "Um Ticket foi criado"
  end
end
