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

//Returns list of tasks whose status is "completed"

MATCH (task:TASK{status:"completed"}) RETURN task

╒══════════════════════════════════════════════════════════════════════╕
│"task"                                                                │
╞══════════════════════════════════════════════════════════════════════╡
│{"workspace_id":2,"task_name":"task2","completed_on":"12/12/2017","pro│
│ject_id":122,"user_id":98080,"created_at":"01/12/2017","task_id":54,"c│
│ompleted":"true","status":"completed"}                                │
├──────────────────────────────────────────────────────────────────────┤
│{"workspace_id":1,"task_name":"task3","project_id":121,"completed_on":│
│"04/13/2018","user_id":56372,"created_at":"02/01/2018","task_id":90,"c│
│ompleted":"true","status":"completed"}                                │
├──────────────────────────────────────────────────────────────────────┤
│{"workspace_id":1,"task_name":"task7","project_id":121,"user_id":12343│
│,"created_at":"12/12/2017","task_id":90,"completed":"false","due_on":"│
│01/11/2018","status":"completed"}                                     │
└──────────────────────────────────────────────────────────────────────┘


//updates the modified_at property value of project with project id 124 and returns it

MATCH (project:Project{project_id:124}) SET project.modified_at="01/5/2018" RETURN project

╒══════════════════════════════════════════════════════════════════════╕
│"project"                                                             │
╞══════════════════════════════════════════════════════════════════════╡
│{"workspace_id":1,"project_id":124,"user_id":[12341,12345],"p_name":"p│
│4","due_date":"10/23/2018","created_at":"03/17/2018","team_id":3,"modi│
│fied_at":"01/5/2018"}                                                 │
└──────────────────────────────────────────────────────────────────────┘

//updates section name of a proect with project id 124 and returns that section

MATCH (section:SECTION{project_id:124}) SET section.name="web dev" RETURN section

╒═══════════════════════════════════════════╕
│"section"                                  │
╞═══════════════════════════════════════════╡
│{"name":"web dev","project_id":124,"id":17}│
├───────────────────────────────────────────┤
│{"name":"web dev","project_id":124,"id":18}│
└───────────────────────────────────────────┘
