Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B8CC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlH/kzcBTKrvcROONwiVItNtyJtkKFZMy5EgRqaiXu8=; b=DxMzsydWamF8Fs
	1S/8IfsHXzF5S73RYSktnRevBT4cm4M8xK6d+5KBkkK4MN0Zt2J6O86dG5Nibvr4RkVGZ2RpJe20l
	ikwrcKgx2ByDNeVWLbULyw9FTDoOAbexWNrYWgR1QxAGc74YFJ+/Xw1TQAf/37kg//ag1FvCDC1U3
	lokxggwZ2t1Y/fiKGYHt6LS208tDYFi4HMWH8s50Y7uI/R97bMg3Bly5j7Duu0wSFPNW0FrTRyWXj
	SLyPz1bJMgKLDqfdzb+yFH/0KD8nt+HS9odQfzLsEGska6cYrgtVFCUvrPeOkIoCH8aFm8vMZwNRg
	lXpTKDtLmzZO1y7APmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLPm1-00Gyhj-MJ; Sat, 19 Feb 2022 13:27:41 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLPlo-00GyeH-59; Sat, 19 Feb 2022 13:27:29 +0000
Received: by mail-io1-xd2c.google.com with SMTP id r7so5372357iot.3;
 Sat, 19 Feb 2022 05:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KO/8QQs4orfHfNwOFQo7k4l8avyPAUDelGciJGBrvjg=;
 b=FCg0kn+ekzhlXs3p+TIEjeOc7qQPGiI/q8jB8XBmvUyIx5TBTcCg/gEKMkHE1kmeSo
 ZGyostuAgkpcxUz9yVWzEwB4Awn7HiPxP6SIbIIlOaWvdB8kNsiyylnEpweS3mrwrLBO
 yfIt/poGl6z7G2byxupCCVRRd2diNVuVkjN8CF6Q/uA1srZRtIJkbf1zJdGjQB/QHQ1I
 amlqKdLH4pJZC+4Jq6hWP7ypUuGkze6Cy9etl/RGVVphmSgpe2NSDb08pHcdhtfz8cWw
 mpti+uZMYIs5DkkXvA6BouF+5V2FdgMvwqp09fYHvaANl4MIvKIvXEKErguPM02txOiS
 3ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KO/8QQs4orfHfNwOFQo7k4l8avyPAUDelGciJGBrvjg=;
 b=m6YUIMt3JkQdROG3ZqvIXXskq4W9lghRQiXP/ypWK6qjHZLqlOVHDtYM3dHm0mLHL1
 fRGDkTYKVhfu9+mbj2qbITjXtgT6kLH5rqJ1beEC8PBskevsR9bbJ8hH5OqTdn6dblH/
 Q8tO1r8xy9X0eLOPispIbg8vx1UcJBXiUUmw3bUy720P9Tf9LDwqTMkbHykP0eOEOn+4
 H9akeD3D6mljT+otnrNPNrh3JhXTbOp3fECs/FlePu1hJDp5SqDvr8r2+4oEqoD+tsq+
 EvT4i8f/jwZNOUARVjD87TITtyMWecvbSGcS945ngwHDiwa2Qd7xELqrNgGKIAIFBKXl
 2g7g==
X-Gm-Message-State: AOAM5309cbAEPgqH+zuHC/JXmiwRj+tukM0t9eYOiR9dv+5l/o3e67Y9
 tapo2hc4Q8kitUwK5S8R3zApXTXR0ihDaotOFGk=
X-Google-Smtp-Source: ABdhPJwU+05GoNQh/jt+OuH0dD2VBbuy+3+srpnHGgkPn+kA5W8tdUu+qBDt7gcW4QbpT8KA0+Fu2CWPpEiOlPEuK90=
X-Received: by 2002:a05:6638:204d:b0:314:a290:48c with SMTP id
 t13-20020a056638204d00b00314a290048cmr7068120jaj.264.1645277246525; Sat, 19
 Feb 2022 05:27:26 -0800 (PST)
MIME-Version: 1.0
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
In-Reply-To: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Feb 2022 14:27:15 +0100
Message-ID: <CANiq72mi5fj07cfo6T4jPmp=EiRtE_uDeHHCqjG9h+duPrUMKg@mail.gmail.com>
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda <ojeda@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_052728_229321_4DAA0B57 
X-CRM114-Status: GOOD (  10.47  )
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

T24gU2F0LCBGZWIgMTksIDIwMjIgYXQgMjoxMyBQTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2Vp
dDFAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhl
IFRpdGFubWVjIFRNMTYyOCA3IHNlZ21lbnQgZGlzcGxheQo+IGNvbnRyb2xsZXIuIEl0J3MgYmFz
ZWQgb24gcHJldmlvdXMgUkZDIHdvcmsgZnJvbSBBbmRyZWFzIEbDpHJiZXIuCj4gVGhlIFJGQyB2
ZXJzaW9uIHBsYWNlZCB0aGUgZHJpdmVyIGluIHRoZSBMRUQgc3Vic3lzdGVtLCBidXQgdGhpcyB3
YXMKPiBOQUsnZWQgYnkgdGhlIExFRCBtYWludGFpbmVyLiBUaGVyZWZvcmUgSSBtb3ZlZCB0aGUg
ZHJpdmVyIHRvCj4gL2RyaXZlcnMvYXV4ZGlzcGxheSB3aGF0IHNlZW1zIG1vc3QgcmVhc29uYWJs
ZSB0byBtZS4KCkNvdWxkIHlvdSBwbGVhc2UgbGluayB0byB0aGUgZGlzY3Vzc2lvbiBhbmQvb3Ig
c3VtbWFyaXplIHRoZSByYXRpb25hbGUKYmVoaW5kIHRoZSBOQUs/CgpDaGVlcnMsCk1pZ3VlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
