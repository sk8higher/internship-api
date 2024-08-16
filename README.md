# Internship School API assignment

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
