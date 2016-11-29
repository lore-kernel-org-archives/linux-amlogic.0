From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 29 Nov 2016 13:28:33 +0100
Subject: video units
In-Reply-To: <3dc0c02e-4613-9a7c-7271-13e48c799e42@poczta.onet.pl>
References: <3dc0c02e-4613-9a7c-7271-13e48c799e42@poczta.onet.pl>
Message-ID: <ac517c2a-96ba-44ca-b3f7-1a267307d5e9@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 11/28/2016 11:38 AM, Micha? Zegan wrote:
> 	Hello.
> 
> I am wondering about one thing: I do not know devices inside of for
> example odroid c2, but when configuring the amlogic kernel, you have:
> a vpu device
> a ge2d driver
> a vout/osd driver and logo driver
> and encoders/postprocess managers/whatever
> What it corresponds to in the display controller patch that is being
> integrated at this time?
> 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
Hi Micha?,

The Amlogic Kernel implements the video pipeline out of the DRM/KMS and v4l frameworks, and
must handle much more uses cases like Video Encoding, Video Capture, ....

The DRM patch integrates the equivalents of amlogic modules : vpu, vout, osd, postprocess managers
The ge2d is not used yep, and encoders will be used to encoder video but will be used with the v4l framework.

Neil

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161129/8bd466bc/attachment.sig>
