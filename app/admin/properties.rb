ActiveAdmin.register Property do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :descripition, :price, :address, :agent_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :descripition, :price, :address, :agent_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
    filter :name
    filter :address
    filter :price
    filter :agents, as: :select, collection: proc { Agent.pluck(:name, :id) }
end
