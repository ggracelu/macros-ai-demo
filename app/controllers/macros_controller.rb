class MacrosController < ApplicationController
  def display_form
    render({ :template => "macros_templates/new_form"})
  end
  
  def calculate
    @description = params.fetch("description_param")
    @image = params.fetch("image_param")

    @image_converted = DataURI.convert(@image)

    c = OpenAI::Chat.new
    c.system("You are an expert nutritionist. Estimate the macronutrients (carbohydrates, proteins, and fats) in grams, as well as total calories in kcal.")
    c.user(@the_description)
    @result = c.assistant!

    render({ :template => "macros_templates/results"})
  end
end
