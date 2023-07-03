function ContourExt:flash(type_or_id, frequency)
	if not self._contour_list then
		return
	end

	for i, setup in ipairs(self._contour_list) do
		if setup.type == type_or_id or setup == type_or_id then
			setup.flash_frequency = frequency and frequency > 0 and frequency or nil
			setup.flash_t = setup.flash_frequency and TimerManager:game():time() + setup.flash_frequency or nil
			setup.flash_on = not setup.flash_on or nil

			self:_chk_update_state()

			break
		end
	end

	self:apply_to_linked("flash", type_or_id, frequency)
end