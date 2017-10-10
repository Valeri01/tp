require 'csv'
require 'linear-regression'


class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_sessions

	
	def sbor
		file=CSV.parse(params[:file].read)
		sum = 0;
			for i in 0..file.length - 1
			
			sum = sum + file[i][0].to_i ; 			
		end		
		render plain: ('%.2f' %sum)  
		
	end
	
	def filters 
		file=CSV.parse(params[:file].read,converters: :numeric)
		sum = 0;
			for i in 0..file.length - 1
				if (file[i][2] %2 != 0)
					sum = sum + file[i][1].to_i;
				end
			end
		sum=sum.ceil
    		render plain: ('%.2f'%sum)
	end	
	
	def naigolqma
		file=CSV.parse(params[:file].read)
		maxsum = 0;
		for i in 0..file.length - 30
			sum = 0;
			for r in i..i + 29
				sum = sum + file[r][0].to_i
			end
			if (maxsum < sum )	
				maxsum = sum;
			end
		end
	
		render plain: ('%.2f'%maxsum)
	end
	
	def regresiq
		file=CSV.parse(params[:file].read)
		ind = [];
		values = [];
		for i in 0..file.length - 1
    			ind[i] = i;
    			values[i] = file[i][0].to_i;
		end
    		linear = Regression::Linear.new(ind, values);
    		b = linear.intercept;
   		a = linear.slope;
				
		render plain: "#{'%.6f' % a},#{'%.6f' % b}"

	end
end
