Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907CDC001B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ao1kWuQE4kRH+cWAi55zH/XffLC63JC0wr0xTL+X1s=; b=KweqqxrOGqk6NC
	NRpYCgAWws2cMIJoXt2KSmvoDWda+gfJoO/LseZCk0gm08KFQ7S2evuKpBCYFend0+uRvxVSvBiWs
	3eKxkmDXIpcRZG1Xh6VcALsKutpDpmnrmcb6ZceFfxZ9gFqA6aIqIjrUkZD+BfuxN3XlFY3agTHWd
	iSEB9BP2Mn88KW6jcwVpC6SNyjmJjgfnvsyULuNzr037LIQ2IcTCAWpBzUw2oQ8HvtMGEP9JYMab8
	juBsEfz1VwnASzaPOdYBPGiuaHFA0OtRPJByhlUtS0Hr3xZc9TDEUcs5w/Ox3z7T1DtVDVdDMxO0G
	FiHZ6a8rZ0vjFMBliZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCBe-008Yhc-0n;
	Wed, 19 Jul 2023 18:46:10 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCBa-008Yfc-0f
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Jul 2023 18:46:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fba86f069bso11964328e87.3
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Jul 2023 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1689792361; x=1692384361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
        b=PNHMPmfGkc1gL3s+kuZsOV06iS0AVcua9wceAmdSEpVaau8usQXOmlxuVajPoqahSZ
         oXCeyXW3i7qO4gPQC3/B5Lo5Eqmi2HM4U13eYxzJby4ZFd5uR2kFc8wjOiArIEd55PBA
         FeCJue+xZBMErbY8RHL9QpZivP+scZ+Uhv+xiPlfw+QmU/c+xu8cJYkIrMEc/MG7elAK
         qWZ83FR4V9wLcNgcODc1mJlKxSJnwdLewAg5rcPN0PhCf2e09w5V1Bp1xL5H141MnfFQ
         Zld3xPSZJnzYVXtM2wQmsSZTU5Qt4Z0CaW8ampG4BzUMYrnqq3UfbUoP7KRh6XWbjalG
         17Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689792361; x=1692384361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
        b=l4h4VJvjaGDR5Oyfoq7Y0UuxuLyWD2VnB663xU5qFcacvxKcf2gaBR3sVXOOBfb/Tk
         aeI4ZEUzJtqwhC5H2hP7YIafaNlz9U+ZSi4W60zJiGS7UFHJ7kt1OW6IN0eBY0U6DBWv
         AYrUfuciBVr05Fp+z0tARHu1T4TvqwWpQ2K/bYk3aPlNCqeXHvL34Kd2rABrtOSsvdGK
         UMhVp6VBDw3dNY66P+No4NyRZVZS0RcCL7FH1q1cLnyNaxrL+uZL4e6pS8I3Lc23BLCH
         +wiPBpkyoku0JvdTvF1NKnpaUxiKbhgLRcZ5ZK+n+vNhYQ8MZUt+gg1K7JXEDTl4QSNX
         YWfg==
X-Gm-Message-State: ABy/qLbnhjgogC3UKGFitGnpN7nSKbumsDK1iu112q1N+nr2WOuIP32J
	LclGITtsl76S22DaFGjya8sY7iiUUYaL34NNkYpahihV
X-Google-Smtp-Source: APBJJlFtrWyQNURr4DI24Yfx+KhHtEnbcs8mZXCEdNLSvmMP4IixrdRQLU+06NloRR7Z4XxkYEDlqQ==
X-Received: by 2002:a05:6512:250f:b0:4fb:8de9:ac0e with SMTP id be15-20020a056512250f00b004fb8de9ac0emr607490lfb.1.1689792361237;
        Wed, 19 Jul 2023 11:46:01 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id m8-20020ac24248000000b004fbad6bc93dsm1057209lfl.136.2023.07.19.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 11:46:00 -0700 (PDT)
Date: Wed, 19 Jul 2023 20:45:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Rob Herring <robh@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Matt Ranostay <matt.ranostay@konsulko.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>, Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krz ysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>, Sean Young <sean@mess.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] media: Explicitly include correct DT includes
Message-ID: <ZLgvZ2ao1tgrRlFu@oden.dyn.berto.se>
References: <20230718143118.1065743-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718143118.1065743-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_114606_462978_3CD2A5DD 
X-CRM114-Status: GOOD (  13.17  )
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

SGkgUm9iLAoKT24gMjAyMy0wNy0xOCAwODozMToxNCAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6
Cj4gVGhlIERUIG9mX2RldmljZS5oIGFuZCBvZl9wbGF0Zm9ybS5oIGRhdGUgYmFjayB0byB0aGUg
c2VwYXJhdGUKPiBvZl9wbGF0Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8g
dGhlIHJlZ3VsYXIgcGxhdGZvcm0gYnVzLgo+IEFzIHBhcnQgb2YgdGhhdCBtZXJnZSBwcmVwcGlu
ZyBBcm0gRFQgc3VwcG9ydCAxMyB5ZWFycyBhZ28sIHRoZXkKPiAidGVtcG9yYXJpbHkiIGluY2x1
ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNvIGluY2x1ZGUgcGxhdGZvcm1fZGV2aWNlLmgKPiBhbmQg
b2YuaC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCByYW5kb20gbWl4IG9mIHRo
b3NlIGluY2x1ZGUKPiBmaWxlcyB1c2VkIHRocm91Z2hvdXQgdGhlIHRyZWUuIEluIG9yZGVyIHRv
IGRldGFuZ2xlIHRoZXNlIGhlYWRlcnMgYW5kCj4gcmVwbGFjZSB0aGUgaW1wbGljaXQgaW5jbHVk
ZXMgd2l0aCBzdHJ1Y3QgZGVjbGFyYXRpb25zLCB1c2VycyBuZWVkIHRvCj4gZXhwbGljaXRseSBp
bmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gdjI6Cj4gLSBGaXggZG91YmxlIGluY2x1ZGUg
b2Ygb2YuaAo+IC0tLQoKRm9yLAoKPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3Jj
YXItaXNwLmMgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9yZW5lc2FzL3JjYXItdmluL3JjYXItY29yZS5jICAgICAgICAgICB8IDEgLQo+ICBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhci12aW4vcmNhci1jc2kyLmMgICAgICAgICAg
IHwgMSAtCgpSZXZpZXdlZC1ieTogTmlrbGFzIFPDtmRlcmx1bmQgPG5pa2xhcy5zb2Rlcmx1bmRA
cmFnbmF0ZWNoLnNlPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
