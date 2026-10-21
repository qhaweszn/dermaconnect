
-- ==========================================
-- REFERENCE COPY: these policies are already applied in Supabase.
-- Do not re-run this file on the live database; it will fail with "already exists".
-- DERMA CONNECT RLS POLICIES
-- Initial development security policies
-- ==========================================


-- ==========================================
-- 1. USERS
-- ==========================================

CREATE POLICY users_select_own
ON public.users
FOR SELECT
TO authenticated
USING (auth.uid() = id);

CREATE POLICY users_update_own
ON public.users
FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);


-- ==========================================
-- 2. PROVIDERS
-- Public provider directory
-- ==========================================

CREATE POLICY providers_public_select
ON public.providers
FOR SELECT
TO anon, authenticated
USING (is_active = TRUE);


-- ==========================================
-- 3. MEDICAL AID SCHEMES
-- ==========================================

CREATE POLICY medical_aid_schemes_public_select
ON public.medical_aid_schemes
FOR SELECT
TO anon, authenticated
USING (is_active = TRUE);


-- ==========================================
-- 4. PROVIDER MEDICAL AID
-- ==========================================

CREATE POLICY provider_medical_aid_public_select
ON public.provider_medical_aid
FOR SELECT
TO anon, authenticated
USING (
    EXISTS (
        SELECT 1
        FROM public.providers
        WHERE providers.id = provider_medical_aid.provider_id
        AND providers.is_active = TRUE
    )
);


-- ==========================================
-- 5. TRIAGE ASSESSMENTS
-- ==========================================

CREATE POLICY triage_assessments_select_own
ON public.triage_assessments
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY triage_assessments_insert_own
ON public.triage_assessments
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

CREATE POLICY triage_assessments_update_own
ON public.triage_assessments
FOR UPDATE
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);


-- ==========================================
-- 6. REFERRALS
-- Users can view their own referrals
-- ==========================================

CREATE POLICY referrals_select_own
ON public.referrals
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);


-- ==========================================
-- 7. REVIEWS
-- ==========================================

CREATE POLICY reviews_public_select
ON public.reviews
FOR SELECT
TO anon, authenticated
USING (is_published = TRUE);

CREATE POLICY reviews_select_own
ON public.reviews
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY reviews_insert_own
ON public.reviews
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

CREATE POLICY reviews_update_own
ON public.reviews
FOR UPDATE
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY reviews_delete_own
ON public.reviews
FOR DELETE
TO authenticated
USING (auth.uid() = user_id);