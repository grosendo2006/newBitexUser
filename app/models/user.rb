class User
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :nationality, :birth_date, :document,
                :document_file_name, :address, :address_file_name

  NATIONALITIES= [
    ['Argentina', 'AR'],
    ['Brasil', 'BR'],
    ['Uruguay', 'UY'],
    ['Chile', 'CL']
  ]

end