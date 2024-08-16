# Internship School API assignment

Hosted on VPS here: [Link](http://95.174.94.72:3000)

[<img src="https://run.pstmn.io/button.svg" alt="Run In Postman" style="width: 128px; height: 32px;">](https://god.gw.postman.com/run-collection/34454879-a58ad5b1-c341-431d-ab37-b758704757ae?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D34454879-a58ad5b1-c341-431d-ab37-b758704757ae%26entityType%3Dcollection%26workspaceId%3D2ecc6e1f-7830-4fcb-820e-a0e393c4f790)

- Ruby 3.3.2
- Rails 7.1.3

Needed to change model name from Class to Group to avoid collisions (`Class` is a reserved keyword).

# Implemented routes:

## POST /students
Requires `student` object, returns a created `student` as JSON, also `X-Auth-Token` in headers (JWT token).

## DELETE /students/:student_id
Requires `X-Auth-Token` from the last request, deletes a student.

## GET /schools/:school_id/groups/:group_id/students
Shows all students from a group in school.

## GET /schools/:school_id/groups/:group_id/
Shows all groups in school.

## Local usage
You need `.env.local` file for development env and `.env.test.local` for test env.
Example:

```
DATABASE_URL=postgresql://postgres:password@postgres:5432/internship_api_development
JWT_ISSUER=<your-issuer>
JWT_SECRET=<your-secret>
```
