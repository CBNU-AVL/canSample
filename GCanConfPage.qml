import QtQuick 2.0
import edu.cbnu.avl.gcanmanager 0.1

GCanConfPageForm {
    //FIXIT: Bidirectional binding.
    onActiveCANChanged: {
        gcanManager.Active = activeCAN
    }
    onSteerControlChanged: {
        gcanManager.EpsEnable = steerControl
    }
    onAccelControlChanged: {
        gcanManager.AccEnable = accelControl
    }
    onSteerIgnOvrChanged: {
        gcanManager.EpsOverrideIgnore = steerIgnOvr
    }
    onSteerAngleChanged: {
        gcanManager.SteerAngle = steerAngle
    }
    onSteerSpeedChanged: {
        gcanManager.SteerSpeed = steerSpeed
    }
    onAccelChanged: {
        gcanManager.VehicleAccel = accel
    }
}
