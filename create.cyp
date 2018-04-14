CREATE (Aneri:User{user_id:12341,u_name:"Aneri",email:"aneri@csueb.com",workspace_id:[1,2,3]})
CREATE (Ami:User{user_id:12342,u_name:"Ami",email:"ami@csueb.com",workspace_id:[1,3]})
CREATE (Jay:User{user_id:12343,u_name:"Jay",email:"jay@csueb.com",workspace_id:[1,2,3]})
CREATE (Raj:User{user_id:12344,u_name:"Raj",email:"raj@csueb.com",workspace_id:[2,1]})
CREATE (Maya:User{user_id:12345,u_name:"Maya",email:"maya@csueb.com",workspace_id:[1,3]})
CREATE (Jonathan: USER {user_id: 34578, user_name: 'Jonathan' , email: 'jsmith102@csueb.com', workspace_id: 1})
CREATE (Donald: USER {user_id: 23879, user_name: 'Donald' , email: 'dfischer@csueb.com', workspace_id: 2})
CREATE (Eric : USER {user_id: 56372, user_name: 'Eric', email: 'esamsung@csueb.com', workspace_id: [1,3]})
CREATE (Jack: USER {user_id: 69078, user_name: 'Jack', email: 'jmatthew@csueb.com', workspace_id:[1,3]})
CREATE (Kelly: USER {user_id: 98080, user_name: 'Kelly', email: 'kwolitzer@csueb.com', workspace_id:[1,2,3]})

CREATE (p1:Project{project_id:121, p_name:"p1", user_id:[69078,56372,12343,12344], due_date:"05/13/2018", created_at:"04/13/2018", 
  modified_at:"04/26/2018",workspace_id:1, team_id:01})
CREATE (p2:Project{project_id:122, p_name:"p2", user_id:[98080,23879], due_date:"07/04/2018", created_at:"01/01/2018", 
  modified_at:"04/13/2018",workspace_id:2, team_id:04})
CREATE (p3:Project{project_id:123, p_name:"p3", user_id:[12341,12342], due_date:"08/09/2018", created_at:"02/12/2018", 
  modified_at:"04/10/2018",workspace_id:3, team_id:02})
CREATE (p4:Project{project_id:124, p_name:"p4", user_id:[12341,12345], due_date:"10/23/2018", created_at:"03/17/2018", 
  modified_at:"04/12/2018",workspace_id:1, team_id:03})

CREATE (team1:Team{team_id:01, team_name:"team1"})
CREATE (team2:Team{team_id:02, team_name:"team2"})
CREATE (team3:Team{team_id:03, team_name:"team3"})
CREATE (team4:Team{team_id:04, team_name:"team4"})

CREATE (workspace1:Workspace{workspace_id:1, workspace_name:"workspace1", is_organization:True})
CREATE (workspace2:Workspace{workspace_id:2, workspace_name:"workspace2", is_organization:True})
CREATE (workspace3:Workspace{workspace_id:3, workspace_name:"workspace3", is_organization:True})



CREATE (s11:SECTION {id:11, name: 'development', project_id: 121})
CREATE (s12:SECTION {id:12, name: 'qa', project_id: 121})
CREATE (s13:SECTION {id:13, name: 'development', project_id: 122})
CREATE (s14:SECTION {id:14, name: 'qa', project_id: 122})
CREATE (s15:SECTION {id:15, name: 'development', project_id: 123})
CREATE (s16:SECTION {id:16, name: 'qa', project_id: 123})
CREATE (s17:SECTION {id:17, name: 'development', project_id: 124})
CREATE (s18:SECTION {id:18, name: 'qa', project_id: 124})

CREATE (task1: TASK {task_id: 98, task_name: 'task1', user_id: 69078, status: 'upcoming', created_at: '01/01/2018', completed: 'false', due_on: '01/10/2018', workspace_id: 1, project_id: 121})
CREATE (task2: TASK {task_id: 54, task_name: 'task2', user_id: 98080, status: 'completed', created_at: '01/12/2017', completed: 'true', completed_on: '12/12/2017', workspace_id: 2, project_id: 122})
CREATE (task3: TASK {task_id: 90, task_name: 'task3', user_id: 56372, status: 'in progress', created_at: '02/01/2018', completed: 'false', due_on: '01/13/2018', workspace_id:1, project_id:121})
CREATE (task4: TASK {task_id: 88, task_name: 'task4', user_id: 23879, status: 'pending', created_at: '01/05/2018', completed: 'false', due_on: '01/20/2018', workspace_id:2, project_id: 122})
CREATE (task5: TASK {task_id: 78, task_name: 'task5', user_id: 12341, status: 'pending', created_at: '01/05/2018', completed: 'false', due_on: '02/01/2018', workspace_id: 3, project_id: 123})
CREATE (task6: TASk {task_id: 56, task_name: 'task6', user_id: 12342, status: 'completed', created_at: '11/08/2018', completed: 'true', completed_on: '01/01/2018', workspace_id: 3, project_id: 123 })
CREATE (task7: TASK {task_id: 90, task_name: 'task7', user_id: 12343, status: 'completed', created_at: '12/12/2017', completed: 'false', due_on: '01/11/2018', workspace_id: 1, project_id: 121 })
CREATE (task8: TASK {task_id: 49, task_name: 'task8', user_id: 12344, status: 'upcoming', created_at: '01/01/2018', completed: 'false', due_on: '02/01/2018', workspace_id: 1, project_id: 121})
CREATE (task9: TASK {task_id: 23, task_name: 'task9', user_id: 12345, status: 'upcoming', created_at: '01/01/2018', completed: 'false', due_on: '03/02/2018', workspace_id: 1, project_id: 124 })
CREATE (task10: TASK {task_id: 25, task_name: 'task10', user_id: 12341, status: 'in progress', created_at: '01/01/2018', completed: 'false', due_on: '10/01/2018', workspace_id: 1, project_id: 124})

CREATE (task1)-[:part_of]->(s11)
CREATE (task2)-[:part_of]->(s13)
CREATE (task3)-[:part_of]->(s12)
CREATE (task4)-[:part_of]->(s14)
CREATE (task5)-[:part_of]->(s15)
CREATE (task6)-[:part_of]->(s16)
CREATE (task7)-[:part_of]->(s11)
CREATE (task8)-[:part_of]->(s11)
CREATE (task9)-[:part_of]->(s17)
CREATE (task10)-[:part_of]->(s18)
