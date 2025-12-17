Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64605D6408E
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2w+lcAoNafyIOhAKxknG+AVH04WvYj8UzM5h6G7/H8=; b=dXehtPPn5MRWBx
	GqTD4vU+3vq+d3haZW+xuhNLA+AGlMckiMPoFkLJRYq9zipJPpMPE+gPZMVLVJEMvKuC0KQCgzqeh
	nOPd1XR/RIz5ilzhc4AVQNd7DjH1tebGsRxNq2h0kOgWKhjRWFGB3NmsSHEK7UD0be0j/JiSTW8mZ
	18nDUusP2Rhj8x9jfySGpTSXu/pqjj7ES2LFGCor25Jv5GjVj1wGUub1+of9bEgRLXi79UJSC99k1
	4kocmQ3UoIGpHA+fi0Ok7hlRum1V8SMhkj/GL9jWariI0NxYisJlfKT323johjcv1N+q74RCJtYll
	PDvHt+g+Sf3skeYlUWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmhm-00000006KYJ-2c2q;
	Wed, 17 Dec 2025 08:16:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmhi-00000006KXC-11i3;
	Wed, 17 Dec 2025 08:16:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 875FCC1A594;
	Wed, 17 Dec 2025 08:15:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E824A6072F;
	Wed, 17 Dec 2025 08:16:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B75111950295;
	Wed, 17 Dec 2025 09:15:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765959364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ujozvAR/egQa+0OwQ9Aeym97mJvVMjkPUclMUt6mE28=;
	b=Ayn6HVBxPDFZQPsofDALTubSwQYYhWe28r/JxNzT2jwfqVPYB7L1I838PbDqUA2VUIhOqj
	T/p4Xd7+cEZfKoKVw2hurXHe5vkPMT19dkYgFzdXbeOY64a8mz9tBTIzqiLJh+GRQDwPsD
	VjAj9SUjWDu+mnsDdX0xgZ/mlF+pzcRkZRkq2CszNx2kC9Ltjs6UjvGcm1OTBOr2Np/bLn
	NV1CdrC5Y70iuSm3WZgQtjFIEPVbj0wIEJonCx4y0ASyFHkHSoAirTeo3ptVJUHuNJrcDq
	2uOgFYfMi01DRPjYnMRS09aqCaxaU09vJzqAbOE6JqfuzC65rEyPdzG9DDpNlg==
Mime-Version: 1.0
Date: Wed, 17 Dec 2025 09:15:48 +0100
Message-Id: <DF0CCD6EW5DR.3CYNK65T1GSAO@bootlin.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use
 devm_of_drm_get_bridge() to put the next bridge
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Phong
 LE" <ple@baylibre.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Adrien Grassein" <adrien.grassein@gmail.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com> <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com> <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com> <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com> <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
In-Reply-To: <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_001614_795632_9D2A6FEB 
X-CRM114-Status: GOOD (  21.12  )
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

SGVsbG8gTWFydGluLAoKT24gV2VkIERlYyAxNywgMjAyNSBhdCAxOjAxIEFNIENFVCwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBMdWNhLAo+Cj4gT24gVHVlLCBEZWMgMTYsIDIwMjUg
YXQgMTo0NuKAr1BNIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IHdy
b3RlOgo+IFsuLi5dCj4+ID4gV2hhdCBJJ20gbm90IHN1cmUgYWJvdXQgaXMgaG93IHRoaXMgc2Vy
aWVzIGludGVyYWN0cyB3aXRoCj4+ID4gZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZSgpIHdoaWNoIGlz
IHdoeSBJJ20gYXNraW5nIGJlZm9yZSBjb29raW5nIGEKPj4gPiBwYXRjaC4KPj4KPj4gQXBvbG9n
aWVzIGZvciB0aGUgbG9uZyBkZWxheSBpbiBnZXR0aW5nIGJhY2sgdG8geW91LiBZb3UgbWlnaHQg
aGF2ZSBub3RpY2VkCj4+IHNvbWUgZGlzY3Vzc2lvbiBhYm91dCB0aGUgb3ZlcmFsbCBhcHByb2Fj
aCwgYW5kIEkgd2FpdGVkIGZvciBpdCB0byBzZXR0bGUuCj4gVGhhdCBoYXNuJ3QgZ29uZSB1bm5v
dGljZWQhCj4KPj4gQWJvdXQgZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZSgpLCBpdCBpcyBhIHZlcnkg
ZGlmZmVyZW50IGZ1bmN0aW9uIHNvIGl0IGRvZXMKPj4gbm90IGFmZmVjdCB0aGlzIHNlcmllcy4g
VGhlIG5hbWUgc2ltaWxhcml0eSBpcyBjb25mdXNpbmcgaW5kZWVkLCBidXQKPj4gZGV2bV9vZl9k
cm1fZ2V0X2JyaWRnZSgpIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBteSBhcHByb2FjaCwgc28gb25l
IGxlc3MKPj4gc291cmNlIG9mIGNvbmZ1c2lvbi4KPiBJIGhhdmUgdG8gY29uZmVzcyB0aGF0IEkn
bSBzdGlsbCBjb25mdXNlZC4gZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBzdGF0ZXM6Cj4g
IkRpc3BsYXkgZHJpdmVycyBhcmUgcmVzcG9uc2libGUgZm9yIGxpbmtpbmcgZW5jb2RlcnMgd2l0
aCB0aGUgZmlyc3QgYnJpZGdlCj4gIGluIHRoZSBjaGFpbnMuIFRoaXMgaXMgZG9uZSBieSBhY3F1
aXJpbmcgdGhlIGFwcHJvcHJpYXRlIGJyaWRnZSB3aXRoCj4gIGRldm1fZHJtX29mX2dldF9icmlk
Z2UoKS4gT25jZSBhY3F1aXJlZCwgdGhlIGJyaWRnZSBzaGFsbCBiZSBhdHRhY2hlZCB0byB0aGUK
PiAgZW5jb2RlciB3aXRoIGEgY2FsbCB0byBkcm1fYnJpZGdlX2F0dGFjaCgpLgo+Cj4gIEJyaWRn
ZXMgYXJlIHJlc3BvbnNpYmxlIGZvciBsaW5raW5nIHRoZW1zZWx2ZXMgd2l0aCB0aGUgbmV4dCBi
cmlkZ2UgaW4gdGhlCj4gIGNoYWluLCBpZiBhbnkuIFRoaXMgaXMgZG9uZSB0aGUgc2FtZSB3YXkg
YXMgZm9yIGVuY29kZXJzLCB3aXRoIHRoZSBjYWxsIHRvCj4gIGRybV9icmlkZ2VfYXR0YWNoKCkg
b2NjdXJyaW5nIGluIHRoZSAmZHJtX2JyaWRnZV9mdW5jcy5hdHRhY2ggb3BlcmF0aW9uLiIKPiBE
b2VzIHRoaXMgbWVhbiB5b3VyIHNlcmllcyBlZmZlY3RpdmVseSBkZXByZWNhdGVzIGRldm1fZHJt
X29mX2dldF9icmlkZ2UoKT8KCldlbGwgc3BvdHRlZCEgSSB0aGVvcnkgeWVzLCBteSBzZXJpZXMg
a2luZCBvZiBpbXBsaWNpdGx5IGRlcHJlY2F0ZXMgb3RoZXIKZnVuY3Rpb25zIGJhc2VkIG9uIGl0
LCBpbmNsdWRpbmcgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgYW5kCipfb2ZfZ2V0X2Jy
aWRnZSgpLCB3aGljaCBhcmUgcHJvYmxlbWF0aWMgaW4gY2FzZSBvZiBicmlkZ2UgcmVtb3ZhbC4g
QnV0CmJlZm9yZSBleHBsaWNpdGx5IGRlcHJlY2F0aW5nIHRoZW0gd2UgbmVlZCBhIGdvb2QgYWx0
ZXJuYXRpdmUuIFdoaWNoIGluCnR1cm4gZGVwZW5kcyBvbiB0aGUgcmV3b3JrIG9mIHRoZSBwYW5l
bF9icmlkZ2UgbGlmZXRpbWUsIHdoaWNoIHdhcyBhbHNvCmRpc2N1c3NlZCB3aXRoIE1heGltZSBp
biB0aGUgc2FtZSB0aHJlYWQuCgpCb3R0b20gbGluZTogZm9yIG5vdyAqX29mX2dldF9icmlkZ2Uo
KSB1c2FnZSBpcyBzdGlsbCBPSywgYnV0IHN0YXkKdHVuZWQuIDotKQoKPj4gSSdtIHNvb24gc2Vu
ZGluZyB2MywgYW5kIEkgaGF2ZSB1cGRhdGVkIG15IHBhdGNoIHRvCj4+IGVzb25fZW5jb2Rlcl97
Y3Zicyxkc2ksaGRtaX0uYywgYWN0dWFsbHkgc3BsaXR0aW5nIGl0IGluIDMuIEknZCBiZSBncmF0
ZWZ1bAo+PiBpZiB5b3UgY291bGQgcmV2aWV3ZCBhbmQvb3QgdGVzdCB0aGVtIHdoZW4gSSBzZW5k
IHYzLiBCdXQgSSBkb24ndCB0aGluawo+PiB0aGVyZSBpcyBhIG5lZWQgZm9yIHlvdSB0byBzZW5k
IGFueSBwYXRjaGVzIHJlbGF0ZWQgdG8gdGhpcyB0b3BpYy4KPiBSZWdhcmRsZXNzIG9mIHRoZSBx
dWVzdGlvbnMgSSBzdGlsbCBoYXZlIGFyb3VuZAo+IGRldm1fZHJtX29mX2dldF9icmlkZ2UoKTog
SSdsbCBnaXZlIHlvdXIgcGF0Y2hlcyBhIGdvIGluIHRoZSBuZXh0Cj4gZGF5cy4KClRoYW5rIHlv
dSwgdjMgaXMgdGhlcmUgYXdhaXRpbmcgeW91IQoKQmVzdCByZWdhcmRzLApMdWNhCgotLQpMdWNh
IENlcmVzb2xpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
