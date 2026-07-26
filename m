Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDB5C53200
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gdcot3nE5XHcOqBY4gO5cyAwfdNwdwZSS/23wo4FHew=; b=TUY0CT6sOkZz8Q
	ki+mJr04o4Ov5i+84BXz2wC05EyHrlosyEv0r2Lf6iiQ1EzlyVUzUc83Ig6gA0K6R4xszJiWqurvq
	Kiq4yQvozcBjs3H8ZE789TvG8kFBjJw/yruP1pQznm6QWlLwGD58ZKVe+KxlQ57bYhhOTSCywue9G
	nR4iN8Q2JzcpFRK33OC657JCEgYDjS8YnTKFdhZoQDjjxkD1NHfdbI2VRx5CFvb+mt2sVt7uN60Qj
	dra/E/EOwWE/4PIH5vvkFqxROgzqTStoEEkRCC7DgIuxLzO7v7dX/YHSwQH1ZW+0b8ptKV4jZDyrE
	PBNloQg1khrhKILErPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyP7-00000001B2O-12oc;
	Sun, 26 Jul 2026 12:56:29 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyP4-00000001B1v-27qE;
	Sun, 26 Jul 2026 12:56:28 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 046A5F40DDF; Sun, 26 Jul 2026 14:56:17 +0200 (CEST)
Date: Sun, 26 Jul 2026 14:56:16 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
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
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/4] nvmem: apple-spmi: improve calling safety with
 wrapper functions
Message-ID: <amYD8I6a1c01fnvs@luna>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
 <20260716142415.28718-4-linkmauve@linkmauve.fr>
 <alkd0WWr3KX7MS5O@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alkd0WWr3KX7MS5O@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_055626_713320_6F18F254 
X-CRM114-Status: GOOD (  19.64  )
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

QWgsIHNvbWVvbmUgaW5kZXBlbmRlbnRseSBzZW50IHRoZSBzYW1lIHBhdGNoIGFzIHRoaXMgb25l
IGluCjcwODkxNzBlMWRmMTYwZjVmOGZiMzk1YmM1YWEyZTI2OTdiNGU4OTYsIHNvIEnigJlsbCBk
cm9wIGl0IGZyb20gdjQuCgpTb3JyeSBpdCB0b29rIHRoYXQgbG9uZyEKCk9uIFRodSwgSnVsIDE2
LCAyMDI2IGF0IDA5OjA3OjEzUE0gKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiBPbiBU
aHUsIEp1bCAxNiwgMjAyNiBhdCAwNDoyNDoxMFBNICswMjAwLCBMaW5rIE1hdXZlIHdyb3RlOgo+
ID4gVGhpcyBkcml2ZXIgdXNlZCB0byBjYXN0IHRoZSByZWdtYXBfYnVsa18qKCkgZnVuY3Rpb25z
IHRvIHZvaWQgKiwKPiA+IGJ5cGFzc2luZyBhbnkgY29tcGlsZXIgc2FmZXR5IGFyb3VuZCBpbmNv
bXBhdGlibGUgZnVuY3Rpb24gcG9pbnRlcnMuCj4gPiAKPiA+IFdpdGggdHdvIHNtYWxsIHdyYXBw
ZXJzLCB3aGljaCBqdXN0IGNvbnZlcnQgdGhlIHZvaWQgKiBwcml2IHBhcmFtZXRlcgo+ID4gaW50
byB0aGUgd2FudGVkIHN0cnVjdCByZWdtYXAgKiwgd2UgY2FuIHJlbW92ZSB0aGUgdm9pZCAqIGNh
c3QKPiA+IGFsdG9nZXRoZXIuCj4gCj4gUmVwb3J0ZWQtYnk6ID8KPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IExpbmsgTWF1dmUgPGxpbmttYXV2ZUBsaW5rbWF1dmUuZnI+Cj4gCj4gLi4uCj4gCj4gPiAr
c3RhdGljIGludCBhcHBsZV9zcG1pX252bWVtX3JlYWQodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50
IG9mZnNldCwKPiA+ICsJCQkJIHZvaWQgKnZhbCwgc2l6ZV90IGJ5dGVzKQo+ID4gK3sKPiAKPiA+
ICsJc3RydWN0IHJlZ21hcCAqcmVnbWFwID0gcHJpdjsKPiAKPiBObyBuZWVkIDotKQo+IAo+ID4g
KwlyZXR1cm4gcmVnbWFwX2J1bGtfcmVhZChyZWdtYXAsIG9mZnNldCwgdmFsLCBieXRlcyk7Cj4g
PiArfQo+IAo+IHN0YXRpYyBpbnQgYXBwbGVfc3BtaV9udm1lbV9yZWFkKHZvaWQgKm1hcCwgdW5z
aWduZWQgaW50IG9mZnNldCwKPiAJCQkJIHZvaWQgKnZhbCwgc2l6ZV90IGJ5dGVzKQo+IHsKPiAJ
cmV0dXJuIHJlZ21hcF9idWxrX3JlYWQobWFwLCBvZmZzZXQsIHZhbCwgYnl0ZXMpOwo+IH0KPiAK
PiAuLi4KPiAKPiA+ICtzdGF0aWMgaW50IGFwcGxlX3NwbWlfbnZtZW1fd3JpdGUodm9pZCAqcHJp
diwgdW5zaWduZWQgaW50IG9mZnNldCwKPiA+ICsJCQkJICBjb25zdCB2b2lkICp2YWwsIHNpemVf
dCBieXRlcykKPiA+ICt7Cj4gPiArCXN0cnVjdCByZWdtYXAgKnJlZ21hcCA9IHByaXY7Cj4gPiAr
CXJldHVybiByZWdtYXBfYnVsa193cml0ZShyZWdtYXAsIG9mZnNldCwgdmFsLCBieXRlcyk7Cj4g
PiArfQo+IAo+IEluIHRoZSBzaW1pbGFyIHdheSBhcyBhYm92ZS4KPiAKPiAuLi4KPiAKPiA+IC0J
CS5yZWdfcmVhZCA9ICh2b2lkICopcmVnbWFwX2J1bGtfcmVhZCwKPiA+IC0JCS5yZWdfd3JpdGVf
Y29uc3QgPSAodm9pZCAqKXJlZ21hcF9idWxrX3dyaXRlLAo+ID4gKwkJLnJlZ19yZWFkID0gYXBw
bGVfc3BtaV9udm1lbV9yZWFkLAo+ID4gKwkJLnJlZ193cml0ZV9jb25zdCA9IGFwcGxlX3NwbWlf
bnZtZW1fd3JpdGUsCj4gCj4gSSB0aGluayB0aGUgcHJvcGVyIG9yZGVyaW5nIGlzIHRvIGFkZHJl
c3MgdGhpcyBmaXJzdCAoYmVmb3JlIHlvdXIgbWFpbiBjaGFuZ2UpCj4gYW5kIHVwZGF0ZSBsYXRl
ciB3aXRoIGNvbnN0IGFyZ3VtZW50LiBZZXMsIGl0IHdpbGwgYmUgYSBiaXQgbW9yZSBjaGFuZ2Vz
LCBidXQKPiBpdCB3aWxsIGJlIGNsZWFuZXIuCj4gCj4gLS0gCj4gV2l0aCBCZXN0IFJlZ2FyZHMs
Cj4gQW5keSBTaGV2Y2hlbmtvCj4gCj4gCgotLSAKTGluayBNYXV2ZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
