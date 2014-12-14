ActiveAdmin.register Newsletter do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :date, :newsletter
  
  form :html => { :enctype => "multipart/form-data"} do |f|
    f.inputs "Newsletter", :multipart => true do
      f.input :name
      f.input :date
      f.input :newsletter
    end
    f.actions
  end
end
