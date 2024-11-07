////
////  ContentView.swift
////  My Rent A Car
////
////  Created by Dev Reptech on 20/03/2024.
////
//
//
//
//
//
//import SwiftUI
//import UIKit
//
//// Model for customer details
//struct Customer {
//    var name: String
//    var address: String
//    var idOrPassport: String
//    var image: Image? // Image for customer
//    // Add more properties as needed
//}
//
//// Model for car details
//struct Car {
//    var name: String
//    var model: String
//    var color: String
//    var meterReading: Int
//    var image: Image? // Image for car
//    // Add more properties as needed
//}
//
//struct Report {
//    var customer: Customer
//    var customerImage: Image?
//    var car: Car
//    var carImage: Image?
//}
//
//struct SelectedImageView: View {
//    var selectedImage: Image?
//
//    var body: some View {
//        selectedImage?
//            .resizable()
//            .scaledToFit()
//            .frame(width: 100, height: 100) // Adjust size as needed
//            .padding()
//            .background(Color.gray)
//            .cornerRadius(8)
//    }
//}
//
//// View model for managing customer details
//class CustomerDetailViewModel: ObservableObject {
//    @Published var customer: Customer
//    @Published var alertMessage: String = ""
//    
//    init() {
//        self.customer = Customer(name: "", address: "", idOrPassport: "", image: nil)
//    }
//    
//    func saveCustomer(selectedImage: Image?) {
//        // Implement save logic here
//        customer.image = selectedImage
//        // For example, you could save the customer data to Core Data or a database
//        print("Customer saved: \(customer)")
//        showAlert = true
//    }
//    
//    @Published var showAlert: Bool = false
//}
//
//// View model for managing car details
//class CarDetailViewModel: ObservableObject {
//    @Published var car: Car
//    @Published var alertMessage: String = ""
//    
//    init() {
//        self.car = Car(name: "", model: "", color: "", meterReading: 0, image: nil)
//    }
//    
//    func saveCar(selectedImage: Image?) {
//        // Assign the selected image to the car's image property
//        car.image = selectedImage
//        // Implement save logic here
//        // For example, you could save the car data to Core Data or a database
//        print("Car saved: \(car)")
//        showAlert = true
//    }
//    
//    @Published var showAlert: Bool = false
//}
//
//
//struct ContentView: View {
//    @StateObject var customerViewModel = CustomerDetailViewModel()
//    @StateObject var carViewModel = CarDetailViewModel()
//    @State private var reports: [Report] = []
//    @State private var isShowingCustomerImagePicker = false
//    @State private var isShowingCarImagePicker = false
//    @State private var selectedCustomerImage: Image?
//    @State private var selectedCarImage: Image?
//    @State private var isReportSavedSuccessfully: Bool = false
//    
//    var body: some View {
//        TabView {
//            NavigationView {
//                ScrollView {
//                    VStack {
//                        // Customer details view
//                        VStack {
//                            Text("Customer Form")
//                                .font(.headline)
//                                .fontWeight(.bold)
//                                .padding(.bottom, 10)
//                            TextField("Customer Name", text: $customerViewModel.customer.name)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            TextField("Customer Address", text: $customerViewModel.customer.address)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            TextField("Customer ID/Passport No", text: $customerViewModel.customer.idOrPassport)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            // Image picker for customer
//                            Button(action: {
//                                isShowingCustomerImagePicker = true
//                            }) {
//                                Text("Upload Customer Image")
//                                    .padding()
//                                    .background(Color.blue)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(8)
//                            }
//                            .padding()
//                            .sheet(isPresented: $isShowingCustomerImagePicker) {
//                                            ImagePicker(selectedImage: $selectedCustomerImage)
//                                        }
//                            SelectedImageView(selectedImage: selectedCustomerImage)
//                            Button(action: {
//                                customerViewModel.saveCustomer(selectedImage: selectedCustomerImage)
//                            }) {
//                                Text("Save Customer")
//                                    .padding()
//                                    .background(Color.green)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(8)
//                            }
//                            .alert(isPresented: $customerViewModel.showAlert) {
//                                       Alert(title: Text("Success"), message: Text("Customer record saved successfully."), dismissButton: .default(Text("OK")))
//                                   }
//
//
//                            .padding()
//                        }
//                        .padding()
//                        
//                        // Car details view
//                        VStack {
//                            Text("Car Detail Form")
//                                .font(.headline)
//                                .fontWeight(.bold)
//                                .padding(.bottom, 10)
//                            TextField("Car Name", text: $carViewModel.car.name)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            TextField("Car Model", text: $carViewModel.car.model)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            TextField("Car Color", text: $carViewModel.car.color)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            TextField("Car Meter Reading", value: $carViewModel.car.meterReading, formatter: NumberFormatter())
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding()
//                            // Image picker for car
//                            Button(action: {
//                                isShowingCarImagePicker = true
//                            }) {
//                                Text("Upload Car Image")
//                                    .padding()
//                                    .background(Color.blue)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(8)
//                            }
//                            .padding()
//                            .sheet(isPresented: $isShowingCarImagePicker) {
//                                            ImagePicker(selectedImage: $selectedCarImage)
//                                        }
//                            SelectedImageView(selectedImage: selectedCarImage)
//                            Button(action: {
//                                carViewModel.saveCar(selectedImage: selectedCarImage)
//                            }) {
//                                Text("Save Car")
//                                    .padding()
//                                    .background(Color.green)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(8)
//                            }
//                            .alert(isPresented: $carViewModel.showAlert) {
//                                        Alert(title: Text("Success"), message: Text("Car record saved successfully."), dismissButton: .default(Text("OK")))
//                                    }
//
//                            .padding()
//                        }
//                        .padding()
//                        
//                        Spacer()
//                        
//                        // Generate report button
//                        Button(action: {
//                            let report = Report(customer: customerViewModel.customer, car: carViewModel.car)
//                            reports.append(report)
//                        }) {
//                            Text("Generate Report")
//                                .padding()
//                                .background(Color.red)
//                                .foregroundColor(.white)
//                                .cornerRadius(8)
//                        }
//                        .alert(isPresented: $isReportSavedSuccessfully) {
//                            Alert(title: Text("Success"), message: Text("Report saved successfully."), dismissButton: .default(Text("OK")))
//                        }
//                        .padding()
//                    }
//                }
//                .padding()
//                .navigationTitle("Car Rental App")
//            }
//            .tabItem {
//                Label("New Rental", systemImage: "car")
//            }
//            
//            NavigationView {
//                ReportListView(reports: $reports)
//                    .navigationTitle("Reports")
//            }
//            .tabItem {
//                Label("Reports", systemImage: "list.bullet.rectangle")
//            }
//        }
//    }
//}
//
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var selectedImage: Image?
//    @Environment(\.presentationMode) var presentationMode
//
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        let parent: ImagePicker
//
//        init(parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                parent.selectedImage = Image(uiImage: uiImage)
//            }
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        picker.sourceType = .photoLibrary // Set source type to .camera to use the camera
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
//    }
//}
//
//
//
//struct ReportListView: View {
//    @Binding var reports: [Report]
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(reports.indices, id: \.self) { index in
//                    NavigationLink(destination: ReportDetailView(report: $reports[index])) {
//                        Text(reports[index].car.name)
//                    }
//                }
//                .onDelete(perform: deleteReport)
//            }
//            .navigationTitle("Reports")
//        }
//    }
//
//    private func deleteReport(at offsets: IndexSet) {
//        reports.remove(atOffsets: offsets)
//    }
//}
//
//
//
//struct ReportDetailView: View {
//    @Binding var report: Report
//    @State private var editedReport: Report
//    @State private var isEditing = false
//    @State private var isShowingCustomerImagePicker = false
//    @State private var isShowingCarImagePicker = false
//    @State private var selectedCustomerImage: Image?
//    @State private var selectedCarImage: Image?
//
//    init(report: Binding<Report>) {
//        self._report = report
//        _editedReport = State(initialValue: report.wrappedValue)
//    }
//
//    var body: some View {
//        Form {
//            Section(header: Text("Customer Details")) {
//                TextField("Name", text: $editedReport.customer.name)
//                TextField("Address", text: $editedReport.customer.address)
//                TextField("ID/Passport No", text: $editedReport.customer.idOrPassport)
//                if let customerImage = editedReport.customer.image ?? report.customerImage ?? selectedCustomerImage {
//                    customerImage
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxWidth: .infinity, maxHeight: 200)
//                }
//            }
//
//            Section(header: Text("Car Details")) {
//                TextField("Name", text: $editedReport.car.name)
//                TextField("Model", text: $editedReport.car.model)
//                TextField("Color", text: $editedReport.car.color)
//                TextField("Meter Reading", value: $editedReport.car.meterReading, formatter: NumberFormatter())
//                if let carImage = editedReport.car.image ?? report.carImage ?? selectedCarImage {
//                    carImage
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxWidth: .infinity, maxHeight: 200)
//                }
//            }
//        }
//        .navigationBarItems(trailing:
//            Button(action: {
//                isEditing.toggle()
//                if !isEditing {
//                    // Update the original report with the edited report
//                    self.report = self.editedReport
//
//                    // Update images if changed
//                    if let selectedCustomerImage = selectedCustomerImage {
//                        editedReport.customer.image = selectedCustomerImage
//                    }
//                    if let selectedCarImage = selectedCarImage {
//                        editedReport.car.image = selectedCarImage
//                    }
//
//                    // Reset selected images
//                    selectedCustomerImage = nil
//                    selectedCarImage = nil
//                }
//            }) {
//                Text(isEditing ? "Done" : "Edit")
//            }
//        )
//        .navigationBarTitle("Report Details")
//        .environment(\.editMode, .constant(isEditing ? .active : .inactive))
//        .sheet(isPresented: $isShowingCustomerImagePicker) {
//            ImagePicker(selectedImage: $selectedCustomerImage)
//        }
//        .sheet(isPresented: $isShowingCarImagePicker) {
//            ImagePicker(selectedImage: $selectedCarImage)
//        }
//    }
//}
//
//
////
////struct ReportDetailView: View {
////    @Binding var report: Report
////    @State private var editedReport: Report
////    @State private var isEditing = false
////    @State private var isShowingCustomerImagePicker = false
////    @State private var isShowingCarImagePicker = false
////    @State private var selectedCustomerImage: Image?
////    @State private var selectedCarImage: Image?
////
////    init(report: Binding<Report>) {
////        self._report = report
////        _editedReport = State(initialValue: report.wrappedValue)
////    }
////
////    var body: some View {
////        Form {
////            Section(header: Text("Customer Details")) {
////                TextField("Name", text: $editedReport.customer.name)
////                TextField("Address", text: $editedReport.customer.address)
////                TextField("ID/Passport No", text: $editedReport.customer.idOrPassport)
////                if isEditing {
////                    Button(action: {
////                        isShowingCustomerImagePicker = true
////                    }) {
////                        Text("Upload Customer Image")
////                    }
////                }
////                if let customerImage = editedReport.customer.image ?? report.customerImage ?? selectedCustomerImage {
////                    customerImage
////                        .resizable()
////                        .scaledToFit()
////                        .frame(maxWidth: .infinity, maxHeight: 200)
////                }
////            }
////
////            Section(header: Text("Car Details")) {
////                TextField("Name", text: $editedReport.car.name)
////                TextField("Model", text: $editedReport.car.model)
////                TextField("Color", text: $editedReport.car.color)
////                TextField("Meter Reading", value: $editedReport.car.meterReading, formatter: NumberFormatter())
////                if isEditing {
////                    Button(action: {
////                        isShowingCarImagePicker = true
////                    }) {
////                        Text("Upload Car Image")
////                    }
////                }
////                if let carImage = editedReport.car.image ?? report.carImage ?? selectedCarImage {
////                    carImage
////                        .resizable()
////                        .scaledToFit()
////                        .frame(maxWidth: .infinity, maxHeight: 200)
////                }
////            }
////        }
////        .navigationBarItems(trailing:
////                                Button(action: {
////            isEditing.toggle()
////            if !isEditing {
////                // Update the original report with the edited report
////                self.report = self.editedReport
////
////                // Update images if changed
////                if let selectedCustomerImage = selectedCustomerImage {
////                    editedReport.customer.image = selectedCustomerImage
////                }
////                if let selectedCarImage = selectedCarImage {
////                    editedReport.car.image = selectedCarImage
////                }
////
////                // Reset selected images
////                selectedCustomerImage = nil
////                selectedCarImage = nil
////            }
////        }) {
////            Text(isEditing ? "Done" : "Edit")
////        }
////        )
////        .navigationBarTitle("Report Details")
////        .environment(\.editMode, .constant(isEditing ? .active : .inactive))
////        .sheet(isPresented: $isShowingCustomerImagePicker) {
////            ImageSelectionView(selectedCustomerImage: $selectedCustomerImage, selectedCarImage: $selectedCustomerImage, isShowingImageSelectionView: $isShowingCustomerImagePicker, editedReport:  $editedReport)
////        }
////        .sheet(isPresented: $isShowingCarImagePicker) {
////            ImageSelectionView(selectedCustomerImage:  $selectedCarImage, selectedCarImage: $selectedCarImage, isShowingImageSelectionView: $isShowingCarImagePicker, editedReport:  $editedReport)
////        }
////    }
////}
//
//
//
//
//
//// ImageSelectionView.swift
//
//
//struct ImageSelectionView: View {
//    @Binding var selectedCustomerImage: Image?
//    @Binding var selectedCarImage: Image?
//    @Binding var isShowingImageSelectionView: Bool
//    @Binding var editedReport: Report
//
//    enum ImageType {
//        case customer
//        case car
//    }
//
//    var body: some View {
//        VStack {
//            Button(action: {
//                self.showImagePicker(for: .customer)
//            }) {
//                Text("Select Customer Image")
//            }
//            .padding()
//
//            Button(action: {
//                self.showImagePicker(for: .car)
//            }) {
//                Text("Select Car Image")
//            }
//            .padding()
//
//            Button(action: {
//                // Dismiss image selection view
//                isShowingImageSelectionView = false
//            }) {
//                Text("Cancel")
//            }
//            .padding()
//        }
//    }
//
//    private func showImagePicker(for type: ImageType) {
//        let picker = UIImagePickerController()
//    //    picker.delegate = context.coordinator // Remove this line
//        picker.sourceType = .photoLibrary
//        switch type {
//        case .customer:
//            picker.allowsEditing = false
//        case .car:
//            picker.allowsEditing = false
//        }
//        UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
//    }
//
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        let parent: ImageSelectionView
//        let type: ImageType
//
//        init(parent: ImageSelectionView, type: ImageType) {
//            self.parent = parent
//            self.type = type
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let image = info[.originalImage] as? UIImage {
//                switch type {
//                case .customer:
//                    parent.selectedCustomerImage = Image(uiImage: image)
//                    parent.editedReport.customer.image = parent.selectedCustomerImage
//                case .car:
//                    parent.selectedCarImage = Image(uiImage: image)
//                    parent.editedReport.car.image = parent.selectedCarImage
//                }
//                parent.isShowingImageSelectionView = false // Dismiss the image selection view
//            }
//            picker.dismiss(animated: true)
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true)
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent: self, type: .customer)
//    }
//}
//
//
//
//
//
//
//struct CarRentalApp: App {
//var body: some Scene {
//    WindowGroup {
//        ContentView()
//    }
//}
//}
//
