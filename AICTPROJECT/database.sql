-- AICT Project: StudioPulse Database (Theoretical)

CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(80) NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE inquiries (
    inquiry_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    service_id INT NOT NULL,
    message TEXT,
    status VARCHAR(20) DEFAULT 'New',
    created_at DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

INSERT INTO clients (client_id, full_name, email, phone)
VALUES
    (1, 'Ayesha Khan', 'ayesha@studiopulse.com', '+92 312 555 0101'),
    (2, 'Omar Malik', 'omar@studiopulse.com', '+92 300 555 0111');

INSERT INTO services (service_id, service_name, base_price)
VALUES
    (10, 'Brand Identity', 450.00),
    (20, 'Website Design', 950.00),
    (30, 'Marketing Assets', 300.00);

INSERT INTO inquiries (inquiry_id, client_id, service_id, message, status)
VALUES
    (1, 1, 20, 'Need a one-page portfolio site.', 'New'),
    (2, 2, 10, 'Logo refresh and brand kit.', 'In Progress');

SELECT clients.full_name, services.service_name, inquiries.status
FROM inquiries
JOIN clients ON clients.client_id = inquiries.client_id
JOIN services ON services.service_id = inquiries.service_id;

UPDATE inquiries
SET status = 'Completed'
WHERE inquiry_id = 1;

DELETE FROM inquiries
WHERE inquiry_id = 2;
