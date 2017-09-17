require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def find_by_name(name)
  results = []
  search = name.downcase
  contacts.each do |contact|
    if contact.full_name.downcase.include?(search)
      results.push(contact)
    end
  end
  puts "Name search results (#{search})"
  results.each do |contact|
    puts contact.to_s('full_name')
    contact.print_phone_numbers
    contact.print_addresses
    puts "\n"
  end
end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

yvonne = Contact.new
yvonne.first_name = "Yvonne"
yvonne.middle_name = "Yu Yuk"
yvonne.last_name = "Tang"
yvonne.add_phone_number("Home", "18610701845")
yvonne.add_phone_number("Work", "1861070188")
yvonne.add_address("Home", "4 Chancel Court", "57 Dean St", "United Kingdom" "W1D6AH")

becky = Contact.new
becky.first_name = "Becky"
becky.last_name = "Liu"
becky.add_phone_number("Home", "222223333")
becky.add_address("Home", "222 Two Lane", "", "Portland", "OR", "12345")

address_book.contacts.push(yvonne)
address_book.contacts.push(becky)

#address_book.print_contact_list

address_book.find_by_name("yvonne")
