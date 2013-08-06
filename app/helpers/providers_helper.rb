module ProvidersHelper

	def category_to_string(number)
		case number
		when 1
			return t('place')
		when 2
			return t('food')
		when 3
			return t('flowers')
		when 4
			return t('jewelry')
		end
	end
end
