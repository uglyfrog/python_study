-- NOTE: Always use the Event object for events otherwise it replaces other event handlers.
if script.active_mods["miniloader"] then
  local miniloader_util = require("__miniloader__/lualib/util.lua")

  function miniloader_on_area_cloned(ev)
    local miniloaders = miniloader_util.find_miniloaders{
      surface = ev.destination_surface,
      area = ev.destination_area,
      }
    for _, loader in ipairs(miniloaders) do
      miniloader_util.update_inserters(loader)
    end
  end

  Event.addListener(defines.events.on_area_cloned, miniloader_on_area_cloned)
end
