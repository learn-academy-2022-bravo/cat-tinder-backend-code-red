 
//Create new rails application 
rails new vampire-tinder-backend -d postgresql -T
cd vampire-tinder-backend
rails db:create
bundle add rspec-rails
rails generate rspec:install
//Add repository
git remote add origin https://github.com/learn-academy-2022-bravo/cat-tinder-backend-code-red.git
git branch 
//Replace master branch wth main
git branch -M main
git branch 
pwd
git checkout -b main
git status
git add .
git commit -m "Initial backend commit"
//Push initial commit to main branch
git push origin main
code .