
-- Insert fictional healthcare providers for development testing
INSERT INTO public.providers (
    name,
    specialty,
    address,
    city,
    province,
    location,
    phone,
    email,
    fee_min,
    fee_max,
    accepts_medical_aid,
    is_active
)
VALUES
(
    'Demo Dermatology Clinic Soweto',
    'Dermatology',
    'Sample Address 1',
    'Soweto',
    'Gauteng',
    ST_SetSRID(
        ST_MakePoint(27.8546, -26.2485),
        4326
    )::geography,
    '0100000001',
    'demo.soweto@example.com',
    500.00,
    1200.00,
    TRUE,
    TRUE
),
(
    'Demo Skin Health Centre Johannesburg',
    'Dermatology',
    'Sample Address 2',
    'Johannesburg',
    'Gauteng',
    ST_SetSRID(
        ST_MakePoint(28.0473, -26.2041),
        4326
    )::geography,
    '0100000002',
    'demo.johannesburg@example.com',
    600.00,
    1500.00,
    TRUE,
    TRUE
),
(
    'Demo Specialist Clinic Randburg',
    'Dermatology',
    'Sample Address 3',
    'Randburg',
    'Gauteng',
    ST_SetSRID(
        ST_MakePoint(27.9949, -26.0936),
        4326
    )::geography,
    '0100000003',
    'demo.randburg@example.com',
    450.00,
    1000.00,
    FALSE,
    TRUE
);