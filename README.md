# README

## データ構造
  - モデル名
    - カラム名:データ型

  - User
    - name:string
    - email:string
    - password_digest:string
  - Task
    - user_id:references
    - title:string
    - description:text
    - limit:integer
    - priority:integer
    - status:integer
  - Label
    - term:string
  - Labelling
    - task_id:references
    - label_id:references
