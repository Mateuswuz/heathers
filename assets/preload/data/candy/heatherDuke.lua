--Creditos a mi (Nickobelit) por el código
--el que robe el código es gei xd
--(además que no será tan fácil)
idle = true
function onCreate()--Por Nickobelit
	makeAnimatedLuaSprite('heatherVerde', 'characters/heatherd',-66, 74); -- Change to characters idle in XML
	addAnimationByPrefix('heatherVerde', 'idle', 'heather idle', 24, false); -- Change to characters idle in XML
    addAnimationByPrefix('heatherVerde', '0', 'heather d left', 24, false); -- Change to characters leftnote in XML
    addAnimationByPrefix('heatherVerde', '1', 'heather d down', 24, false); -- Change to characters downnote in XML
    addAnimationByPrefix('heatherVerde', '2', 'heather d up', 24, false); -- Change to characters upnote in XML
    addAnimationByPrefix('heatherVerde', '3', 'heather d right', 24, false);-- Change to characters rightnote in XML
    addAnimationByPrefix('heatherVerde', 'walk', 'heather d walk', 24, true);
	objectPlayAnimation('heatherVerde', 'idle');
	addLuaSprite('heatherVerde', false)
    setProperty('heatherVerde.alpha', 1);
    
    setObjectOrder('shadow3', 1)
    setObjectOrder('shadow4', 2);
    setObjectOrder('heatherVerde', 3);
    setObjectOrder('heatherAmarilla', 4);
end

function onBeatHit()
if idle == true then
	if curBeat % 2 == 0 then
		objectPlayAnimation('heatherVerde', 'idle',true);
		setProperty('heatherVerde.offset.x',0)
        setProperty('heatherVerde.offset.y',0)
	end
end

if curBeat == 236 then
idle = false
objectPlayAnimation('heatherVerde', 'walk',false);
setProperty('heatherVerde.offset.x',40)
setProperty('heatherVerde.offset.y',20)
end

if curBeat == 242 then
objectPlayAnimation('heatherVerde', 'idle',true);
setProperty('heatherVerde.offset.x',0)
setProperty('heatherVerde.offset.y',0)
idle = true
end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)--Nickobelit lo hizo :0
if noteType == 'Backers'  or noteType == 'Chorus' then
idle = false
if noteData == 0 then
			objectPlayAnimation('heatherVerde','0',true)
                setProperty('heatherVerde.offset.x',9)
                setProperty('heatherVerde.offset.y',-7)
		end
		if noteData == 1 then
			objectPlayAnimation('heatherVerde','1',true)
                setProperty('heatherVerde.offset.x',-23)
                setProperty('heatherVerde.offset.y',-36)
		end
		if noteData == 2 then
			objectPlayAnimation('heatherVerde','2',true)
                setProperty('heatherVerde.offset.x',-10)
                setProperty('heatherVerde.offset.y',17)
		end
		if noteData == 3 then
			objectPlayAnimation('heatherVerde','3',true)
                setProperty('heatherVerde.offset.x',-30)
                setProperty('heatherVerde.offset.y',-26)
		end
runTimer('idleDuke', 0.2)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'idleDuke' then
idle=true
end
end
--El código es tan Insano que robarlo es un delito 👮‍♂️