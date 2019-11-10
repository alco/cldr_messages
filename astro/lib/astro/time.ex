defmodule Astro.Time do
  @moduledoc """
  Calculations converting between geometry and time

  All public functions use degrees as their input
  parameters

  Time is a fraction of a day after UTC

  """

  alias Astro.Location

  @doc """
  Calculates the time zone from a longitude
  in degrees

  ## Arguments

  * `lng` is a longitude in degrees

  ## Returns

  * `time` as a fraction of a day after UTC

  """
  def offset(lng) do
    lng / 360
  end

  def utc_from_local(local_time, %Location{offset: offset}) do
    local_time - offset
  end

  def local_from_utc(utc_time, %Location{offset: offset}) do
    utc_time + offset
  end

  def standard_from_utc(utc_time, %Location{zone: zone}) do
    utc_time + zone
  end

  def utc_from_standard(standard_time, %Location{zone: zone}) do
    standard_time - zone
  end

end