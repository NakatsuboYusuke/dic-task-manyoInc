# README

## データ構造

### Userモデル
  |  カラム名  |  データ型 |
  | ---- | ---- |
  |  id  |  integer  |
  |  name  |  string  |
  |  email  |  string  |
  |  password_digest  |  string  |
### TASKモデル
  |  カラム名  |  データ型 |
  | ---- | ---- |
  |  id  |  integer  |
  |  user_id  |  references  |
  |  title  |  string  |
  |  description  |  text  |
  |  limit  |  integer  |
  |  priority  |  integer  |
  |  status  |  integer  |
### Labelモデル
  |  カラム名  |  データ型 |
  | ---- | ---- |
  |  id  |  integer  |
  |  term  |  string  |
### Labellingモデル
  |  カラム名  |  データ型 |
  | ---- | ---- |
  |  id  |  integer  |
  |  task_id  |  references  |
  |  label_id  |  references  |

##Herokuのアプリケーション情報

- URL https://taskapp-heroku.herokuapp.com/
- Ruby 2.6.5
- Rails 5.2.3

##Herokuへのデプロイ方法

- Herokuへログインします。  
  ```$ heroku login```
- ローカルのmasterブランチでステージング後、GitHubへpushします。  
  ```$ git add --all```  
  ```$ git commit -m 'コメントを入力します'```  
  ```$ git push origin master```
- Herokuへ自動的にデプロイします。
