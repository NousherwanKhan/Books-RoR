class Section < ApplicationRecord

    belongs_to :page
    has_many :section_edits
    has_many :editors, :through => :section_edits, :class_name => 'AdminUser', :foreign_key => 'admin_user_id'

    acts_as_list :scope => :page
    after_save :page_touch


    validates :name, :presence => true,
    :length =>{:within => 4..20}
    validates :page_id, :presence => true,
    :length =>{:within => 1..20}
    validates :content, :presence => true,
                        :length =>{:within => 4..100}
                        validates :content_type, :presence => true
    validates :position, :presence => true

    
    scope :sorted, lambda{order('position ASC')}
    scope :visible, lambda{where(:visible => true)}
    scope :invisible, lambda{where(:visible => false)}
    
    private
    def page_touch
        page.touch
    end

end
