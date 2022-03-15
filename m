Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D7C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Mar 2022 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W21J4d1aX3rx54DMPWj+xYCd6WS/cAVVZ83Nqk7o1uU=; b=O+OXNpQSdgcuES
	HCPM5xGRJkwj42MhHvvHImdFpQGgy9BMbX2f8Wk9Hhbf5/VP98BedwSG30scWO2FHUc83xgmacYdb
	HIpZH8/l3Tze/O8zvVKDmjCZbfNI4nKpWy6Ggq4fB1KxiqZb2IL5HFWuEN3txeJWfwc3S1c6BbvMp
	bQcIXeJBdcEtd6g0JTXLuLvXPfy9BDxZfcbRbnvki6bvG0xDfQjBa/nl8yURul/Isi567KLrv6OPq
	rK/a4079F8LgOKfhsylnvTBuJVpq4R4IoZhVOkZkCt3J3ZxDJSeofIHMPSD1QJFm3U/AT6gSirkCx
	hQfSNnVfG19Np/I3IXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUBXc-00A9dN-Ug; Tue, 15 Mar 2022 18:05:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUBXY-00A9Zy-T6; Tue, 15 Mar 2022 18:05:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id qa43so42871400ejc.12;
 Tue, 15 Mar 2022 11:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7bpalvhMp7syEkA5bOD6m3Hiadeq1GFGR2u5DFZQUPg=;
 b=DFsEVIcpVFZmsLrzVsuXGfCDAOQo45HphHPPHqSlOIJqflipspyIX6nDmHEdm7p5ZN
 qStS1Me4q0ChYcco/kXFdiYP6BFh8vXOSO+RranC2vJEEDyM2cTCdEwWsBLGXaFTO3cm
 ZrLXhRs0Zr57Jp4HWFlA6dsjObFGsCSo2ta1XqASGUjr5h2618FD/7YtapV90aJTALFH
 26YUJTPAW2tj1bjGYJa3B53LWudxdy+KC1sO3IaOfXY9WMLiKhQeh7CYPtaRCelYukQ0
 ykHuhInylyATUkZelWpM9ZbZh88D3lun1+FtqQDueri5iYlC11fvs52nKVwDvhxDADZb
 itcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7bpalvhMp7syEkA5bOD6m3Hiadeq1GFGR2u5DFZQUPg=;
 b=b7wpAmN+TAsqL6EvpsXJMeRPONmX4iVTGg7GEFw/oAKzu16ki866RVgUeV201p8Dtl
 KvOiwxgpwH2eQGL0xZ1Vdz2fXO2I48WbmTmaH6Q55e45d9u10jdmW4DRWOalujCSANjy
 e55eEvYQ50sXoivjQ2t1fa+X/2CmRxBG9/WOCVsmH/bpvDcAXNnUNKL+BVP8yWAOSw7r
 1rxxMFq//FBp1Qm2yLf8KrM0LZyzrq9Akqwy+vaFzruZitJgrXGN4XGz/3rvwlg3jx9P
 zKkHRpmIL8ZJhH5IIy3QbJ36e81tYGmof/+dqvnFe+O456IV6lDIgtkJr8uaj935ZpOa
 G76w==
X-Gm-Message-State: AOAM533fIYumuYF1jwzmOV8GmoXsRuEbuu4EsvgZXq+Dm4o6GqB43Vfd
 TOZ3rAqNCNRq/f+NAKMkyy9E1wXryntJPeTT6YQ=
X-Google-Smtp-Source: ABdhPJxW6+1eFC3OcTirM9mgeDfTXvBfatrTIVC6OBa4JEN+KNKCGi5wT8QrdQtnyTpzndOFbCuPp9umJm3+8HzbnXM=
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id
 q7-20020a1709064cc700b006d07efb049fmr23301879ejt.639.1647367498316; Tue, 15
 Mar 2022 11:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Mar 2022 20:03:44 +0200
Message-ID: <CAHp75VdH4vGr57v6tfkRuxh-3agRKO8C08+DH8dsB1HnPfnz5Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] clk: provide new devm helpers for prepared and
 enabled clocks
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 linux-hwmon@vger.kernel.org, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, 
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Paul Cercueil <paul@crapouillou.net>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Oleksij Rempel <linux@rempel-privat.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, 
 Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
 Tomislav Denis <tomislav.denis@avl.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, 
 =?UTF-8?Q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>, 
 Cai Huoqing <caihuoqing@baidu.com>, linux-iio <linux-iio@vger.kernel.org>, 
 linux-crypto <linux-crypto@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-watchdog@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-pwm@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>, 
 linux-spi <linux-spi@vger.kernel.org>, 
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 dmaengine <dmaengine@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_110500_971018_5A40A6CB 
X-CRM114-Status: GOOD (  28.16  )
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

T24gTW9uLCBNYXIgMTQsIDIwMjIgYXQgNToxNCBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gdGhpcyBpcyBh
bm90aGVyIHRyeSB0byBjb252aW5jZSB0aGUgcmVsZXZhbnQgcGVvcGxlIHRoYXQKPiBkZXZtX2Ns
a19nZXRfZW5hYmxlZCgpIGlzIGEgbmljZSBpZGVhLiBDb21wYXJlZCB0byB2NyAoYmFjayBpbiBN
YXkgMjAyMSkgdGhpcwo+IHNlcmllcyBpcyByZWJhc2VkIHRvIHY1LjE3LXJjOCBhbmQgY29udmVy
dHMgcXVpdGUgc29tZSBkcml2ZXJzIHRoYXQgb3BlbiBjb2RlCj4gZGV2bV9jbGtfZ2V0X2VuYWJs
ZWQoKSB1cCB0byBub3cgKHBhdGNoZXMgIzMgLSAjMTEpLgo+Cj4gQSBjb25jZXJuIGFib3V0IGRl
dm1fY2xrX2dldF9lbmFibGVkKCkgaW4gdjcgd2FzIHRoYXQgaXQgaGVscHMgcGVvcGxlIHRvIGJl
Cj4gbGF6eSBhbmQgSSBhZ3JlZSB0aGF0IGluIHNvbWUgc2l0dWF0aW9ucyB3aGVuIGRldm1fY2xr
X2dldF9lbmFibGVkKCkgaXMgdXNlZCBpdAo+IHdvdWxkIGJlIG1vcmUgZWZmaWNpZW50IGFuZCBz
ZW5zaWJsZSB0byBjYXJlIHRvIG9ubHkgZW5hYmxlIHRoZSBjbGsgd2hlbiByZWFsbHkKPiBuZWVk
ZWQuCj4KPiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhlIGZ1bmN0aW9uIGlzIHJpZ2h0IGZvciBzb21l
IHVzZXJzLCBlLmcuIHRoZSB3YXRjaGRvZwo+IGRyaXZlcnMuIEZvciB0aGUgb3RoZXJzIGl0J3Mg
bm90IHNvIHNpbXBsZSB0byBqdWRnZS4gR2l2ZW4gdGhhdCB0aGVyZSBhcmUgYQo+IGxvdCBvZiBk
cml2ZXJzIHRoYXQgYXJlIGxhenkgZXZlbiBpZiBkb2luZyBzbyBpcyBzb21lIGVmZm9ydCAoaS5l
LiBjYWxsaW5nCj4gY2xrX3ByZXBhcmVfZW5hYmxlKCkgYW5kIGRldm1fYWRkX2FjdGlvbigpKSBj
b252aW5jZXMgbWUsIHRoYXQgaW50cm9kdWNpbmcgdGhlCj4gZnVuY3Rpb24gZmFtaWx5IGlzIHNl
bnNpYmxlLiAoQW5kIGlmIHlvdSB3YW50IHRvIHdvcmsgb24gdGhlc2UgZHJpdmVycywKPiBncmVw
cGluZyBmb3IgZGV2bV9jbGtfZ2V0X2VuYWJsZWQgZ2l2ZXMgeW91IGEgZmV3IGNhbmRpZGF0ZXMg
b25jZSB0aGUKPiBzZXJpZXMgaXMgaW4gOi0pCgpGV0lXLApSZXZpZXdlZC1ieTogQW5keSBTaGV2
Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgpmb3IgZHJpdmVycy9paW8KClRoYW5r
cyBmb3IgZG9pbmcgdGhpcyEKCj4gT3RoZXJ3aXNlIGxvb2tpbmcgYXQgdGhlIGRpZmZzdGF0IG9m
IHRoaXMgc2VyaWVzOgo+Cj4gIDQ4IGZpbGVzIGNoYW5nZWQsIDI1NyBpbnNlcnRpb25zKCspLCA4
NTEgZGVsZXRpb25zKC0pCj4KPiBpcyBxdWl0ZSBjb252aW5jaW5nLiBKdXN0IHRoZSBmaXJzdCB0
d28gcGF0Y2hlcyAod2hpY2ggaW50cm9kdWNlIHRoZSBuZXcKPiBmdW5jdGlvbnMpIGFjY291bnQg
Zm9yCj4KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNjkgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pCj4KPiAuIEEgcm91Z2ggdGhpcmQgb2YgdGhlIGFkZGVkIGxpbmVzIGlzIGRvY3VtZW50YXRp
b24uIFRoZSByZXN0IGlzIGRyaXZlcgo+IHVwZGF0ZXMgd2hpY2ggdGhlbiBoYXM6Cj4KPiAgNDYg
ZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKSwgODM0IGRlbGV0aW9ucygtKQo+Cj4gd2hp
Y2ggbWFrZXMgYSByZWFsbHkgbmljZSBjbGVhbnVwLgo+Cj4gVGhlIHNlcmllcyBpcyBidWlsZC10
ZXN0ZWQgb24gYXJtNjQsIG02OGssIHBvd2VycGMsIHJpc2N2LCBzMzkwLCBzcGFyYzY0Cj4gYW5k
IHg4Nl82NCB1c2luZyBhbiBhbGxtb2Rjb25maWcuCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPgo+
IFV3ZSBLbGVpbmUtS8O2bmlnICgxNik6Cj4gICBjbGs6IGdlbmVyYWxpemUgZGV2bV9jbGtfZ2V0
KCkgYSBiaXQKPiAgIGNsazogUHJvdmlkZSBuZXcgZGV2bV9jbGsgaGVscGVycyBmb3IgcHJlcGFy
ZWQgYW5kIGVuYWJsZWQgY2xvY2tzCj4gICBod21vbjogTWFrZSB1c2Ugb2YgZGV2bV9jbGtfZ2V0
X2VuYWJsZWQoKQo+ICAgaWlvOiBNYWtlIHVzZSBvZiBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpCj4g
ICBod3JuZzogbWVzb24gLSBEb24ndCBvcGVuLWNvZGUgZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2Vu
YWJsZWQoKQo+ICAgYnVzOiBidDE6IERvbid0IG9wZW4gY29kZSBkZXZtX2Nsa19nZXRfZW5hYmxl
ZCgpCj4gICBncGlvOiB2ZjYxMDogU2ltcGxpZnkgZXJyb3IgaGFuZGxpbmcgaW4gcHJvYmUKPiAg
IGRybS9tZXNvbjogZHctaGRtaTogRG9uJ3Qgb3BlbiBjb2RlIGRldm1fY2xrX2dldF9lbmFibGVk
KCkKPiAgIHJ0YzogaW5nZW5pYzogU2ltcGxpZnkgdXNpbmcgZGV2bV9jbGtfZ2V0X2VuYWJsZWQo
KQo+ICAgY2xrOiBtZXNvbjogYXhnLWF1ZGlvOiBEb24ndCBkdXBsaWNhdGUgZGV2bV9jbGtfZ2V0
X2VuYWJsZWQoKQo+ICAgd2F0Y2hkb2c6IE1ha2UgdXNlIG9mIGRldm1fY2xrX2dldF9lbmFibGVk
KCkKPiAgIHB3bTogYXRtZWw6IFNpbXBsaWZ5IHVzaW5nIGRldm1fY2xrX2dldF9wcmVwYXJlZCgp
Cj4gICBydGM6IGF0OTFzYW05OiBTaW1wbGlmeSB1c2luZyBkZXZtX2Nsa19nZXRfZW5hYmxlZCgp
Cj4gICBpMmM6IGlteDogU2ltcGxpZnkgdXNpbmcgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKQo+ICAg
c3BpOiBkYXZpbmNpOiBTaW1wbGlmeSB1c2luZyBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpCj4gICBk
bWFlbmdpbmU6IGxnbTogRml4IGVycm9yIGhhbmRsaW5nCj4KPiAgZHJpdmVycy9idXMvYnQxLWFw
Yi5jICAgICAgICAgICAgICAgICB8IDIzICstLS0tLS0KPiAgZHJpdmVycy9idXMvYnQxLWF4aS5j
ICAgICAgICAgICAgICAgICB8IDIzICstLS0tLS0KPiAgZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9t
ZXNvbi1ybmcuYyAgICB8IDIwICstLS0tLQo+ICBkcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMgICAg
ICAgICAgICAgIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvY2xr
L21lc29uL2F4Zy1hdWRpby5jICAgICAgICAgfCAzNiArKy0tLS0tLS0tCj4gIGRyaXZlcnMvZG1h
L2xnbS9sZ20tZG1hLmMgICAgICAgICAgICAgfCAgOCArLS0KPiAgZHJpdmVycy9ncGlvL2dwaW8t
dmY2MTAuYyAgICAgICAgICAgICB8IDQ1ICsrKy0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X2hkbWkuYyB8IDQ4ICsrKysrLS0tLS0tLS0tCj4gIGRyaXZlcnMvaHdt
b24vYXhpLWZhbi1jb250cm9sLmMgICAgICAgfCAxNSArLS0tLQo+ICBkcml2ZXJzL2h3bW9uL2x0
YzI5NDctY29yZS5jICAgICAgICAgIHwgMTcgKy0tLS0KPiAgZHJpdmVycy9od21vbi9tcjc1MjAz
LmMgICAgICAgICAgICAgICB8IDI2ICstLS0tLS0tCj4gIGRyaXZlcnMvaHdtb24vc3Bhcng1LXRl
bXAuYyAgICAgICAgICAgfCAxOSArLS0tLS0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgu
YyAgICAgICAgICB8IDEyICstLS0KPiAgZHJpdmVycy9paW8vYWRjL2FkNzEyNC5jICAgICAgICAg
ICAgICB8IDE1ICstLS0tCj4gIGRyaXZlcnMvaWlvL2FkYy9hZDc3NjgtMS5jICAgICAgICAgICAg
fCAxNyArLS0tLQo+ICBkcml2ZXJzL2lpby9hZGMvYWQ5NDY3LmMgICAgICAgICAgICAgIHwgMTcg
Ky0tLS0KPiAgZHJpdmVycy9paW8vYWRjL2luZ2VuaWMtYWRjLmMgICAgICAgICB8IDE1ICstLS0t
Cj4gIGRyaXZlcnMvaWlvL2FkYy9scGMxOHh4X2FkYy5jICAgICAgICAgfCAxOCArLS0tLQo+ICBk
cml2ZXJzL2lpby9hZGMvcm9ja2NoaXBfc2FyYWRjLmMgICAgIHwgNDQgKy0tLS0tLS0tLS0tCj4g
IGRyaXZlcnMvaWlvL2FkYy90aS1hZHMxMzFlMDguYyAgICAgICAgfCAxOSArLS0tLS0KPiAgZHJp
dmVycy9paW8vYWRjL3hpbGlueC1hbXMuYyAgICAgICAgICB8IDE1ICstLS0tCj4gIGRyaXZlcnMv
aWlvL2FkYy94aWxpbngteGFkYy1jb3JlLmMgICAgfCAxOCArLS0tLQo+ICBkcml2ZXJzL2lpby9m
cmVxdWVuY3kvYWRmNDM3MS5jICAgICAgIHwgMTcgKy0tLS0KPiAgZHJpdmVycy9paW8vZnJlcXVl
bmN5L2FkbXYxMDEzLmMgICAgICB8IDE1ICstLS0tCj4gIGRyaXZlcnMvaWlvL2ZyZXF1ZW5jeS9h
ZHJmNjc4MC5jICAgICAgfCAxNiArLS0tLQo+ICBkcml2ZXJzL2lpby9pbXUvYWRpczE2NDc1LmMg
ICAgICAgICAgIHwgMTUgKy0tLS0KPiAgZHJpdmVycy9wd20vcHdtLWF0bWVsLmMgICAgICAgICAg
ICAgICB8IDE2ICstLS0tCj4gIGRyaXZlcnMvcnRjL3J0Yy1hdDkxc2FtOS5jICAgICAgICAgICAg
fCAyMiArKy0tLS0KPiAgZHJpdmVycy9ydGMvcnRjLWp6NDc0MC5jICAgICAgICAgICAgICB8IDIx
ICstLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktZGF2aW5jaS5jICAgICAgICAgICAgIHwgMTEgKy0t
Cj4gIGRyaXZlcnMvd2F0Y2hkb2cvY2FkZW5jZV93ZHQuYyAgICAgICAgfCAxNyArLS0tLQo+ICBk
cml2ZXJzL3dhdGNoZG9nL2RhdmluY2lfd2R0LmMgICAgICAgIHwgMTggKy0tLS0KPiAgZHJpdmVy
cy93YXRjaGRvZy9pbWdwZGNfd2R0LmMgICAgICAgICB8IDMxICstLS0tLS0tLQo+ICBkcml2ZXJz
L3dhdGNoZG9nL2lteDJfd2R0LmMgICAgICAgICAgIHwgMTUgKy0tLS0KPiAgZHJpdmVycy93YXRj
aGRvZy9pbXg3dWxwX3dkdC5jICAgICAgICB8IDE1ICstLS0tCj4gIGRyaXZlcnMvd2F0Y2hkb2cv
bG9vbmdzb24xX3dkdC5jICAgICAgfCAxNyArLS0tLQo+ICBkcml2ZXJzL3dhdGNoZG9nL2xwYzE4
eHhfd2R0LmMgICAgICAgIHwgMzAgKy0tLS0tLS0tCj4gIGRyaXZlcnMvd2F0Y2hkb2cvbWVzb25f
Z3hiYl93ZHQuYyAgICAgfCAxNiArLS0tLQo+ICBkcml2ZXJzL3dhdGNoZG9nL29mX3hpbGlueF93
ZHQuYyAgICAgIHwgMTYgKy0tLS0KPiAgZHJpdmVycy93YXRjaGRvZy9waWMzMi1kbXQuYyAgICAg
ICAgICB8IDE1ICstLS0tCj4gIGRyaXZlcnMvd2F0Y2hkb2cvcGljMzItd2R0LmMgICAgICAgICAg
fCAxNyArLS0tLQo+ICBkcml2ZXJzL3dhdGNoZG9nL3BueDQwMDhfd2R0LmMgICAgICAgIHwgMTUg
Ky0tLS0KPiAgZHJpdmVycy93YXRjaGRvZy9xY29tLXdkdC5jICAgICAgICAgICB8IDE2ICstLS0t
Cj4gIGRyaXZlcnMvd2F0Y2hkb2cvcnRkMTE5eF93ZHQuYyAgICAgICAgfCAxNiArLS0tLQo+ICBk
cml2ZXJzL3dhdGNoZG9nL3N0X2xwY193ZHQuYyAgICAgICAgIHwgMTYgKy0tLS0KPiAgZHJpdmVy
cy93YXRjaGRvZy9zdG0zMl9pd2RnLmMgICAgICAgICB8IDMxICstLS0tLS0tLQo+ICBkcml2ZXJz
L3dhdGNoZG9nL3Zpc2NvbnRpX3dkdC5jICAgICAgIHwgMTggKy0tLS0KPiAgaW5jbHVkZS9saW51
eC9jbGsuaCAgICAgICAgICAgICAgICAgICB8IDkwICsrKysrKysrKysrKysrKysrKysrKysrKy0K
PiAgNDggZmlsZXMgY2hhbmdlZCwgMjU3IGluc2VydGlvbnMoKyksIDg1MSBkZWxldGlvbnMoLSkK
Pgo+Cj4gYmFzZS1jb21taXQ6IDA5Njg4YzAxNjZlNzZjZTJmYjg1ZTg2YjlkOTliZThiMDA4NGNk
ZjkKPiAtLQo+IDIuMzUuMQo+CgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVu
a28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
