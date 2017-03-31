SELECT astrophysicist_name, detector_name, galaxy_name, measurement_time,  am.amplitude_1, am.amplitude_2, am.amplitude_3
FROM admin_astrophysicists1 as aa, admin_detectors1 as ad, admin_galaxies1 ag, admin_measurements as am
WHERE aa.astrophysicist_id=am.astrophysicist_id
AND ad.detector_id=am.detector_id
AND ag.galaxy_id=am.galaxy_id
AND am.amplitude_1>0.995
AND am.amplitude_3>0.995
AND am.amplitude_2 < 0.005;
