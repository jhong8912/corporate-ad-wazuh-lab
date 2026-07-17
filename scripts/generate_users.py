import csv
import random

# Core configuration parameters
DEPARTMENTS = ["IT", "HR", "Finance"]
OUTPUT_FILE = "mock_users.csv"

FIRST_NAMES = ["James", "Mary", "John", "Patricia", "Robert", "Jennifer", "Michael", "Linda", "William", "Elizabeth"]
LAST_NAMES = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez"]

def generate_mock_users(num_users=20):
    users = []
    used_usernames = set()
    
    for i in range(num_users):
        first = random.choice(FIRST_NAMES)
        last = random.choice(LAST_NAMES)
        dept = random.choice(DEPARTMENTS)
        
        # Create a clean enterprise username (first initial + last name)
        username = f"{first[0].lower()}{last.lower()}"
        
        # Handle username collisions if they happen
        suffix = 1
        original_username = username
        while username in used_usernames:
            username = f"{original_username}{suffix}"
            suffix += 1
        used_usernames.add(username)
        
        email = f"{username}@corp.local"
        
        users.append({
            "FirstName": first,
            "LastName": last,
            "Username": username,
            "Email": email,
            "Department": dept
        })
    return users

def write_to_csv(users):
    headers = ["FirstName", "LastName", "Username", "Email", "Department"]
    with open(OUTPUT_FILE, mode="w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(file, fieldnames=headers)
        writer.writeheader()
        writer.writerows(users)
    print(f"[+] Successfully generated {len(users)} users inside {OUTPUT_FILE}")

if __name__ == "__main__":
    mock_users = generate_mock_users(20)
    write_to_csv(mock_users)
