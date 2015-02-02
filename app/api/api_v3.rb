module API
	class V3 < Grape::API
		prefix 'v3'
		format :json

		get :hello do
			{ text:'hello' }
		end
	
		resource :chk_passes do
			get do
				ChkPass.all
			end

			get ':user_id' do
				ChkPass.find(params[:user_id])
			end	

			post do
				ChkPass.create(
					:user_id => params[:user_id],
					:category_id => params[:category_id],
					:venue1_id => params[:venue1_id],
					:venue2_id => params[:venue2_id],
					:venue3_id => params[:venue3_id],
					:venue4_id => params[:venue4_id],
					:venue5_id => params[:venue5_id]
				)
				User.test
			end	
		end	
	end
end
