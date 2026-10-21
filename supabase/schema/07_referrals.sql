
-- Create the referrals table
CREATE TABLE public.referrals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    assessment_id UUID NOT NULL
        REFERENCES public.triage_assessments(id)
        ON DELETE CASCADE,

    provider_id UUID NOT NULL
        REFERENCES public.providers(id)
        ON DELETE RESTRICT,

    user_id UUID NOT NULL
        REFERENCES public.users(id)
        ON DELETE CASCADE,

    referral_status TEXT NOT NULL DEFAULT 'pending'
        CHECK (
            referral_status IN (
                'pending',
                'sent',
                'accepted',
                'declined',
                'completed',
                'cancelled'
            )
        ),

    referral_reason TEXT,

    referral_notes TEXT,

    referred_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Create an index for assessment lookups
CREATE INDEX referrals_assessment_id_idx
ON public.referrals(assessment_id);

-- Create an index for provider lookups
CREATE INDEX referrals_provider_id_idx
ON public.referrals(provider_id);

-- Create an index for user lookups
CREATE INDEX referrals_user_id_idx
ON public.referrals(user_id);

-- Create an index for referral status filtering
CREATE INDEX referrals_status_idx
ON public.referrals(referral_status);

-- Enable Row Level Security
ALTER TABLE public.referrals
ENABLE ROW LEVEL SECURITY;