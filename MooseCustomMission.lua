-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with RED-EWR and RED-AWACS..
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes({ "RED-EWR", "RED-AWACS" })
DetectionSetGroup:FilterStart()

-- Setup the detection and group targets to a 30km range!
Detection = DETECTION_AREAS:New(DetectionSetGroup, 30000)

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher_Red = AI_A2A_DISPATCHER:New(Detection)

-- Set 100km as the radius to engage any target by airborne friendlies.
A2ADispatcher_Red:SetEngageRadius()

-- Set 100km as the radius to ground control intercept detected targets from the nearest airbase.
A2ADispatcher_Red:SetGciRadius(100000)
