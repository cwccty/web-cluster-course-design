#!/usr/bin/env bash
set -euo pipefail

ROOT="${COURSE_ROOT:-/course-design-five}"
WAR="students/nieping/webapp/target/ROOT.war"

echo "[Jenkins] build source: GitHub cwccty/web-cluster-course-design"
echo "[Jenkins] deploy student: nieping"
mvn -q -f "students/nieping/webapp/pom.xml" clean package -DskipTests
for node in tomcat01 tomcat02; do
  rm -rf "$ROOT/nieping/deploy/$node/ROOT" "$ROOT/nieping/deploy/$node/ROOT.war"
  cp "$WAR" "$ROOT/nieping/deploy/$node/ROOT.war"
  echo "[Jenkins] deployed $WAR to $ROOT/nieping/deploy/$node/ROOT.war"
done
echo "[Jenkins] verify URL: http://154.64.231.137:18180/session.jsp"
