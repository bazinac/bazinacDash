using Toybox.Application as App;

class EDGE5App extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

	var view = null;

    function getInitialView() {
    	view = new EDGE5View();
        return [ view ];
    }
	function onSettingsChanged()
    {
        if (view != null) {
        	view.onSettingsChanged();
        }
    }

}