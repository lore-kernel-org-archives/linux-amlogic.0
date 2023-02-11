Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A0CC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zno0vnVYNubck9lVLYPwiD9R7X8ZH3n+cPxIoX+iVVw=; b=Ri59RQtl3B5cE3
	qBymlRqkf59oEfX0WODqq7XMYqgGAbjcEra7pu0gnjtxAoH1qAYkWzSqmt3Dl9apQrhyx7KB7QUnq
	i59+V/TI56nPlLC7ikzuohDo785WJaBl7amwKWVrr+ioQm4zKFlX4tKxKyIf0COlKlg+NCJQ77rBH
	LVC7qVF4lYCo4A0AR7KMkxqFckbVax2y2snMLvfFI4fuyznB323l2MkGBn9+YNha1hAAC2zrWdk0D
	ZM8IYeVnnNi5F/exJcUh/NDfBe4Mslgbaf/A5D3rgIV6ByLMbfJBYm8h650VaYyyMqyGrB0JVB7do
	563h7CiSllpvUxyXwg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQsoQ-009uq5-Nd; Sat, 11 Feb 2023 16:33:18 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQsoH-009uoj-UQ; Sat, 11 Feb 2023 16:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676133189; x=1707669189;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=OMMsvl+bUPjHIfFs5mz9bCDS3SOP8YrQweMO/MZJftc=;
  b=PN0Tfy78R66OIvOn6P8TC1GowEta3xiCAB6/GPJj7Y3i5fsqmqI0+zCE
   BZiQf4ObhR7TBE5RIXxfV4qUMiE6oIORb5EJSp40ne/wrFQEPc1joT6pQ
   lem4p6DGi68Uc0qVNXQwCusUY6pXwms9z6NHTopVKDy9eg5/U+HUUYQqb
   VNwkuPvlLPX+hVVptU4kF9l+KeR7zTErOJXfZFcG6wwL1mO0IH56Om4KU
   +kIrQvv9S1XcMmLQ+1F0fhH3qrNnl29B9+NoseYB02TV2vNFugc0VJUzF
   +E2wiEgfAiFfGiaMlFgIKAjWN9HCkiW7hu1LV+4UfSVdjgi4dKqv5Zt03
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="314267322"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="314267322"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 08:33:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="732029288"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="732029288"
Received: from ajaymv-mobl1.gar.corp.intel.com ([10.215.205.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 08:32:51 -0800
Message-ID: <258dedb542d4dcb73e9ec903d205ba64639c9f0a.camel@linux.intel.com>
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Ricardo Neri
	 <ricardo.neri-calderon@linux.intel.com>
Cc: rafael.j.wysocki@intel.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thara
 Gopinath <thara.gopinath@gmail.com>,  Niklas =?ISO-8859-1?Q?S=F6derlund?=
 <niklas.soderlund@ragnatech.se>, Bartlomiej Zolnierkiewicz
 <bzolnier@gmail.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 ye xingchen <ye.xingchen@zte.com.cn>, Haowen Bai <baihaowen@meizu.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, "open list:THERMAL DRIVER FOR AMLOGIC
 SOCS" <linux-amlogic@lists.infradead.org>, "moderated list:BROADCOM
 BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/QUALCOMM SUPPORT"
 <linux-arm-msm@vger.kernel.org>, "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>, "open list:SAMSUNG THERMAL DRIVER"
 <linux-samsung-soc@vger.kernel.org>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, "open list:TEGRA
 ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Date: Sat, 11 Feb 2023 08:32:48 -0800
In-Reply-To: <9a121d43-b6d9-fe99-1e4c-498dac2e6b17@linaro.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
	 <20230211021023.GA13306@ranerica-svr.sc.intel.com>
	 <9a121d43-b6d9-fe99-1e4c-498dac2e6b17@linaro.org>
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_083310_099308_1EE575C8 
X-CRM114-Status: GOOD (  23.07  )
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

T24gU2F0LCAyMDIzLTAyLTExIGF0IDA4OjUzICswMTAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToK
PiBPbiAxMS8wMi8yMDIzIDAzOjEwLCBSaWNhcmRvIE5lcmkgd3JvdGU6Cj4gPiBPbiBNb24sIEZl
YiAwNiwgMjAyMyBhdCAwNDozNDoyOVBNICswMTAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiA+
ID4gQXMgdGhlIG5hbWUgc3RhdGVzICJ0aGVybWFsX2NvcmUuaCIgaXMgdGhlIGhlYWRlciBmaWxl
IGZvciB0aGUKPiA+ID4gY29yZQo+ID4gPiBjb21wb25lbnRzIG9mIHRoZSB0aGVybWFsIGZyYW1l
d29yay4KPiA+ID4gCj4gPiA+IFRvbyBtYW55IGRyaXZlcnMgYXJlIGluY2x1ZGluZyBpdC4gSG9w
ZWZ1bGx5IHRoZSByZWNlbnQgY2xlYW51cHMKPiA+ID4gaGVscGVkIHRvIHNlbGYgZW5jYXBzdWxh
dGUgdGhlIGNvZGUgYSBiaXQgbW9yZSBhbmQgcHJldmVudGVkIHRoZQo+ID4gPiBkcml2ZXJzIHRv
IG5lZWQgdGhpcyBoZWFkZXIuCj4gPiA+IAo+ID4gPiBSZW1vdmUgdGhpcyBpbmNsdXNpb24gaW4g
ZXZlcnkgcGxhY2Ugd2hlcmUgaXQgaXMgcG9zc2libGUuCj4gPiA+IAo+ID4gPiBTb21lIG90aGVy
IGRyaXZlcnMgZGlkIGEgY29uZnVzaW9uIHdpdGggdGhlIGNvcmUgaGVhZGVyIGFuZCB0aGUKPiA+
ID4gb25lCj4gPiA+IGV4cG9ydGVkIGluIGxpbnV4L3RoZXJtYWwuaC4gVGhleSBpbmNsdWRlIHRo
ZSBmb3JtZXIgaW5zdGVhZCBvZgo+ID4gPiB0aGUKPiA+ID4gbGF0dGVyLiBUaGUgY2hhbmdlcyBh
bHNvIGZpeCB0aGlzLgo+ID4gPiAKPiA+ID4gVGhlIHRlZ3JhL3NvY3RoZXJtIGRyaXZlciBzdGls
bCByZW1haW5zIGFzIGl0IHVzZXMgYW4gaW50ZXJuYWwKPiA+ID4gZnVuY3Rpb24gd2hpY2ggbmVl
ZCB0byBiZSByZXBsYWNlZC4KPiA+ID4gCj4gPiA+IFRoZSBJbnRlbCBIRkkgZHJpdmVyIHVzZXMg
dGhlIG5ldGxpbmsgaW50ZXJuYWwgZnJhbWV3b3JrIGNvcmUgYW5kCj4gPiA+IHNob3VsZCBiZSBj
aGFuZ2VkIHRvIHByZXZlbnQgdG8gZGVhbCB3aXRoIHRoZSBpbnRlcm5hbHMuCj4gPiAKPiA+IEkg
ZG9uJ3Qgc2VlIGFueSBvZiB0aGUgdGhlcm1hbCBuZXRsaW5rIGZ1bmN0aW9uYWxpdHkgZXhwb3Nl
ZC4gSXMKPiA+IHRoZXJlIGFueSB3b3JrIGluIHByb2dyZXNzPwo+IAo+IGNvbW1pdCBiZDMwY2Rm
ZDliZDczYjY4ZTQ5NzdjZTdjNTU0MGFhN2IxNGMyNWNkCj4gQXV0aG9yOiBTcmluaXZhcyBQYW5k
cnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4KPiAKPiDCoMKgwqDC
oCB0aGVybWFsOiBpbnRlbDogaGZpOiBOb3RpZnkgdXNlciBzcGFjZSBmb3IgSEZJIGV2ZW50cwo+
IApUaGlzIGlzIGFscmVhZHkgZXhwb3NlZCBhbmQgd2UgdXNlIGl0IGluIHVzZXIgc3BhY2UuCnRo
ZXJtYWxfZ2VubF9jcHVfY2FwYWJpbGl0eV9ldmVudCgpIGlzIGNhbGxlZCBmcm9tIGludGVsX2hm
aSBkcml2ZXIgdG8Kc2VuZCB0aGUgY3B1IGNhcGFiaWxpdGllcy4KCk5vdCBzdXJlIHdoYXQgZG8g
eW91IG1lYW4gYnkgICJkb24ndCBzZWUgbmV0bGluayBmdW5jdGlvbmFsaXR5CmV4cG9zZWQiPwoK
dGhlcm1hbF9nZW5sX2NwdV9jYXBzIHN0cnVjdCBhbmQgdGhlcm1hbF9nZW5sX2NwdV9jYXBhYmls
aXR5X2V2ZW50KCkKYXJlIGRlZmluZWQgaW4gZHJpdmVycy90aGVybWFsL3RoZXJtYWxfbmV0bGlu
ay5oLgoKClRoYW5rcywKU3Jpbml2YXMKCgo+IAo+ID4gRldJVywgQWNrZWQtYnk6IFJpY2FyZG8g
TmVyaQo+ID4gPHJpY2FyZG8ubmVyaS1jYWxkZXJvbkBsaW51eC5pbnRlbC5jb20+Cj4gCj4gVGhh
bmtzIQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
