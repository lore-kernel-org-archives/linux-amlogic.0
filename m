Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB27CA0EFC
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Aug 2025 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvtRGEfnpQZ2P68ekoOoRPzuZJzK1tYpmT4w2OvgeXw=; b=101sqschNwUHbZ
	NWQbhk3/KBIQMP1PMNVFlXtNpLaUof/Aj9b4lmucGJ/1IfEtF2E6qRDutp6ZRvzNG6Mq6KavxHMXJ
	7m32z3ksemXI7UeUNxqYusp/ncTDellhGl5x4xh2MJQR428KutTyPjhE8uK7omhUr22ePCv6jKv/2
	+gBr0pk+2Xl/LBF4NmPd+HJzdwmEQerdZfyrtdsdzJWaQQng95IDr6D7Fc4xlH/wa9cP/VWepU2AZ
	WyZn7j9wTfD2+yY8G6mcENRGvjpKNU1hwFoU3UcCsE91Y2RhrQQwqOvgYverm6TPz+X3tX8VM16xp
	R/PTHrJxDlm9hS1dazsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Fx-0000000HNvj-1i7W;
	Thu, 21 Aug 2025 15:31:13 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3oU-0000000GoEl-3X7Z
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Aug 2025 11:50:41 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7e8702fd3b2so79148285a.0
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Aug 2025 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1755777037; x=1756381837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI2XcWaMkZXf3XlixG2IPGL+6e9Vy4tl86zb1yjrRNY=;
        b=YrLJ11/xcen83cyqerh5e449b4Nob7At5hWJbVJD/agUb0Hu7btC7OXF83L1Icwoia
         WTxmTOd2MjAkPQgeKPEUSEcbkES9IAq7YbuKaGo/1wPi7x1Rl9VDcWmZB2UNA4LZpWsY
         cJnB9atHfnGHVeB0Zl6HjqBPIQ9VvBxTtm255ok+7N8uZ7kRhLj1pfdPpOQRuk8Y3+Re
         s1UiIVKjHvgMZ1Ba/2aLsFMvUBEBOA4snGfcwgdGkJjmErfrHWIxQsnRxPo+xF9jWzoQ
         ++Xr2Thigl6UwfBglJawkFOKOm6RnXuwx65+tGov2iGEMt5xCxXyAyyJ+4MxOLzVK6AM
         szjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777037; x=1756381837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI2XcWaMkZXf3XlixG2IPGL+6e9Vy4tl86zb1yjrRNY=;
        b=PtJc/miEcOgoBjP7eZz3JCQfUASM7eY5Matsml1YJQXYWM+rwPsvwLhmcQll/8lLkn
         MmLg0FPSj8cZCBu+mO9WzwfZImP3o68zLG17AKNn/g9IHHmm7obi26qVwGLc7peb8jXf
         W80p5fj3TGHFFn9YSnXAG5RRNXa6EZm9nU30Fon4RmdgU+8laHgvUJMWsirsz+Fy4R4/
         +RpKGCcZbKo9uR0hBLUEwDGOlE0j2QNiegb6uM7FfkqHU9vr2074JI8uKM5wx8PpDIQ2
         XN87P8PKjOBahq0Bf3gLRvUljCmlMBhOg4GvrCBMoQdnKFP2XQUzLuASO8x0rWOxvpnX
         MqUA==
X-Forwarded-Encrypted: i=1; AJvYcCX0GLyEKeEpS3rumsr5NLWukbc8rww1zmcM++XRaonAHaAoGF+O8JYQSMUbn8FohSNvRLbf2LW1qXvARnFY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3G1tAy5lPHpYpYL0Xujdqjs7QaMEYc2QUON2ywOqVY+YlnoT1
	L0OMed5A95+6hUciu/dJxtb4xBHYyUcpXg6e3l9jnq4nQJ5vbnLFqEPOgVNkhuk7Jhgu4oMW62J
	RAYDYLa+rFCdWA0iDuL2WNg+kwWzgh5vW7YxxVAP5
X-Gm-Gg: ASbGncuW76AGJNU9END9Nltx+A7Eq32tx3XMkBuIqN6tr75r3zVlGdAUN0ediScXtIY
	qZtnwwsK6z3LJV9aySKZlwHiVD/LnYr7UT47u+EGDIu66FAEzpcCsHg2SdX8gJoLoeEqiPXPRAP
	/j8jYizmIg4CxZ1AC6zVvAiPz3Ifj6HiuUxOKVP3NsIkM7Xx94f3A4Ee7m1y0PAIR/SfL3jIni4
	jPwfaA+wA==
X-Google-Smtp-Source: AGHT+IFXgN4z+V5r61maVUoVH7Q+4oGAXqZzaV+iRCJ0lg/aewM1N1+KmnykJmm4zHXRs1rwg//XUIeBfKZTRO4+v7g=
X-Received: by 2002:a05:620a:4548:b0:7ea:5aa:84fe with SMTP id
 af79cd13be357-7ea08c78a25mr207064785a.2.1755777037356; Thu, 21 Aug 2025
 04:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250821080723.525379-1-zhao.xichao@vivo.com> <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
In-Reply-To: <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
From: Crt Mori <cmo@melexis.com>
Date: Thu, 21 Aug 2025 13:50:00 +0200
X-Gm-Features: Ac12FXxGX8W0hsOM6YtKDXVSOgl06ennUByjlBCRIy2fIDyre-p0gjpggdKZ2cA
Message-ID: <CAKv63uvfHYATd7ZFweZ0LMfTLt-idHVgYJqOV8PvzaNeigbt9w@mail.gmail.com>
Subject: Re: [PATCH 0/7] iio: Remove dev_err_probe() if error is -ENOMEM
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marius Cristea <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Gustavo Silva <gustavograzs@gmail.com>, 
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Per-Daniel Olsson <perdaniel.olsson@axis.com>, Waqar Hameed <waqar.hameed@axis.com>, 
	Yasin Lee <yasin.lee.x@gmail.com>, Julien Stephan <jstephan@baylibre.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_045038_873214_EE249895 
X-CRM114-Status: GOOD (  14.24  )
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

U29ycnkgZHVwbGljYXRlIC0gYXMgSSBjb21tZW50ZWQgb24gZHJpdmVyLgoKT24gVGh1LCAyMSBB
dWcgMjAyNSBhdCAxMDoxMywgQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDIxLCAyMDI1IGF0IDExOjA34oCvQU0gWGljaGFv
IFpoYW8gPHpoYW8ueGljaGFvQHZpdm8uY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgZGV2X2Vycl9w
cm9iZSgpIGRvZXNuJ3QgZG8gYW55dGhpbmcgd2hlbiBlcnJvciBpcyAnLUVOT01FTScuCj4KPiB3
aGVuIHRoZSBlcnJvcgo+Cj4gPiBUaGVyZWZvcmUsIHJlbW92ZSB0aGUgdXNlbGVzcyBjYWxsIHRv
IGRldl9lcnJfcHJvYmUoKSwgYW5kIGp1c3QKPiA+IHJldHVybiB0aGUgdmFsdWUgaW5zdGVhZC4K
Pgo+IEluIGZhdm91ciBvZiB0aGlzIHNlcmllcywKPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hl
bmtvIDxhbmR5QGtlcm5lbC5vcmc+Cj4gKHllcywgSSBpbmRlZWQgbG9va2VkIGF0IGFsbCBwYXRj
aGVzIGluIHRoaXMgb25lIDotKQo+CkkgYW0gbm90IHN1cmUgSSBhZ3JlZSB3aXRoIHRoaXMuIEl0
IHByb3ZpZGVzIGFuIGVycm9yIG1lc3NhZ2Ugd2l0aApyZWFzb24gYW5kIEkgdW5kZXJzdGFuZCB3
ZSB3YW50IGFzIGZldyBhcyBwb3NzaWJsZSwgYnV0IHRoaXMgd291bGQgYmUKYSB2YWxpZCByZW1h
cmsgaW5zaWRlIHRoZSBsb2dzLCBidXQgd2l0aG91dCBpdCB3ZSBvbmx5IGdldCBlcnJvciB2YWx1
ZQp0byBmaWd1cmUgb3V0IHdoZXJlIGl0IGNvbWVzIGZyb20/Cgo+IC0tCj4gV2l0aCBCZXN0IFJl
Z2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
