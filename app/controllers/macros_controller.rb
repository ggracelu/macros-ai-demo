class MacrosController < ApplicationController
  def display_form
    render({ :template => "macros_templates/new_form"})
  end
end
