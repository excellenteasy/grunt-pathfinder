requirejs(["core/core"].concat([<% _.each(js, function(jsFile) { print('"'+jsFile.replace('.js', '')+'", ') }); %>]), function() {})
