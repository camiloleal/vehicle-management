class API::V1::PeopleController < ApplicationController
  before_action :set_person, only: [:show, :destroy, :update]

  def index
    people = Person.all
    render json: people
  end

  def show
    render json: @person
  end

  def create
    person = Person.new(person_params)
    if person.save
      render json: person
    else
      render json: { error: person.errors }, status: :bad_request
    end
  end

  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: { error: @person.errors }, status: :bad_request
    end
  end

  def destroy
    @person.destroy
    head :no_content
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :document_number, :document_file)
  end
end
