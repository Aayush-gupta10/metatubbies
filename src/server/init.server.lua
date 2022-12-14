local QS1_Teleport_Destination_Pad = game.Workspace.QS1_Teleport_Destination

game.Workspace.Portal.QS1_Teleport_Source.Touched:Connect(function(hit)
	local Player = game.Players:GetPlayerFromCharacter(hit.Parent)

	if Player then
		local CurrentlyTeleporting = Player.Character:FindFirstChild("CurrentlyTeleporting")
		if not CurrentlyTeleporting then return end
		
		if not CurrentlyTeleporting.Value then
			CurrentlyTeleporting.Value = true
            print("teleporting.....")
			Player.Character.HumanoidRootPart.CFrame = QS1_Teleport_Destination_Pad.CFrame + Vector3.new(0,5,0)
            wait(3)
			CurrentlyTeleporting.Value = false
		end
	end
end)


function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

local Quiz = {}

quizTable = {}
users = {}
leaderBoard = {}
quizState = {}

-- [[ Setup a quiz ]]
function setupQuiz(quizName, quizLocation)
    if (quizTable[quizName] ~= nil) then
        error("A quiz with same name already exists")
    else
        quizTable[quizName] = {}
        quizTable[quizName]["location"] = quizLocation
        quizTable[quizName]["questions"] = {}
        quizTable[quizName]["questionCount"] = 0
        quizState[quizName] = {}
        users[quizName] = {}
        users[quizName]["userlist"] = {}
        users[quizName]["userCount"] = 0
    end
    return quizTable
end

function endQuiz(quizName)
    quizTable[quizName]["location"] = nil
    quizTable[quizName]["questions"] = nil
    quizTable[quizName]["questionCount"] =nil
    users[quizName] = nil
    quizTable[quizName] = nil
end

-- [[ Add a question to the a quiz ]]
function addQuestion(quizName, question)
    if (quizTable[quizName] == nil) then
        error("The quiz doesnt exist")
    else
        local questionCount = quizTable[quizName]["questionCount"]
        quizTable[quizName]["questionCount"] = questionCount + 1
        quizTable[quizName]["questions"][questionCount] = question
    end
end

-- [[ Create question ]]
function createQuestion(questionStatement, option1, option2, option3, option4, correctOption)
    local question = {}
    question["questionStatement"] = questionStatement
    question["option1"] = option1
    question["option2"] = option2
    question["option3"] = option3
    question["option4"] = option4
    question["correctOption"] = correctOption
    return question
end

-- [[ User cannot be added after the quiz starts]]
function addUser(quizName, userId)
    if(quizState[quizName]["isQuizStarted"] == true)
    then
        error("The quiz has already been started")
    end
    count = users[quizName]["userCount"]
    users[quizName]["userlist"][userId] = {userId = userId, score = 0,rank = "-"}
    users[quizName]["userCount"] = users[quizName]["userCount"]  + 1
end

function removeUser(quizName, userId)
    users[quizName]["userCount"] = users[quizName]["userCount"]  - 1
    users[quizName]["userlist"][userId] = nil
end

function isUserAdded(quizName, userId)
    if users[quizName]["userlist"][userId] ~= nil then
        do return true
        end
    end
    return false
end


function getUserScore(quizName, userId)
    return users[quizName]["userlist"][userId]["score"] 
end

function setUserScore(quizName, userId, score)
    users[quizName]["userlist"][userId]["score"] = score
end

function addUserScore(quizName, userId, scoreToBeAdded)
    users[quizName]["userlist"][userId]["score"] = users[quizName]["userlist"][userId]["score"] + scoreToBeAdded
end

function startQuiz(quizName)
    quizState[quizName]["isQuizStarted"] = true
    quizState[quizName]["currentQuestionIndex"] = 0
    leaderBoard[quizName] = {}
    local index = 0
    for userId, user in pairs(users[quizName]["userlist"]) 
    do
        table.insert(leaderBoard[quizName],user)
    end
end

function getLeaderboard(quizName)
    return leaderBoard[quizName]
end

function refreshLeaderboard(quizName)
    table.sort(leaderBoard[quizName], function (k1, k2) return k1.score > k2.score end )
    local rank = 1
    for userId, user in pairs(leaderBoard[quizName])
    do 
        user.rank = rank
        rank = rank + 1
    end

    return leaderBoard[quizName]
end

function getNextQuestion(quizName)
    local currentQuestionIndex = quizState[quizName]["currentQuestionIndex"]

    if(currentQuestionIndex == quizTable[quizName]["questionCount"]) then
        quizState[quizName]["isQuizEnded"] = true
        return nil
    end
    local nextQuestion = quizTable[quizName]["questions"][currentQuestionIndex]
    quizState[quizName]["currentQuestionIndex"] = quizState[quizName]["currentQuestionIndex"] + 1
    return nextQuestion
end

function isAnswerCorrect(quizName, questionIndex, optionSelected)
    local correctOption = quizTable[quizName]["questions"][questionIndex]["correctOption"]
    if correctOption == optionSelected then return true end
    return false
end


--Setup the quizes

local nagarro_quiz = "Nagarro"
local nagarro_quiz_location = {0,0}

setupQuiz(nagarro_quiz,nagarro_quiz_location)

local nq_question1 = "When was Nagarro found?"
local nq_nq1_op1 = "1996"
local nq_nq1_op2 = "1986"
local nq_nq1_op3 = "1992"
local nq_nq1_op4 = "2004"

nq_q1 = createQuestion(nq_question1, nq_nq1_op1, nq_nq1_op2, nq_nq1_op3, nq_nq1_op4, "A")
addQuestion(nagarro_quiz, nq_q1)

local nq_question2 = "Where is Nagarro Headquarters located?"
local nq_nq2_op1 = "Gurugram, India"
local nq_nq2_op2 = "Frankfurt, Germany"
local nq_nq2_op3 = "Munich, Germany"
local nq_nq2_op4 = "Seattle, USA"

nq_q2 = createQuestion(nq_question2, nq_nq2_op1, nq_nq2_op2, nq_nq2_op3, nq_nq2_op4, "C")
addQuestion(nagarro_quiz, nq_q2)

local nq_question3 = "In which stock exchange is Nagarro listed?"
local nq_nq3_op1 = "National Stock Exchange, India"
local nq_nq3_op2 = "Bombay Stock Exchange, India"
local nq_nq3_op3 = "Frankfurt Stock Exchange, Germany"
local nq_nq3_op4 = "All of the above"

nq_q3 = createQuestion(nq_question3, nq_nq3_op1, nq_nq3_op2, nq_nq3_op3, nq_nq3_op4, "C")
addQuestion(nagarro_quiz, nq_q3)

local nq_question4 = "Who is the CEO of Nagarro?"
local nq_nq4_op1 = "Manas Fuloria"
local nq_nq4_op2 = "Manas Human"
local nq_nq4_op3 = "Manas Chopra"
local nq_nq4_op4 = "Manas Gupta"

nq_q4 = createQuestion(nq_question4, nq_nq4_op1, nq_nq4_op2, nq_nq4_op3, nq_nq4_op4, "B")
addQuestion(nagarro_quiz, nq_q4)

local nq_question5 = "How many employees does Nagarro has globally (Approx.)?"
local nq_nq5_op1 = "1000"
local nq_nq5_op2 = "4000"
local nq_nq5_op3 = "8000"
local nq_nq5_op4 = "17000"

nq_q5 = createQuestion(nq_question5, nq_nq5_op1, nq_nq5_op2, nq_nq5_op3, nq_nq5_op4, "D")
addQuestion(nagarro_quiz, nq_q5)

isQuiz1Started = false

function startTimer(timerPeriod, timerEnd, timerPeriodCallback, timerEndCallback)
    local startTime = os.time()
    local stopTime = startTime + timerEnd
    while true do
        local currentTime = os.time()
        if currentTime > stopTime then
            do 
                timerEndCallback()
                break
            end
        end

        if currentTime > startTime + timerPeriod then
            do 
                wait(timerPeriod)
                timerPeriodCallback()
                startTime = startTime + timerPeriod
            end
        end
    end
end

quiz1Time = 20
answerTime = 10
currentQuestion = {}
function timerPeriodCallbackQuiz1()
    quiz1Time = quiz1Time - 1
    game.Workspace.DispFrame.DisplayFrame.SurfaceGui.TextLabel.Text = "Quiz is about to get started in "..quiz1Time.." seconds"
end

function startQuizCallbackQuiz1()
    startQuiz(nagarro_quiz)
    currentQuestion = getNextQuestion(nagarro_quiz)
    game.Workspace.DispFrame.DisplayFrame.SurfaceGui.TextLabel.Text = "Question : "..currentQuestion["questionStatement"].."\n\n Time left : "..answerTime.."\n\n Stand on correct answer tile!"
    game.Workspace.QS1_Option1.Button.Button_move.SurfaceGui.TextLabel.Text = currentQuestion["option1"]
    game.Workspace.QS1_Option2.Button.Button_move.SurfaceGui.TextLabel.Text = currentQuestion["option2"]
    game.Workspace.QS1_Option3.Button.Button_move.SurfaceGui.TextLabel.Text = currentQuestion["option3"]
    game.Workspace.QS1_Option4.Button.Button_move.SurfaceGui.TextLabel.Text = currentQuestion["option4"]
    startTimer(1, answerTime, timerPeriodCallbackQuestion, answerQuestionCallback)
end

function timerPeriodCallbackQuestion() 
    answerTime = answerTime - 1
    game.Workspace.DispFrame.DisplayFrame.SurfaceGui.TextLabel.Text = "Question : "..currentQuestion["questionStatement"].."\n Time left : "..answerTime.."\n\n Stand on correct answer tile!"
end

option1SelectedByPlayers = {}
option2SelectedByPlayers = {}
option3SelectedByPlayers = {}
option4SelectedByPlayers = {}

game.Workspace.QS1_Option1.Button.Button_move.Touched:Connect(function(hit)
        local Player = game.Players:GetPlayerFromCharacter(hit.Parent)

        if Player then
            option1SelectedByPlayers[Player.name] = true
            option2SelectedByPlayers[Player.name] = false
            option3SelectedByPlayers[Player.name] = false
            option4SelectedByPlayers[Player.name] = false
        end
    end
)

game.Workspace.QS1_Option2.Button.Button_move.Touched:Connect(function(hit)
    local Player = game.Players:GetPlayerFromCharacter(hit.Parent)

    if Player then
        option1SelectedByPlayers[Player.name] = false
        option2SelectedByPlayers[Player.name] = true
        option3SelectedByPlayers[Player.name] = false
        option4SelectedByPlayers[Player.name] = false
    end
end
)


game.Workspace.QS1_Option3.Button.Button_move.Touched:Connect(function(hit)
    local Player = game.Players:GetPlayerFromCharacter(hit.Parent)

    if Player then
        option1SelectedByPlayers[Player.name] = false
        option2SelectedByPlayers[Player.name] = false
        option3SelectedByPlayers[Player.name] = true
        option4SelectedByPlayers[Player.name] = false
    end
end
)

game.Workspace.QS1_Option4.Button.Button_move.Touched:Connect(function(hit)
    local Player = game.Players:GetPlayerFromCharacter(hit.Parent)

    if Player then
        option1SelectedByPlayers[Player.name] = false
        option2SelectedByPlayers[Player.name] = false
        option3SelectedByPlayers[Player.name] = false
        option4SelectedByPlayers[Player.name] = true
    end
end
)

function getOptionSelected(username)
    if option1SelectedByPlayers[username] == true then
        return "A"
    end
    if option2SelectedByPlayers[username] == true then
        return "B"
    end
    if option3SelectedByPlayers[username] == true then
        return "C"
    end
    if option4SelectedByPlayers[username] == true then
        return "D"
    end
    return nil
end

players = {}
game.Players.PlayerAdded:Connect(function(thisPlayer)
    local playerName = thisPlayer.Name
    players[playerName] = thisPlayer
end)

function collectAnswer()
    
    for username,v in pairs(users[nagarro_quiz]["userlist"]) do
        local optionsSelected = getOptionSelected(username)
        local isAnswerCorrectObj = isAnswerCorrect(nagarro_quiz, quizState[nagarro_quiz]["currentQuestionIndex"]-1, optionsSelected)

        if isAnswerCorrectObj then 
            addUserScore(nagarro_quiz, username, 10) 
        end

        local scoreValue = getUserScore(nagarro_quiz, username)
        local score = Instance.new("IntValue")
        score.Name = "Score"
        score.Value = scoreValue
        score.Parent = players[username].leaderstats
        refreshLeaderboard(nagarro_quiz)
        local leaderBoard = getLeaderboard(nagarro_quiz)

    end
end

function answerQuestionCallback() 
    collectAnswer()
    currentQuestion = getNextQuestion(nagarro_quiz)
    if currentQuestion ~= nil then 
        do
            game.Workspace.DispFrame.DisplayFrame.SurfaceGui.TextLabel.Text = "Question : "..currentQuestion["questionStatement"].."\n Time left : "..answerTime.."\n\n Stand on correct answer tile!"
            game.Workspace.QS1_Option1.Button.Button_move.SurfaceGui.TextLabel.Text = currentQuestion["option1"]
            game.Workspace.QS1_Option2.Button.Button_move.SurfaceGui.TextLabel.Text = currentQuestion["option2"]
            game.Workspace.QS1_Option3.Button.Button_move.SurfaceGui.TextLabel.Text = currentQuestion["option3"]
            game.Workspace.QS1_Option4.Button.Button_move.SurfaceGui.TextLabel.Text = currentQuestion["option4"]
            answerTime = 10
            startTimer(1, answerTime, timerPeriodCallbackQuestion, answerQuestionCallback)
        end
    else
        do
            isQuiz1Started = false
            quiz1Time = 20
            local leaderBoard = getLeaderboard(nagarro_quiz)
            local winner = {}
            for userId, user in pairs(leaderBoard)
            do 
                winner = userId
                break
            end
            game.Workspace.DispFrame.DisplayFrame.SurfaceGui.TextLabel.Text = "Quiz has ended! Go to portal to start again!".."\n\n The winner is "..winner
        return
        end
    end
end

game.Workspace.QS1_Teleport_Destination.Touched:Connect(function(hit)
    local Player = game.Players:GetPlayerFromCharacter(hit.Parent)

	if Player then
        local isUserAddedObj = isUserAdded(nagarro_quiz, Player.name)

        if (isUserAddedObj == false) then 
            addUser(nagarro_quiz, Player.Name)
        end

        if isQuiz1Started == false
            then
                isQuiz1Started = true
                startTimer(1, quiz1Time, timerPeriodCallbackQuiz1, startQuizCallbackQuiz1)
        end
    end
end)
