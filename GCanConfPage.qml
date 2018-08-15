import QtQuick 2.0
import edu.cbnu.avl.gcanmanager 0.1

GCanConfPageForm {
    //FIXIT: gcan is not accessible.
    steerControl: gcan.EpsEnable
    accelControl: gcan.AccEnable
    steerIgnOvr: gcan.EpsOverrideIgnore
    steerAngle: gcan.SteerAngle
    steerSpeed: gcan.SteerSpeed
    accel: gcan.VehicleAccel
    onAccelChanged: {
        gcan.setVehicleAccel(accel)
        console.log(gcan.VehicleAccel)
    }
}
