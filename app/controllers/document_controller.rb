class DocumentController < ApplicationController
	layout :resolve_layout
	before_action :authenticate_user!
	before_action :set_document, only: [:show, :edit, :update, :destroy]
	before_filter :have_sidebar, except: [:index, :new, :show, :edit, :destroy, :list, :doc, :create, :update]

	def index
		if params[:search]
			@documents = Document.search(params[:search])
		else 
			@documents = Document.all
		end
		@have_sidebar = true			
	end

	def list		
		@documents = Document.all
	end

	def doc
		@document = Document.find(params[:document_id])
	end

	def new
		@document = Document.new
		@proses =  Prose.all
		@types = Speciality.all
		@subtopics = Subtopic.all

		@all_authors = Author.all
		@document_author = @document.documentauthors.build

		@all_books = Book.all
		@document_book = @document.documentbooks.build
		@have_sidebar = true
	end

	def create
		@document = Document.new(document_params)

		params[:authors][:id].each do |author|
			if !author.empty?
				@document.documentauthors.build(:author_id => author)
			end
		end

		params[:books][:id].each do |book|
			if !book.empty?
				@document.documentbooks.build(:book_id => book)
			end
		end

		if @document.save 
			redirect_to document_index_path, notice: "El docuemto #{@document.name} ha sido guardado correctamente."
		else
			flash[:notice] = "ERROR, Está ingresando mal la información, por favor verificar los campos e intenta de nuevo"
			redirect_to new_document_path
		end
	end

	def show		
		@subtopic = Subtopic.all
		@speciality = Speciality.all
		@prose = Prose.all
		@author = Author.all
		@book = Book.all

		@document = Document.find(params[:id])
		@authors = @document.documentauthors.where(:document_id == @document.id)
		@books = @document.documentbooks.where(:document_id == @document.id)
		@have_sidebar = true
	end

	def edit
		@document = Document.find(params[:id])
		@have_sidebar = true

	    @proses =  Prose.all
	    @types = Speciality.all
	    @subtopics = Subtopic.all

	    @all_authors = Author.all
	    @document_author = @document.documentauthors.build

	    @all_books = Book.all
	    @document_book = @document.documentbooks.build
	    @have_sidebar = true
	end

	def update
	  @document = Document.find(params[:id])  

  	  params[:authors][:id].each do |author|
	  	if !author.empty?
	  		@document.documentauthors.build(:author_id => author)
	  	end
	  end

	  params[:books][:id].each do |book|
	  	if !book.empty?
	  		@document.documentbooks.build(:book_id => book)
	  	end
	  end
	 
	  if @document.update(document_params)
	    redirect_to document_index_path
	  else
	    render edit_document_path(@document)
	  end
	end

	def destroy
	  @document = Document.find(params[:id])
	  @document.destroy
	 
	  redirect_to document_index_path
	end


private
  def document_params
    params.require(:document).permit(:number, :name, :description, :date, :autor, :status, :place, :attachment, :prose_id, :subtopic_id, :speciality_id) 
  end

	def resolve_layout
	   	if  current_user.has_role?(:admin)
	      "welcome_root"
	     else 
	      "application"
	    end
	end
	
	def set_document
      @document = Document.find(params[:id])
    end
    
end




