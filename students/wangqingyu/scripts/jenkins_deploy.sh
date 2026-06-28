#!/usr/bin/env bash
set -euo pipefail

ROOT="${COURSE_ROOT:-/course-design-five}"
WAR="students/wangqingyu/webapp/target/ROOT.war"

echo "[Jenkins] build source: GitHub cwccty/web-cluster-course-design"
echo "[Jenkins] deploy student: wangqingyu"
mvn -q -f "students/wangqingyu/webapp/pom.xml" clean package -DskipTests
for node in tomcat01 tomcat02; do
  rm -rf "$ROOT/wangqingyu/deploy/$node/ROOT" "$ROOT/wangqingyu/deploy/$node/ROOT.war"
  cp "$WAR" "$ROOT/wangqingyu/deploy/$node/ROOT.war"
  echo "[Jenkins] deployed $WAR to $ROOT/wangqingyu/deploy/$node/ROOT.war"
done
echo "[Jenkins] verify URL: http://154.64.231.137:18380/session.jsp"
