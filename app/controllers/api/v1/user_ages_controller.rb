class Api::V1::UserAgesController < Api::V1::GraphitiController
  def index
    user_ages = UserAgeResource.all(params)
    respond_with(user_ages)
  end

  def show
    user_age = UserAgeResource.find(params)
    respond_with(user_age)
  end

  def create
    user_age = UserAgeResource.build(params)

    if user_age.save
      render jsonapi: user_age, status: :created
    else
      render jsonapi_errors: user_age
    end
  end

  def update
    user_age = UserAgeResource.find(params)

    if user_age.update_attributes
      render jsonapi: user_age
    else
      render jsonapi_errors: user_age
    end
  end

  def destroy
    user_age = UserAgeResource.find(params)

    if user_age.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: user_age
    end
  end
end
