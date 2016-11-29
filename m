From: webczat_200@poczta.onet.pl (=?UTF-8?Q?Micha=c5=82_Zegan?=)
Date: Tue, 29 Nov 2016 14:02:43 +0100
Subject: video units
In-Reply-To: <ac517c2a-96ba-44ca-b3f7-1a267307d5e9@baylibre.com>
References: <3dc0c02e-4613-9a7c-7271-13e48c799e42@poczta.onet.pl>
 <ac517c2a-96ba-44ca-b3f7-1a267307d5e9@baylibre.com>
Message-ID: <99d4ee55-04e4-49ee-f705-d49ec80fb625@poczta.onet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

So what is missing? ge2d, v4l support maybe? I do not count mali, not
sure what is the chance of supporting mali.
Also what is vpu and what is ge2d? I was always interested in what is
what but no info
ahh and hdmi is not supported, I know

W dniu 29.11.2016 o 13:28, Neil Armstrong pisze:
> On 11/28/2016 11:38 AM, Micha? Zegan wrote:
>> 	Hello.
>>
>> I am wondering about one thing: I do not know devices inside of for
>> example odroid c2, but when configuring the amlogic kernel, you have:
>> a vpu device
>> a ge2d driver
>> a vout/osd driver and logo driver
>> and encoders/postprocess managers/whatever
>> What it corresponds to in the display controller patch that is being
>> integrated at this time?
>>
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>
> Hi Micha?,
> 
> The Amlogic Kernel implements the video pipeline out of the DRM/KMS and v4l frameworks, and
> must handle much more uses cases like Video Encoding, Video Capture, ....
> 
> The DRM patch integrates the equivalents of amlogic modules : vpu, vout, osd, postprocess managers
> The ge2d is not used yep, and encoders will be used to encoder video but will be used with the v4l framework.
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20161129/fc4cd992/attachment.sig>
