module HashComparator
  module Emails
    class Parser
      def self.parse(emails, options = {})
        new(emails, options).parse
      end

      def initialize(emails, options)
        @emails = emails
        @options = options
      end

      attr_accessor :emails, :options

      def parse
        remove_usernames if options[:remove_usernames]
        remove_generic_domains if options[:remove_generic_domains]

        emails
      end

      private

      def remove_usernames
        @emails = emails.map do |email|
          email.strip.split('@')[1]
        end
      end

      def remove_generic_domains
        @emails = emails.each_with_object([]) do |email, list|
          domain = email.split('@')[-1]
          list << email unless GENERIC_EMAIL_DOMAINS.include?(domain)
        end
      end
    end

    # Email Domains
    # Adapted from https://github.com/mailcheck/mailcheck/wiki/List-of-Popular-Domains
    GENERIC_EMAIL_DOMAINS = %w[
      aol.com
      att.net
      comcast.net
      facebook.com
      gmail.com
      gmx.com
      googlemail.com
      google.com
      hotmail.com
      hotmail.co.uk
      mac.com
      me.com
      mail.com
      msn.com
      live.com
      sbcglobal.net
      verizon.net
      yahoo.com
      yahoo.co.uk
      email.com
      games.com
      gmx.net
      hush.com
      hushmail.com
      icloud.com
      inbox.com
      lavabit.com
      love.com
      outlook.com
      pobox.com
      rocketmail.com
      safe-mail.net
      wow.com
      ygm.com
      ymail.com
      zoho.com
      fastmail.fm
      bellsouth.net
      charter.net
      comcast.net
      cox.net
      earthlink.net
      juno.com
      btinternet.com
      virginmedia.com
      blueyonder.co.uk
      freeserve.co.uk
      live.co.uk
      ntlworld.com
      o2.co.uk
      orange.net
      sky.com
      talktalk.co.uk
      tiscali.co.uk
      virgin.net
      wanadoo.co.uk
      bt.com
      sina.com
      qq.com
      naver.com
      hanmail.net
      daum.net
      nate.com
      yahoo.co.jp
      yahoo.co.kr
      yahoo.co.id
      yahoo.co.in
      yahoo.com.sg
      yahoo.com.ph
      hotmail.fr
      live.fr
      laposte.net
      yahoo.fr
      wanadoo.fr
      orange.fr
      gmx.fr
      sfr.fr
      neuf.fr
      free.fr
      gmx.de
      hotmail.de
      live.de
      online.de
      t-online.de
      web.de
      yahoo.de
      mail.ru
      rambler.ru
      yandex.ru
      ya.ru
      list.ru
      hotmail.be
      live.be
      skynet.be
      voo.be
      tvcablenet.be
      telenet.be
      hotmail.com.ar
      live.com.ar
      yahoo.com.ar
      fibertel.com.ar
      speedy.com.ar
      arnet.com.ar
      hotmail.com
      gmail.com
      yahoo.com.mx
      live.com.mx
      yahoo.com
      hotmail.es
      live.com
      hotmail.com.mx
      prodigy.net.mx
      msn.com
    ].freeze
  end
end