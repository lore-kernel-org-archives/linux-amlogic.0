Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D01C7EE2D
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 16:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umcLn7ndXP0NgPJRGtAZPB/kIW9+UZPyo1FLEPUD0/4=; b=X4VQntw2j3pV6q
	YgJ/tkDNnnUpGuEwMfgQTPuqwzErRDmlK+azGXaJTkhEylRQSn4j7fqkqAHiOUOkSKizV0gAvHpf8
	cMi5ol6D42E9T6G1O1EUMHrVzWBkpDqfXybMmpXtu/oenx4dOSJclPwdUpbn0T/eJRpB0qWJOU9HK
	ephT071r/LF7FT9nqwKGRD/wreH9qTKnGLTx8yTQUCeQzl/HGoM7NWzclYOubVF8ybQnZmjsMypzJ
	eoQ5dJitOP1Cr3TFHSD3fzeTp3E/CNuiWuhHFYsRacwms3gIhGGFID4quJu7wBGSUJKVAQY54OjCq
	twUYPIC2bs9MjIi3RhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY8AY-006np3-DY; Fri, 03 Mar 2023 16:22:06 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY8AT-006nmX-Rw; Fri, 03 Mar 2023 16:22:04 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 04 Mar 2023 01:21:52 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id EE1632058442;
	Sat,  4 Mar 2023 01:21:51 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Sat, 4 Mar 2023 01:21:51 +0900
Received: from [10.212.156.241] (unknown [10.212.156.241])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 60F9D25528;
	Sat,  4 Mar 2023 01:21:44 +0900 (JST)
Message-ID: <acb7d81e-69d5-ff1b-aa0b-709c8c56010b@socionext.com>
Date: Sat, 4 Mar 2023 01:21:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 02/18] thermal/core: Use the thermal zone 'devdata'
 accessor in thermal located drivers
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mark Brown <broonie@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Dhruva Gole <d-gole@ti.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
 "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
 Shang XiaoJing <shangxiaojing@huawei.com>, Tim Zimmermann <tim@linux4.de>,
 Yang Li <yang.lee@linux.alibaba.com>, Jiang Jian <jiangjian@cdjrlc.com>,
 Daniel Golle <daniel@makrotopia.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ido Schimmel <idosch@nvidia.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Johan Hovold <johan+linaro@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
 <20230301201446.3713334-3-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20230301201446.3713334-3-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_082202_022457_66A0657F 
X-CRM114-Status: GOOD (  16.03  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAyMy8wMy8wMiA1OjE0LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBUaGUgdGhlcm1hbCB6
b25lIGRldmljZSBzdHJ1Y3R1cmUgaXMgZXhwb3NlZCB0byB0aGUgZGlmZmVyZW50IGRyaXZlcnMK
PiBhbmQgb2J2aW91c2x5IHRoZXkgYWNjZXNzIHRoZSBpbnRlcm5hbHMgd2hpbGUgdGhhdCBzaG91
bGQgYmUKPiByZXN0cmljdGVkIHRvIHRoZSBjb3JlIHRoZXJtYWwgY29kZS4KPiAKPiBJbiBvcmRl
ciB0byBzZWxmLWVuY2Fwc3VsYXRlIHRoZSB0aGVybWFsIGNvcmUgY29kZSwgd2UgbmVlZCB0byBw
cmV2ZW50Cj4gdGhlIGRyaXZlcnMgYWNjZXNzaW5nIGRpcmVjdGx5IHRoZSB0aGVybWFsIHpvbmUg
c3RydWN0dXJlIGFuZCBwcm92aWRlCj4gYWNjZXNzb3IgZnVuY3Rpb25zIHRvIGRlYWwgd2l0aC4K
PiAKPiBVc2UgdGhlIGRldmRhdGEgYWNjZXNzb3IgaW50cm9kdWNlZCBpbiB0aGUgcHJldmlvdXMg
cGF0Y2guCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+IFJldmll
d2VkLWJ5OiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25h
dGVjaC5zZT4gI1ItQ2FyCj4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9y
Zz4KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8KPiA8YW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiAjTWVkaWFUZWsgYXV4YWRjIGFuZCBsdnRz
Cj4gUmV2aWV3ZWQtYnk6IEJhbHNhbSBDSElISSA8YmNoaWhpQGJheWxpYnJlLmNvbT4gI01lZGlh
dGVrIGx2dHMKPiBSZXZpZXdlZC1ieTogQWRhbSBXYXJkIDxETEctQWRhbS5XYXJkLm9wZW5zb3Vy
Y2VAZG0ucmVuZXNhcy5jb20+ICNkYTkwNjIKPiBSZXZpZXdlZC1ieTogQmFvbGluIFdhbmcgPGJh
b2xpbi53YW5nQGxpbnV4LmFsaWJhYmEuY29tPiAgI3NwcmVhZAo+IEFja2VkLWJ5OiBKZXJuZWog
U2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPiAjc3VuOGlfdGhlcm1hbAo+IEFja2Vk
LWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+Cj4gQWNr
ZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiAjQnJvYWRjb20K
PiBSZXZpZXdlZC1ieTogRGhydXZhIEdvbGUgPGQtZ29sZUB0aS5jb20+ICMgSzMgYmFuZGdhcAoK
KHNuaXApCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvdW5pcGhpZXJfdGhlcm1hbC5j
Cj4gYi9kcml2ZXJzL3RoZXJtYWwvdW5pcGhpZXJfdGhlcm1hbC5jCj4gaW5kZXggNDc4MDE4NDFi
M2Y1Li5hZWY2MTE5Y2MwMDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90aGVybWFsL3VuaXBoaWVy
X3RoZXJtYWwuYwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC91bmlwaGllcl90aGVybWFsLmMKPiBA
QCAtMTg3LDcgKzE4Nyw3IEBAIHN0YXRpYyB2b2lkIHVuaXBoaWVyX3RtX2Rpc2FibGVfc2Vuc29y
KHN0cnVjdAo+IHVuaXBoaWVyX3RtX2RldiAqdGRldikKPiAKPiAgIHN0YXRpYyBpbnQgdW5pcGhp
ZXJfdG1fZ2V0X3RlbXAoc3RydWN0IHRoZXJtYWxfem9uZV9kZXZpY2UgKnR6LCBpbnQKPiAqb3V0
X3RlbXApCj4gICB7Cj4gLQlzdHJ1Y3QgdW5pcGhpZXJfdG1fZGV2ICp0ZGV2ID0gdHotPmRldmRh
dGE7Cj4gKwlzdHJ1Y3QgdW5pcGhpZXJfdG1fZGV2ICp0ZGV2ID0gdGhlcm1hbF96b25lX2Rldmlj
ZV9wcml2KHR6KTsKClJldmlld2VkLWJ5OiBLdW5paGlrbyBIYXlhc2hpIDxoYXlhc2hpLmt1bmlo
aWtvQHNvY2lvbmV4dC5jb20+ICN1bmlwaGllcgoKVGhhbmsgeW91LAoKLS0tCkJlc3QgUmVnYXJk
cwpLdW5paGlrbyBIYXlhc2hpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
