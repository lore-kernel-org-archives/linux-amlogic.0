Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7DFC77B7F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 May 2023 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=go/r3baHpprm0LwqckLqSOyMGjNgi4fKDEtF3IAjXRQ=; b=Ty4TZoG87gPmjo
	Q7w9+sLb4mlBheOhZu/IIQK4zBU1V/Ix493hPnFUDt7aPMF/Kf6PrnpEtT1ajcWJms0x8IUq1xdIB
	6P8fu6Z9Ix1h3erDfRIT8/yGDoHEwWH81Zonzw91mb+JZRMd0pM3u7hdg7E9C5CxQhX703kCLuPNf
	ypAYka1n4fRbQ4UptAbkiu4AjanVdJBPhBTdPAsGb02Z7Og9Z373adSjLNV1V6743Ne36/3BTn20S
	eYTBDh5fArDc0YjXhosjNMk/4tSXt9rGz9R8e6fodJpzriVpLbCHOLxmLzvDylTHUCTuHiICAuAxr
	9++ahCAmzStWljzI5ocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6hJ-001DDZ-0M;
	Mon, 08 May 2023 19:39:01 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6hD-001DBz-1r;
	Mon, 08 May 2023 19:38:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96598a7c5e0so789856866b.3;
        Mon, 08 May 2023 12:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683574732; x=1686166732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=;
        b=LdKR+DvwekVyUqgb/OT5xTqhw/MViMQ2grjMX3F9EokLXqNtqQu+Yaq832aoIGmDUD
         lhFJulZucMOiVKprfDsGQg9GFm2RX72N6K4RFjcwnLALtfKYtElM4ySRQMBQ1AvOcDqt
         8P4dmntcKQTi5iP7QRCEAwIgDsBHatpoJLQksY2CBr0/CbuVNwuxoIne1er9XhoRQI+C
         Ifcf1ZXUagIN/A33dX2c5xKrqXa+QMwky6t/Mba+jSXTPJHMtanSbaWx9Uo87ctCq6Np
         FIonibR0S5vhRSKVOKruXgY14G/yJg8NCal6Ar8m/NHKoxaj1g7jRcJvWV+49tuOAONI
         5UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574732; x=1686166732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=;
        b=jBOzs4Y1OFYhBm/wWS5Fm/Dyb6c018r+MQT9f1TMwfZHGb6tqJVQ7NqF02b1alLk3+
         8AmGjvmQ6EwQnQojPC3f3tZzXZYKumc6Joq8K+OOy0tqi5hbPjF2b+ZceX4FOBwEAnqy
         IAKaoznkTj0QcTtDM8syplxYs2rkleRCBFKU3Mx6FGEn/+Y/MNdPPDcTQ1FrLrDMn8KN
         IjP0urZTO5mBZNlBgAeWO3zKH18z5gtnarmEYvoMvTc94+fQQT1jl+7d7CTqlcWM+ORW
         hNjeMbQgV/jFtYEB2AbBMYWhoyhGKq4v4nt9dTtg0caDztIRsP+aTBb15Bal+FwsIyS6
         nQvg==
X-Gm-Message-State: AC+VfDxmrx9TgfR4Lt7oRdoYp7adSlDMgbipokP1XDSXn0j62Oiibktm
	0Xd4zsaWsL4XiyMexYc6THeIQgHi00FQk+YkT7I=
X-Google-Smtp-Source: ACHHUZ6dsVgo1prYYtLrJg0gIiYhBjQNx+st7OeU+cr1SkPuxS+S4CB5SSBSFTCcvBvNJKZ/6ClIl+DTCz2pkxjEmWc=
X-Received: by 2002:a17:906:dac5:b0:94a:4fc5:4c2e with SMTP id
 xi5-20020a170906dac500b0094a4fc54c2emr9330195ejb.49.1683574732223; Mon, 08
 May 2023 12:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de> <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:38:41 +0200
Message-ID: <CAFBinCAXQywWReBbqRCgB36gKGjhX9Tx6g-8OTewt_xipdhp3w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 01/11] net: stmmac: Make stmmac_pltfr_remove()
 return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, 
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	Simon Horman <simon.horman@corigine.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_123855_613984_036530A4 
X-CRM114-Status: GOOD (  11.39  )
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCA0OjI34oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgZnVuY3Rpb24gcmV0dXJu
cyB6ZXJvIHVuY29uZGl0aW9uYWxseS4gQ2hhbmdlIGl0IHRvIHJldHVybiB2b2lkIGluc3RlYWQK
PiB3aGljaCBzaW1wbGlmaWVzIHNvbWUgY2FsbGVycyBhcyBlcnJvciBoYW5kaW5nIGJlY29tZXMg
dW5uZWNlc3NhcnkuCj4KPiBUaGUgZnVuY3Rpb24gaXMgYWxzbyB1c2VkIGZvciBzb21lIGRyaXZl
cnMgYXMgcmVtb3ZlIGNhbGxiYWNrLiBTd2l0Y2ggdGhlc2UKPiB0byB0aGUgLnJlbW92ZV9uZXco
KSBjYWxsYmFjay4gRm9yIHNvbWUgb3RoZXJzIG5vIGVycm9yIGNhbiBoYXBwZW4gaW4gdGhlCj4g
cmVtb3ZlIGNhbGxiYWNrIG5vdywgY29udmVydCB0aGVtIHRvIC5yZW1vdmVfbmV3KCksIHRvby4K
Pgo+IEFja2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgo+
IFJldmlld2VkLWJ5OiBTaW1vbiBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+Cj4g
QWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xl
bWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtYW5hcmlvbi5jICAgICB8IDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZ2VuZXJpYy5jICAgICB8IDIgKy0KPiAgZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW14LmMgICAgICAgICB8IDIgKy0KPiAg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW5nZW5pYy5jICAgICB8
IDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW50ZWwt
cGxhdC5jICB8IDkgKysrLS0tLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWlwcTgwNnguYyAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLWxwYzE4eHguYyAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgICAgfCA5ICsrKy0tLS0tLQo+
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZXNvbi5jICAgICAg
IHwgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZXNv
bjhiLmMgICAgIHwgMiArLQpGb3IgdGhlc2UgdHdvIEFtbG9naWMgTWVzb24gZHJpdmVyczoKUmV2
aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xl
bWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
