Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC3DC636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fy61hDmAdztSpX/iAhr3xhYX9qzW9VKvwFA6SvFa/mA=; b=VCaOMS5WcOD48S
	LAqTsVAMDK8J0Jq0ceSSb7d8nEU+A8k56jgbHsWuzywwdhy7xS7BKKYiYkoqwhC6/sJ/3YdjcCe5U
	OlLgTOWXw8XjM66B5lIiz7cUUdSfob5867C1lawC5rClx9E83YLBvad/JCWcoe8yjTNBJIHGTLkcn
	/AkRUXAhSivA9rSMvAgEc4TQNdsN25AocBMp83Vx0WpYgQxQF/j9iWejnB7tl5TS5ktCY+8Plbd0f
	70Us0BrDCuQU3vBMJrjMqP/lxHofyZ8E2QqVQJqwB5gAuGMj22ZXBPLhJT3/GcMtC0CAKT45SSely
	4d+EqMBFHNl4cc47kpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP48N-009F7j-8I; Mon, 06 Feb 2023 16:14:23 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3o4-0095Rw-Me; Mon, 06 Feb 2023 15:53:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 635361C000A;
	Mon,  6 Feb 2023 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675698800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T+B3RCvnN/A9QkWUBTmslla6TsR6i6LzRlnEYAv5F3Q=;
	b=Qtjb3GZlond/VqhH1wI9WqFkUTwIx6Xv+zssCdcz0vlldDafEWSB06zZ//x0Ak5PkC5s9y
	ZxfUTza51NQilgjwYbUeD93lWl0YkGanyt4N/HQcJQmS+KroZcFE/xfTkRSM2sxsdcGf1f
	20SxBUIoivwiZ6s9aJ+ixE2geS9izQBcTC0BtnofMVoclnJKbVIB5QEvwsdQxDRVvnTztn
	mWfYNVZzBBsywzjxDjc3HnjZoENi2lYxasHSm8kpUEw2am/dKrdmudXoC8BSbNJ5qS4nRi
	XqyYsA8WsUcyWOY6WGG+PMMJLyhBUYj2TKKx+CBVhWfLPP7d+4gsOsJ9cAGaug==
Date: Mon, 6 Feb 2023 16:53:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael.j.wysocki@intel.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thara
 Gopinath <thara.gopinath@gmail.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund@ragnatech.se>, Bartlomiej Zolnierkiewicz
 <bzolnier@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 ye xingchen <ye.xingchen@zte.com.cn>, Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Haowen Bai <baihaowen@meizu.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-amlogic@lists.infradead.org
 (open list:THERMAL DRIVER FOR AMLOGIC SOCS),
 linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM
 BCM2711/BCM2835 ARM ARCHITECTURE), linux-arm-kernel@lists.infradead.org
 (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
 linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
 linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL
 DRIVERS), linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL
 DRIVER), linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE
 SUPPORT)
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
Message-ID: <20230206165311.0777ec69@xps-13>
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_075325_094407_15D82DA8 
X-CRM114-Status: GOOD (  18.79  )
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

SGkgRGFuaWVsLAoKZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZyB3cm90ZSBvbiBNb24sICA2IEZl
YiAyMDIzIDE2OjM0OjI5ICswMTAwOgoKPiBBcyB0aGUgbmFtZSBzdGF0ZXMgInRoZXJtYWxfY29y
ZS5oIiBpcyB0aGUgaGVhZGVyIGZpbGUgZm9yIHRoZSBjb3JlCj4gY29tcG9uZW50cyBvZiB0aGUg
dGhlcm1hbCBmcmFtZXdvcmsuCj4gCj4gVG9vIG1hbnkgZHJpdmVycyBhcmUgaW5jbHVkaW5nIGl0
LiBIb3BlZnVsbHkgdGhlIHJlY2VudCBjbGVhbnVwcwo+IGhlbHBlZCB0byBzZWxmIGVuY2Fwc3Vs
YXRlIHRoZSBjb2RlIGEgYml0IG1vcmUgYW5kIHByZXZlbnRlZCB0aGUKPiBkcml2ZXJzIHRvIG5l
ZWQgdGhpcyBoZWFkZXIuCj4gCj4gUmVtb3ZlIHRoaXMgaW5jbHVzaW9uIGluIGV2ZXJ5IHBsYWNl
IHdoZXJlIGl0IGlzIHBvc3NpYmxlLgo+IAo+IFNvbWUgb3RoZXIgZHJpdmVycyBkaWQgYSBjb25m
dXNpb24gd2l0aCB0aGUgY29yZSBoZWFkZXIgYW5kIHRoZSBvbmUKPiBleHBvcnRlZCBpbiBsaW51
eC90aGVybWFsLmguIFRoZXkgaW5jbHVkZSB0aGUgZm9ybWVyIGluc3RlYWQgb2YgdGhlCj4gbGF0
dGVyLiBUaGUgY2hhbmdlcyBhbHNvIGZpeCB0aGlzLgo+IAo+IFRoZSB0ZWdyYS9zb2N0aGVybSBk
cml2ZXIgc3RpbGwgcmVtYWlucyBhcyBpdCB1c2VzIGFuIGludGVybmFsCj4gZnVuY3Rpb24gd2hp
Y2ggbmVlZCB0byBiZSByZXBsYWNlZC4KPiAKPiBUaGUgSW50ZWwgSEZJIGRyaXZlciB1c2VzIHRo
ZSBuZXRsaW5rIGludGVybmFsIGZyYW1ld29yayBjb3JlIGFuZAo+IHNob3VsZCBiZSBjaGFuZ2Vk
IHRvIHByZXZlbnQgdG8gZGVhbCB3aXRoIHRoZSBpbnRlcm5hbHMuCj4gCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2VzCj4gCj4gWyBBcHBsaWVzIHRvIHRoZXJtYWwvbGludXgtbmV4dCBvciBsaW51eC1w
bS9saW51eC1uZXh0IF0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVs
LmxlemNhbm9AbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhl
cm1hbC5jICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL3RoZXJtYWwvYXJtYWRhX3RoZXJtYWwu
YyAgICAgICAgICAgIHwgMiAtLQoKRm9yIGFybWFkYV90aGVybWFsLmM6CgpSZXZpZXdlZC1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCj4gIGRyaXZlcnMvdGhl
cm1hbC9icm9hZGNvbS9iY20yODM1X3RoZXJtYWwuYyAgfCAxIC0KPiAgZHJpdmVycy90aGVybWFs
L2hpc2lfdGhlcm1hbC5jICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvdGhlcm1hbC9p
bXg4bW1fdGhlcm1hbC5jICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy90aGVybWFsL2lteF9z
Y190aGVybWFsLmMgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL3RoZXJtYWwvaW50ZWwvaW50
ZWxfaGZpLmMgICAgICAgICAgIHwgMyArKy0KPiAgZHJpdmVycy90aGVybWFsL3Fjb20vcWNvbS1z
cG1pLXRlbXAtYWxhcm0uYyB8IDEgLQo+ICBkcml2ZXJzL3RoZXJtYWwvcW9yaXFfdGhlcm1hbC5j
ICAgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvdGhlcm1hbC9yY2FyX2dlbjNfdGhlcm1hbC5j
ICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy90aGVybWFsL3NhbXN1bmcvZXh5bm9zX3RtdS5jICAg
ICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jICAgICAgICAg
ICAgfCAxIC0KPiAgZHJpdmVycy90aGVybWFsL3RlZ3JhL3RlZ3JhMzAtdHNlbnNvci5jICAgICB8
IDEgLQo+ICBkcml2ZXJzL3RoZXJtYWwvdW5pcGhpZXJfdGhlcm1hbC5jICAgICAgICAgIHwgMiAt
LQo+ICAxNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgYi9kcml2
ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiBpbmRleCBkMzBjYjc5MWU2M2MuLjkyMzVm
ZGE0ZWMxZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMK
PiArKysgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiBAQCAtMjgsNyArMjgs
NiBAQAo+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gICNpbmNsdWRlIDxsaW51eC90aGVy
bWFsLmg+Cj4gIAo+IC0jaW5jbHVkZSAidGhlcm1hbF9jb3JlLmgiCj4gICNpbmNsdWRlICJ0aGVy
bWFsX2h3bW9uLmgiCj4gIAo+ICAjZGVmaW5lIFRTRU5TT1JfQ0ZHX1JFRzEJCQkweDQKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
