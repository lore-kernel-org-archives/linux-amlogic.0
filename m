From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 25 Jun 2016 18:34:43 +0200
Subject: [RFC] improve support for the Tronsmart Vega S95 devices 
Message-ID: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series enables the following functionality:
- ethernet support
- enable uart_A (serial1) to which the bluetooth device is attached
  (currently not usable yet because the clocks for the WIFI + BT combo
  chip are not set up yet)
- SD-card support

Please note that this is an RFC because it was only tested on a *CLONE*
of the "Tronsmart Vega S95 Meta". According to the .dts of my device
and all Tronsmart Vega S95 devices everything which was enabled in this
series should be identical across all devices.
