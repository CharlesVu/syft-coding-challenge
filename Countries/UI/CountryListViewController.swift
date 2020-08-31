//
//  CountryListViewController.swift
//  Countries
//
//  Created by Syft on 03/03/2020.
//  Copyright © 2020 Syft. All rights reserved.
//

import UIKit
import CoreData


class CountryListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var countryTableView: UITableView!
    var countries: [Country]? {
        didSet {
            sortCountries()
        }
    }

    var sortedCountries: [Country]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        countryTableView.rowHeight = UITableView.automaticDimension
        countryTableView.estimatedRowHeight = 100
        countryTableView.dataSource = self
        countryTableView.accessibilityIdentifier = "CountryTable"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchCountries()
    }

    func fetchCountries() {
        HUD.show(in: view.window!)

        Server.shared.countryList() { (result) in

            HUD.dismiss(from: self.view.window!)
            switch result {
            case .success(let countries):
                self.countries = countries
                self.countryTableView.reloadData()
            case .failure(let error):
                assertionFailure("There was an error: \(error)")
            }
        }
    }
    
    
    // MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
        
        if let country = sortedCountries?[indexPath.row] {
            populateCell(cell, withCountry: country)
        }
        return cell
    }


    private func populateCell(_ cell: CountryTableViewCell,
                              withCountry country : Country) {
        guard let name = country.name else {
            assertionFailure("Trying to fill a cell without a country Name")
            return
        }

        cell.country.text = country.name
        cell.capital.text = country.capital
        cell.population.text = PopulationFormatter.formatPopulation(population: country.population)

        Self.fillAccessibilityIdentifiers(cell, countryName: name)
        Self.layoutCell(cell, capital: country.capital)
    }

    static func fillAccessibilityIdentifiers(_ cell: CountryTableViewCell,
                                             countryName : String) {
        cell.accessibilityIdentifier = "\(countryName)-Cell"
        cell.country.accessibilityIdentifier = "Country"
        cell.capital.accessibilityIdentifier = "\(countryName)-Capital"
        cell.capitalLabel.accessibilityIdentifier = "\(countryName)-Capital-Label"
        cell.population.accessibilityIdentifier = "\(countryName)-Population"
        cell.populationLabel.accessibilityIdentifier = "\(countryName)-Population-Label"
    }

    static func layoutCell(_ cell: CapitalLabelHideable,
                            capital : String?) {
        if capital == nil || capital == "" {
            cell.hideCapitalLabels()
        } else {
            cell.showCapitalLabels()
        }
    }

    func sortCountries() {
        sortedCountries = countries?.sorted { (lhs, rhs) -> Bool in
            lhs.name ?? "" < rhs.name ?? ""
        }
    }
}

