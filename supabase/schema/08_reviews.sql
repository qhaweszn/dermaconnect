
-- Create the reviews table
CREATE TABLE public.reviews (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.users(id)
        ON DELETE CASCADE,

    provider_id UUID NOT NULL
        REFERENCES public.providers(id)
        ON DELETE CASCADE,

    referral_id UUID
        REFERENCES public.referrals(id)
        ON DELETE SET NULL,

    rating INTEGER NOT NULL
        CHECK (rating BETWEEN 1 AND 5),

    review_title TEXT,

    review_text TEXT,

    is_verified BOOLEAN NOT NULL DEFAULT FALSE,

    is_published BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Create an index for provider reviews
CREATE INDEX reviews_provider_id_idx
ON public.reviews(provider_id);

-- Create an index for user reviews
CREATE INDEX reviews_user_id_idx
ON public.reviews(user_id);

-- Create an index for published reviews
CREATE INDEX reviews_published_idx
ON public.reviews(is_published);

-- Enable Row Level Security
ALTER TABLE public.reviews
ENABLE ROW LEVEL SECURITY;