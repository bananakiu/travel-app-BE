json.(user, :id, :email, :bio, :image, :first_name, :last_name)
json.token user.generate_jwt