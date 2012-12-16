class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name

  validates :first_name, presence: true
  validates :last_name, presence: true
  
  has_many :filled_forms, order: "updated_at DESC"

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
    filled_forms.where(state: [nil, 'not_reviewed'])
  end

  def name
    "#{first_name} #{last_name}"
  end
end
