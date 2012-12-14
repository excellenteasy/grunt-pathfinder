requirejs(["core/core"].concat([<% _.each(paths, function(js) { print('"'+js.replace('.js', '')+'", ') }); %>]), function() {})
