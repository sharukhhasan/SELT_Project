class Profile < ActiveRecord::Base
    belongs_to :author, :class_name => "User"

    # Paperclip
    has_attached_file :photo, :styles => { :medium => "400x400>", :thumb => "50x50>", :regular => "200x200>" }
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
