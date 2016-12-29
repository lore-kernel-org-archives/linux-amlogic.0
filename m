From: webczat_200@poczta.onet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Thu, 29 Dec 2016 15:53:36 +0100
Subject: odroid c2 devices
In-Reply-To: <159f4f64-4277-957f-7f0d-43604088aeb0@baylibre.com>
References: <2f91f7f6-b59b-fd15-2b3b-861871baa4d4@poczta.onet.pl>
 <159f4f64-4277-957f-7f0d-43604088aeb0@baylibre.com>
Message-ID: <b40d137b-0871-d359-054b-37ac88ab1a5e@poczta.onet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

well, it is an extension. Do you suggest that users should add full
entry describing the device instead of just enabling the pre existing
one in device tree?

W dniu 29.12.2016 o 10:00, Neil Armstrong pisze:
> On 12/26/2016 07:39 PM, Micha? Zegan wrote:
>> Hello, are odroid c2 devices enabled in device tree bindings? I mean
>> serial ports, and two i2c controllers, and other disabled things...?
>> Also could you add an entry to device tree describing their i2c rtc, as
>> it is done in the odroid c2 original kernel?
> 
> Hi Micha?,
> 
> Yes, almost all onboard devices of the Odroid-C2 supported by the Linux kernel are
> enabled in the device tree.
> 
> For the RTC, it's not part of the board but seems to be an extension.
> 
> Neil
> 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 525 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161229/98ea07f1/attachment.sig>
