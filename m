Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC0AE9D3E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Feb 2026 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYXSCB2ri6uZzgPnwqC74lcwYehC7JLIQu19pwHxkP8=; b=YQS77hTsa3lhHM
	J68zuV3uOIPqOGRLgd2HuZPBO4yVEpz/1aWo9i/LyLM1qGxAWotXmwdd/TW1bIFJofyDYJPSoaULC
	ft6F63KkkZlt4uqBAHtI/+iDfhY6D/vlhEa6akIl57DD8KqtU2yBbS0ALTeyFHOuZvGkCF3gDFypJ
	B5DgBLGotQEay0MaXL0LAqlKATTIl530N4BqbqcHLmclch3c4vynFx9Tmt893cSHdKktx75r0w6MH
	XvdhPl897mw6y+Rut9l23F92TwJq/zAaMN5QcqOtI1LX55ir/wuKqv+LX7Pz9qYscYds5un5VBW6q
	StMoIUtdsuT7d0GHNTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndmO-00000008aKe-0zfD;
	Wed, 04 Feb 2026 14:22:52 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndmM-00000008aKF-15cg;
	Wed, 04 Feb 2026 14:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770214970; x=1801750970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IrNP9aPjvILwnwoEewPVQMmwUR+z+tWND+goKGd2lig=;
  b=T31ws/Jl02C73iVcAE1o8C/fh4NVAPtVUV4pHiGUHXErFbbOP+uAuldt
   /Nr3O9oW7AvWwbMqA18cZZGUAfNiM9oWMcc6HSQK9oVbYFw2AP16ldWMu
   +vP3zokTX93ojZs/+1zx9qLtdQhwy6nRsKq698EAootrucRsXzRturvNM
   zDeUpGr5qPa+Pq4d50/f8Dp8hDh+LsEUWJBWwDNks90fYQXCIKLxAAfYT
   6B0f+OnDTQEiM3KzV+koQk5ng1bro63n37q60jg8SLipdHDR0Krx1HBkJ
   sxU4mK62CenQe8Q+F0tBfLs6fqB76THsCz7OVcjtNorIN3O2rZBf9Z9eQ
   w==;
X-CSE-ConnectionGUID: ALUTqpi+Tzm7Aq05bxOQvw==
X-CSE-MsgGUID: mHfJIYWMTrialP++ki3pGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75252951"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75252951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:22:47 -0800
X-CSE-ConnectionGUID: S2N85vwdSnaWdLO1IP1BCw==
X-CSE-MsgGUID: 7foP+xnfTiWmLWigJKydsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214350282"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:22:45 -0800
Date: Wed, 4 Feb 2026 16:22:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYNWMndBWxxoPABG@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204-crawlers-nacho-d7c9021cdb6f@spud>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_062250_363979_1BBFAFAA 
X-CRM114-Status: GOOD (  11.80  )
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

T24gV2VkLCBGZWIgMDQsIDIwMjYgYXQgMDI6MTU6MTBQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDA5OjA1OjM0QU0gKzAxMDAsIEFuZHkgU2hl
dmNoZW5rbyB3cm90ZToKPiA+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDEyOjM0OjM2QU0gKzAx
MDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgRmViIDMsIDIwMjYgYXQgNTox
N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6CgouLi4KCj4gPiBO
b3RlLCBwbGVhc2UsIHJlbW92ZSBleHRyYSAnLicgKGRvdCkgaW4gdGhlIFN1YmplY3Qubwo+IAo+
IGZ3aXcsIHRoZSAuLiB3YXMgaW50ZW50aW9uYWwgY29zIEkgd2FzIHRydW5jYXRpbmcgdGhlIHBp
bmNvbmZfZ2VuZXJpYwo+IGZyb20gdGhlIGZ1bmN0aW9uIHNpbmNlIHRoZSBzdWJqZWN0IHdhcyBy
ZWFsbHkgbG9uZywgbm90IHJlZmVycmluZyB0bwo+IGEgbWVtYmVyIG9mIGFuIG9wcyBzdHJ1Y3Qu
CgpZZXMsIGFuZCB0aGF0J3MgaG93IHdlIHJlZmVyIHRvIHRoZSBjYWxsYmFja3Mg4oCUIHdpdGgg
YSBzaW5nbGUgZG90IGFuZCBwYXJlbnRoZXNlczoKCgkubXlfY29vbF9jYigpCgpBbHRlcm5hdGl2
ZWx5CgoJLT5teV9jb29sX2NiKCkKCmJ1dCBpdCBvbmUgY2hhcmFjdGVyIGxvbmdlciBhbmQgVEJI
IGl0IHNsaWdodGx5IGxlc3MgcmVhZGFibGUgKEkgcGVyc29uYWxseQp1c2VkIHRoZSBsYXR0ZXIg
YW5kIHRoZW4gc3dpdGNoZWQgdG8gdGhlIGZvcm1lciBpbiB0aGUgcmVjZW50IHllYXJzKS4KCi0t
IApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
