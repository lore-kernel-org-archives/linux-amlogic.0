Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8780C44515
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 17:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FI38n92lXSnNVsksiQ7peXWcbUzqzG2+XALHUiez4sA=; b=mTfG6P2tsiKHya
	u0Ja9Udg6VM9UyBfmNLg+NtozJz44TkuH0162Z9m4dRxNacBLGZNPbipyn9+VLeh/SkiJ1mft9Pnn
	HNgT6GpJXtuBXhccnVE0eXdhpE8OV3Rtpkb1qwXt8KyoOZ/QsXy6QpyWYuttKjbgoHp5Wc56bY2m4
	2yl2q6Tpy4kw58ZTW4YOvWnOHgJJO/2bhCTU/Wde8yQilPFirdX4c/R6y9jaQiLS7J7YMEXxrZWpe
	hS30rtDHeOp3gW9QCVadaIcMK0yPI9tKFx3jPRfT5IJh1wKB99yIc1xa3PMLqUE4+fl4etet++e/Y
	dz+JhcYRZNXUvkXSxTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQCu-00000000JVJ-420x;
	Thu, 16 Jul 2026 17:49:12 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQCs-00000000JUl-1LSr;
	Thu, 16 Jul 2026 17:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784224151; x=1815760151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WDOpxcwFle75xJgV45Y3mz4ze1wpcOya2GSWIlnO6Qg=;
  b=R4Yk3PzuyFeKLBvJFyfCwhVDmVZ7VkMyPd0nDX7Hpq7VMA/fRhp3xnvr
   PlyzWb+EdYfoihASSrQRtO+N6CMyifbw4bQa+S+Z9FyHoiSk0gMN5co6D
   jxFiiIBOS/hZ9HRuhiehKdx/ek2ZiqqT1K/u66MDvq3dNFtjmEbFgGXJn
   m0eRfjL7OXo9z8eGZpSPUaQCq8YZm5m3OsojfAQwztmLB9QfyhfKg4dDQ
   WVWEGpg0zmtfRvwIKo6vF75kmSb5ZKJVuRHeQNJ4/SxCPAg9uXcsUexq2
   IJuMXF79j7V/Xr6Y+VGrEIUnEsOD3dVqNAnr1JXL3LnF7NINUCF1kzXYE
   Q==;
X-CSE-ConnectionGUID: wuelDJ7rRV6YDb8pWsK/Nw==
X-CSE-MsgGUID: G9L+Y94eRGSOH1VdhAYWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84853703"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84853703"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:49:10 -0700
X-CSE-ConnectionGUID: XfGCLMq2TIOWPCEFC2xIgw==
X-CSE-MsgGUID: kOYF/zaMQF25P48lYMtL6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255415130"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:49:00 -0700
Date: Thu, 16 Jul 2026 20:48:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] nvmem: fix a const-unsoundness in reg_write
Message-ID: <alkZiozKVGlAYVUb@ashevche-desk.local>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <alieVR1cOtOySi4_@ashevche-desk.local>
 <ali7bki3jqpd8ckE@luna>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ali7bki3jqpd8ckE@luna>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_104910_404297_4BFC71FD 
X-CRM114-Status: GOOD (  13.06  )
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

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMDE6MDc6MjZQTSArMDIwMCwgTGluayBNYXV2ZSB3cm90
ZToKPiBPbiBUaHUsIEp1bCAxNiwgMjAyNiBhdCAxMjowMzoxN1BNICswMzAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAxNSwgMjAyNiBhdCAwOTo1NToxNlBNICswMjAw
LCBMaW5rIE1hdXZlIHdyb3RlOgoKLi4uCgo+IEnigJl2ZSBhdHRhY2hlZCBhIHBhdGNoIGZpeGlu
ZyB0aGlzIHBhcnRpY3VsYXIgaXNzdWUsIEkgd2lsbCBpbmNsdWRlIGl0IGluCj4gbXkgdjMgaWYg
dGhhdOKAmXMgb2sgd2l0aCB5b3UgKG9yIGl0IGNvdWxkIGdvIGFzIGEgZGlmZmVyZW50IHNlcmll
cywgSQo+IGRvbuKAmXQgY2FyZSBtdWNoKS4KCldvcmtzIGZvciBtZS4KCj4gSSB0aGluayBJ4oCZ
dmUgZm91bmQgYW5vdGhlciBidWcgaW4gdGhhdCBkcml2ZXIsIGl0IHNheXMgLm1heF9yZWdpc3Rl
ciA9Cj4gMHhmZmZmIGJ1dCAuc2l6ZSA9IDB4ZmZmZiwgb25lIG9yIHRoZSBvdGhlciBpcyBwcm9i
YWJseSBvZmYtYnktb25lLCBhbmQKPiBJIHN1c3BlY3QgLnNpemUgc2hvdWxkIGJlIDB4MTAwMDAg
aW5zdGVhZC4KClllYWgsIG1heF9yZWdpc3RlciBtZWFucyBvZmZzZXQgb2YgdGhlIGxhc3QgX2Fj
Y2Vzc2libGVfIHJlZ2lzdGVyLgpTbywgMHhmZmZmIHNvdW5kcyBhYm91dCByaWdodCB0aGVyZS4g
QXMgZm9yIHNpemUgYmVpbmcgMHhmZmZmLCBJIHdlYWtseQpyZW1lbWJlciB0aGF0IHRoZXJlIHdh
cyBhIGRpc2N1c3Npb24gYWJvdXQgdGhlc2UgdmFsdWVzLiBDYW4geW91IGRpZyB0aGUKbG9yZSBh
cmNoaXZlPwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
