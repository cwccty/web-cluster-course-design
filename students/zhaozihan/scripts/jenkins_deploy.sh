#!/usr/bin/env bash
set -euo pipefail

ROOT="${COURSE_ROOT:-/course-design-five}"
WAR="students/zhaozihan/webapp/target/ROOT.war"

echo "[Jenkins] build source: GitHub cwccty/web-cluster-course-design"
echo "[Jenkins] deploy student: zhaozihan"
mvn -q -f "students/zhaozihan/webapp/pom.xml" clean package -DskipTests
for node in tomcat01 tomcat02; do
  rm -rf "$ROOT/zhaozihan/deploy/$node/ROOT" "$ROOT/zhaozihan/deploy/$node/ROOT.war"
  cp "$WAR" "$ROOT/zhaozihan/deploy/$node/ROOT.war"
  echo "[Jenkins] deployed $WAR to $ROOT/zhaozihan/deploy/$node/ROOT.war"
done
echo "[Jenkins] verify URL: http://154.64.231.137:18580/session.jsp"
