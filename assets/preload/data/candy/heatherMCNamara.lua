--Creditos a mi (Nickobelit) por el código
--el que robe el código es gei xd
--(además que no será tan fácil)
idle2 = true
function onCreate()--Por Nickobelit
	makeAnimatedLuaSprite('heatherAmarilla', 'characters/heatherm',140, 120); -- Change to characters idle in XML
	addAnimationByPrefix('heatherAmarilla', 'idle', 'heather idle', 24, false); -- Change to characters idle in XML
    addAnimationByPrefix('heatherAmarilla', '0', 'heather m left', 24, false); -- Change to characters leftnote in XML
    addAnimationByPrefix('heatherAmarilla', '1', 'heather m down', 24, false); -- Change to characters downnote in XML
    addAnimationByPrefix('heatherAmarilla', '2', 'heather m up', 24, false); -- Change to characters upnote in XML
    addAnimationByPrefix('heatherAmarilla', '3', 'heather m right', 24, false);-- Change to characters rightnote in XML
    addAnimationByPrefix('heatherAmarilla', 'walk', 'heather m walk', 24, true);
	objectPlayAnimation('heatherAmarilla', 'idle');
	addLuaSprite('heatherAmarilla', false)
    setProperty('heatherAmarilla.alpha', 1);
    
    setObjectOrder('shadow3', 1)
    setObjectOrder('shadow4', 2);
    setObjectOrder('heatherVerde', 3);
    setObjectOrder('heatherAmarilla', 4);
end

function onBeatHit()
if idle2 == true then
	if curBeat % 2 == 0 then
		objectPlayAnimation('heatherAmarilla', 'idle',true);
		setProperty('heatherAmarilla.offset.x',0)
        setProperty('heatherAmarilla.offset.y',0)
	end
end

if curBeat == 236 then
idle2 = false
objectPlayAnimation('heatherAmarilla', 'walk',false);
setProperty('heatherAmarilla.offset.x',50)
setProperty('heatherAmarilla.offset.y',0)
end

if curBeat == 241 then
objectPlayAnimation('heatherAmarilla', 'idle',true);
setProperty('heatherAmarilla.offset.x',0)
setProperty('heatherAmarilla.offset.y',0)
idle2 = true
end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)--Nickobelit lo hizo :0
if noteType == 'Backers'  or noteType == 'Chorus' then
idle2 = false
if noteData == 0 then
			objectPlayAnimation('heatherAmarilla','0',true)
                setProperty('heatherAmarilla.offset.x',15)
                setProperty('heatherAmarilla.offset.y',-9)
		end
		if noteData == 1 then
			objectPlayAnimation('heatherAmarilla','1',true)
                setProperty('heatherAmarilla.offset.x',7)
                setProperty('heatherAmarilla.offset.y',-14)
		end
		if noteData == 2 then
			objectPlayAnimation('heatherAmarilla','2',true)
                setProperty('heatherAmarilla.offset.x',-10)
                setProperty('heatherAmarilla.offset.y',0)
		end
		if noteData == 3 then
			objectPlayAnimation('heatherAmarilla','3',true)
                setProperty('heatherAmarilla.offset.x',0)
                setProperty('heatherAmarilla.offset.y',-13)
		end
runTimer('idleNamara', 0.2)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'idleNamara' then
idle2 = true
end
end
--El código es tan Insano que robarlo es un delito 👮‍♂️