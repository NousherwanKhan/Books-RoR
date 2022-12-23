class Page < ApplicationRecord

    belongs_to :subject
    has_many :sections, :dependent => :destroy
    has_and_belongs_to_many :editors, :class_name => 'AdminUser'
    
    acts_as_list :scope => :subject
    before_validation :add_default_permalink
    after_save :subject_touch

    scope :sorted, lambda{order('pages.position ASC')}
    scope :visible, lambda{where(:visible => true)}
    scope :invisible, lambda{where(:visible => false)}
    
    validates :name,  :presence => true,
                     :length => {:within => 5..20}

    validates :position,  :presence => true
    validates :subject_id,  :presence => true,
                           :length => {:within => 1..20}
    validates :permalink,  :presence => true,
                           :length => {:within => 5..30}


    private
    def add_default_permalink
        if permalink.blank?
            self.permalink = "#{id}-#{name.parameterize}"
        end
    end

    def subject_touch
        subject.touch
        # this changes updated_at to time.now
    end

end
