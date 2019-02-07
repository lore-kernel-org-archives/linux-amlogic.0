Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0BEC282C2
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 19:30:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA722175B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 19:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kc0QVnH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA722175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tk5WqL3SmT8P3pbQcNZibLAW6lejeG2JgaVQeTfrRaY=; b=Kc0QVnH2tFPCbI
	e1rR4TT6CbWV8ncBv+64+1JucF25VSd0+YCeY7Zm4li7mAA09MXryv5sWSwRsT+VB3qbnYy7DiXmW
	G899kxDn5FdIy/VjgatMbf0m5cuHMCFBE8q3KQpL0HnhRosSW2yT+q9iPuqBeF4RA6bm03RK/ZyNL
	2I0YZccbHwxZOy6uy1S/7vZtGNXelIakgomB5Ifson5sFQqi0/JI2SEvviFgBP9bTnXF13/Tc2jhm
	Lm6T72iLyK9YRjgq2D5nvr2tG3ChqIX4nEAlKXuYBevLyliDB7Ufz5ZI9VE3HsSczwazPCZRVOQwu
	AAYzJBG4mKIYKvttT6BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grpNa-0005pQ-6g; Thu, 07 Feb 2019 19:30:34 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grpNW-0005p7-1O
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 19:30:32 +0000
Received: from [10.10.11.100] ([95.88.178.171]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Lg1QN-1hTyDu22W3-00pcX0; Thu, 07
 Feb 2019 20:30:21 +0100
Subject: Re: stmmac / meson8b-dwmac
To: Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
 <20190206103645.GA2482@ingrassia.epigenesys.com>
From: Simon Huelck <simonmail@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=simonmail@gmx.de; prefer-encrypt=mutual; keydata=
 mQGiBD/bCNARBACE3URTBXZ/AA03NwRNtz03ewQn3uhvYSTjfqgplBtb3dfC4a79BXDRIWVX
 xPGH9Ewios1c8gMu3/RI2l3JzXoISfw5b0L/5igyPKV+sGuUA2FD27kYtPaaF/TqEWIv+Yxp
 9DCjCX5IQSYyvCfcxcyEkY8eVWxnaAlV3zKRR8wn0wCglWIOtAugBcg1YXmoLpFZE8Ca0fkD
 /jG+n4U9DPfCgkbgjQ/dv2W2a0ZDHccA9N8AW/FTXGyXXO0e7ql9/kORJnp7jD7/Z9HCKpeS
 HajgxuX9Vhfx6bH1dAMfsg88+K8pOO9oulNX1+YffQyZWOfdbmnZDUzBt9HKR9Wgh8WoIyw9
 TVluclzn6hYz+z9jbqHWMOsiCu8zA/0apHbW8vaIDT4+nNUxNdqU1TKa9kW47vNjwYYL0jZW
 TXNjDIRpqJVSugYVc/U847GoVoxyvtzre4TAbBV8h0BAOeMdxI5En67RGWzeNaMDJV1bwapj
 qdfj3e/X8rnGIfwz47rwztLNKoAIUlKrATwroiI7UNT+84G7H5qalu+Eu7QqU2ltb24gSHVl
 bGNrIDxzaW1vbi5odWVsY2tAZ29vZ2xlbWFpbC5jb20+iGIEExECACIFAlH7wL4CGyMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEJNSVvfBt05KlBQAn1JDO7e4H3N0WFJkZnxvObhk
 2kiAAJwPdDd6T1TuGo4iDIENRhAX4AH2KrkBDQQ/2wjSEAQAj6JnDDQzIIYzPGsrHRvaq8vw
 n8VrZCbPRvkngGvtQIss5pH/MLeu9jLepDGO9WHByFSg4QJh8cINYwTLtX8Bu0naA6ZI46hn
 GyfxdRlxSU9dRqHpU3G0tymL1w3AER6aVSfdXQTmFgf61anKunbIIptkqzZurkjnxkwCE/RM
 RscABA0D/jhglpj8siSIAxs8XLVfKJrjzbYM9/wS0NfdSXBeQJiYtKrY0WMNsqjY50wDnLMg
 anORN/odT6mCwKI6xChzxEv/ta4+teZl92aitziSuqmtl+jm23DpOcUC7UBz2W1+TvnrhPR+
 MKu8pPKAgsE8AI5uwCcNJx7V3bczYkIGaXybiEYEGBECAAYFAj/bCNIACgkQk1JW98G3Tko6
 3wCfZBpZAUhUz/Rcp2rfg/YSKl4YLlEAoJN7e322OvHc2GQ9n1+tKLi6Og4c
Message-ID: <3001f244-8904-1e89-9595-62a65a7b32ae@gmx.de>
Date: Thu, 7 Feb 2019 20:30:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190206103645.GA2482@ingrassia.epigenesys.com>
X-Provags-ID: V03:K1:NQFMDHsQD1SwzfhOukAtggDqCziiGLTD+zWaEGiuRWbHPmlErml
 D6Ucw9rpG+DxZxcqYDaZ8Z5DMvS5RI01hX9T3LP2FmlI2dkUmEg7d9wB44AVbMS6rcnXsu2
 y6j0lc8qnqqeaIs43e/E6RhVPr/xeacnOSTxzSAlZ/fWoFYDuZLNRcrW5icyJ/0NdQdLEl5
 FCxRdh0B7DWC+ar2YtwnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dwzD9fBLulo=:O5ntJFASFBkbuvVy3BKqGt
 pYDjvnh10+1g5500srH6zbGmVAg1/PKsSFlFwzBnYFgiEvQoCsFwagocsZGMTpwcyeNFkOKuc
 RODaNw1YmuVZId7sTSTM3vjdW8XcGLmGxXSeKDb+IKvybBa/VSv+SK3QE9rupceXHl5pfaohl
 3gkQlvAyIAoNi7SIrv/78fUNo2wjP211lZIbxetlMKLKY3xLikdMQBykF5H8OQoTzLDTsUixl
 IFB4HXmq6aF5HcdIa/4Ym6S3Zt+bqkLrEhRvtWIdZaja8jLP+p65SZ7LzQI33AE99DUdW5FaY
 yyOsSbam8GPZHhLZtny5dYhQqrelJ2x6ifcVNO6/PVZ//Fv6yVsUZbUKuyqSl9Eo2R5Cf7y+v
 sCjZq38CvopavzJGEgeG7GaUcrA5RViK1uZuKz9Mc5Xg5mvnpZl07FrwreQtPBUylVxU38Pv5
 NMHMufPh0atNUClUkTrYiV1PiWuk+4FQgCL1TXzWoN9akCy0WAzDjZ0YhmyvBbIhdPJrThP1/
 YQEjyrqSwhAC+rQ1VjbLGW/4Wg5cfh899aipmPzapB0OsTIWx/PfzpH60SREtP5O4sdkVUhtv
 HqICECVEn/1osHp0WFNPyV1wUwFLxF1l7MjnEDU6jmHvZT0wkLahl9lh46Knbv0chFakTqVU9
 peW9trsi40fSN1RI9MHkb+1lll52K5IVLhdmHQyH4DQ8V4+awHZRTOixNe0guqHWfndD6iBQm
 b/hWevd5c+iG/MLUs+Cr0jht7YFpVpPECqJe6pt5Tg13y+Cb+YbvjB9TouAwOEsGHMlw5zGDD
 r2sAsodoiaxPJ4TSWPX/B+oj+h37DnH5eMM1BEZ18xnr2dYzaZN5YzqzVOCm0EFvlXC2voXr4
 eInskLdgrygRSnev9CL5w6QpcxpzNIKkxP66NAj+DUsbJ4FfS3KvUT2iECkq+EmOjp8KxdX/A
 F+YSHn54ETA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_113030_382035_F1159065 
X-CRM114-Status: GOOD (  15.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guys,


i can confirm better performance with 4.14.29

- ~900 MBits with iperf2 in one way
-~ 500 - 600MBits with iperf2 in duplex in both directions


This wasnt the case with 4.17.9, not with 4.18, 4.19 or the 5.0 series.....


How can i help further ?

regards,
Simon


Am 06.02.2019 um 11:36 schrieb Emiliano Ingrassia:
> Hi Martin, Hi Simon,
>
> On Mon, Feb 04, 2019 at 03:34:41PM +0100, Martin Blumenstingl wrote:
>> On Thu, Jan 17, 2019 at 10:23 PM Simon Huelck <simonmail@gmx.de> wrote:
>> [...]
>>>>> I got problems with my ODROID c2 running on 4.19.16 ( and some releases
>>>>> earlier ). the stmmac / dwmac driver doesnt provide the 800M/900M
>>>>> performance that i was used to earlier.
>>>>>
> Simon, did you ever reach 1 Gbps full duplex speed?
> If yes, what was the kernel version did you use?
>
>>>>> Now im stuck near 550M/600M in the same environment. but what really
>>>>> confuses me that duplex does hurt even more.
>>>> interesting that you see this on the Odroid-C2 as well.
>>>> previously I have only observed it on an Odroid-C1
>>>>
>>>>> PC --- VLAN3 --> switch --VLAN3--> ODROID
>>>>>
>>>>> NAS <-- VLAN1 -- switch <-- VLAN1-- ODROID
>>>>>
>>>>>
>>>>> this means when im doing a iperf from PC to NAS, that my ODROID has load
>>>>> on RX/TX same time (duplex). this shouldnt be an issue , all is 1GBits
>>>>> FD. And in the past that wasnt an issue.
>> +Cc Emiliano who has seen a similar duplex issue on his Odroid-C1: [0]
>> (please note that all kernels prior to v5.1 with the pending patches
>> from [1] applied are only receiving data on RXD0 and RXD1 but not on
>> RXD2 and RXD3)
>>
>> Emiliano, can you confirm the duplex issue observed by Simon is
>> similar to the one you see on your Odroid-C1?
>>
> It could be but, if I understand correctly, Simon is limited in
> speed also in half duplex transmission (~550/600 Mbps), while we can
> reach at least 900 Mbps.
>
>>>>>
>>>>> Now what happens:
>>>>>
>>>>> - benchmark between PC - ODROID is roughly 550M
>>>>>
>>>>> - benchmark between NAS - ODROID is roughly 550M
>>>>>
>>>>> - benchmark between PC - NAS is only around 300M
>>>>>
>>>>>
>>>>> and like i said i was easliy able to hit 800 or even 900M to my NAS
>>>>> earlier. I applied some .dtb fixes for interrupt levels for the
>>>>> meson-gx.dtsi and meson-gxbb-odroid-c2.dtb, which will be mainlined ,
>>>>> but the effect stayed identical.
>>>> good that you have the interrupt patches already applied
>>>> I believe it don't fix any performance issues - it's a fix for the
>>>> Ethernet controller seemingly getting "stuck" (not processing data
>>>> anymore). however, that already rules out one potential issue
>>>>
>>>>> are you aware of this problem ? Earlier kernel versions were all
>>>>> perfectly fine and i stepped ( self compiled) kernel through all major
>>>>> releases since odroid c2 was mainlined.
>> Guiseppe, Alexandre: what kind of data do you need from us if we see
>> the speeds drop (in both directions) when we send and receive at the
>> same time?
>>
>> [...]
>>> the problem is that i dont have these kernel sources anymore :-(. but i
>>> can provide some testing and numbers. maybe i dig if i got these kernel
>>> configs somewhere around but i did not change much during migrating
>> do you remember the kernel version where it worked fine?
>>
>>> im using a zyxel gs1900-8 switch and a qnap ts231p , and as i said i
>>> didnt change my setup. i was able to hit 100MByte/s from my NAS , so
>>> close to the benchmarks of 900MBit/s
>> I typically only do small transfers or I have traffic only in one direction.
>> thus it's likely that I missed this in my own tests
>>
>>
>> Regards
>> Martin
>>
>>
>> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009679.html
>> [1] https://patchwork.kernel.org/cover/10744905/
> Regards,
>
> Emiliano



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
