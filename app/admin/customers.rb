ActiveAdmin.register Customer do
  # Permit parameters for mass assignment (Fix for update error)
  permit_params :full_name, :phone_number, :email, :notes, :image

  # Index page customization
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :notes
    column "Profile Image" do |customer|
      if customer.image.attached?
        image_tag customer.image, size: "50x50"
      else
        "No Image"
      end
    end
    actions
  end

  # Show page customization
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row "Profile Image" do |customer|
        if customer.image.attached?
          image_tag customer.image, size: "100x100"
        else
          "No Image"
        end
      end
    end
  end

  # Edit & New Form Customization
  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  # Custom Action for Alphabetized Customers
  collection_action :alphabetized, method: :get do
    @customers = Customer.order(:full_name)
    render "admin/customers/index", locals: { customers: @customers }
  end

  # Custom Action for Customers with Missing Emails
  collection_action :missing_email, method: :get do
    @customers = Customer.where(email: [nil, ""])
    render "admin/customers/index", locals: { customers: @customers }
  end
end
