class BooksWorked < ActiveRecord::Base

	has_and_belongs_to_many :documents
end