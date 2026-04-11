# Zarządzanie Infrastrukturą Chmurową – WSB-NLU

Repozytorium do ćwiczeń z kursu **Zarządzanie Infrastrukturą Chmurową**  
Wyższa Szkoła Biznesu – National-Louis University

---

## Jak zacząć

### 1. Sklonuj repozytorium

```bash
git clone https://gitlab.com/wsb-nlu-devops1/WSB-NLU-Terraform.git
cd WSB-NLU-Terraform
```

### 2. Utwórz swój branch

Każdy student pracuje na własnym branchu. Nazwa brancha to Twoje **imię i nazwisko** małymi literami, spacje zastąp myślnikami:

```bash
git checkout -b jan-kowalski
git push -u origin jan-kowalski
```

Od tej chwili wszystkie Twoje commity trafiają na Twój branch.

### 3. Odśwież sesję AWS przed każdymi zajęciami

```bash
aws sso login --profile wsb-lab
export AWS_PROFILE=wsb-lab          # macOS / Linux
# lub na Windows (PowerShell):
$env:AWS_PROFILE = "wsb-lab"
```

Weryfikacja połączenia:

```bash
aws sts get-caller-identity
```

---

## Struktura repozytorium

```
WSB-NLU-Terraform/
├── README.md               ← jesteś tutaj
├── .gitignore              ← pliki wykluczone z Gita
│
├── cwiczenia/              ← Twój folder roboczy
│   └── <imie-nazwisko>/    ← stworzysz go w czasie CW1
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── terraform.tfvars   (w .gitignore – nie commituj!)
│
└── materialy/              ← pliki udostępnione przez prowadzącego
    ├── cw1/
    ├── cw2/
    └── ...
```

> **Ważne:** pracuj wyłącznie w katalogu `cwiczenia/<twoje-imie-nazwisko>/`.  
> Nie modyfikuj plików innych studentów ani katalogu `materialy/`.

---

## Zasady pracy z Git

### Codzienny workflow

```bash
# Przed rozpoczęciem pracy – pobierz zmiany z serwera
git pull origin main

# Po wprowadzeniu zmian – zapisz i wypchnij
git add .
git commit -m "cwiczenie-1: dodaj bucket S3"
git push
```

### Konwencja nazw commitów

Używaj krótkiego prefiksu opisującego rodzaj zmiany:

| Prefiks | Kiedy |
|---------|-------|
| `feat:` | nowy zasób lub funkcjonalność |
| `fix:` | poprawka błędu |
| `refactor:` | przepisanie bez zmiany działania |
| `docs:` | zmiany w dokumentacji |

Przykłady:
```
feat: dodaj bucket S3 z szyfrowaniem
fix: popraw nazwe bucketu
refactor: zamien hardkodowane wartosci na zmienne
```

### Czego NIE commitować

Plik `.gitignore` chroni przed przypadkowym dodaniem:

```
.terraform/          ← pobrane providery (duże pliki)
*.tfstate            ← stan infrastruktury (może zawierać hasła!)
*.tfstate.backup
terraform.tfvars     ← Twoje wartości zmiennych (lokalny config)
tfplan               ← zapisany plan Terraform
```

---

## Dostęp do AWS

Portal SSO: **https://wsb-nlu.awsapps.com/start/#/?tab=accounts**

- Konto: indywidualne konto studenta
- Region: `eu-central-1` (Frankfurt)
- Profil AWS CLI: `wsb-lab`

> Sesja SSO wygasa po **8 godzinach**. Odśwież ją przez:  
> `aws sso login --profile wsb-lab`

---

## Plan ćwiczeń

| # | Temat | Narzędzia |
|---|-------|-----------|
| CW1 | Środowisko, Git, pierwszy zasób S3 | Terraform, Git, AWS CLI |
| CW2 | Remote state, zmienne, outputs | Terraform |
| CW3 | Moduły i środowiska dev/prod | Terraform |
| CW4 | Testowanie: tflint, Checkov, terraform test | tflint, Checkov |
| CW5 | Ansible – podstawy i playbooki | Ansible |
| CW6 | Ansible – role, szablony Jinja2, Vault | Ansible |
| CW7 | Projekt końcowy: Terraform + Ansible | Terraform + Ansible |

---

## Przydatne linki

| Zasób | Link |
|-------|------|
| Dokumentacja Terraform | https://developer.hashicorp.com/terraform/docs |
| Terraform Registry (moduły) | https://registry.terraform.io |
| Dokumentacja AWS CLI | https://docs.aws.amazon.com/cli/ |
| Dokumentacja Ansible | https://docs.ansible.com |
| Portal AWS SSO (uczelnia) | https://wsb-nlu.awsapps.com/start/#/?tab=accounts |

---
