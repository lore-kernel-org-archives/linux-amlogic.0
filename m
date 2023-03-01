Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13AAC6FA9D
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Mar 2023 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk9eNztnAa/wrTqrl8TeWrcL/c0VhO2x3tyeqS8M2tQ=; b=bgAk4nVJn+ByFk
	pw1SUVWFiNatWgWbC8Q6zkckbj1n/rqy7alzgjzIb1jOnipuAhubf+30jears3OIEjBlydEV5K4Lt
	fIahsCH6EF82iYFpIh76Tyx6MxLK9XRRO1MzZ+nfuroaM0ce8zi6qxgT7xePucQM69VjbkCrilLso
	wkEslIHMLXuKmFTa3gg/4IWBIJqXYDPPb6zubT6LFkhmCnGoyvRaHQpADQx2ce2Ca5oBpN3aoH0LC
	vVQgl29nwIKsWwht0zNzyej7G/py5OG2whcg1HvGSsHAmRQAwHHowS05UYtpCKejZryMrmQ3bMu3h
	wOtzXlg0YNpKaI78RgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPDC-00Gned-HK; Wed, 01 Mar 2023 16:21:50 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXPD8-00GndK-HG; Wed, 01 Mar 2023 16:21:48 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 321GKeV8065246;
	Wed, 1 Mar 2023 10:20:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677687640;
	bh=eJOulfBTO406+XJwSAbUrw3TOVKL7z76SdXOdRRvd8g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oITlJuKJL0Igo+Zp8Mw3to8q1ph1GEIt/d3yESZ3cer2ebuhWbdbMI3A5SmJvB3FN
	 V+iCTjreym1r6VJb2vPdvJYz95D6QkQDjk525lQPej2NRTUvuqozcO2ayatgFg+2/r
	 1bTPhJR/a6fqQcqeL9vlm4O3gnX/VFyNSv0aWTr0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 321GKeZv003448
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Mar 2023 10:20:40 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 1
 Mar 2023 10:20:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 1 Mar 2023 10:20:40 -0600
Received: from [10.250.235.39] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 321GKE84054644;
	Wed, 1 Mar 2023 10:20:15 -0600
Message-ID: <2493cf75-f78c-993a-01e6-8f89556973f0@ti.com>
Date: Wed, 1 Mar 2023 21:50:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 02/19] thermal/core: Use the thermal zone 'devdata'
 accessor in thermal located drivers
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, <rafael@kernel.org>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Balsam CHIHI
	<bchihi@baylibre.com>,
        Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        "Rafael J . Wysocki"
	<rafael.j.wysocki@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Guillaume La Roque <glaroque@baylibre.com>,
        Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Markus
 Mayer <mmayer@broadcom.com>,
        Support Opensource
	<support.opensource@diasemi.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha
 Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team
	<linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
	<niklas.soderlund@ragnatech.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Bartlomiej
 Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel
 Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Talel Shenhar <talel@amazon.com>,
        Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
        Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu
	<mhiramat@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stefan
 Wahren <stefan.wahren@i2se.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Zheng
 Yongjun <zhengyongjun3@huawei.com>,
        Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
        Kees Cook
	<keescook@chromium.org>,
        Shang XiaoJing <shangxiaojing@huawei.com>,
        Tim
 Zimmermann <tim@linux4.de>, Yang Li <yang.lee@linux.alibaba.com>,
        Jiang Jian
	<jiangjian@cdjrlc.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Johan Hovold
	<johan+linaro@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        "open
 list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
	<linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM
 BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:RENESAS R-CAR THERMAL DRIVERS"
	<linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support"
	<linux-rockchip@lists.infradead.org>,
        "open list:SAMSUNG THERMAL DRIVER"
	<linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "open list:ARM/Allwinner sunXi
 SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:TEGRA ARCHITECTURE
 SUPPORT" <linux-tegra@vger.kernel.org>,
        "open list:TI BANDGAP AND THERMAL
 DRIVER" <linux-omap@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
References: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
 <20230228112238.2312273-3-daniel.lezcano@linaro.org>
From: "Gole, Dhruva" <d-gole@ti.com>
Organization: Texas Instruments Incorporated
In-Reply-To: <20230228112238.2312273-3-daniel.lezcano@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_082146_664218_B4CCB93E 
X-CRM114-Status: GOOD (  20.57  )
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

Ck9uIDIvMjgvMjAyMyA0OjUyIFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBUaGUgdGhlcm1h
bCB6b25lIGRldmljZSBzdHJ1Y3R1cmUgaXMgZXhwb3NlZCB0byB0aGUgZGlmZmVyZW50IGRyaXZl
cnMKPiBhbmQgb2J2aW91c2x5IHRoZXkgYWNjZXNzIHRoZSBpbnRlcm5hbHMgd2hpbGUgdGhhdCBz
aG91bGQgYmUKPiByZXN0cmljdGVkIHRvIHRoZSBjb3JlIHRoZXJtYWwgY29kZS4KPgo+IEluIG9y
ZGVyIHRvIHNlbGYtZW5jYXBzdWxhdGUgdGhlIHRoZXJtYWwgY29yZSBjb2RlLCB3ZSBuZWVkIHRv
IHByZXZlbnQKPiB0aGUgZHJpdmVycyBhY2Nlc3NpbmcgZGlyZWN0bHkgdGhlIHRoZXJtYWwgem9u
ZSBzdHJ1Y3R1cmUgYW5kIHByb3ZpZGUKPiBhY2Nlc3NvciBmdW5jdGlvbnMgdG8gZGVhbCB3aXRo
Lgo+Cj4gVXNlIHRoZSBkZXZkYXRhIGFjY2Vzc29yIGludHJvZHVjZWQgaW4gdGhlIHByZXZpb3Vz
IHBhdGNoLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+Cj4gUmV2aWV3
ZWQtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kK3JlbmVzYXNAcmFnbmF0
ZWNoLnNlPiAjUi1DYXIKPiBBY2tlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3Jn
Pgo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiAjTWVkaWFUZWsgYXV4YWRjIGFuZCBsdnRzCj4g
UmV2aWV3ZWQtYnk6IEJhbHNhbSBDSElISSA8YmNoaWhpQGJheWxpYnJlLmNvbT4gI01lZGlhdGVr
IGx2dHMKPiBSZXZpZXdlZC1ieTogQWRhbSBXYXJkIDxETEctQWRhbS5XYXJkLm9wZW5zb3VyY2VA
ZG0ucmVuZXNhcy5jb20+ICNkYTkwNjIKPiBSZXZpZXdlZC1ieTogQmFvbGluIFdhbmcgPGJhb2xp
bi53YW5nQGxpbnV4LmFsaWJhYmEuY29tPiAgI3NwcmVhZAo+IEFja2VkLWJ5OiBKZXJuZWogU2ty
YWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPiAjc3VuOGlfdGhlcm1hbAo+IEFja2VkLWJ5
OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+Cj4gQWNrZWQt
Ynk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiAjQnJvYWRjb20KPiAt
LS0KPiAgZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy90aGVybWFsL2FybWFkYV90aGVybWFsLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3RoZXJtYWwvYnJvYWRjb20vYmNtMjcxMV90aGVy
bWFsLmMgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3RoZXJtYWwvYnJvYWRjb20vYmNtMjgz
NV90aGVybWFsLmMgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3RoZXJtYWwvYnJvYWRjb20v
YnJjbXN0Yl90aGVybWFsLmMgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvdGhlcm1hbC9i
cm9hZGNvbS9ucy10aGVybWFsLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdGhl
cm1hbC9icm9hZGNvbS9zci10aGVybWFsLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvdGhlcm1hbC9kYTkwNjItdGhlcm1hbC5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4g
IGRyaXZlcnMvdGhlcm1hbC9kYjg1MDBfdGhlcm1hbC5jICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIGRyaXZlcnMvdGhlcm1hbC9kb3ZlX3RoZXJtYWwuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4gIGRyaXZlcnMvdGhlcm1hbC9oaXNpX3RoZXJtYWwuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdGhlcm1hbC9pbXg4bW1fdGhlcm1hbC5jICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdGhlcm1hbC9pbXhfc2NfdGhlcm1hbC5j
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdGhlcm1hbC9pbXhfdGhlcm1h
bC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICAuLi4vdGhlcm1hbC9pbnRl
bC9pbnQzNDB4X3RoZXJtYWwvaW50MzQwMF90aGVybWFsLmMgfCAgMiArLQo+ICAuLi4vaW50ZWwv
aW50MzQweF90aGVybWFsL2ludDM0MHhfdGhlcm1hbF96b25lLmMgICAgfCAgNCArKy0tCj4gIC4u
Li9pbnQzNDB4X3RoZXJtYWwvcHJvY2Vzc29yX3RoZXJtYWxfZGV2aWNlX3BjaS5jICB8ICA0ICsr
LS0KPiAgZHJpdmVycy90aGVybWFsL2ludGVsL2ludGVsX3BjaF90aGVybWFsLmMgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy90aGVybWFsL2ludGVsL2ludGVsX3F1YXJrX2R0c190aGVybWFs
LmMgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9pbnRlbC9pbnRlbF9zb2NfZHRz
X2lvc2YuYyAgICAgICAgICB8IDEzICsrKysrLS0tLS0tLS0KPiAgZHJpdmVycy90aGVybWFsL2lu
dGVsL3g4Nl9wa2dfdGVtcF90aGVybWFsLmMgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3Ro
ZXJtYWwvazNfYmFuZGdhcC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2
ZXJzL3RoZXJtYWwvazNfajcyeHhfYmFuZGdhcC5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+
IFsuLi5dCj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvazNfYmFuZGdhcC5jIGIv
ZHJpdmVycy90aGVybWFsL2szX2JhbmRnYXAuYwo+IGluZGV4IDIyYzliY2I4OTljMy4uYjVjZDJj
ODVlMGMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC9rM19iYW5kZ2FwLmMKPiArKysg
Yi9kcml2ZXJzL3RoZXJtYWwvazNfYmFuZGdhcC5jCj4gQEAgLTE0MSw3ICsxNDEsNyBAQCBzdGF0
aWMgaW50IGszX2JncF9yZWFkX3RlbXAoc3RydWN0IGszX3RoZXJtYWxfZGF0YSAqZGV2ZGF0YSwK
PiAgCj4gIHN0YXRpYyBpbnQgazNfdGhlcm1hbF9nZXRfdGVtcChzdHJ1Y3QgdGhlcm1hbF96b25l
X2RldmljZSAqdHosIGludCAqdGVtcCkKPiAgewo+IC0Jc3RydWN0IGszX3RoZXJtYWxfZGF0YSAq
ZGF0YSA9IHR6LT5kZXZkYXRhOwo+ICsJc3RydWN0IGszX3RoZXJtYWxfZGF0YSAqZGF0YSA9IHRo
ZXJtYWxfem9uZV9kZXZpY2VfcHJpdih0eik7CgpSZXZpZXdlZC1ieTogRGhydXZhIEdvbGUgPGQt
Z29sZUB0aS5jb20+CgoKPiAgCWludCByZXQgPSAwOwo+ICAKPiAgCXJldCA9IGszX2JncF9yZWFk
X3RlbXAoZGF0YSwgdGVtcCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9rM19qNzJ4
eF9iYW5kZ2FwLmMgYi9kcml2ZXJzL3RoZXJtYWwvazNfajcyeHhfYmFuZGdhcC5jCj4gaW5kZXgg
MDMxZWExMDkxOTA5Li41YmUxZjA5ZWViMmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90aGVybWFs
L2szX2o3Mnh4X2JhbmRnYXAuYwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9rM19qNzJ4eF9iYW5k
Z2FwLmMKPiBAQCAtMjQ4LDcgKzI0OCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGszX2JncF9yZWFk
X3RlbXAoc3RydWN0IGszX3RoZXJtYWxfZGF0YSAqZGV2ZGF0YSwKPiAgLyogR2V0IHRlbXBlcmF0
dXJlIGNhbGxiYWNrIGZ1bmN0aW9uIGZvciB0aGVybWFsIHpvbmUgKi8KPiAgc3RhdGljIGludCBr
M190aGVybWFsX2dldF90ZW1wKHN0cnVjdCB0aGVybWFsX3pvbmVfZGV2aWNlICp0eiwgaW50ICp0
ZW1wKQo+ICB7Cj4gLQlyZXR1cm4gazNfYmdwX3JlYWRfdGVtcCh0ei0+ZGV2ZGF0YSwgdGVtcCk7
Cj4gKwlyZXR1cm4gazNfYmdwX3JlYWRfdGVtcCh0aGVybWFsX3pvbmVfZGV2aWNlX3ByaXYodHop
LCB0ZW1wKTsKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCB0aGVybWFsX3pvbmVfZGV2
aWNlX29wcyBrM19vZl90aGVybWFsX29wcyA9IHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVy
bWFsL2tpcmt3b29kX3RoZXJtYWwuYyBiL2RyaXZlcnMvdGhlcm1hbC9raXJrd29vZF90aGVybWFs
LmMKPiBpbmRleCBiZWM3ZWMyMGU3OWQuLjkyYjNjZTQyNmI5ZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3RoZXJtYWwva2lya3dvb2RfdGhlcm1hbC5jCj4gKysrIGIvZHJpdmVycy90aGVybWFsL2tp
cmt3b29kX3RoZXJtYWwuYwo+IEBAIC0yNyw3ICsyNyw3IEBAIHN0YXRpYyBpbnQga2lya3dvb2Rf
Z2V0X3RlbXAoc3RydWN0IHRoZXJtYWxfem9uZV9kZXZpY2UgKnRoZXJtYWwsCj4gIAkJCSAgaW50
ICp0ZW1wKQo+ICB7Cj4gIAl1bnNpZ25lZCBsb25nIHJlZzsKPiAtCXN0cnVjdCBraXJrd29vZF90
aGVybWFsX3ByaXYgKnByaXYgPSB0aGVybWFsLT5kZXZkYXRhOwo+ICsJc3RydWN0IGtpcmt3b29k
X3RoZXJtYWxfcHJpdiAqcHJpdiA9IHRoZXJtYWxfem9uZV9kZXZpY2VfcHJpdih0aGVybWFsKTsK
PiAgCj4gIAlyZWcgPSByZWFkbF9yZWxheGVkKHByaXYtPnNlbnNvcik7Cj4gIAo+IFsuLi5dCgot
LSAKUmVnYXJkcywKRGhydXZhIEdvbGUgPGQtZ29sZUB0aS5jb20+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
