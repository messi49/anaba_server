module API
	class V2 < Grape::API
		prefix 'v2'
		format :json

		get :hello do
			{ text:'hello' }
		end

		resource :passinforms do
			# http://49.212.195.22:3000/api/v2/users
			desc "return all users"
			get do
				Passinform.all
			end
			
			# http://49.212.195.22:3000/api/v2/users/#{user_id}
			desc "return a user"
			params do
				requires :user_id, type: Integer
			end
			get ':user_id' do
				Passinform.find(params[:user_id])
			end
			
			

			desc "Search resources (same venue_id && not equal user_id)"
			post do
				# Register into table 'passinforms'
				Passinform.create(
					:user_id => params[:user_id],
					:category_id => params[:category_id],
					:venue_id => params[:venue_id]
				)
				
				#Passinform.where(:venue_id =>params[:venue_id]).where('user_id != ?', params[:user_id]).where(:category_id =>params[:categori_id]).where.not(:venue_id =>params[:venue_id])
				# User Id(s) who has the same venue id with user id 
				userid = Passinform.where(:venue_id =>params[:venue_id]).where('user_id != ?', params[:user_id]).select("user_id")
				#Passinform.find_by_sql("SELECT FROM passinforms where user_id=#{userid}")
				#Passinform.where(user_id: :user_id)
				# User Id(s) and their Velue Id(s) who did not access to the same venue id
				#Passinform.where(:category_id =>params[:categori_id]).where.not(:venue_id =>params[:venue_id])
				#Passinform.select("user_id, venue_id").distinct.where('user_id !=?', params[:user_id])
=begin

				if Passinform.where(user_id: nil) == nil then
				Passinform.transaction do
					i = Passinform.lock.first
					i.venue1_id = 'xxxxxx'
					i.save
				end
				else

				Passinform.transaction do
					i = Passinform.lock.first
					i.venue1_id = params[:venue_id]
					i.save
				end
				end
=end
				#User.where('venue_id !=?', params[:venue_id]).select("user_id, venue_id").distinct
				#User.where('venue_id !=?', params[:venue_id]).select(:user_id).distinct
				#User.select("venue_id")
				#User.insert('chk_passes')
				
=begin
				ChkPass.where(user_id: '100').uniq
				ChkPass.joins(:chk_passes).all.where(chk_passes: { venue_id: ':venue_id'})
=end
				#ChkPass.create(
			       	#	:user_id => params[:user_id],
				#	:category_id => params[:category_id],
				#	:venue1_id => params[:venue_id]
				#)
			       #end		
    			end
		end
		
	end
end
