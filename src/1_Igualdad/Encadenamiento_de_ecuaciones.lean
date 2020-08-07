-- ---------------------------------------------------------------------
-- Ejercicio. Sean a, b, c y d números reales. Demostrar que si 
--    c = d * a + b  
--    b = a + d
-- entonces c = 2 * a * d. 
-- ----------------------------------------------------------------------

import data.real.basic

variables (a b c d : ℝ)

-- 1ª demostración (reescribiendo las hipótesis)
-- =============================================

example 
  (a b c d : ℝ) 
  (h1 : c = d * a + b) 
  (h2 : b = a * d) 
  : c = 2 * a * d :=
begin
  rw h2 at h1,
  rw mul_comm at h1,
  rw ← two_mul (a * d) at h1,
  rw ← mul_assoc at h1,
  exact h1,
end

-- Prueba:
/-
  a b c d : ℝ,
  h1 : c = d * a + b,
  h2 : b = a * d
  ⊢ c = 2 * a * d
rw h2 at h1,
  h1 : c = d * a + a * d
  ⊢ c = 2 * a * d
rw mul_comm at h1,
  h1 : c = a * d + a * d
  ⊢ c = 2 * a * d
rw ← two_mul (a * d) at h1,
  h1 : c = 2 * (a * d)
  ⊢ c = 2 * a * d
rw ← mul_assoc at h1,
  h1 : c = 2 * a * d
  ⊢ c = 2 * a * d
exact h1,
  no goals
-/

-- Comentarios:
-- + Se han usado los siguientes lemas
--   + mul_comm : ∀ (a b : ℝ), a * b = b * a 
--   + mul_assoc : ∀ (a b c : ℝ), a * b * c = a * (b * c)   
--   + two_mul : 2 * a = a + a

-- 2ª demostración (encadenamiento de ecuaciones)
-- ==============================================

example 
  (a b c d : ℝ) 
  (h1 : c = d * a + b) 
  (h2 : b = a * d) 
  : c = 2 * a * d :=
begin
  calc
    c   = d * a + b     : by exact h1 
    ... = d * a + a * d : by rw h2 
    ... = a * d + a * d : by rw mul_comm 
    ... = 2 * (a * d)   : by rw two_mul (a * d) 
    ... = 2 * a * d     : by rw mul_assoc,
end

-- 3ª demostración (encadenamiento de ecuaciones)
-- ==============================================

example 
  (a b c d : ℝ) 
  (h1 : c = d * a + b) 
  (h2 : b = a * d) 
  : c = 2 * a * d :=
begin
  calc
    c   = d * a + b     : by exact h1 
    ... = d * a + a * d : by rw h2
    ... = 2 * a * d     : by ring,
end

-- 4ª demostración (automática con linarith)
-- =========================================

example 
  (a b c d : ℝ) 
  (h1 : c = d * a + b) 
  (h2 : b = a * d) 
  : c = 2 * a * d :=
by linarith