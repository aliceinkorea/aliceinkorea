class Event < ActiveRecord::Base

  has_many :tickets, dependent: :destroy
  has_many :requests, dependent: :destroy
  
  accepts_nested_attributes_for :tickets,
    :allow_destroy => true,
    :reject_if     => :all_blank

  attr_accessible :title, :genre, :venue, :city, :start_date, :end_date, 
                  :age_group, :run_time, :description, :image
                  
  mount_uploader :image, ImageUploader
  
  STATUS = ['Not Active',
            'Active', 
            'Closed']
            
  GENRE = ['Concert', 
           'Musical', 
           'Exhibitions', 
           'Sports', 
           'Others']
                  
  validates_presence_of :title,
                        message: "Title can't be blank"
  
  validates_presence_of :genre,
                        message: "Genre can't be blank"
  
  validates_presence_of :venue,
                        message: "Venue can't be blank"
  
  validates_presence_of :city,
                        message: "City can't be blank"
                        
  validates_presence_of :start_date,
                        message: "Start date can't be blank"
  
  validates_presence_of :age_group,
                        message: "Age group can't be blank"
  
  validates_presence_of :description,
                        message: "Description can't be blank"
  
  validates_presence_of :image,
                        message: "Image can't be blank"
                        
  validates_inclusion_of :status, in: STATUS,
                        message: "Invalid status"
    
  def is_active?
    status == 'Active'
  end
  
end
