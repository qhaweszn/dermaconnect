
-- Create the provider-medical-aid linking table
CREATE TABLE public.provider_medical_aid (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    provider_id UUID NOT NULL
        REFERENCES public.providers(id)
        ON DELETE CASCADE,

    medical_aid_scheme_id UUID NOT NULL
        REFERENCES public.medical_aid_schemes(id)
        ON DELETE CASCADE,

    plan_name TEXT,

    accepts_new_patients BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    -- Prevent duplicate provider and scheme relationships
    CONSTRAINT unique_provider_medical_aid
        UNIQUE (
            provider_id,
            medical_aid_scheme_id
        )
);

-- Create an index for provider lookups
CREATE INDEX provider_medical_aid_provider_id_idx
ON public.provider_medical_aid(provider_id);

-- Create an index for medical aid scheme lookups
CREATE INDEX provider_medical_aid_scheme_id_idx
ON public.provider_medical_aid(medical_aid_scheme_id);

-- Enable Row Level Security
ALTER TABLE public.provider_medical_aid
ENABLE ROW LEVEL SECURITY;