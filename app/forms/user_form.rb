#require 'string/similarity'
class UserForm < Reform::Form

  def initialize(args={})
    super(args)
  end

  property :first_name;
  property :last_name;
  property :nationality;
  property :birth_date;
  property :document;
  property :document_file_name;
  property :address;
  property :address_file_name;

  validates :first_name, presence:         { message: 'Ingrese un nombre' }
  validates :last_name, presence:          { message: 'Ingrese un apellido' }
  validates :birth_date, presence:         { message: 'Ingrese fecha de nacimiento' }
  validates :document, presence:           { message: 'Ingrese dni' }
  validates :document_file_name, presence: { message: 'Adjunte una imagen de DNI' }
  validates :address, presence:            { message: 'Ingrese una direccion' }
  validates :address_file_name, presence:  { message: 'Adjunte una imagen de domicilio' }
end