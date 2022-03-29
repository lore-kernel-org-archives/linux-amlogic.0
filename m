Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70075C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHQYksLAN0/qTx9klMg+I0s7ERWijjF/E+N3u0L4Wtk=; b=NAYFsq22zvcSz8
	15Zpo+jQDGsW3uwDxQNsUuQCTNn8n9OVo3XC7Rn/fYa0CeOt7RtW9KwNFFiEBOf4LpJ+gpFThhVVo
	YPBWDhCYORY5glw88yVOH279OiNmyBrkXrbBDkpiSl1GeudY7gYvREf2fDQAQZBBm9foWqmLlL9Ss
	ndWelV2ksRJgLWfUokeQiF0S8hgM+4j/e+QUdbRHW3mVTWaTJVH2rpLiHbKiGnb2ZeUT1SkpvepH3
	NJTvTrY0Q1iE3KE2zWd5jW0hx3hJjo0XWV4fXUdTgYcHUHn4fhLafkwc2C4/2mLMXAKDHTpzLFUmj
	qBhj6O3xrxU5xOBd487Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZEzq-00CwX2-NQ; Tue, 29 Mar 2022 16:47:06 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZEzI-00CwH9-VI; Tue, 29 Mar 2022 16:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648572392; x=1680108392;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l79PCfT680tSg5itoW3f+C4BVaO65e08V3oBAzUaQsg=;
 b=f06cvkxvn6rtCCUVO3fG49cmUXL+RXAjWYOlumTW9Q5DnmecOSrqDxC8
 ikOkBSp4gIsKMa5lpIrTDyIQaS3a1djiPKxCdJHDtFDa5fSeeFR1V9ccf
 tZ9fggP//S6Y37oGEmnEhvvLeqGLT5DDBVQMDbQy2Qfk/vDD4AtDaLQJj
 +CEgjyGLPT9ExTcUhUK2mQ2D9AQJTLU9HAXiKSpZ49Hcg1wktl2h8LVZS
 DXP/Y1VkneF/SQxsxf+iYgKeh6MkXdSGWzrMpl49HImMoK8HMvMSsXmaj
 xFRFHvMxoDTYqJL0uiFZMjPK9BiXNeuQFu1y40QSDmHYwvc4CwHIhyXG9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="256882779"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="256882779"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 09:42:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="554327473"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 09:42:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZEuu-008rb0-Vw; Tue, 29 Mar 2022 19:42:00 +0300
Date: Tue, 29 Mar 2022 19:42:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 09/13] pinctrl: meson: Rename REG_* to MREG_*
Message-ID: <YkM22GwhxV+YKl8l@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_094633_064100_DB93EF7C 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBNYXIgMjksIDIwMjIgYXQgMDY6MTM6MTlQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gT24gMjkvMDMvMjAyMiAxNzoyOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4g
UmVuYW1lIFJFR18qIHRvICogYXMgYSBwcmVyZXF1aXNpdGUgZm9yIGVuYWJsaW5nIENPTVBJTEVf
VEVTVC4KPiAKPiBXaGF0IGVycm9yIGRvIHlvdSBoaXQgPwoKYXJjaC94ODYvaW5jbHVkZS9hc20v
YXJjaF9od2VpZ2h0Lmg6OToxNzogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIgYmVmb3JlIHN0
cmluZyBjb25zdGFudAo5IHwgI2RlZmluZSBSRUdfT1VUICJhIgogIHwgICAgICAgICAgICAgICAg
IF5+fgpkcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi5oOjY5Ojk6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhSRUdfT1VU4oCZCjY5IHwgICAgICAgICBSRUdfT1VULAoK
QW5kIHNvbWUgbW9yZS4KCj4gTVJFR18gaXMgcmF0aGVyIHVnbHksIHNvbWV0aGluZyBsaWtlIFBJ
TkNPTkZfUkVHXyBvciBtb3JlIHNpbXBsZXIgTUVTT05fUkVHXyB3b3VsZCBiZSBtb3JlIGFwcHJv
cHJpYXRlLgoKRmluZSB3aXRoIG1lLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZj
aGVua28KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
