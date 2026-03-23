import subprocess

result = subprocess.run(
    ["docker", "exec", "mongo1", "mongosh", "--eval", "db.isMaster()"],
    capture_output=True,
    text=True
)

print(result.stdout)
