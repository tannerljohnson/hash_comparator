module HashComparator
  module Emails
    class Parser
      def self.parse(emails)
        emails.map do |email|
          email.strip.split('@')[1]
        end
      end
    end
  end
end