class StatusInput <  SimpleForm::Inputs::Base
   include ActionView::Helpers::AssetTagHelper

   def input
    [
      @builder.text_field(attribute_name, input_html_options),
      content_tag(:span, I18n.t('.exists'), class: 'existence', id: 'exists'),
      content_tag(:span, I18n.t('.exists_not'), class: 'existence', id: 'exists_not')
    ].join.html_safe
   end
end
