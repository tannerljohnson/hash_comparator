module HashComparator
  class SetComparator
    def self.calculate_overlap(subject_items:, target_items:)
      new(subject_items: subject_items, target_items: target_items).calculate_overlap
    end

    def initialize(subject_items:, target_items:)
      @subject_items = subject_items
      @target_items = target_items
    end

    attr_accessor :subject_items, :target_items

    def calculate_overlap
      subject_items & target_items
    end
  end
end