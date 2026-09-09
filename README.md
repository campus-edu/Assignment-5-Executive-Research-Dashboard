# QuickBite Technologies // C-Suite Strategy & Regulatory Portals

> **Course:** AI.135 Applied AI for Document & Linguistic Analysis  
> **Author:** Jason Orozco Zarco (Head of Legal & Compliance / Chief Strategy Officer)  
> **Framework:** Flutter 3.24 (Web Assembly / CanvasKit) + GitHub Pages Automated Actions  

---

## Executive System Architecture

This repository contains the interactive Flutter Web executive strategy portal for QuickBite Technologies, resolving the multi-jurisdictional compliance mandates and unit economic sensitivities across Course Assignments 1 through 5.

```
ready_to_upload_github_pages/
├── lib/
│   ├── main.dart                          # Root routing controller & theme definition
│   ├── theme/app_theme.dart               # C-Suite Material 3 dark slate palette
│   ├── models/
│   │   ├── regulatory_model.dart          # 5-Pillar dynamic statutory weighting model
│   │   └── sensitivity_model.dart         # Unit economics & GAAP revenue engine
│   ├── widgets/
│   │   ├── orientation_bar.dart           # Three Questions Test orientation bar
│   │   └── doc_download_button.dart       # Deliverable file triggers
│   └── views/
│       ├── hub_view.dart                  # Master Executive Strategy Hub
│       ├── assignment4_view.dart          # Assignment 4: 16:9 Presentation & Matrix
│       └── assignment5_view.dart          # Assignment 5: 4 Strategic Panels & Simulator
├── web/                                   # Flutter web packaging & manifest
├── assets/documents/                      # Preserved PDF, PPTX, and DOCX deliverables
├── .github/workflows/deploy.yml           # CI/CD Flutter Web builder & Pages deployer
├── connect_github.sh                      # Automated GitHub remote & upload script
└── pubspec.yaml                           # Flutter dependencies & asset registration
```

---

## Resolving the Assignment 5 Isolation Bug

In earlier vanilla HTML prototypes, the presentation deck markup from Assignment 4 was duplicated directly above the Assignment 5 panels, and JavaScript forced an initial `deck` viewport state. This Flutter Web implementation isolates both deliverables into discrete declarative views (`Assignment4View` and `Assignment5View`), completely eliminating viewport bleeding and cross-panel state contamination.

---

## Connecting to GitHub & Deploying to GitHub Pages

### Option 1: Automated Script
Run the included connector script:
```bash
./connect_github.sh <YOUR_REPOSITORY_NAME>
```

### Option 2: Manual Push
1. Authenticate with GitHub CLI:
   ```bash
   gh auth login
   ```
2. Create or link the remote repository:
   ```bash
   git remote add origin https://github.com/<USERNAME>/<REPO_NAME>.git
   git push -u origin main
   ```
3. In GitHub, go to **Settings > Pages** and ensure **Source** is set to **GitHub Actions**. The automated workflow in `.github/workflows/deploy.yml` will compile Flutter Web and publish the application immediately.
