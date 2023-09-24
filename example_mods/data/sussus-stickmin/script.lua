healthBarTweenY = 0
function onCreate()
    triggerEvent('middlescroll', '', '')
    setProperty('iconP1.x', getProperty('iconP1.x')+20)
    setProperty('iconP2.x', getProperty('iconP2.x')-40)
end

function onCountdownStarted()
    if not seenCutscene then
        if healthBarTweenY == 0 then
            doTweenY('healthBarTweenY', 'healthBar', getProperty('healthBar.y')+100, 2, 'cubeOut')
            healthBarTweenY = 1
        end
    end
    setProperty('skipCountdown', true)
    return Function_Continue
end

function onUpdate()
    setProperty('health', 1) -- prevents any kind of health gain or loss
end

function onDestroy()
    setProperty('skipCountdown', false)
end