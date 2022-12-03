quiz = require("Quiz")

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

location = { }
location["x"] = 100
location["y"] = 100

-- [ Quiz flow sample ]
-- [ Setup a new quiz, quiz name should be unique, location in above format ]
quizTable = quiz.setupQuiz("Sample", location)

-- [ Create and add questions in the quiz ]
question = quiz.createQuestion(
                "How many edges do a triangle has?", 
                    "One", 
                    "Two", 
                    "Three", 
                    "Four", 
                    "C")

quiz.addQuestion("Sample", question)

question = quiz.createQuestion(
                "How many letters are in the english alphabet?", 
                    "25", 
                    "26", 
                    "21", 
                    "20", 
                    "B")

quiz.addQuestion("Sample", question)

question = quiz.createQuestion(
                "What is 10 times 20?", 
                    "200", 
                    "2010", 
                    "1020", 
                    "1010", 
                    "A")

quiz.addQuestion("Sample", question)

-- [ Add users to a quiz who teleports to quiz]
quiz.addUser("Sample", "User 1")
quiz.addUser("Sample", "User 2")
quiz.addUser("Sample", "User 3")
quiz.addUser("Sample", "User 4")

-- [ Remove users from quiz who leave ]
quiz.removeUser("Sample", "User 3")

-- [ Start the quiz ]
quiz.startQuiz("Sample")

-- [ Get leaderBoard ]
local leaderBoardObj = quiz.getLeaderboard("Sample")
-- print(dump(leaderBoard))

-- [ Get next question ]
local nextQuestion = quiz.getNextQuestion("Sample")
print(nextQuestion.questionStatement)
print(nextQuestion.option1)
print(nextQuestion.option2)
print(nextQuestion.option3)
print(nextQuestion.option4)

-- [ Answer question ]
local questionIndex = quizState["Sample"]["currentQuestionIndex"] - 1

local user1answer = quiz.isAnswerCorrect("Sample", questionIndex, "B")
local user2answer = quiz.isAnswerCorrect("Sample", questionIndex, "C")
local user4answer = quiz.isAnswerCorrect("Sample", questionIndex, "D")


-- [Update score ]
if user1answer then quiz.addUserScore("Sample", "User 1", 5) end
if user2answer then quiz.addUserScore("Sample", "User 2", 5) end
if user4answer then quiz.addUserScore("Sample", "User 4", 5) end


leaderBoardObj = quiz.refreshLeaderboard("Sample")
print(dump(leaderBoardObj))

nextQuestion = quiz.getNextQuestion("Sample")
print(nextQuestion.questionStatement)
print(nextQuestion.option1)
print(nextQuestion.option2)
print(nextQuestion.option3)
print(nextQuestion.option4)

questionIndex = quizState["Sample"]["currentQuestionIndex"] - 1

user1answer = quiz.isAnswerCorrect("Sample", questionIndex, "B")
user2answer = quiz.isAnswerCorrect("Sample", questionIndex, "C")
user4answer = quiz.isAnswerCorrect("Sample", questionIndex, "D")


-- [Update score ]
if user1answer then quiz.addUserScore("Sample", "User 1", 5) end
if user2answer then quiz.addUserScore("Sample", "User 2", 5) end
if user4answer then quiz.addUserScore("Sample", "User 4", 5) end

leaderBoardObj = quiz.refreshLeaderboard("Sample")
print(dump(leaderBoardObj))

nextQuestion = quiz.getNextQuestion("Sample")
print(nextQuestion.questionStatement)
print(nextQuestion.option1)
print(nextQuestion.option2)
print(nextQuestion.option3)
print(nextQuestion.option4)

questionIndex = quizState["Sample"]["currentQuestionIndex"] - 1

user1answer = quiz.isAnswerCorrect("Sample", questionIndex, "B")
user2answer = quiz.isAnswerCorrect("Sample", questionIndex, "A")
user4answer = quiz.isAnswerCorrect("Sample", questionIndex, "D")


-- [Update score ]
if user1answer then quiz.addUserScore("Sample", "User 1", 5) end
if user2answer then quiz.addUserScore("Sample", "User 2", 5) end
if user4answer then quiz.addUserScore("Sample", "User 4", 5) end

leaderBoardObj = quiz.refreshLeaderboard("Sample")
print(dump(leaderBoardObj))


nextQuestion = quiz.getNextQuestion("Sample")
print(nextQuestion)
