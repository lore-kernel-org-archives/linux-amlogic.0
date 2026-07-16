Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8DAC44515
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdJ9fV7c+fxEFszzyCN4ncgc5JQAPEWcxD7JO9Y90jc=; b=wnme0ZU4p0ba9c
	bpk7+F+cd1cYZ1YvOFIHs6s2tfrPKzix+FHSU/9LUrxLzRsdg/CgZj2IZ4nkERbWxIatTeeovgvSg
	tdADWQZDad7+SQe0fCr2sOJ/nS203fMzRa/zTxweXy7OUv2y0EG9EJt8I3OYh7x39kPHFTyl6RWO2
	9s9CFtugGPOF1lr7mgBQ7RrwZr8evSNOGqVvrNtNe4OpOY9+v5YlkidgX8z2P2nU4786AcBrihtn6
	1svqxUvcnVplRu1mmQdPTaj9fCE+1nVCNbHXdDOud9NSvqzSx3JhEcXTFlU8CxzwXLYHaPOwL2UCs
	Q5o7rhu/lJzvekfOBxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQI7-00000000Jx6-2jWk;
	Thu, 16 Jul 2026 17:54:35 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQI4-00000000Jk2-14mp;
	Thu, 16 Jul 2026 17:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784224473; x=1815760473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xxOjee7glhv2bbNIZZyyAk70a5eC9HP+MBjlGBfZqNA=;
  b=QsaWTJmd3rOE6TFNtRHlsumFLT7nr2txQhjVuOllbEb4twhhUaU3MHv7
   g69r2pFjOBEpn3SRy0bZ3GOgGgokcc/tLddiqe4rb1KQm2dvlfHu+5hYJ
   yTNhd7UmekevgKM3tyqqdz+9mVzfae/tOaEcP85BEuIl8cY1sNa48jfX6
   LOPNiVinF7c4/9hv5kUtpz5bCzEXHhsnnpzSRjhQOyhotpHhdo6eqNgOZ
   dA/aGMX06Zcz10Jkw0JCRl3Hj2vwbWS7Lc1hMus+9ddipflgmLCTthVoM
   C+cyCjTKSczF7GkTr8xDCvlIWLmdA+ZfzXMPAmwMTUGfGSl2O15q7ZWhN
   w==;
X-CSE-ConnectionGUID: q0nd2Q8ESG6RjccRkLuy+g==
X-CSE-MsgGUID: 4kJ6lOBYTy+oYswWJLjWuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88569125"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88569125"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:50:35 -0700
X-CSE-ConnectionGUID: KSXdeNBXTx+whu28zmJl9Q==
X-CSE-MsgGUID: ISrJSJNIRJu4vj7xXuRo5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260854065"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:50:25 -0700
Date: Thu, 16 Jul 2026 20:50:22 +0300
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
Message-ID: <alkZ3tVY0y31RYUz@ashevche-desk.local>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <alieVR1cOtOySi4_@ashevche-desk.local>
 <aljAqBNVXV1aVJqx@luna>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aljAqBNVXV1aVJqx@luna>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_105432_334998_700333C8 
X-CRM114-Status: GOOD (  13.86  )
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

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMDE6Mjk6NDRQTSArMDIwMCwgTGluayBNYXV2ZSB3cm90
ZToKPiBPbiBUaHUsIEp1bCAxNiwgMjAyNiBhdCAxMjowMzoxN1BNICswMzAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6Cgpb4oCmXQoKPiA+IFRMO0RSOiB5b3Ugc2hvdWxkIGZpeCB0aGUgQXBwbGUg
ZHJpdmVyIChhbmQgbWlnaHQgbW9yZSBpZiBhbnkgb2YgdGhlbQo+ID4gdXNlIHRoYXQgZGlydHkg
dHJpY2spLgo+IAo+IEl0IHdhcyB0aGUgb25seSBvbmUgb2YgdGhlIGRyaXZlcnMvbnZtZW0vIHRv
IGRvIHRoYXQuICBUaHJlZSBvdGhlcgo+IGRyaXZlcnMgdXNlIGEgcGF0dGVybiB3aGVyZSB0aGV5
IG1lcmdlIHJlYWQgYW5kIHdyaXRlIG9wZXJhdGlvbnMgaW50byBhCj4gc2luZ2xlIGFjY2VzcyBm
dW5jdGlvbiB3aXRoIGEgdHlwZT1yZWFkL3dyaXRlIHBhcmFtZXRlciwgc28gY29uc3Qgc2FmZXR5
Cj4gY2Fu4oCZdCB3b3JrIHRoZXJlIGFuZCBJ4oCZbGwgY29udGludWUgY2FzdGluZyBmcm9tIGNv
bnN0IHZvaWQgKiB0byB2b2lkICoKPiBpbiB0aGUgd3JpdGUgZnVuY3Rpb24gdG8ga2VlcCB0aGF0
IHBhdHRlcm4gd29ya2luZy4KCkkgbWVhbnQgYWxsIHRoZSBkcml2ZXIgaW4gdGhlIGtlcm5lbCB0
aGF0IGFyZSBnb2luZyB0byBiZSBhZmZlY3RlZCBieSB0aGlzCmNoYW5nZS4KCi0tIApXaXRoIEJl
c3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
