DataIntelligenceSubmitScript = {
    _settings: null,
    _client: null,

    /* --------------------------------- set up and tear down ---------------------------- */

    _createClient: function (canTrack) {       
    
        DataIntelligenceSubmitScript._client = new sfDataIntell.Client({
            apiKey: DataIntelligenceSubmitScript._settings.apiKey,
            source: DataIntelligenceSubmitScript._settings.applicationName,
            apiServerUrl: DataIntelligenceSubmitScript._settings.apiServerUrl,
            trackingCookieDomain: DataIntelligenceSubmitScript._settings.trackingCookieDomain,
            trackPageVisits: true,
            trackUtmParameters: true,
            instrument: true,
            trackBrowserInformation: true,
            enableTracking: canTrack
        });

        // Delete the tracking cookie if user has rejected the consent and the retention policy is set to False (default)
        var keepDecCookie = DataIntelligenceSubmitScript._settings.keepDecTrackingCookieOnTrackingConsentRejection || false;
        if (canTrack === false && keepDecCookie === false) {
            DataIntelligenceSubmitScript._client.deleteCookie(DataIntelligenceSubmitScript._settings.trackingCookieDomain);
        }

        if (typeof CustomEvent == "function") {
            var evt = new CustomEvent('decclientready');
            document.dispatchEvent(evt);
        } else if (!document.createEvent) {    // If IE < 9 event won't be fired
            // DO NOTHING!
        } else {    // If CuntomEvent object is not supported (e.g. IE9) -> create polyfil
            // CustomEvent polyfil
            var CustomEvent = function (event, params) {
                params = params || { bubbles: false, cancelable: false, detail: undefined };
                var evt = document.createEvent('CustomEvent');
                evt.initCustomEvent(event, params.bubbles, params.cancelable, params.detail);
                return evt;
            };
            CustomEvent.prototype = window.Event.prototype;
            window.CustomEvent = CustomEvent;
            // CustomEvent polyfil - END

            var evt = new CustomEvent('decclientready', { bubbles: true, cancelable: true });
            document.dispatchEvent(evt);
        }
    },

    load: function (settings) {
        if (typeof jQuery !== "undefined") {
            this._settings = settings;

            if (window.TrackingConsentManager) {
                TrackingConsentManager.removeEventListener("ConsentChanged", this._createClient);
                TrackingConsentManager.addEventListener("ConsentChanged", this._createClient);

                this._createClient(TrackingConsentManager.canTrackCurrentUser());
            }
            else {
                this._createClient(true);
            }
        }
    }
}