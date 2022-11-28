function onCreate()
setPropertyFromClass('flixel.FlxG','sound.music.volume',0)
setPropertyFromClass('Main','fpsVar.visible',false)
setProperty('skipCountdown',true)
setProperty('vocals.time',0)

makeLuaSprite('BG','BG',-589,-170);
addLuaSprite('BG')

makeLuaSprite('reflection','reflection',-239,662-43);
addLuaSprite('reflection')

makeLuaSprite('shadow1','shadow',484,726);
addLuaSprite('shadow1',false)

makeLuaSprite('shadow2','shadow',877,720);
addLuaSprite('shadow2',false)

makeLuaSprite('shadow3','shadow',-44.0,726);
addLuaSprite('shadow3',false)

makeLuaSprite('shadow4','shadow',877,720);
addLuaSprite('shadow4',false)
end

function onCreatePost()
setProperty('vocals.volume',0)
setProperty('vocals.time',0)

makeLuaSprite('spotlight','spotlight',-502,-327)
addLuaSprite('spotlight',true)
setBlendMode('spotlight','multiply')

makeLuaSprite('spotlight2','spotlight2',-502,-327)
addLuaSprite('spotlight2')

c = 1
d = 210
if downscroll then c = -1
end
noteTweenY('0',4,defaultPlayerStrumY0-(d*c),0.01)
noteTweenY('1',5,defaultPlayerStrumY0-(d*c),0.01)
noteTweenY('2',6,defaultPlayerStrumY0-(d*c),0.01)
noteTweenY('3',7,defaultPlayerStrumY0-(d*c),0.01)

setProperty('heatherVerde.visible',false)
setProperty('heatherAmarilla.visible',false)
setProperty('gf.visible',false)
setProperty('boyfriend.visible',false)

setProperty('camHUD.visible',false)

setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup'))
setObjectOrder('heatherd',getObjectOrder('gfGroup'))
setTextFont('timeTxt','cheri.ttf')
setTextFont('botplayTxt','cheri.ttf')
setTextFont('scoreTxt','cheri.ttf')
end

function onMoveCamera(focus)
    if focus == 'boyfriend' then
        setProperty("timeBar.color",getColorFromHex("0000FF"))
    elseif focus == 'dad' then
        setProperty("timeBar.color",getColorFromHex("FF0000"))
    end
end

function onSongEnd()

setPropertyFromClass('Main','fpsVar.visible',true)

end

function onBeatHit()
if getProperty('dad.animation.curAnim.name') == 'idle' then
			triggerEvent('Play Animation','idle','dad')
			end
if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
			triggerEvent('Play Animation','idle-alt','dad')
			end
if curBeat == 31 then
if flashingLights then 
cameraFlash('camGame','ffffff',0.4,true) 
end
setProperty('heatherVerde.visible',true)
setProperty('heatherAmarilla.visible',true)
setProperty('boyfriend.visible',true)
setProperty('spotlight.visible',false)
setProperty('spotlight2.visible',false)
end

if curBeat == 75 then
noteTweenY('0',4,defaultPlayerStrumY0,2*crochet/1000,'elasticOut')
noteTweenY('1',5,defaultPlayerStrumY1,2*crochet/1000,'elasticOut')
noteTweenY('2',6,defaultPlayerStrumY2,2*crochet/1000,'elasticOut')
noteTweenY('3',7,defaultPlayerStrumY3,2*crochet/1000,'elasticOut')
end

if curBeat == 196 then
setProperty('camOther._fxFadeCompleted',true)
if flashingLights then
cameraFlash('camOther','ffffff',0.5,true) 
end
setProperty('spotlight.visible',true)
end

if curBeat == 212 then
setProperty('camGame.visible',false)
end

if curBeat == 213 then
setProperty('camOther._fxFadeCompleted',true)
if flashingLights then
cameraFlash('camOther','0x55ff99cc',0.5,true) 
end
setProperty('camGame.visible',true)
end

if curBeat == 235 then
doTweenAlpha('a','spotlight',0,0.3)
end

if curBeat == 236 then
doTweenX('walk1','heatherAmarilla',625,crochet*.005)
doTweenY('walk2','heatherAmarilla',148,crochet*.005)
doTweenX('walk3','heatherVerde',261,crochet*.006)
doTweenY('walk4','heatherVerde',117,crochet*.006)
end

if curBeat == 292 or curBeat == 293 or curBeat == 392 or curBeat == 395 then
setProperty('camGame._fxFadeCompleted',true)
if flashingLights then 
cameraFlash('camGame','ffffff',0.5,true)
end
end

if curBeat == 396 then
if flashingLights then 
cameraFlash('camOther','ffffff',0.5,true) 
end
setProperty('camGame.visible',false)
setProperty('camHUD.alpha',0)
end
end

function onStepHit()   
	if curStep == 128 then
		setProperty('camHUD.visible',true)
	end
end

function onUpdatePost()
setProperty('spotlight.flipX',mustHitSection)
setProperty('spotlight2.flipX',mustHitSection)
setProperty('shadow3.x',getProperty('heatherVerde.x')-16)
setProperty('shadow3.y',getProperty('heatherVerde.y')+605)

setProperty('shadow4.x',getProperty('heatherAmarilla.x'))
setProperty('shadow4.y',getProperty('heatherAmarilla.y')+560)
end

function onNoteSpawn(id,d,t,s)
	setPropertyFromGroup('notes',id,'alpha' ,1)
end

function onCountdownStart()
setProperty('vocals.volume',0)
--onBeatHit()
end

function onSongStart()
--onBeatHit()
setProperty('vocals.volume',1)
setProperty('vocals.time',0)
setPropertyFromClass('flixel.FlxG','sound.music.volume',1)
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.2 then
        setProperty('health', health- 0.01);
    end
end