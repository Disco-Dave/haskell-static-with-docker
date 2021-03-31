{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Database.PostgreSQL.Simple as SQL

main :: IO ()
main =  do
  _ <- SQL.connectPostgreSQL ""
  pure ()
