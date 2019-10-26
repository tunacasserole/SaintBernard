# Build Setup Data
Allergy.create(description: 'hypersensitivity to aspirin or NSAIDs')
Allergy.create(description: 'gluten intolerance')
cd = Diagnosis.create(code: 'J45', description: 'Asthma', coding_system: 'CHRONIC')
ad = Diagnosis.create(code: 'S82.101', description: 'a fracture of upper end of the right tibia')
pd = Diagnosis.create(code: 'S82.101A', description: 'a closed fracture in the right tibia')
DiagnosticProcedure.create(description: 'exploratory radiography', moment: Time.now)
Facility.create(name: 'Blue Alps Ski Camp')
MedicationOrder.create(name: 'Acetaminophen', unit: 'mg', dosage: 500.00, route: 0, order_frequency: OrderFrequency.create(value: 'q4h'), necessity: 'relieve swelling' )
Observation.create(description: 'No soft tissues were damaged')
Symptom.create(description: 'severe pain')
Symptom.create(description: 'swelling')
Symptom.create(description: 'limited bending of the joint')
Treatment.create(description: 'temporary bracing the right leg', necessity: 'restrict the motion')
Admission.create(moment: Time.now)

# Build Patient Records
p=Patient.create(first_name: 'Thomas', last_name: 'Schudel', mr: '30997', dob: (Date.today - 43.years), gender: 1, admission: Admission.first )

Allergy.all.each { |a| p.patient_allergies.create(allergy: a) }
p.patient_medication_orders.create(medication_order: MedicationOrder.first)
p.patient_diagnoses.create(diagnosis: cd )
p.patient_diagnoses.create(diagnosis: pd )
p.patient_diagnostic_procedures.create(diagnostic_procedure: DiagnosticProcedure.first)
p.patient_treatments.create(treatment: Treatment.first)

# Build Patient Admission Records
pa = p.admission
pa.admission_diagnoses.create(diagnosis: ad)
Symptom.all.each { |s| pa.admission_symptoms.create(symptom: s) }
pa.admission_observations.create(observation: Observation.first)
