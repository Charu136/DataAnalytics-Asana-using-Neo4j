MATCH (project:Project{p_name:'p1'})
MATCH(task:TASK)
WHERE task.project_id = project.project_id
AND task.status <> 'completed'
RETURN task.task_name,task.status,task.due_on

╒════════════════╤═════════════╤═════════════╕
│"task.task_name"│"task.status"│"task.due_on"│
╞════════════════╪═════════════╪═════════════╡
│"task1"         │"upcoming"   │"01/10/2018" │
├────────────────┼─────────────┼─────────────┤
│"task3"         │"in progress"│"01/13/2018" │
├────────────────┼─────────────┼─────────────┤
│"task8"         │"upcoming"   │"02/01/2018" │
└────────────────┴─────────────┴─────────────┘

MATCH (project:Project{p_name:'p2'})
MATCH(task:TASK)
WHERE task.project_id = project.project_id
MATCH (section:SECTION)
MATCH (task)-[:part_of]->(section)
WHERE section.name = 'qa'
RETURN task.task_name

╒════════════════╕
│"task.task_name"│
╞════════════════╡
│"task4"         │
└────────────────┘

MATCH(task:TASK{task_name:'task3'})
SET task.status = 'completed'
SET task.completed = 'true'
REMOVE task.due_on
SET task.completed_on = '04/13/2018'
RETURN task


╒══════════════════════════════════════════════════════════════════════╕
│"task"                                                                │
╞══════════════════════════════════════════════════════════════════════╡
│{"workspace_id":1,"task_name":"task3","project_id":121,"user_id":56372│
│,"completed_on":"04/13/2018","created_at":"02/01/2018","task_id":90,"c│
│ompleted":"true","status":"completed"}                                │
└──────────────────────────────────────────────────────────────────────┘