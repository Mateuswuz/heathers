function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Chorus' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); -- make it so original character doesn't sing these notes
		end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
if noteType == 'Chorus' then
triggerEvent('Screen Shake','0.1','0.002')
triggerEvent('Add Camera Zoom','0.015','0.015')
end
end