Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C154CC4450A
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMD2+JVKydyTrw3AZbMaHRJ25rVe6vz7qAF0L8OMPuI=; b=LxyJVeBoOOL5AY
	M0BMYPkvxw1u2GWQY9iNIukWYY3lSU+ufzbtswJ5d0AQ9cBiOnutDarseVan4bWBP1fd+pUberaMj
	yhzv5Ll/0p+00ha8c+oSan7FS9eCTb1P346oK3dMVtGShCLxc/uc6IZzqKeQDw30EfPaQTrTLjfmU
	vDAEVblBZd/1WHshoyd6Y70P+zJ7CTuGGB6pJG5KtimCfl25+/P8oBy4qrzZkETOapT8xPNHxHoW5
	Jq9GyIuu22x/fB37h+TxRvSl2JG0ZPatrtE8g27STuXKWKkirMVrWuHtUCQ8y1oUMd7YZgkJRL8Dw
	nPjf3/+heMVT2npIEVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKHr-0000000H83Y-0FxL;
	Thu, 16 Jul 2026 11:29:55 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKHo-0000000H836-2zH9;
	Thu, 16 Jul 2026 11:29:53 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 9FB37F40D30; Thu, 16 Jul 2026 13:29:45 +0200 (CEST)
Date: Thu, 16 Jul 2026 13:29:44 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
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
Message-ID: <aljAqBNVXV1aVJqx@luna>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <alieVR1cOtOySi4_@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alieVR1cOtOySi4_@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_042952_889724_86842A35 
X-CRM114-Status: GOOD (  11.04  )
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

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMTI6MDM6MTdQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgpb4oCmXQo+IC4uLi4uIFRMO0RSOiB5b3Ugc2hvdWxkIGZpeCB0aGUgQXBwbGUgZHJp
dmVyIChhbmQgbWlnaHQgbW9yZSBpZiBhbnkgb2YgdGhlbQo+IHVzZSB0aGF0IGRpcnR5IHRyaWNr
KS4KCkl0IHdhcyB0aGUgb25seSBvbmUgb2YgdGhlIGRyaXZlcnMvbnZtZW0vIHRvIGRvIHRoYXQu
ICBUaHJlZSBvdGhlcgpkcml2ZXJzIHVzZSBhIHBhdHRlcm4gd2hlcmUgdGhleSBtZXJnZSByZWFk
IGFuZCB3cml0ZSBvcGVyYXRpb25zIGludG8gYQpzaW5nbGUgYWNjZXNzIGZ1bmN0aW9uIHdpdGgg
YSB0eXBlPXJlYWQvd3JpdGUgcGFyYW1ldGVyLCBzbyBjb25zdCBzYWZldHkKY2Fu4oCZdCB3b3Jr
IHRoZXJlIGFuZCBJ4oCZbGwgY29udGludWUgY2FzdGluZyBmcm9tIGNvbnN0IHZvaWQgKiB0byB2
b2lkICoKaW4gdGhlIHdyaXRlIGZ1bmN0aW9uIHRvIGtlZXAgdGhhdCBwYXR0ZXJuIHdvcmtpbmcu
Cgo+IAo+IC0tIAo+IFdpdGggQmVzdCBSZWdhcmRzLAo+IEFuZHkgU2hldmNoZW5rbwo+IAo+IAoK
LS0gCkxpbmsgTWF1dmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
