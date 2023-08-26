//
//  LossesListView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import SwiftUI

struct LossesListView: View {
    @State private var selectedDate = Date()
    
    let startingDate : Date = Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 25)) ?? Date()
    let endingDate = Date()
    
    @State private var isSelectedEquipment : Bool = false
    @State private var isSelectedPersonnel : Bool = false
    
    //equipment losses
    @State private var lossesTank : Int = 0
    @State private var lossesAPC : Int = 0
    @State private var lossesArtillery = 0
    @State private var lossesMRL = 0
    @State private var lossesAntiaircraftSystems = 0
    @State private var lossesAircraft = 0
    @State private var lossesHelicopter = 0
    @State private var lossesDrone = 0
    @State private var lossesCruiseMissiles = 0
    @State private var lossesNavalShip = 0
    @State private var lossesMilitaryAuto = 0
    @State private var lossesFuelTank = 0
    @State private var lossesVehiclesAndFuelTanks = 0
    @State private var lossesSpecialEquipment = 0
    @State private var lossesMobileSRBMSystems = 0
    
    //personnel losses
    @State private var lossesPersonnel = 0
    @State private var lossesPOW = 0
    
    @State private var selectedLossesOnThisDay: [Losses] = []
    @State private var losses: [Losses] = []
    
    var body: some View {
        
        VStack {
            DatePicker(
                "Протягом 24.02.22 - ",
                selection: $selectedDate,
                in: startingDate...endingDate,
                displayedComponents: .date)
            .tint(Color.yellow)
            .datePickerStyle(.compact)
            .padding(.horizontal, 32)
            .foregroundColor(.white)
            .colorMultiply(.white)
            
            Text("орієнтовні втрати противника:")
                .foregroundColor(.white)
                .textCase(.uppercase)
            
            //Text("Selected date: \(formattedDate(selectedDate: selectedDate))")
            
            HStack {
                
                Button {
                    isSelectedEquipment.toggle()
                    
                    if isSelectedPersonnel {
                        isSelectedPersonnel.toggle()
                    }
                    
                    if let jsonData = loadJSON(fileName: "russia_losses_equipment") {
                        displayJSONData(data: jsonData, type: "Equipment", selectedDate: selectedDate, losses: &losses, selectedLossesOnThisDay: &selectedLossesOnThisDay, startingDate: startingDate)
                        
                        lossesTank = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "tank")
                        
                        lossesAPC = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "apc")
                        
                        lossesArtillery = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "fieldArtillery")
                        
                        lossesMRL = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "mrl")
                        
                        lossesAntiaircraftSystems = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "antiAircraftWarfare")
                        
                        lossesAircraft = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "aircraft")
                        
                        lossesHelicopter = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "helicopter")
                        
                        lossesDrone = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "drone")
                        
                        lossesCruiseMissiles = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "cruiseMissiles")
                        
                        lossesNavalShip = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "navalShip")
                        
                        lossesMilitaryAuto = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "militaryAuto")
                        
                        lossesFuelTank = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "fuelTank")
                        
                        lossesVehiclesAndFuelTanks = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "vehiclesAndFuelTanks")
                        
                        lossesSpecialEquipment = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "specialEquipment")
                        
                        lossesMobileSRBMSystems = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "mobileSRBMSystem")
                        
                    }
                } label: {
                    Text("Equipment")
                }
                .background(isSelectedEquipment ? Color(hex: "040D12") : Color(hex: "183D3D"))
                .padding()
                .frame(width: 150)
                
                //second button
                
                Button {
                    isSelectedPersonnel.toggle()
                    if isSelectedEquipment {
                        isSelectedEquipment.toggle()
                    }
                    if let jsonData = loadJSON(fileName: "russia_losses_personnel") {
                        displayJSONData(data: jsonData, type: "Personnel", selectedDate: selectedDate, losses: &losses, selectedLossesOnThisDay: &selectedLossesOnThisDay, startingDate: startingDate)
                        
                        lossesPersonnel = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "personnel")
                        
                        lossesPOW = calculateDifference(selectedDate: selectedDate, losses: losses, fieldName: "pow")
                    }
                } label: {
                    Text("Personnel")
                }
                .background(isSelectedPersonnel ? Color(hex: "040D12") : Color(hex: "183D3D"))
                .padding()
                .frame(width: 150)
                
            }
            .frame(height: 20)
            .padding()
            
            //NavigationView {
                ScrollView {
                    
                    if !selectedLossesOnThisDay.isEmpty {
                        Text("Losses:")
                        
                        ForEach(selectedLossesOnThisDay, id:\.date) { item in
                            
                            if let lossesItem = item as? LossesEquipmentModel {
                                
                                //tanks
//                                NavigationLink {
//                                    DetailView()
//                                } label: {
                                    if lossesTank > 0 {
                                        RepeatedElement(text1: "~\(lossesItem.tank)", text2: "+\(lossesTank)", text3: "танків", text4: "tanks")
                                    } else {
                                        RepeatedElement(text1: "~\(lossesItem.tank)", text2: "", text3: "танків", text4: "tanks")
                                    }
//                                }

                                
                                
                                //apc
                                if lossesAPC > 0 {
                                    RepeatedElement(text1: "~\(lossesItem.apc)", text2: "+\(lossesAPC)", text3: "бойових броньованих машин", text4: "armoured personell vehicle")
                                } else {
                                    RepeatedElement(text1: "~\(lossesItem.apc)", text2: "", text3: "бойових броньованих машин", text4: "armoured personell vehicle")
                                }
                                
                                
                                //artillery systems/mlrs
                                if lossesArtillery > 0 && lossesMRL > 0 {
                                    RepeatedElement(text1: "~\(lossesItem.fieldArtillery)/ \(lossesItem.mrl)", text2: "+\(lossesArtillery)/+\(lossesMRL)", text3: "артилерійських систем/рсзв", text4: "artillery systems/mlrs")
                                } else if lossesArtillery > 0 && lossesMRL == 0 {
                                    RepeatedElement(text1: "~\(lossesItem.fieldArtillery)", text2: "+\(lossesArtillery)/+0", text3: "артилерійських систем/рсзв", text4: "artillery systems/mlrs")
                                } else if lossesArtillery == 0 && lossesMRL > 0 {
                                    RepeatedElement(text1: "~\(lossesItem.mrl)", text2: "+0/+\(lossesMRL)", text3: "артилерійських систем/рсзв", text4: "artillery systems/mlrs")
                                } else {
                                    RepeatedElement(text1: "~\(lossesItem.fieldArtillery)/\(lossesItem.mrl)", text2: "test", text3: "артилерійських систем/рсзв", text4: "artillery systems/mlrs")
                                }
                                
                                
                                //anti-aircraft warfare systems
                                if lossesAntiaircraftSystems > 0 {
                                    RepeatedElement(text1: "~\(lossesItem.antiAircraftWarfare)", text2: "+\(lossesAntiaircraftSystems)", text3: "засоби ппо", text4: "anti-aircraft warfare systems")
                                } else {
                                    RepeatedElement(text1: "~\(lossesItem.antiAircraftWarfare)", text2: "", text3: "засоби ппо", text4: "anti-aircraft warfare systems")
                                }
                                
                                //aircraft/helicopters
                                if let aircraft = lossesItem.aircraft {
                                    if lossesAircraft > 0 && lossesHelicopter > 0 {
                                        RepeatedElement(text1: "~\(aircraft)/\(lossesItem.helicopter)", text2: "+\(lossesAircraft)/+\(lossesHelicopter)", text3: "літаків/гелікоптерів", text4: "aircraft/helicopters")
                                    } else if lossesAircraft > 0 && lossesHelicopter == 0 {
                                        RepeatedElement(text1: "~\(aircraft)", text2: "+\(lossesAircraft)/+0", text3: "літаків/гелікоптерів", text4: "aircraft/helicopters")
                                    } else if lossesAircraft == 0 && lossesHelicopter > 0 {
                                        RepeatedElement(text1: "~\(lossesItem.helicopter)", text2: "+0/+\(lossesHelicopter)", text3: "літаків/гелікоптерів", text4: "aircraft/helicopters")
                                    } else {
                                        RepeatedElement(text1: "~\(aircraft)/\(lossesItem.helicopter)", text2: "", text3: "літаків/гелікоптерів", text4: "aircraft/helicopters")
                                    }
                                }
                                
                                
                                //uav operational-tactical level
                                
                                if lossesDrone > 0 {
                                    RepeatedElement(text1: "~\(lossesItem.drone)", text2: "+\(lossesDrone)", text3: "бпла оперативного-тактичного рівня", text4: "uav operational-tactical level")
                                } else {
                                    RepeatedElement(text1: "~\(lossesItem.drone)", text2: "", text3: "бпла оперативного-тактичного рівня", text4: "uav operational-tactical level")
                                }
                                
                                
                                //cruise missiles
                                if let missiles = lossesItem.cruiseMissiles {
                                    if lossesCruiseMissiles > 0 {
                                        RepeatedElement(text1: "~\(missiles)", text2: "+\(lossesCruiseMissiles)", text3: "крилаті ракети", text4: "cruise missiles")
                                    } else {
                                        RepeatedElement(text1: "~\(lossesItem.cruiseMissiles ?? 0)", text2: "", text3: "крилаті ракети", text4: "cruise missiles")
                                    }
                                }
                                
                                //warships/boats
                                if lossesNavalShip > 0 {
                                    RepeatedElement(text1: "~\(lossesItem.navalShip)", text2: "+\(lossesNavalShip)", text3: "кораблі/катери", text4: "warships/boats")
                                } else {
                                    RepeatedElement(text1: "~\(lossesItem.navalShip)", text2: "", text3: "кораблі/катери", text4: "warships/boats")
                                }
                                
                                //vehicles & fuel tanks
                                if let auto = lossesItem.militaryAuto, let tankFuel = lossesItem.fuelTank {
                                    if lossesMilitaryAuto > 0 && lossesFuelTank > 0 {
                                        RepeatedElement(text1: "~\(auto)/\(tankFuel)", text2: "+\(lossesMilitaryAuto)/+\(lossesFuelTank)", text3: "авто/цистерни", text4: "vehicles/fuel tanks")
                                    } else if lossesMilitaryAuto > 0 && lossesFuelTank == 0 {
                                        RepeatedElement(text1: "~\(auto)/\(tankFuel)", text2: "+\(lossesMilitaryAuto)/+0", text3: "авто/цистерни", text4: "vehicles/fuel tanks")
                                    } else if lossesMilitaryAuto == 0 && lossesFuelTank > 0 {
                                        RepeatedElement(text1: "~\(auto)/\(tankFuel)", text2: "+0/\(lossesFuelTank)", text3: "авто/цистерни", text4: "vehicles/fuel tanks")
                                    } else {
                                        RepeatedElement(text1: "~\(auto)/\(tankFuel)", text2: "", text3: "авто/цистерни", text4: "vehicles/fuel tanks")
                                    }
                                } else if let vehicleAndFuelTank = lossesItem.vehiclesAndFuelTanks {
                                    RepeatedElement(text1: "~\(vehicleAndFuelTank)", text2: "+\(lossesVehiclesAndFuelTanks)", text3: "автомобільна техніка та цистерни з пмм", text4: "vehicles & fuel tanks")
                                }
                                
                                //special equipment
                                if lossesSpecialEquipment > 0 {
                                    RepeatedElement(text1: "~\(lossesItem.specialEquipment!)", text2: "+\(lossesSpecialEquipment)", text3: "спеціальна техніка", text4: "special equipment")
                                } else {
                                    RepeatedElement(text1: "~\(lossesItem.specialEquipment!)", text2: "", text3: "спеціальна техніка", text4: "special equipment")
                                }
                                
    //                            if let greatLossesDirection = lossesItem.greatestLossesDirection {
    //                                RepeatedElement(text1: "\(lossesItem.greatestLossesDirection ?? "")", text2: "", text3: "greatest losses direction", text4: "")
    //                                print("yes")
    //                            } else {
    //                                Text("no")
    //                                print("no")
    //                            }
                                
                                
                            } else if let lossesItem = item as? LossesPersonnelModel {
                                
                                if lossesItem.personnel > 0 {
                                    RepeatedElement(text1: "~\(lossesItem.personnel)", text2: "+\(lossesPersonnel)", text3: "ліквідовано особового складу", text4: "liquidated personnel")
                                }
                                
                                if let pow = lossesItem.pow {
                                    if pow > 0 {
                                        RepeatedElement(text1: "~\(pow)", text2: "+\(lossesPOW)", text3: "ліквідовано особового складу", text4: "liquidated personnel")
                                    } else {
                                        RepeatedElement(text1: "~\(pow)", text2: "\(lossesPOW)", text3: "полонені", text4: "prisoners of war")
                                    }
                                }
                                
                            }
                        }
                    } else {
                        Text("No data for \(formattedDate(selectedDate: selectedDate))")
                            .foregroundColor(.white)
                    }
                    
                //}
                //.navigationTitle("Losses")
            }
            .onTapGesture {
                
            }
            
            }
            .textCase(.uppercase)
            .tint(.white)
            .padding()
        
                        }
                    }

struct LossesListView_Previews: PreviewProvider {
    static var previews: some View {
        LossesListView()
            .background(.gray)
    }
}

struct RepeatedElement : View {
    
    var text1 : String
    var text2 : String
    var text3 : String
    var text4 : String

    init(text1: String, text2: String, text3: String, text4: String) {
        self.text1 = text1
        self.text2 = text2
        self.text3 = text3
        self.text4 = text4
    }
    
    var body: some View {
        
        HStack(spacing : 4) {
                
                //numbers
                HStack {
                    Text(text2)
                        .frame(maxWidth: .infinity ,alignment: .trailing)
                        .foregroundColor(.white)
                        
                        
                    Text(text1)
                        .frame(maxWidth: .infinity ,alignment: .trailing)
                        .foregroundColor(.yellow)
                        .font(.system(size: 26))
                        .frame(width: 125)
                        
                }
                .frame(width: UIScreen.main.bounds.width / 2)
                    .padding(.horizontal, 7)
                
                
                //text of losses
            VStack(alignment: .leading) {
                    Text(text3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.yellow)
                    Text(text4)
                        .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width / 2)
                    .padding(.horizontal, 4)
                    .font(.system(size: 16))
                
            }
        .padding()
        .border(.black)

    }
}


