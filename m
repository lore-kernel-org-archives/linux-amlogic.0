Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E29FD2F349
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYtYWElJttrN8yH6sXphEI0+nK8Xty/kqCwwJ8utMe4=; b=IDntD+wkkqPdYe
	2FgJ/SadTBeDlA5SSbV117sU5IPLWozguvRiKZ8COldBH9CMyCWR9uUvSoNm/FNiU6Ujrk1i4NwY+
	JCyDd6D11LenH9tctco38zao86CW5ZJp8MTFSPXQOJFXYm/4vJj9VrP3N6Q7pBUZYjGGKdKjwMphb
	Eu8j0WJF3BA0wdlbJizhSVuE5ep0r3/3AL2IuwLA5HBENoZhr6JE74DcbIwhaCIhyq78LITvI06Wm
	LnSL7P15YzDA/NxpBS194PNoDKf6QHxCGevVOV20lxf4bVgwOdH+1AIwVZPZSST6HjGFP+EpgG5Wc
	FTs/QrHvlQ//OpRQdtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiEi-00000007Wwf-2fXq;
	Tue, 13 Jan 2026 17:31:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiEf-00000007Wv3-0Ek2;
	Tue, 13 Jan 2026 17:31:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 907654E420AF;
	Tue, 13 Jan 2026 17:31:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43C8360701;
	Tue, 13 Jan 2026 17:31:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 089C0103C81D3;
	Tue, 13 Jan 2026 18:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768325470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ArN+gzNluv41ve7tNs9bCuLTGUt8HRF4hQp5onhOiSg=;
	b=SbsgZNDgkfZHCx/r34yGumijNEEAujBA1Asley4Zy9v924+EMnfgnRIOcSjOdM5mvGqWPR
	lWsq+4rbWv1be42TFPaquIJOTEqiazGpexh6KgVqdj/vsp21Futc53PdAYnOxHNcXKfXWM
	UPMA6t4YXAPOUmX4w/xDnACUO3E4LMeMErPwCMH1EWAjKXwOnIsQ28a7Nib3ZS84y0pFQm
	0r3v24ZarNzuyfppzipCFobDWeOQLNpJc0/4gSmi7B9gJ2tirl0htm/b1q7gv8HVWCGTPs
	rlMphTDPohwx9XlNXbinFpmLjBit+nuMZZCTpdBFpyRuhJNgeuQUSxvN+fm7cQ==
Mime-Version: 1.0
Date: Tue, 13 Jan 2026 18:30:58 +0100
Message-Id: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
X-Mailer: aerc 0.20.1
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com> <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com> <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
In-Reply-To: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_093117_227862_9CE28528 
X-CRM114-Status: GOOD (  18.09  )
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

SGVsbG8gTWFydGluLAoKT24gTW9uIEphbiAxMiwgMjAyNiBhdCAxMToyMSBQTSBDRVQsIE1hcnRp
biBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gSGkgTHVjYSwKPgo+IE9uIEZyaSwgSmFuIDksIDIwMjYg
YXQgMTE6MDPigK9BTSBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPiB3
cm90ZToKPj4KPj4gb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgaXMgZGVwcmVjYXRlZC4gTW92ZSB0byBp
dHMgcmVwbGFjZW1lbnQKPj4gb2ZfZHJtX2ZpbmRfYW5kX2dldF9icmlkZ2UoKSB3aGljaCBnZXRz
IGEgYnJpZGdlIHJlZmVyZW5jZSwgYW5kIGVuc3VyZSBpdAo+PiBpcyBwdXQgd2hlbiBkb25lLgo+
Pgo+PiBkd19oZG1pLT5icmlkZ2UgaXMgdXNlZCBvbmx5IGluIGR3X2hkbWlfdG9wX3RocmVhZF9p
cnEoKSwgc28gaW4gb3JkZXIgdG8KPj4gYXZvaWQgcG90ZW50aWFsIHVzZS1hZnRlci1mcmVlIGVu
c3VyZSB0aGUgaXJxIGlzIGZyZWVkIGJlZm9yZSBwdXR0aW5nIHRoZQo+PiBkd19oZG1pLT5icmlk
Z2UgcmVmZXJlbmNlLgo+Pgo+PiBBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJv
b3RsaW4uY29tPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+Cj4gWy4uLl0KPj4gQEAgLTc4OSw4ICs3ODksMTIg
QEAgc3RhdGljIHZvaWQgbWVzb25fZHdfaGRtaV91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqZGF0YSkKPj4gIHsKPj4gICAgICAgICBzdHJ1Y3QgbWVzb25fZHdfaGRtaSAqbWVz
b25fZHdfaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+PiArICAgICAgIHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKPj4gKyAgICAgICBp
bnQgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4KPj4gKyAgICAgICBkZXZtX2Zy
ZWVfaXJxKGRldiwgaXJxLCBtZXNvbl9kd19oZG1pKTsKPiBJIGhhdmUgb25lIHF1ZXN0aW9uIChz
byBJIGNhbiB1bmRlcnN0YW5kIHRoaW5ncyBiZXR0ZXIpOgo+IGlzIHRoZXJlIGEgcGFydGljdWxh
ciByZWFzb24gd2h5IHlvdSB3ZW50IHdpdGggZnJlZSdpbmcgdGhlIElSUQo+IGluc3RlYWQgb2Yg
Imp1c3QiIG1hc2tpbmcgaXQgKHNvIHRoZSBoYXJkd2FyZSB3b24ndCBmaXJlIGFueW1vcmUgb2YK
PiB0aG9zZSBJUlFzKT8KCk9uZSByZWFzb24gaXMgc3ltbWV0cnk6IF9iaW5kIHJlcXVlc3RzIHRo
ZSBpcnEsIHNvIF91bmJpbmQgZG9lcyB0aGUKcmV2ZXJzZS4KCkFub3RoZXIgaXMgSSBkb24ndCBo
YXZlIHRoZSBoYXJkd2FyZSwgc28gSSB3YW50ZWQgbXkgY2hhbmdlcyB0byBiZSBhcyBzbWFsbAph
bmQgY2xlYXIgYXMgcG9zc2libGUuCgpJbiBwcmluY2lwbGUgb25lIGNvdWxkIHJlcXVlc3QvZnJl
ZSB0aGUgaXJxIGluIHByb2JlL3JlbW92ZSBhbmQgdGhlbgplbmFibGUvZGlzYWJsZSBpdCBpbiBi
aW5kL3VuYmluZC4gV2hldGhlciBpdCB3b3VsZCBiZSBhIGdvb2Qgb3IgYmFkIGlkZWEgSQpkb24n
dCBrbm93LCBidXQgc3VyZWx5IGl0IHdvdWxkIGJlIG1vcmUgY29tcGxleCBhbmQgSSB3b3VsZG4n
dCB3YW50IHRvIGRvCml0IHdpdGhvdXQgYW55IGNoYW5jZSB0byB0ZXN0IGl0IG9uIGhhcmR3YXJl
LgoKQWxzbywgdGhhdCB3b3VsZCBvbmx5IG9wdGltaXplIHRoZSBjYXNlIG9mIG11bHRpcGxlIGJp
bmQvdW5iaW5kIGN5Y2xlcywKd2hpY2ggYXJlIG5vdCBxdWl0ZSByZWFsaXN0aWMgd2l0aG91dCBi
cmlkZ2UgaG90cGx1Zy4gQW5kIGJyaWdkZSBob3RwbHVnCmRvZXMgbm90IGV4aXN0IHlldCBpbiBt
YWlubGluZSwgYW5kIHdoZW4gaXQgd2lsbCBhcnJpdmUgaXQgd2lsbCBiZSB1c2VkCm9ubHkgZm9y
IGEgZmV3IHVzZSBjYXNlcy4KCkkgaG9wZSB0aGlzIGFuc3dlcnMgeW91ciBxdWVzdGlvbi4KCkJl
c3QgcmVnYXJkcywKTHVjYQoKLS0KTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
