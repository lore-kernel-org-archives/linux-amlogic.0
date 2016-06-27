From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 27 Jun 2016 08:46:41 -0700
Subject: [RFC] improve support for the Tronsmart Vega S95 devices
In-Reply-To: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sat, 25 Jun 2016 18:34:43 +0200")
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
Message-ID: <m2twgetz1a.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series enables the following functionality:
> - ethernet support
> - enable uart_A (serial1) to which the bluetooth device is attached
>   (currently not usable yet because the clocks for the WIFI + BT combo
>   chip are not set up yet)
> - SD-card support
>
> Please note that this is an RFC because it was only tested on a *CLONE*
> of the "Tronsmart Vega S95 Meta". According to the .dts of my device
> and all Tronsmart Vega S95 devices everything which was enabled in this
> series should be identical across all devices.

I'll let Andreas (or anyone else with a this board) verify if this
series works on the Vega S95 Meta.)

Kevin
