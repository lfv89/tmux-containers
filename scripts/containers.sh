#!/usr/bin/env bash

get_docker_mem() {
  if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
    docker_mem=$(docker stats --no-stream --format "{{.MemUsage}}" 2>/dev/null | awk -F'/' '{
      mem = $1
      if (mem ~ /GiB/) {
        gsub(/GiB/, "", mem)
        sum += mem
      } else if (mem ~ /MiB/) {
        gsub(/MiB/, "", mem)
        sum += mem/1024
      } else if (mem ~ /KiB/) {
        gsub(/KiB/, "", mem)
        sum += mem/1024/1024
      }
    } END {printf "%.1f", sum}')
    
    running_containers=$(docker ps -q | wc -l | tr -d ' ')
    disk_usage=$(docker system df --format "{{.Size}}" 2>/dev/null | awk '{
      if ($0 ~ /GB/) {
        gsub(/GB/, "", $0)
        sum += $0
      } else if ($0 ~ /MB/) {
        gsub(/MB/, "", $0)
        sum += $0/1024
      } else if ($0 ~ /KB/) {
        gsub(/KB/, "", $0)
        sum += $0/1024/1024
      }
    } END {printf "%.1f", sum}')
  echo "up(${running_containers}) ram(${docker_mem}GB) disk(${disk_usage}GB)"
  else
    echo "N/A"
  fi
}

get_docker_mem
