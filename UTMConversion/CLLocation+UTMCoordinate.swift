import CoreLocation
import Foundation

public extension CLLocation {
    
    /**
        Calculates the UTM coordinate of the receiver
     
        - Parameter datum: The datum to use, defaults to WGS84 which should be fine for most applications.
     
        Throws a ``UTMConversionError.invalidCoordinate`` if the locations coordinate is invalid.
     */
    func utmCoordinate(datum: UTMDatum = UTMDatum.wgs84) throws -> UTMCoordinate {
        let coordinate = self.coordinate
        guard CLLocationCoordinate2DIsValid(coordinate) else { throw UTMConversionError.invalidCoordinate }
        let zone = coordinate.zone
        return TMCoordinate(coordinate: coordinate, centralMeridian: zone.centralMeridian, datum: datum).utmCoordinate(zone: zone, hemisphere: coordinate.hemisphere)
    }
    
}
