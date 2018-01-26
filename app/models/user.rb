class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :role, optional: true
  before_create :set_default_role
  # or 
  # before_validation :set_default_role 

  has_many :rooms
  has_many :bookings
  has_many :reviews
  
  validates_presence_of :username, :moblie
  validates_numericality_of :moblie
  validates_length_of :moblie, is: 10

  def role?(role)
    self.role.name.include?(role)
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('guest')
  end 

end