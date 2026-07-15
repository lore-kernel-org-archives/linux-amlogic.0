Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD80C44507
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 19:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xl+FyxL5gvlUQRFWdVXyFBYc8UGBwOVS4dpFmQIuCgo=; b=bxhWnpkHaxEr/7
	Sy8XLZYcj6IvO5y60piM5z4aKGr1iuIgHLiJmiT7RKHcbPo5ps+MzjRJgl9k8LAmXL6sm+G8zJbYm
	bIOcEoSFS95JMmE+QrXoP1pceQ+OhiMI0XjT+KCWWRIQlMg1+hW705CjS89dQIK45pX0fvuBf1ABt
	Ymdia3BAlqExINDQNlLTzk5qbycvrGGyC/PoZONZbBVVJ9P7hxxMtYuHTWdwyv/SPU7k9qy6F/BLV
	2ZPPHJKZl+ZLBGTp+Q+ZO1SwQir1ErpXxnM0RRecS+FbSIohlznJ6Vrwfu8MQ4gTZs0V7UFDPcUXM
	HHj/I2O3bJqTFXJXM9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4yq-0000000Fl5m-44DM;
	Wed, 15 Jul 2026 19:09:16 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4yo-0000000Fl4O-27t4;
	Wed, 15 Jul 2026 19:09:15 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 7F6AFF40D2D; Wed, 15 Jul 2026 21:09:06 +0200 (CEST)
Date: Wed, 15 Jul 2026 21:09:06 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Joshua Kinard <linux@kumba.dev>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
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
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Salah Triki <salah.triki@gmail.com>, Yury Norov <ynorov@nvidia.com>,
	David Carlier <devnexen@gmail.com>,
	Achim Gratz <Achim.Gratz@stromeko.de>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Patrick Wicki <patrick.wicki@siemens.com>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Markus Perkins <markus@notsyncing.net>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org, mfd@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/8] nvmem: make reg_write() take a const void *
Message-ID: <alfa0i2wLGZkhl5Z@luna>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <alfZNQGcX0Z68eto@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alfZNQGcX0Z68eto@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_120914_732546_8DA137C9 
X-CRM114-Status: GOOD (  23.30  )
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

T24gV2VkLCBKdWwgMTUsIDIwMjYgYXQgMTA6MDI6MTNQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDE1LCAyMDI2IGF0IDA3OjUyOjE2UE0gKzAyMDAsIExpbmsg
TWF1dmUgd3JvdGU6Cj4gPiBUaGlzIGNhbGxiYWNrIHVzZWQgdG8gdGFrZSBhIG11dGFibGUgdm9p
ZCAqIGZvciBubyByZWFzb24sIHdoaWNoIGNhdXNlcwo+ID4gdGhlIGNvbXBpbGVyIHRvIGJlIHVu
YXdhcmUgdGhhdCB0aGUgdmFsIGJ1ZmZlciBzaG91bGQgbmV2ZXIgYmUgbW9kaWZpZWQKPiA+IGJ5
IHRoZSBjYWxsYmFjay4KPiA+IAo+ID4gVGhpcyB3YXMgZm91bmQgd2hpbGUgZHJhZnRpbmcgdGhl
IG52bWVtLXByb3ZpZGVyIFJ1c3QgYWJzdHJhY3Rpb24uCj4gPiAKPiA+IEnigJl2ZSBzcGxpdCB0
aGlzIHNlcmllcyBiYXNlZCBvbiB0aGUgc3Vic3lzdGVtIGVhY2ggcGF0Y2ggYWZmZWN0cywgYnV0
IEkKPiA+IHRoaW5rIGl0IHNob3VsZCBnbyB0aHJvdWdoIHRoZSBudm1lbSB0cmVlIGluIG9uZSBn
byBhZnRlciBnYXRoZXJpbmcgdGhlCj4gPiBhY2tzIGZyb20gdGhlIG90aGVyIHN1YnN5c3RlbSBt
YWludGFpbmVycy4KPiAKPiBJdCdzIGFuIG9wdGlvbi4gVGhlIG90aGVyIG9wdGlvbiAoYW5kIG9m
dGVuIHdlIGdvIHRoaXMgd2F5KSBpcyB0byBpbnRyb2R1Y2UKPiBhIG5ldyBuYW1lLCBjb252ZXJ0
IHVzZXJzLCBjb252ZXJ0IHRoZSBuYW1lIGJhY2suCgpUaGFua3MgZm9yIHRoZSBoaW50LCBJ4oCZ
bGwgZ28gZm9yIHRoaXMgcm91dGUgZm9yIHYyIHRoZW4uCgo+IAo+IFNlZSwgZm9yIGV4YW1wbGUs
IGhvdyBHUElPIHN1YnN5c3RlbSBjaGFuZ2VkIGEgcHJvdG8gb2YgLnNldCgpIGNhbGxiYWNrLgoK
SSB3aWxsLCB0aGFua3MuCgo+IAo+ID4gSeKAmXZlIGJlZW4gdG9sZCBwcmV2aW91c2x5IHRvIG5v
dCBpbmNsdWRlIHRvbyBtYW55IG1haW50YWluZXJzIGluIENjLCBidXQKPiA+IEkgZG9u4oCZdCBr
bm93IHdoaWNoIG9uZXMgdG8gcmVtb3ZlIGZyb20gdGhlIGdldF9tYWludGFpbmVycy5wbCBvdXRw
dXQsIHNvCj4gPiBJ4oCZdmUgc3RpbGwgaW5jbHVkZWQgZXZlcnlvbmUsIHNvcnJ5IGFib3V0IHRo
YXQuCj4gCj4gV2l0aCB0aGlzLCByYXRoZXIgc3RhbmRhcmQsIHdheSB5b3Ugd2lsbCBmdWxmaWxs
IHRoZSBhYm92ZSByZXF1aXJlbWVudAo+IGF1dG9tYXRpY2FsbHkuIEFsc28geW91IHdvbid0IG5l
ZWQgdHJlZXdpZGUgY2hhbmdlIHRvIGJvdGhlciBldmVyeWJvZHkKPiB3aXRoIHRoaXMuIEFuZCBh
bHNvIGluY3JlYXNlIHRoZSBjaGFuY2VzIHRvIGdvIGluIChtYXliZSBpbiBhIGZldyByZWxlYXNl
cwo+IHNwYW4pLgoKSSBvcmlnaW5hbGx5IHRob3VnaHQgZ2l2ZW4gaG93IGZldyB1c2VycyBvZiB0
aGlzIEFQSSB0aGVyZSBhcmUgaW4gdGhlCmtlcm5lbCwgaXQgd291bGQgYmUgc2ltcGxlciB0byBm
aXggdGhlbSBhbGwgaW4gb25lIGdvLCBidXQgdGhhdCBtaWdodCBiZQphIGJldHRlciBvcHRpb24g
dGhlbi4KCj4gCj4gLS0gCj4gV2l0aCBCZXN0IFJlZ2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCj4g
Cj4gCgotLSAKTGluayBNYXV2ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
