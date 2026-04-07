# साफ करने के लिए (optional)
Comment.destroy_all
Report.destroy_all
User.destroy_all

# ---------------- USERS ----------------
doctor = User.create!(
  email: "doctor@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "doctor"
)

reviewer = User.create!(
  email: "reviewer@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "reviewer"
)

admin = User.create!(
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "admin"
)

# ---------------- REPORTS ----------------
report1 = doctor.reports.create!(
  title: "Severe headache",
  description: "Patient experienced headache after medicine",
  severity: "high",
  status: "draft"
)

report2 = doctor.reports.create!(
  title: "Skin rash",
  description: "Allergic reaction observed",
  severity: "medium",
  status: "draft"
)


puts "✅ Seed data created: Users, Reports, Comments"