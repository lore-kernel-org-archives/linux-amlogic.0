Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BDFEB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jul 2023 17:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQmaomqA1vwQkL4+DN3dPf20v9Y0z9X9c00BS8Vx/dU=; b=ZV/8//D3SKeu/U
	ntuKm/37n9HISAF+aIOCf1wV/VmTiiIf99NoXdn/FC0iAaaSJuWvFltQMDwKxN5cYaaNS6abPtRfj
	jsoAbSWP45K198IxmziCrW8RP9GlxHX8+GcUxyj2g42EBU9sAwuA//foQDWc5v+obhqEeTF78pwXP
	5v69h+8YZMrbQZB7GOJj0JkOLzrPR9+hwtrxyX0w9moyYbqUbXoevCLDqWyqeB5BpGrq7SK15XT1Q
	dH+G9apiHUOgaFJCy0Cm+Qhdm6AIgmFKMp1c18/wqfEQmcxOpv5sU5MFBAV64U4pydkdiF6+ANYo/
	a1gP9duF8nudjUHh//6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLSJI-004ibw-0U;
	Mon, 17 Jul 2023 17:47:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLSJD-004ib4-1Z;
	Mon, 17 Jul 2023 17:46:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C64D56119D;
	Mon, 17 Jul 2023 17:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396C2C433C7;
	Mon, 17 Jul 2023 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689616014;
	bh=aTPuf0Zd8OpbwoKQZ65jJYeSg9DTodI+njCE2/27PY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fBMcwhUNcM0V4autvJVgcKQnhFbO7brLAEesnhEzKxTvyYBZsqjwc+cojOZv8v9UC
	 C1fFtr+snZnoCQBuIjCC+uqbL1txzClbWIi6/Eqa6m+4RGip54iRnMoz47f6udL2oG
	 QgKwwUVcwaxROldmVq5NNT3ndThlYFno/GItwYo30sXRqpZ3vtfi8rmQeHUZPSZsw8
	 nBomaa0tVX346pR41e0rqob0iI2Yo27n4Om1YAlYa9235UCWZuLT6xOi/p3K5HKm5U
	 yiAaqVLPCkUZKmnHgR84LUxhUnkrP+Q15V/RcRNk1rR8kEkcW0/GgWyopYhnj8btQ/
	 HW5N4J95bcJrg==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so50625105e9.2;
        Mon, 17 Jul 2023 10:46:54 -0700 (PDT)
X-Gm-Message-State: ABy/qLZj84McdCCpu730JQslSYj3S50OyufHJzDyK61slatmDBr0f8c7
	mbgi6LhX9Bqc2LSMpBCiK5Z7Ia4AXQnH5fKyEQ==
X-Google-Smtp-Source: APBJJlEaii1O/P4FM3AIiFrxrm+c2/2j2dMof6/ew372YwZ9YuuOJ20F60zHYXA1FfdAlxaKv4uhiryEoY4fwMAMSwI=
X-Received: by 2002:a2e:7a1a:0:b0:2b5:bc27:d6eb with SMTP id
 v26-20020a2e7a1a000000b002b5bc27d6ebmr8861286ljc.8.1689615991907; Mon, 17 Jul
 2023 10:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174745.4060260-1-robh@kernel.org>
In-Reply-To: <20230714174745.4060260-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 11:46:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+H5jcTfuAdE=XvcWP+Td3xn9hdq1QA3HKouPJDaedwYg@mail.gmail.com>
Message-ID: <CAL_Jsq+H5jcTfuAdE=XvcWP+Td3xn9hdq1QA3HKouPJDaedwYg@mail.gmail.com>
Subject: Re: [PATCH] mmc: Explicitly include correct DT includes
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Robert Richter <rric@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Vignesh Raghavendra <vigneshr@ti.com>, 
	Ben Dooks <ben-linux@fluff.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_104655_664628_27AE4BD1 
X-CRM114-Status: GOOD (  15.25  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTE6NDjigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBk
YXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0
IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiBBcyBwYXJ0IG9mIHRo
YXQgbWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQgMTMgeWVhcnMgYWdvLCB0aGV5Cj4gInRl
bXBvcmFyaWx5IiBpbmNsdWRlIGVhY2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3Jt
X2RldmljZS5oCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2gg
cmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gZmlsZXMgdXNlZCB0aHJvdWdob3V0IHRoZSB0
cmVlLiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBoZWFkZXJzIGFuZAo+IHJlcGxhY2UgdGhl
IGltcGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0
bwo+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRlcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbW1j
L2hvc3QvYXRtZWwtbWNpLmMgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21tYy9o
b3N0L2Nhdml1bS1vY3Rlb24uYyAgICAgICAgICAgICAgfCAyICsrCj4gIGRyaXZlcnMvbW1jL2hv
c3QvY2F2aXVtLXRodW5kZXJ4LmMgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL21tYy9ob3N0
L2RhdmluY2lfbW1jLmMgICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tbWMvaG9zdC9t
ZXNvbi1neC1tbWMuYyAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21tYy9ob3N0L210
ay1zZC5jICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9tbWMvaG9zdC9t
eGNtbWMuYyAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvbW1jL2hvc3QvbXhz
LW1tYy5jICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21tYy9ob3N0L293bC1t
bWMuYyAgICAgICAgICAgICAgICAgICAgfCAzICsrLQo+ICBkcml2ZXJzL21tYy9ob3N0L3B4YW1j
aS5jICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tbWMvaG9zdC9yZW5lc2Fz
X3NkaGlfaW50ZXJuYWxfZG1hYy5jIHwgMyArKy0KPiAgZHJpdmVycy9tbWMvaG9zdC9yZW5lc2Fz
X3NkaGlfc3lzX2RtYWMuYyAgICAgIHwgMyArKy0KPiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1i
Y20ta29uYS5jICAgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktY2Fk
ZW5jZS5jICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1lc2Ro
Yy1pbXguYyAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLWlwcm9j
LmMgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktbXNtLmMg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hcmFz
YW4uYyAgICAgICAgICAgIHwgMyArKy0KCk5vdCB2aXNpYmxlIGluIHRoZSBkaWZmLCBidXQgdGhl
cmUncyBhIGRvdWJsZSBpbmNsdWRlIG9mIG9mLmguIHYyIGNvbWluZy4KCj4gIGRyaXZlcnMvbW1j
L2hvc3Qvc2RoY2ktb2YtYXQ5MS5jICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tbWMv
aG9zdC9zZGhjaS1vZi1kd2Ntc2hjLmMgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21tYy9o
b3N0L3NkaGNpLW9mLXNwYXJ4NS5jICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbW1jL2hv
c3Qvc2RoY2ktb21hcC5jICAgICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21tYy9ob3N0
L3NkaGNpLXB4YXYyLmMgICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tbWMvaG9zdC9z
ZGhjaS1zM2MuYyAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvbW1jL2hvc3Qvc2Ro
Y2ktc3ByZC5jICAgICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNp
LXRlZ3JhLmMgICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tbWMvaG9zdC9zaF9tbWNp
Zi5jICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvbW1jL2hvc3QvdW5pcGhpZXIt
c2QuYyAgICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21tYy9ob3N0L3dtdC1zZG1tYy5j
ICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgMjkgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKSwgMjkgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
