class Advertise < ActiveRecord::Base

	#paginates_per 1
	#max_paginates_per 2

	geocoded_by :address
	after_validation :geocode
	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
