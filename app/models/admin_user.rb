class AdminUser < ApplicationRecord

    has_secure_password
    has_and_belongs_to_many  :pages
    has_many :section_edits
    has_many :sections, :through => :section_edits, :foreign_key => 'section_id'

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    
    
    validates :first_name,  :presence => true,
                            :length => { :maximum => 20}
                            # :null => false
    validates :last_name,   :presence => true,
                            :length => { :maximum => 20}
                            # :null => false
    validates :username,    :presence => true,
                            :length => {:within => 5..30}
                            # :null => false
    validates  :email,  :presence => true,
                        :length => { :maximum => 40},
                        :format => VALID_EMAIL_REGEX,
                        :confirmation => true

    

    


    scope :sorted, lambda{order('last_name ASC','first_name ASC')}

end

