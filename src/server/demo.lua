-- local Players = game:GetService("Players")

-- local function replaceClothes(player)
-- 	local character = player.Character
-- 	if character then
-- 		-- look for shirts / pants
-- 		local shirt = character:FindFirstChildOfClass("Shirt")
-- 		local pants = character:FindFirstChildOfClass("Pants")
-- 		local head = character:FindFirstChildOfClass("Head")


-- 		-- create shirts / pants if they don't exist
-- 		if not shirt then
-- 			shirt = Instance.new("Shirt")
-- 			shirt.Parent = character
-- 		end
-- 		if not pants then
-- 			pants = Instance.new("Pants")
-- 			pants.Parent = character
-- 		end


-- 		hatAccessory = Instance.new("HatAccessory")
-- 		hatAccessory.Parent = character

-- 		shirt.Color3 = Color3(200, 50, 50)
-- 		pants.Color3 = Color3(200, 50, 50)
-- 		head.Color3 = Color3(200, 50, 50)
-- 		hatAccessory.Color3 = Color3(200, 50, 50)



-- 		-- reset shirt / pants content ids
-- 		-- shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=83326831"
-- 		-- pants.PantsTemplate = "http://www.roblox.com/asset/?id=10045638"
-- 		-- head.HeadTemplate = "http://www.roblox.com/asset/?id=10045638"
-- 	end
-- local Pad = game.Workspace.SmallHouse2.Kitchen_floor

-- game.Workspace.SmallHouse1.Kitchen_floor.Touched:Connect(function(hit)
-- 	local Player = game.Players:GetPlayerFromCharacter(hit.Parent)
-- 	replaceClothes(Player)
-- 	if Player then
-- 		local CurrentlyTeleporting = Player.Character:FindFirstChild("CurrentlyTeleporting")
-- 		if not CurrentlyTeleporting then return end
		
-- 		if not CurrentlyTeleporting.Value then
-- 			CurrentlyTeleporting.Value = true
--          print("teleporting.....")
-- 			Player.Character.HumanoidRootPart.CFrame = Pad.CFrame + Vector3.new(0,5,0)
-- 			wait(3)
-- 			CurrentlyTeleporting.Value = false
-- 		end
-- 	end
-- end)

-- quiz = require("Quiz")

-- function dump(o)
--     if type(o) == 'table' then
--        local s = '{ '
--        for k,v in pairs(o) do
--           if type(k) ~= 'number' then k = '"'..k..'"' end
--           s = s .. '['..k..'] = ' .. dump(v) .. ','
--        end
--        return s .. '} '
--     else
--        return tostring(o)
--     end
-- end

-- -- for _index, player in ipairs(Players:GetPlayers()) do
-- -- 	replaceClothes(player)
-- -- end
-- -- quiz = require("Quiz")

-- -- function dump(o)
-- --     if type(o) == 'table' then
-- --        local s = '{ '
-- --        for k,v in pairs(o) do
-- --           if type(k) ~= 'number' then k = '"'..k..'"' end
-- --           s = s .. '['..k..'] = ' .. dump(v) .. ','
-- --        end
-- --        return s .. '} '
-- --     else
-- --        return tostring(o)
-- --     end
-- -- end

-- -- location = { }
-- -- location["x"] = 100
-- -- location["y"] = 100

-- -- -- [ Quiz flow sample ]
-- -- -- [ Setup a new quiz, quiz name should be unique, location in above format ]
-- -- quizTable = quiz.setupQuiz("Sample", location)

-- -- -- [ Create and add questions in the quiz ]
-- -- question = quiz.createQuestion(
-- --                 "How many edges do a triangle has?", 
-- --                     "One", 
-- --                     "Two", 
-- --                     "Three", 
-- --                     "Four", 
-- --                     "C")

-- -- quiz.addQuestion("Sample", question)

-- -- question = quiz.createQuestion(
-- --                 "How many letters are in the english alphabet?", 
-- --                     "25", 
-- --                     "26", 
-- --                     "21", 
-- --                     "20", 
-- --                     "B")

-- -- quiz.addQuestion("Sample", question)

-- -- question = quiz.createQuestion(
-- --                 "What is 10 times 20?", 
-- --                     "200", 
-- --                     "2010", 
-- --                     "1020", 
-- --                     "1010", 
-- --                     "A")

-- -- quiz.addQuestion("Sample", question)

-- -- -- [ Add users to a quiz who teleports to quiz]
-- -- quiz.addUser("Sample", "User 1")
-- -- quiz.addUser("Sample", "User 2")
-- -- quiz.addUser("Sample", "User 3")
-- -- quiz.addUser("Sample", "User 4")

-- -- -- [ Remove users from quiz who leave ]
-- -- quiz.removeUser("Sample", "User 3")

-- -- -- [ Start the quiz ]
-- -- quiz.startQuiz("Sample")

-- -- -- [ Get leaderBoard ]
-- -- local leaderBoardObj = quiz.getLeaderboard("Sample")
-- -- -- print(dump(leaderBoard))

-- -- -- [ Get next question ]
-- -- local nextQuestion = quiz.getNextQuestion("Sample")
-- -- print(nextQuestion.questionStatement)
-- -- print(nextQuestion.option1)
-- -- print(nextQuestion.option2)
-- -- print(nextQuestion.option3)
-- -- print(nextQuestion.option4)

-- -- -- [ Answer question ]
-- -- local questionIndex = quizState["Sample"]["currentQuestionIndex"] - 1

-- -- local user1answer = quiz.isAnswerCorrect("Sample", questionIndex, "B")
-- -- local user2answer = quiz.isAnswerCorrect("Sample", questionIndex, "C")
-- -- local user4answer = quiz.isAnswerCorrect("Sample", questionIndex, "D")


-- -- -- [Update score ]
-- -- if user1answer then quiz.addUserScore("Sample", "User 1", 5) end
-- -- if user2answer then quiz.addUserScore("Sample", "User 2", 5) end
-- -- if user4answer then quiz.addUserScore("Sample", "User 4", 5) end


-- -- leaderBoardObj = quiz.refreshLeaderboard("Sample")
-- -- print(dump(leaderBoardObj))

-- -- nextQuestion = quiz.getNextQuestion("Sample")
-- -- print(nextQuestion.questionStatement)
-- -- print(nextQuestion.option1)
-- -- print(nextQuestion.option2)
-- -- print(nextQuestion.option3)
-- -- print(nextQuestion.option4)

-- -- questionIndex = quizState["Sample"]["currentQuestionIndex"] - 1

-- -- user1answer = quiz.isAnswerCorrect("Sample", questionIndex, "B")
-- -- user2answer = quiz.isAnswerCorrect("Sample", questionIndex, "C")
-- -- user4answer = quiz.isAnswerCorrect("Sample", questionIndex, "D")


-- -- -- [Update score ]
-- -- if user1answer then quiz.addUserScore("Sample", "User 1", 5) end
-- -- if user2answer then quiz.addUserScore("Sample", "User 2", 5) end
-- -- if user4answer then quiz.addUserScore("Sample", "User 4", 5) end

-- -- leaderBoardObj = quiz.refreshLeaderboard("Sample")
-- -- print(dump(leaderBoardObj))

-- -- nextQuestion = quiz.getNextQuestion("Sample")
-- -- print(nextQuestion.questionStatement)
-- -- print(nextQuestion.option1)
-- -- print(nextQuestion.option2)
-- -- print(nextQuestion.option3)
-- -- print(nextQuestion.option4)

-- -- questionIndex = quizState["Sample"]["currentQuestionIndex"] - 1

-- -- user1answer = quiz.isAnswerCorrect("Sample", questionIndex, "B")
-- -- user2answer = quiz.isAnswerCorrect("Sample", questionIndex, "A")
-- -- user4answer = quiz.isAnswerCorrect("Sample", questionIndex, "D")


-- -- -- [Update score ]
-- -- if user1answer then quiz.addUserScore("Sample", "User 1", 5) end
-- -- if user2answer then quiz.addUserScore("Sample", "User 2", 5) end
-- -- if user4answer then quiz.addUserScore("Sample", "User 4", 5) end

-- -- leaderBoardObj = quiz.refreshLeaderboard("Sample")
-- -- print(dump(leaderBoardObj))


-- -- nextQuestion = quiz.getNextQuestion("Sample")
-- -- print(nextQuestion)
