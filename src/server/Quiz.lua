local Quiz = {}

quizTable = {}
users = {}
leaderBoard = {}
quizState = {}

-- [[ Setup a quiz ]]
function Quiz.setupQuiz(quizName, quizLocation)
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

function Quiz.endQuiz(quizName)
    quizTable[quizName]["location"] = nil
    quizTable[quizName]["questions"] = nil
    quizTable[quizName]["questionCount"] =nil
    users[quizName] = nil
    quizTable[quizName] = nil
end

-- [[ Add a question to the a quiz ]]
function Quiz.addQuestion(quizName, question)
    if (quizTable[quizName] == nil) then
        error("The quiz doesnt exist")
    else
        local questionCount = quizTable[quizName]["questionCount"]
        quizTable[quizName]["questionCount"] = questionCount + 1
        quizTable[quizName]["questions"][questionCount] = question
    end
end

-- [[ Create question ]]
function Quiz.createQuestion(questionStatement, option1, option2, option3, option4, correctOption)
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
function Quiz.addUser(quizName, userId)
    if(quizState[quizName]["isQuizStarted"] == true)
    then
        error("The quiz has already been started")
    end
    count = users[quizName]["userCount"]
    users[quizName]["userlist"][userId] = {userId = userId, score = 0,rank = "-"}
    users[quizName]["userCount"] = users[quizName]["userCount"]  + 1
end

function Quiz.removeUser(quizName, userId)
    users[quizName]["userCount"] = users[quizName]["userCount"]  - 1
    users[quizName]["userlist"][userId] = nil
end

function Quiz.getUserScore(quizName, userId)
    return users[quizName]["userlist"][userId]["score"] 
end

function Quiz.setUserScore(quizName, userId, score)
    users[quizName]["userlist"][userId]["score"] = score
end

function Quiz.addUserScore(quizName, userId, scoreToBeAdded)
    users[quizName]["userlist"][userId]["score"] = users[quizName]["userlist"][userId]["score"] + scoreToBeAdded
end

function Quiz.startQuiz(quizName)
    quizState[quizName]["isQuizStarted"] = true
    quizState[quizName]["currentQuestionIndex"] = 0
    leaderBoard[quizName] = {}
    local index = 0
    for userId, user in pairs(users[quizName]["userlist"]) 
    do
        table.insert(leaderBoard[quizName],user)
    end
end

function Quiz.getLeaderboard(quizName)
    return leaderBoard[quizName]
end

function Quiz.refreshLeaderboard(quizName)
    table.sort(leaderBoard[quizName], function (k1, k2) return k1.score > k2.score end )
    local rank = 1
    for userId, user in pairs(leaderBoard[quizName])
    do 
        user.rank = rank
        rank = rank + 1
    end

    return leaderBoard[quizName]
end

function Quiz.getNextQuestion(quizName)
    local currentQuestionIndex = quizState[quizName]["currentQuestionIndex"]

    if(currentQuestionIndex == quizTable[quizName]["questionCount"]) then
        quizState[quizName]["isQuizEnded"] = true
        return "The quiz is over"
    end
    local nextQuestion = quizTable[quizName]["questions"][currentQuestionIndex]
    quizState[quizName]["currentQuestionIndex"] = quizState[quizName]["currentQuestionIndex"] + 1
    return nextQuestion
end

function Quiz.isAnswerCorrect(quizName, questionIndex, optionSelected)
    local correctOption = quizTable[quizName]["questions"][questionIndex]["correctOption"]
    if correctOption == optionSelected then return true end
    return false
end

return Quiz

