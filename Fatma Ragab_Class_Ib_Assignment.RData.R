# ====================================================
# AI and Omics Research Internship (2025)
# Module I: Getting Started with R (Class Ib)
# ====================================================

# -----------------------------
# Step 1: Setup Project Folders
# -----------------------------

# Create folders to organize our files
dir.create("raw_data", showWarnings = FALSE)   # For original downloaded data
dir.create("clean_data", showWarnings = FALSE) # For cleaned/processed data
dir.create("scripts", showWarnings = FALSE)    # For saving R scripts
dir.create("results", showWarnings = FALSE)    # For analysis results
dir.create("plots", showWarnings = FALSE)      # For graphs and charts

# Show confirmation message
print("Step 1: Project folders created successfully!")

# ----------------------------
# Step 2: Download Patient Data
# ----------------------------

# Download the patient data from GitHub
try({
  download.file(
    url = "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/main/patient_info.csv",
    destfile = "raw_data/patient_info.csv",
    mode = "wb"
  )
  print("Step 2: Downloaded patient data successfully!")
})

# ----------------------------
# Step 3: Load and Check Data
# ----------------------------

# Load the patient data into R
patient_info <- read.csv("raw_data/patient_info.csv")

# Show first few rows
print("Step 3: First look at the data:")
print(head(patient_info))

# Show data structure
print("Data structure:")
print(str(patient_info))

# ----------------------------
# Step 4: Clean and Prepare Data
# ----------------------------

# Convert text categories to factors (categories R understands)
patient_info$gender <- as.factor(patient_info$gender)
patient_info$diagnosis <- as.factor(patient_info$diagnosis)

# Create smoker/non-smoker flag (1 = smoker, 0 = non-smoker)
patient_info$smoker_binary <- ifelse(patient_info$smoker == "Yes", 1, 0)
patient_info$smoker_binary <- as.factor(patient_info$smoker_binary)

# Show cleaned data structure
print("Step 4: Data after cleaning:")
print(str(patient_info))

# ----------------------------
# Step 5: Save Results
# ----------------------------

# Save cleaned data
write.csv(patient_info, "clean_data/patient_info_clean.csv", row.names = FALSE)
print("Step 5: Saved cleaned data to clean_data/ folder")

# Save your work (REPLACE "YourName" with your actual name)
student_name <- "Fatma Ragab"  # 
save.image(file = paste0(student_name, "_Class_Ib_Assignment.RData"))
print(paste("Saved workspace as:", student_name, "_Class_Ib_Assignment.RData"))

