--
-- HorrorClown (PewX)
-- Using: IntelliJ IDEA 14 Ultimate
-- Date: 17.01.2015 - Time: 19:15
-- pewx.de // iGaming-mta.de // iRace-mta.de // iSurvival.de // mtasa.de
--
CLogin = {}

function CLogin:constructor()
    fadeCamera(false)
    self.cams = {
        {2054.9406738281, 1298.5733642578, 95.947769165039, 2120.7822265625, 1230.1296386719, 64.637092590332},
        {1814.2286376953, -1888.7556152344, 53.846141815186, 1734.5378417969, -1832.7844238281, 31.117233276367},
        {1578.1954345703, -1610.4873046875, 78.673355102539, 1501.4410400391, -1658.9365234375, 36.703880310059}
    }

    setTime(12, 0)
    setHeatHaze(0)
    setWeather(0)
    setMinuteDuration(600000)
    setPlayerHudComponentVisible("all", false)
    fadeCamera(true)
    setCloudsEnabled(false)

    setCameraMatrix(unpack(self.cams[math.random(1, #self.cams)]))

    local sound = new(CSound, "http://pewx.de/res/sounds/iGaming/Nero - The Thrill.mp3", false, 0)
    sound:play()
    sound:fadeIn(15000, "Linear")

    addEvent("server:onLogin", true)
    addEventHandler("server:onLogin", me, bind(CLogin.onLogin, self))
    self:createLogin()
end

function CLogin:destructor()
  
end

function CLogin:createLogin()
    --ToDo: Login Screen mit Spotify API für neuste hits? -> http://charts.spotify.com/api/tracks/most_streamed/de/daily/latest

    --ToDo: Just Dev!
    setDevelopmentMode(true, true)
    addCommandHandler("igl",
        function(_, username, pw)
            local EMAIL = false
            if username and pw then
                if string.find(username, "@") then EMAIL = true end
                triggerServerEvent("client:onLogin", resourceRoot, username, pw, EMAIL)
            else
                debugOutput("Invalid username or password!")
            end
        end
        )
end

function CLogin:onLogin(bSuccess)
    if bSuccess then
        debugOutput("Successfully logged in!")
    end
end

--Methode called by CEF, when LOGIN Button pressed
function CLogin:onClientLogin()
  outputChatBox("Client login!")
end