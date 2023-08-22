CREATE DATABASE clinic;
CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(60),
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(60),
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(id),
    PRIMARY KEY(id)
);

CREATE TABLE treatments (
    id INT,
    type VARCHAR(50),
    name VARCHAR (60),
    PRIMARY KEY(id)
);

CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(11, 5),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_histories_id INT,
    CONSTRAINT fk_medical FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DEC(11, 5),
    quantity INT,
    total_price DEC(11, 5),
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id),
    PRIMARY KEY(id)
);

CREATE TABLE medical_treatment(
    medical_histories_id INT,
    treatment_id INT,
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id),
    CONSTRAINT fk_medical FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id),
    PRIMARY KEY(medical_histories_id, treatment_id) 
);

-- Add indexes 
CREATE INDEX idx_patient ON patients(name);
CREATE INDEX idx_medical ON medical_histories(admitted_at);
CREATE INDEX idx_treatment ON treatments(name);
CREATE INDEX idx_invoice ON invoice_items(invoice_id);
CREATE INDEX idx_treatment_item ON invoice_items(treatment_id);
CREATE INDEX idx_medical_treatment_treatment_id ON medical_treatment(treatment_id);
CREATE INDEX idx_invoices_medical_histories_id ON invoices(medical_histories_id);
