
function onCreate()
    drain = 0
end

function noteMiss()
        shouldDrain = true
        drain = drain + 0.001
end

function opponentNoteHit()
    if shouldDrain == true then
    setProperty('health', getProperty('health') - drain)
    end
end