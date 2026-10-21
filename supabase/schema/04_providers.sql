
-- Create the providers table
CREATE TABLE public.providers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    specialty TEXT NOT NULL,
    address TEXT,
    city TEXT NOT NULL,
    province TEXT NOT NULL,
    location GEOGRAPHY(POINT, 4326),
    phone TEXT,
    email TEXT,
    fee_min NUMERIC(10,2),
    fee_max NUMERIC(10,2),
    accepts_medical_aid BOOLEAN NOT NULL DEFAULT FALSE,
    medical_aid_list TEXT[],
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fee_range_valid
        CHECK (
            fee_min IS NULL
            OR fee_max IS NULL
            OR fee_min <= fee_max
        )
);

-- Create a spatial index for proximity searches
CREATE INDEX providers_location_idx
ON public.providers
USING GIST (location);

-- Enable Row Level Security
ALTER TABLE public.providers ENABLE ROW LEVEL SECURITY;