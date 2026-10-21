
-- Create the medical aid schemes table
CREATE TABLE public.medical_aid_schemes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    name TEXT NOT NULL UNIQUE,

    description TEXT,

    website TEXT,

    contact_phone TEXT,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Create an index for active schemes
CREATE INDEX medical_aid_schemes_active_idx
ON public.medical_aid_schemes(is_active);

-- Enable Row Level Security
ALTER TABLE public.medical_aid_schemes
ENABLE ROW LEVEL SECURITY;