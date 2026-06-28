#!/usr/bin/env bash
set -euo pipefail

ROOT="${COURSE_ROOT:-/course-design-five}"
WAR="students/chetiantian/webapp/target/ROOT.war"

echo "[Jenkins] build source: GitHub cwccty/web-cluster-course-design"
echo "[Jenkins] deploy student: chetiantian"
mvn -q -f "students/chetiantian/webapp/pom.xml" clean package -DskipTests
for node in tomcat01 tomcat02; do
  rm -rf "$ROOT/chetiantian/deploy/$node/ROOT" "$ROOT/chetiantian/deploy/$node/ROOT.war"
  cp "$WAR" "$ROOT/chetiantian/deploy/$node/ROOT.war"
  echo "[Jenkins] deployed $WAR to $ROOT/chetiantian/deploy/$node/ROOT.war"
done
echo "[Jenkins] verify URL: http://154.64.231.137:18280/session.jsp"
