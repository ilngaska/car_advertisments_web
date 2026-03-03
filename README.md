# Car Advertisements Web 🚗

A robust Ruby on Rails web application for browsing and searching car advertisements. This project features a custom search engine logic originally developed for a console-based application, now fully integrated into a modern web interface.

## 🌟 Key Features

- **Custom Search Engine**: Leverages the proprietary `CarSearchEngine` logic for precise filtering and data preparation.
- **Advanced Search**: Filter cars by make, model, year range, and price range.
- **Smart Sorting**: Optimized sorting by price, production year, and "Date Added" (with proper `Date` object parsing).
- **Search Analytics**: Integrated `SearchTracker` that logs search queries and result counts into a `yml` database.
- **Modern UI**: A responsive, clean interface built with **Tailwind CSS**.
- **Pagination**: Efficient data handling using the `Pagy` gem.

## 🛠 Tech Stack

- **Backend:** Ruby on Rails 7
- **Frontend:** Tailwind CSS (via CDN/Tailwind-Rails)
- **Database:** YAML (maintained for compatibility with the legacy console system)
- **Pagination:** Pagy
- **Logic Integration:** Custom Ruby Classes (`CarSearchEngine`, `SearchTracker`)

## 🚀 Getting Started

### Prerequisites
- Ruby (check `.ruby-version`)
- Rails 7+
- Bundler

### Installation
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/car_advertisments_web.git](https://github.com/your-username/car_advertisments_web.git)
   cd car_advertisments_web
2. **Install dependencies:**
   ```bash
   bundle install
   ```
3. **Database Setup:**
  Ensure your db/cars.yml and db/searches.yml files are present in the directory.

4. **Start the server:**

```bash
bin/dev
# or
rails server
```
5. **Access the app:**
Open http://localhost:3000 in your browser.
