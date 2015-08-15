Portfolio::Engine.routes.draw do
  if Portfolio.auth_method == :portfolio_admin_user
    devise_for :admin_users, class_name: 'Portfolio::AdminUser', module: :devise
  end
  
  scope '/admin' do
    resources :items do
      resources :item_social_links
      resources :item_menu_links
    end
    resources :social_links

    root 'items#index'
  end

  root 'items#default', as: :default_item
end
