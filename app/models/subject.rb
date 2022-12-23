class Subject < ApplicationRecord

    has_many :pages, :dependent =>  :destroy
    has_one_attached :image

    acts_as_list

    validates :name, :presence => true,
                     :length => { :minimum => 2 },
                     :uniqueness => true
    validates_presence_of :position

    # image validation
    validates :image, :presence => true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }, on: :create

    # namescope(shortcut) queries of where, order and search
    scope :visible, lambda{where(:visible => true)}
    scope :invisible, lambda{where(:visible => false)}
    scope :search, lambda{ |query| where(['name LIKE ?', '%' + query +'%'])}
    scope :sorted, lambda{order("subjects.position ASC")}
    scope :new_first, lambda{order('subjects.created_at DESC')}



    def image_as_thumbnails
        return unless image.content_type.in?(%w[image/jpeg, image/png])
        image.variant(resize_to_limit: [100, 100]).processed
    end

end
