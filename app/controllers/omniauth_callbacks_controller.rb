class OmniauthCallbacksController < ApplicationController
    def twitter
        render plain: "Successfully authenticated from Twitter!"
    end
end
