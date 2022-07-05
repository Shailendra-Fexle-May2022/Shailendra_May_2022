/**
    *  Purpose         :    Child Class
    *  Created By      :    Shailendra Sharma
    *  Created Date    :    2022/07/5
    *  Revision Logs   :    V_1.0 - Created - 2022/07/5
    **/
public virtual class ChildMarker extends ParentMarker {
    /**
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is getting the value from parent class.
    * Params        :    Void
    * Return        :    Void
    **/
    public override void write() {
        System.debug('Writing some text using the child marker.'); //Writing some text using the child marker.
        ParentMarker obj1 = new ParentMarker();
        ParentMarker obj2 = new ParentMarker();
        obj1.write(); // calling parent class method.
        obj2.write();
        Double d = obj2.discount();
        System.debug(d);//0.05
    }
}