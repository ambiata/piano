{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE ViewPatterns #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Piano.Foreign.Bindings where

import Anemone.Foreign.Data (CError(..))

--
-- This module contains 1:1 bindings for all the zebra header files, in the
-- style of bindings-DSL, for "nice" wrappers, see the Piano.Foreign module.
--

#include <bindings.dsl.h>
#include "piano_bindings.h"
#include "piano.h"

#strict_import

#starttype struct piano_section32
#field offset , Int32
#field length , Int32
#stoptype

#starttype struct piano
#field count , Int32
#field hashes , Ptr Word32
#field id_sections , Ptr <piano_section32>
#field id_data , Ptr Word8
#field time_sections , Ptr <piano_section32>
#field time_data , Ptr Int64
#stoptype

#ccall piano_lookup_linear , Ptr <piano> -> Ptr Word8 -> CSize -> Ptr Int64 -> Ptr (Ptr Int64) -> IO CError