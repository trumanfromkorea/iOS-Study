//
//  ViewController.swift
//  MyWeather
//
//  Created by 장재훈 on 2022/05/16.
//

import CoreLocation
import UIKit

// Location: CoreLocation
// table view
// custom cell: collection view
// API / request to get the data

class ViewController: UIViewController {
    @IBOutlet var table: UITableView!

    var models = [Daily]()

    let locationManager = CLLocationManager()

    var currentLocation: CLLocation?
//    var current: CurrentWeather?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register 2 cells
        table.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: HourlyTableViewCell.identifier)
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier)

        table.delegate = self
        table.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Location
        setupLocation()
    }
}

// Location
extension ViewController: CLLocationManagerDelegate {
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }

    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation
        else { return }

        let lon = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude

        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly,alerts&appid=\(PrivateData.apiKey)"

        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, _, error in
            // Validation
            guard let data = data, error == nil
            else {
                print("something went wrong")
                return
            }

            // Convert data to models / some Object
            var json: WeatherResponse?
            do {
                json = try JSONDecoder().decode(WeatherResponse.self, from: data)
            } catch {
                print("error \(error)")
            }

            guard let result = json
            else { return }

            result.daily.forEach { daily in
                self.models.append(daily)
            }
            // 여기서 current weather 넣어주기

            // Update user interface
            DispatchQueue.main.async {
                self.table.reloadData()
                self.table.tableHeaderView = self.createTableHeader()
            }

        }).resume()
    }

    func createTableHeader() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))

        let locationLabel = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: headerView.frame.height / 5))
        let summaryLabel = UILabel(frame: CGRect(x: 10, y: 20 + locationLabel.frame.size.height, width: view.frame.size.width - 20, height: headerView.frame.height / 5))
        let tempLabel = UILabel(frame: CGRect(x: 10, y: 20 + summaryLabel.frame.size.height, width: view.frame.size.width - 20, height: headerView.frame.height / 2))

        headerView.addSubview(locationLabel)
        headerView.addSubview(summaryLabel)
        headerView.addSubview(tempLabel)

        locationLabel.textAlignment = .center
        summaryLabel.textAlignment = .center
        tempLabel.textAlignment = .center

        locationLabel.text = "Current Location" // current 넣어주기
        summaryLabel.text = "Clear"
        tempLabel.text = "12"

        tempLabel.font = UIFont(name: "Helvetica-Bold", size: 32)

        return headerView
    }
}

// Table
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.configure(with: models[indexPath.row])

        return cell
    }
}

struct WeatherResponse: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var timezone_offset: Int
    var daily: [Daily]
}

struct Daily: Codable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Temp
    var humidity: Int
    var weather: [Weather]
}

struct Temp: Codable {
    var min: Double
    var max: Double
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
}
