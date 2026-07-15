Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C42C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 19:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1g1kYWqmV3UCPtp5l2wR2Nb6XgSkiZAJCrwp3SDZk4=; b=IszPBVCnn82gm6
	PRqKMqhX1Dnit+y5BOePk0YLWMhUwfZfc2VX6FfAeybz3NA3yTEZfIgDSaG25W9Gnm3xAEIS0zVnx
	Mtf3OQYkRFZBKwwm605GzPH5hnVfXepGJMduBDt1BBm2BZBQ5DmCEGbEp7R7LzSPHdXNHkmPsZ+7+
	adQqOsFyvsPqMXL2XBkEiecw8a8NsW9EZ43TV1z2g300FpKSBPReJo33PcrE3i9CayIGvqqtwqLb4
	EzpafbqRsxFaynbwPWFPQtUjHTGX1A9D03VF8HxDy/3ZpmYTi0MqLIbMl4lGqo/gvOkt1gj/shBUZ
	o9BHs/u98X5d8cdYIDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4sO-0000000FkZg-46ao;
	Wed, 15 Jul 2026 19:02:37 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4sM-0000000FkZB-29cE;
	Wed, 15 Jul 2026 19:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784142154; x=1815678154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jkRUcG0fpUKUz5oE5nA2qUlCbNkbkFNgmwTENQzAFys=;
  b=BvJMDgiyd4ulEV8ecbw1OHg0kYWyy9fC+UcvSHb4Rzx69nXcvhDKOAdh
   pEXTZ7eAoeSg7/YXKv5U7E8aUbLRCizeYy6PNwZN+X6qYESAk12GfVgGP
   eWu3f+Vcjn331tWCVemPblb/b8oiqhSZ2EWkIgj5OdVGmc0qaOcwzpL8z
   ClJCTEHFwgXSNLvRQxqIEjOuDXN1NmD/DfI58cLKdHqhwqxMg2T+aYZWB
   ALYJ+VZmFWmCYr2TVWbDsmA6zeelQfl3u9Sr22xY93WLMIcjdRvsyJBXg
   5/kRkFMPgi26sZMEo70UsgxDhv6U7sG46n2VsRRwyQqGH2QhX6p6uZ4Hm
   g==;
X-CSE-ConnectionGUID: 1QkRuKgUT+2Wnq4tAustUA==
X-CSE-MsgGUID: 7M+agry9RrScXtueC2qgoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84678539"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84678539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 12:02:33 -0700
X-CSE-ConnectionGUID: 8yyOrudNS+6KFBZjLwXtOQ==
X-CSE-MsgGUID: YpTKP7aFT2KqlGQNWvtRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="254517773"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 12:02:16 -0700
Date: Wed, 15 Jul 2026 22:02:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
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
Message-ID: <alfZNQGcX0Z68eto@ashevche-desk.local>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260715175229.24672-1-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_120234_565562_6629A958 
X-CRM114-Status: GOOD (  15.07  )
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

T24gV2VkLCBKdWwgMTUsIDIwMjYgYXQgMDc6NTI6MTZQTSArMDIwMCwgTGluayBNYXV2ZSB3cm90
ZToKPiBUaGlzIGNhbGxiYWNrIHVzZWQgdG8gdGFrZSBhIG11dGFibGUgdm9pZCAqIGZvciBubyBy
ZWFzb24sIHdoaWNoIGNhdXNlcwo+IHRoZSBjb21waWxlciB0byBiZSB1bmF3YXJlIHRoYXQgdGhl
IHZhbCBidWZmZXIgc2hvdWxkIG5ldmVyIGJlIG1vZGlmaWVkCj4gYnkgdGhlIGNhbGxiYWNrLgo+
IAo+IFRoaXMgd2FzIGZvdW5kIHdoaWxlIGRyYWZ0aW5nIHRoZSBudm1lbS1wcm92aWRlciBSdXN0
IGFic3RyYWN0aW9uLgo+IAo+IEnigJl2ZSBzcGxpdCB0aGlzIHNlcmllcyBiYXNlZCBvbiB0aGUg
c3Vic3lzdGVtIGVhY2ggcGF0Y2ggYWZmZWN0cywgYnV0IEkKPiB0aGluayBpdCBzaG91bGQgZ28g
dGhyb3VnaCB0aGUgbnZtZW0gdHJlZSBpbiBvbmUgZ28gYWZ0ZXIgZ2F0aGVyaW5nIHRoZQo+IGFj
a3MgZnJvbSB0aGUgb3RoZXIgc3Vic3lzdGVtIG1haW50YWluZXJzLgoKSXQncyBhbiBvcHRpb24u
IFRoZSBvdGhlciBvcHRpb24gKGFuZCBvZnRlbiB3ZSBnbyB0aGlzIHdheSkgaXMgdG8gaW50cm9k
dWNlCmEgbmV3IG5hbWUsIGNvbnZlcnQgdXNlcnMsIGNvbnZlcnQgdGhlIG5hbWUgYmFjay4KClNl
ZSwgZm9yIGV4YW1wbGUsIGhvdyBHUElPIHN1YnN5c3RlbSBjaGFuZ2VkIGEgcHJvdG8gb2YgLnNl
dCgpIGNhbGxiYWNrLgoKPiBJ4oCZdmUgYmVlbiB0b2xkIHByZXZpb3VzbHkgdG8gbm90IGluY2x1
ZGUgdG9vIG1hbnkgbWFpbnRhaW5lcnMgaW4gQ2MsIGJ1dAo+IEkgZG9u4oCZdCBrbm93IHdoaWNo
IG9uZXMgdG8gcmVtb3ZlIGZyb20gdGhlIGdldF9tYWludGFpbmVycy5wbCBvdXRwdXQsIHNvCj4g
SeKAmXZlIHN0aWxsIGluY2x1ZGVkIGV2ZXJ5b25lLCBzb3JyeSBhYm91dCB0aGF0LgoKV2l0aCB0
aGlzLCByYXRoZXIgc3RhbmRhcmQsIHdheSB5b3Ugd2lsbCBmdWxmaWxsIHRoZSBhYm92ZSByZXF1
aXJlbWVudAphdXRvbWF0aWNhbGx5LiBBbHNvIHlvdSB3b24ndCBuZWVkIHRyZWV3aWRlIGNoYW5n
ZSB0byBib3RoZXIgZXZlcnlib2R5CndpdGggdGhpcy4gQW5kIGFsc28gaW5jcmVhc2UgdGhlIGNo
YW5jZXMgdG8gZ28gaW4gKG1heWJlIGluIGEgZmV3IHJlbGVhc2VzCnNwYW4pLgoKLS0gCldpdGgg
QmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
