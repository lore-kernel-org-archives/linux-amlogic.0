From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 29 Dec 2016 10:00:49 +0100
Subject: odroid c2 devices
In-Reply-To: <2f91f7f6-b59b-fd15-2b3b-861871baa4d4@poczta.onet.pl>
References: <2f91f7f6-b59b-fd15-2b3b-861871baa4d4@poczta.onet.pl>
Message-ID: <159f4f64-4277-957f-7f0d-43604088aeb0@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 12/26/2016 07:39 PM, Micha? Zegan wrote:
> Hello, are odroid c2 devices enabled in device tree bindings? I mean
> serial ports, and two i2c controllers, and other disabled things...?
> Also could you add an entry to device tree describing their i2c rtc, as
> it is done in the odroid c2 original kernel?

Hi Micha?,

Yes, almost all onboard devices of the Odroid-C2 supported by the Linux kernel are
enabled in the device tree.

For the RTC, it's not part of the board but seems to be an extension.

Neil

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161229/b4e3e767/attachment.sig>
