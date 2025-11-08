#!/usr/bin/env bash
set -euo pipefail
REMOTE=origin
SRC_BRANCH=main
SRC_DIR=shared
DELIVERY=ro-shared-ddl

git switch "${SRC_BRANCH}"
git pull --ff-only "${REMOTE}" "${SRC_BRANCH}"

git branch -D "${DELIVERY}" 2>/dev/null || true
git push "${REMOTE}" --delete "${DELIVERY}" 2>/dev/null || true

git checkout --orphan "${DELIVERY}"
git rm -rf . 2>/dev/null || true
git checkout "${SRC_BRANCH}" -- "${SRC_DIR}"
rsync -a "${SRC_DIR}/" ./
git rm -r "${SRC_DIR}" 2>/dev/null || true
git add -A
git commit -m "build: export ${SRC_DIR}/ for delivery"

git push -u "${REMOTE}" "${DELIVERY}" --force
git switch "${SRC_BRANCH}"
echo "Published ${DELIVERY} from ${SRC_BRANCH}:${SRC_DIR}/"
