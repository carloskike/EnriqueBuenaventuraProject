class BooksWorkedController < ApplicationController

	layout :resolve_layout
	before_action :have_sidebar, except: [:index, :new, :show, :create, :edit, :update, :destroy]

	def index
		@books = Book.all
		@have_sidebar = true
	end

	def show
		@book = Book.find(params[:id])
		@have_sidebar = true
	end

	def new
		@book = Book.new
		@have_sidebar = true
	end

	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to books_worked_path(@book)
		else 
			reder "new"
		end
	end

	def edit
		@book = Book.find(params[:id])
		@have_sidebar = true
	end

	def update
		@book = Book.find(params[:id])
		
		if @author.update(author_params)
			redirect_to  books_worked_index_path
		else
			redirect_to books_worked_path(@author)
		end
	end

	def destroy

		@book = Book.find(params[:id])
	  	
	  	if @author.destroy
	  		redirect_to books_worked_index_path
	  	end
	end

private
  def book_params
    params.require(:book).permit(:name, :description)
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	    else 
	      "application"
	    end
	end
end
