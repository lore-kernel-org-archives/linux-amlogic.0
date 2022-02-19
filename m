Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89449C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 13:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DgjfQgd1OrSLQQ0XmGi4cQThCiIqp0jfbXnavNkGwg=; b=sMHvVCOcpgMaAt
	zqwfWow9cu7/ourCBvyaEBFtAGsK57f1ckgQmWTxZaSyPbjs81n0FVGWW3gq2WfnyOBkZz28SkDn/
	ltJ3SOrT2ocXaa1M3LEWljIVuTTwpm3Cd+SK4pgbNuQJyLFYZPLbNWWwxLi0r5OEvN2FIOCXYjrps
	RPTD2qppKAEaSDYCP50LhCEWP5f1Rwbpu/Lo7UpP3EUroxxhrBQ5CjA2vsP4oATuPZhIX8rPQPx0u
	/jMq01WmYjZ7Z5g53TZcD3OEA/Gdc6gPetIPwugjZJ3XjxcROuBelb6pWPx/R1LXZWi+cgBbi8wy6
	SLrRHxdxpHnc2QZjUWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLPvS-00H01S-8h; Sat, 19 Feb 2022 13:37:26 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLPvF-00Gzye-TB; Sat, 19 Feb 2022 13:37:15 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s14so2888351edw.0;
 Sat, 19 Feb 2022 05:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=hHHScw58pgrJJfCMocTEt/w7m0EUDTl2Y3p2I5hmxFU=;
 b=geXHgpGEe/z7ZCgVptzMQTHiMvRCzFRYIm1uvPmUAdWqXNLPlnnY+/xOllwgkXx9Au
 hR6KfUsDdsTAr9uAclO4CZkXgiTX4VFL0pvGyNBH8cm2BoTHmx6Hfprqigu7tfG7npQc
 j+MWPPYclHLr6OFoeTQJIMxKAH8LcpFpp32XXUiGW3mmXBVK51ExIar0//d8JKpgWvSd
 EpgzBrihpsKgS1vGvnk5GBzr3RzAJWC1rKHNIOWN0muw/q9AaRpwDmEIIFpyDDnSEa7K
 LYHLnTXVyn1l9HVUnUaySfLCTTg2ny05MSMTvNYescIM1lRLzc0PdQENePU3C7DjTLmS
 2Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=hHHScw58pgrJJfCMocTEt/w7m0EUDTl2Y3p2I5hmxFU=;
 b=RtilVBBVE7Ne8Y8M6tNg1n0w4zPrNfiNk+kTx2RWTYd0Dyx4Y2WkzPVrTOhXajgzk+
 6O+87JSyHHME+ruLr21e1Gvkk3yQMyXT29vdKc9FZc499E0yyQJxCBEFsRhHYhIjpO4s
 FOSdRcy8ynVCSDo6PtouEeyMs40fhzvuRUCjxoT+9VP5QTJ2sQYq7fTN6dSmAxxUknkN
 7Y4HU67hjfc+JPwCgRVRdzOJ+vZynO/wkE9JxfnFanEcoXMOiOzzw291i2eRuHy5FkU5
 KW1tYKZMvEpAutATsucoXTmdMfiaT+B8rMi7jy93A8yGzIOyoBSYgHj1kP9vHigFT5h1
 f1rA==
X-Gm-Message-State: AOAM532kx8LWdrTEZSeN0hbAqbIZFmv17tT7naezjGvIth8vKiMwxXm8
 ZqeVaLZnJKnMpoOUUYdINhY=
X-Google-Smtp-Source: ABdhPJyGz2QRe4cH/p7/PdgSmapN0KXIN8wsQGnjP8tAiLQoAuu5SPDnUdbm2SqEWQwxiRFgxY4BCQ==
X-Received: by 2002:a05:6402:358c:b0:412:e44e:f62c with SMTP id
 y12-20020a056402358c00b00412e44ef62cmr1911773edc.206.1645277832636; 
 Sat, 19 Feb 2022 05:37:12 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d?
 (p200300ea8f4d2b005cf9df09c1b3d44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d])
 by smtp.googlemail.com with ESMTPSA id s11sm2347445edt.10.2022.02.19.05.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 05:37:12 -0800 (PST)
Message-ID: <ecdbfb3a-e214-a059-95b9-1ebf2f625295@gmail.com>
Date: Sat, 19 Feb 2022 14:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <CANiq72mi5fj07cfo6T4jPmp=EiRtE_uDeHHCqjG9h+duPrUMKg@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
In-Reply-To: <CANiq72mi5fj07cfo6T4jPmp=EiRtE_uDeHHCqjG9h+duPrUMKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_053713_967147_E5ED4C30 
X-CRM114-Status: GOOD (  12.19  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTkuMDIuMjAyMiAxNDoyNywgTWlndWVsIE9qZWRhIHdyb3RlOgo+IE9uIFNhdCwgRmViIDE5
LCAyMDIyIGF0IDI6MTMgUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4g
d3JvdGU6Cj4+Cj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFRpdGFubWVjIFRN
MTYyOCA3IHNlZ21lbnQgZGlzcGxheQo+PiBjb250cm9sbGVyLiBJdCdzIGJhc2VkIG9uIHByZXZp
b3VzIFJGQyB3b3JrIGZyb20gQW5kcmVhcyBGw6RyYmVyLgo+PiBUaGUgUkZDIHZlcnNpb24gcGxh
Y2VkIHRoZSBkcml2ZXIgaW4gdGhlIExFRCBzdWJzeXN0ZW0sIGJ1dCB0aGlzIHdhcwo+PiBOQUsn
ZWQgYnkgdGhlIExFRCBtYWludGFpbmVyLiBUaGVyZWZvcmUgSSBtb3ZlZCB0aGUgZHJpdmVyIHRv
Cj4+IC9kcml2ZXJzL2F1eGRpc3BsYXkgd2hhdCBzZWVtcyBtb3N0IHJlYXNvbmFibGUgdG8gbWUu
Cj4gCj4gQ291bGQgeW91IHBsZWFzZSBsaW5rIHRvIHRoZSBkaXNjdXNzaW9uIGFuZC9vciBzdW1t
YXJpemUgdGhlIHJhdGlvbmFsZQo+IGJlaGluZCB0aGUgTkFLPwo+IAoKK1BhdmVsCgpJIGRpZG4n
dCBmaW5kIGFuIGV4cGxpY2l0IHJlYXNvbiwgYnV0IEkgc3VwcG9zZSBQYXZlbCBzZWVzIHRoaXMg
ZHJpdmVyIGFzCm9uZSB0aGF0IG1ha2VzIHVzZSBvZiB0aGUgTEVEIHN1YnN5c3RlbSwgYnV0IGRv
ZXNuJ3QgYmVsb25nIHRvIGl0LgpJbiB0aGUgZm9sbG93aW5nIG1haWwgaGUncyBleHByZXNzaW5n
IGhpcyBvcGluaW9uIHRoYXQgdGhlIGRyaXZlciBzaG91bGQKYmUgYmVzdCBwbGFjZWQgdW5kZXIg
YXV4ZGlzcGxheS4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAy
MDAyMjYxMzAzMDAuR0IyODAwQGR1by51Y3cuY3ovCgo+IENoZWVycywKPiBNaWd1ZWwKCkhlaW5l
cgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
