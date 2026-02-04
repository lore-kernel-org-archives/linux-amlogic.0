Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86F8E83EEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Feb 2026 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmvxfEEe8yFb/CMNCGQmk/yu8GgW1f2qM6jpYwCJX98=; b=BICMYXTdkNh02b
	i7O6WkNW3idceaohij52Tfq1ARD48zwnaO+9UfQCcR46YWnNOdtUw0CKwlbKbJ+mnpMUvC5XnxdCa
	FGCrFvAL+cy+C4RQ+NMgsrPtQgWodJWAeoU6NORENcgbL1N6qg706BVJy7ib8icO3FDoOy1+AxvBv
	s7Mx1Jk8Ynr0Hs8+q9ZgFeBvbvT9CGHBZj75x+9+mM/y26fskM31mxiU9XF6UI1TvElW89hDrsjqM
	yLO2DPA1/4QKrpbEFB1bLEoJsks5FlxDkKL8cYaAe6A9IXitinssX9I8S2FMK76tFDYwkSGMZlGFG
	qkgkMHR/aw77m0RadM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXtN-000000085Ek-3ETN;
	Wed, 04 Feb 2026 08:05:41 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXtL-000000085EJ-43ED;
	Wed, 04 Feb 2026 08:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770192340; x=1801728340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DDwHMOsMUXm6WJ1FhegVa/SYna+oMCYrxCy4oam8+74=;
  b=EfCVzjh+oBr2nXy4A8qQLXPanLT6siDtLaJlR9nGz+USQWArGxPJClKy
   faQX9hWykkXUjYgfHyqXUyhh1HtJYh215J0DXLljbZPUpXI39ebd9eYqz
   xC7foA3qnh+5enWM2wM9wGoOFc2EF8W5GCt364F2vU9861uGRITeYjrep
   FdwGpSAz+NTv7mzJPyamF5iQGrJZBNtI7NIY4L4Hzq2Zb2S8pVI8mLq5x
   wTSq+1hcjdCL3CB2iEd/FLuPhYyPSvzHuRE7P5BXiNUQVSKrNSPWEg6Gf
   b5ty3km8mE+Xqi83E31kIdGLfm2KtC3aK1FF+Gs1ikAHXskgkiz0K63nj
   w==;
X-CSE-ConnectionGUID: EqvbRBaFR2SC6420wWu/0g==
X-CSE-MsgGUID: dTBPDmFTSyyRV7hX++xNRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73974813"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="73974813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:05:38 -0800
X-CSE-ConnectionGUID: gieHYdZRQuSMnX4Z5OrgTQ==
X-CSE-MsgGUID: ZLpUHnB4SdKCro4KdvDuew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209473784"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2026 00:05:36 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5881F95; Wed, 04 Feb 2026 09:05:34 +0100 (CET)
Date: Wed, 4 Feb 2026 09:05:34 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
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
Message-ID: <aYL9zgEyCarrluvP@black.igk.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_000540_044539_B6D3CA29 
X-CRM114-Status: GOOD (  14.31  )
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

T24gV2VkLCBGZWIgMDQsIDIwMjYgYXQgMTI6MzQ6MzZBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUdWUsIEZlYiAzLCAyMDI2IGF0IDU6MTfigK9QTSBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiA+IHBpbmNvbmZfZ2VuZXJpY19kdF9ub2RlX3RvX21h
cF9waW5tdXgoKSBpcyBub3QgYWN0dWFsbHkgYSBnZW5lcmljCj4gPiBmdW5jdGlvbiwgYW5kIHJl
YWxseSBiZWxvbmdzIGluIHRoZSBhbWxvZ2ljLWFtNCBkcml2ZXIuIFRoZXJlIGFyZSB0aHJlZQo+
ID4gcmVhc29ucyB3aHkuCj4gKC4uLikKPiA+IFRoZSBvdGhlciBkdF9ub2RlX3RvX21hcCBpbXBs
ZW1lbnRhdGlvbnMgYWNjZXB0IGEgYmVpbmcgY2FsbGVkIGZvcgo+ID4gZWl0aGVyIGEgbm9kZSBj
b250YWluaW5nIHBpbiBjb25maWd1cmF0aW9uIHByb3BlcnRpZXMgb3IgYSBub2RlCj4gPiBjb250
YWluaW5nIGNoaWxkIG5vZGVzIHRoYXQgZWFjaCBjb250YWluIHRoZSBjb25maWd1cmF0aW9uIHBy
b3BlcnRpZXMuCj4gPiBJT1csIHRoZXkgc3VwcG9ydCB0aGUgZm9sbG93aW5nIHR3byBkZXZpY2V0
cmVlIGNvbmZpZ3VyYXRpb25zOgo+ID4KPiA+IHwgY2ZnIHsKPiA+IHwgICAgICAgbGFiZWw6IGdy
b3VwIHsKPiA+IHwgICAgICAgICAgICAgICBwaW5tdXggPSA8YXNqaGRhc2pobGFqc2tkPjsKPiA+
IHwgICAgICAgICAgICAgICBjb25maWctaXRlbTE7Cj4gPiB8ICAgICAgIH07Cj4gPiB8IH07Cj4g
Pgo+ID4gfCBsYWJlbDogY2ZnIHsKPiA+IHwgICAgICAgZ3JvdXAxIHsKPiA+IHwgICAgICAgICAg
ICAgICBwaW5tdXggPSA8ZHNqaGxma2E+Owo+ID4gfCAgICAgICAgICAgICAgIGNvbmZpZy1pdGVt
MjsKPiA+IHwgICAgICAgfTsKPiA+IHwgICAgICAgZ3JvdXAyIHsKPiA+IHwgICAgICAgICAgICAg
ICBwaW5tdXggPSA8bHNkamhhZj47Cj4gPiB8ICAgICAgICAgICAgICAgY29uZmlnLWl0ZW0xOwo+
ID4gfCAgICAgICB9Owo+ID4gfCB9Owo+ID4KPiA+IHBpbmNvbmZfZ2VuZXJpY19kdF9ub2RlX3Rv
X21hcF9waW5tdXgoKSBvbmx5IHN1cHBvcnRzIHRoZSBsYXR0ZXIuCj4gCj4gVGhpcyBhbG9uZSBp
cyBhIGdvb2QgcmVhc29uIHRvIGFwcGx5IHRoZSBwYXRjaC4KPiAKPiBJIGhhdmUgYSBzdHJvbmcg
dXJnZSB0byBhcHBseSB0aGlzIGFscmVhZHkgZm9yIHY3LjAgZGVzcGl0ZSBpdHMgUkZDIHN0YXRl
Lgo+IAo+IEFueW9uZSBhZ2FpbnN0PwoKUXVpdGUgdGhlIG9wcG9zaXRlISBJIGZ1bGx5IHN1cHBv
cnQgdW5sb2FkaW5nIHBpbiBjb250cm9sIGNvcmUgZnJvbSBPRi1jZW50cmljCmNvZGUuIE5vdGUs
IHBsZWFzZSwgcmVtb3ZlIGV4dHJhICcuJyAoZG90KSBpbiB0aGUgU3ViamVjdC5vCkFja2VkLWJ5
OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4KCi0tIApXaXRo
IEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
