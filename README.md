# README

## データ構造

### Userモデル
  |  カラム名  |  データ型 |
  | ---- | ---- |
  |  id  |  integer  |
  |  name  |  string  |
  |  email  |  string  |
  |  password_digest  |  string  |
### Taskモデル
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
