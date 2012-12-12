class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :filled_forms

  def visible_forms
    Form.scoped
  end

  def fillable_forms
    Form.where(enabled: true)
  end

  def visible_filled_forms
    filled_forms
  end

  def editable_filled_forms
    filled_forms
  end
end
