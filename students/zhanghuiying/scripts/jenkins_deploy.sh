#!/usr/bin/env bash
set -euo pipefail

ROOT="${COURSE_ROOT:-/course-design-five}"
WAR="students/zhanghuiying/webapp/target/ROOT.war"

echo "[Jenkins] build source: GitHub cwccty/web-cluster-course-design"
echo "[Jenkins] deploy student: zhanghuiying"
mvn -q -f "students/zhanghuiying/webapp/pom.xml" clean package -DskipTests
for node in tomcat01 tomcat02; do
  rm -rf "$ROOT/zhanghuiying/deploy/$node/ROOT" "$ROOT/zhanghuiying/deploy/$node/ROOT.war"
  cp "$WAR" "$ROOT/zhanghuiying/deploy/$node/ROOT.war"
  echo "[Jenkins] deployed $WAR to $ROOT/zhanghuiying/deploy/$node/ROOT.war"
done
echo "[Jenkins] verify URL: http://154.64.231.137:18480/session.jsp"
