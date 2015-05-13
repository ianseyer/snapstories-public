class Report
	include Mongoid::Document
end

# Example JSON block for a report:
# {
#   dirty: false,
# 	inputs: [{'label':'name', 'type':'string', 'default_value':'cat', 'value':''},
# 			{'label':'age', 'type':'number', 'default_value':None, 'value':''},
# 			{'label':'blonde', 'type':'checkbox', 'default_value':'none', 'value':''},
# 			{'label':'condition', 'type':'dropdown', 'multiple':false, 'default_value':'none', 'value':'', 'options':['Good','Bad','Ugly']},
# 			{'label':'birthday', 'type':'date', 'default_value':'', 'value':''}]
# }