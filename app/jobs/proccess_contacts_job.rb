class ProccessContactsJob < ApplicationJob
  queue_as :default

  def perform(file, id)
    # Do something later
    user = User.find(id)
    CSV.foreach(file, headers: true, col_sep: ';') do |row|
      row[0] = row[0] << " x"
      contact = user.contacts.new(row.to_hash)
      contact.save
    end
  end
end
