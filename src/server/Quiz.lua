local Quiz = {}

quizTable = {}
users = {}


-- [[ Setup a quiz ]]
function Quiz.setupQuiz(quizName, quizLocation)
    if (quizTable[quizName] ~= nil) then
        error("A quiz with same name already exists")
    else
        quizTable[quizName] = {}
        quizTable[quizName]["location"] = quizLocation
        quizTable[quizName]["questions"] = {}
        quizTable[quizName]["questionCount"] = 0
        users[quizName] = {}
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
    users[quizName][userId] = {}
end

function Quiz.removeUser(quizName, userId)
    users[quizName][userId] = nil
end

function Quiz.getUserScore(quizName, userId)
    return users[quizName][userId]["score"] 
end

function Quiz.setUserScore(userId, score)
    users[userId]["score"] = score
end

function Quiz.addUserScore(userId, scoreToBeAdded)
    users[userId]["score"] = users[userId]["score"] + scoreToBeAdded
end

function Quiz.startQuiz(quizName)
    quizState[quizName]["isQuizStarted"] = true
    quizState[quizName]["currentQuestionIndex"] = 0
end

function Quiz.getNextQuestion(quizName)
    local currentQuestionIndex = quizState[quizName]["currentQuestionIndex"]

    if(currentQuestionIndex == quizTable[quizName]["questionCount"]) then
        error("No more questions")
    end
    local nextQuestion = quizTable[quizName][questions][currentQuestionIndex]
    quizState[quizName]["currentQuestionIndex"] = quizState[quizName]["currentQuestionIndex"] + 1
    return nextQuestion
end

function Quiz.answerQuestion(quizName, userId, questionIndex, optionSelected)
    error("Not implemented")
end

return Quiz

