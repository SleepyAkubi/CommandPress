function CommandPressSetup()

  CommandPress = { Commands = {}, Helpers = {}, Version = 0.4, Me = LocalPlayer(), BaseURL = "https://raw.githubusercontent.com/PrestonAshton/CommandPress/master/commandPress/" }

  me:PrintMessage(HUD_PRINTTALK, "Initialising CommandPress by Preston - Version " .. CommandPress.Version)

  http.Fetch(CommandPress.BaseURL .. "default.manifest", function(body, len, headers, code)
  	local lines = string.Explode("\n", body, false)
  	for i = 1,#lines do
  	  if (lines[i] != "") then
  	  http.Fetch(CommandPress.BaseURL .. lines[i],
  		    function(body, len, headers, code)
  			    RunStringEx(body, "CommandPress - " .. CommandPress.BaseURL .. lines[i])
  	     end,
  		   function (error)
  		     Say(error)
        end)
       end
  	end
  end,
  function(error)
  	Say(error)
  end)

end

CommandPressSetup()
