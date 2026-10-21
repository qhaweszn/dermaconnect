
-- Create the triage assessments table
CREATE TABLE public.triage_assessments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.users(id)
        ON DELETE CASCADE,

    symptoms TEXT NOT NULL,

    symptom_duration TEXT,

    affected_area TEXT,

    severity_score INTEGER
        CHECK (
            severity_score IS NULL
            OR severity_score BETWEEN 1 AND 10
        ),

    risk_level TEXT NOT NULL
        CHECK (
            risk_level IN (
                'low',
                'moderate',
                'high',
                'urgent'
            )
        ),

    recommended_action TEXT,

    assessment_notes TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Create an index to retrieve assessments by user
CREATE INDEX triage_assessments_user_id_idx
ON public.triage_assessments(user_id);

-- Create an index for risk-level filtering
CREATE INDEX triage_assessments_risk_level_idx
ON public.triage_assessments(risk_level);

-- Enable Row Level Security
ALTER TABLE public.triage_assessments
ENABLE ROW LEVEL SECURITY;