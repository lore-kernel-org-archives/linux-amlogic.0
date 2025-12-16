Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87327D5E146
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2HZIUe8S5gR4TBGfakaTLFtFHCzDLuYPfCJRGD6YWA=; b=FCzlEjfCT4/Nmz
	/PkuSaphvCOVq86K12ZPbKXT2O+6xk3BwZ/q+FQES/tlkX44oX7ogWqeLRaygW5yh6+2oIsSuZdVH
	PdQPrGP6nGmDTezdkBicVafClmMK5bFUFJeUe1yq/v6FgyFEVRnIrgOjr2OcZ9++hhyK9kM+4znrT
	961iWOa9Q/52SvMk7SJqADSNtqk5UPCByLvI3ru8VlT1j+0OftbR49b5Cvws2KE8YEIMZdXa8aFG+
	IgDtZTIHLw95b66CHeGOlDrn/H5iV5btXLSTHMNcjsc8AM27YF8x8IJ6VoYp2qLT6qXgmsJ0bCuDb
	4Icf3kDIL9eAwin6Odsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVURp-00000005CzU-2IMk;
	Tue, 16 Dec 2025 12:46:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVURk-00000005Cxi-3kRL
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 12:46:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48847C19D31;
	Tue, 16 Dec 2025 12:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0B896071C;
	Tue, 16 Dec 2025 12:46:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F6D9119434E1;
	Tue, 16 Dec 2025 13:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765889187; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5hHeRHBPz8FHrfA8wBRwIPdvL07IcL4vWcbkjQN6o5U=;
	b=m6Q9kiwXvA4v1X/hP/+JyTcjUw1OsRZD6sX9zF23Uc56YUe0aF7FfA2KCuP1M2obR4PlMb
	aPzIj3mIE/PPPTiVXNNK9IvGfQU/IcRxA1u3tSisdJ4StT4ZwIhS9r2tuvD4DcqrWN6HK7
	r+Fv7dhPRtuhT08YnqBBjRN6nck6Vv5kD/gUckn233hlRlfhJoVzlbq0b8DUv//EcPVzWh
	C+Xfl+is9PJ7W3ZgO6EOYgUa9QWFL4H0SQzz534bgN3xNr/BymxAexqEz6ffIeUj20qWGx
	KQmu8ehyJNbQzZEDn46VBO1vOEXe44XkhxfLx234QUnyLF1DRhsghK7L/S8xtg==
Mime-Version: 1.0
Date: Tue, 16 Dec 2025 13:46:11 +0100
Message-Id: <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
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
X-Mailer: aerc 0.20.1
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com> <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com> <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
In-Reply-To: <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_044633_445763_E2512EB2 
X-CRM114-Status: GOOD (  21.45  )
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

SGVsbG8gTWFydGluLAoKT24gU3VuIE5vdiAzMCwgMjAyNSBhdCAyOjA5IFBNIENFVCwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBMdWNhLAo+Cj4gT24gRnJpLCBOb3YgMjgsIDIwMjUg
YXQgNTo1NOKAr1BNIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+IHdy
b3RlOgo+Pgo+PiBUaGlzIGRyaXZlciBvYnRhaW5zIGEgYnJpZGdlIHBvaW50ZXIgZnJvbSBvZl9k
cm1fZmluZF9icmlkZ2UoKSBpbiB0aGUgcHJvYmUKPj4gZnVuY3Rpb24gYW5kIHN0b3JlcyBpdCB1
bnRpbCBkcml2ZXIgcmVtb3ZhbC4gb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgaXMKPj4gZGVwcmVjYXRl
ZC4gTW92ZSB0byBkZXZtX29mX2RybV9nZXRfYnJpZGdlKCkgd2hpY2ggcHV0cyB0aGUgYnJpZGdl
Cj4+IHJlZmVyZW5jZSBvbiByZW1vdmUgb3Igb24gcHJvYmUgZmFpbHVyZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KPj4gLS0t
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9jdmJzLmMgfCAyICstCj4+
ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9kc2kuYyAgfCAyICstCj4+ICBk
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMgfCAyICstCj4+ICAzIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYwo+PiBpbmRleCBkYzM3NGJmYzU5
NTEuLmJmODU4OGE1ZjZkZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX2VuY29kZXJfY3Zicy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9l
bmNvZGVyX2N2YnMuYwo+PiBAQCAtMjQxLDcgKzI0MSw3IEBAIGludCBtZXNvbl9lbmNvZGVyX2N2
YnNfcHJvYmUoc3RydWN0IG1lc29uX2RybSAqcHJpdikKPj4gICAgICAgICAgICAgICAgIHJldHVy
biAwOwo+PiAgICAgICAgIH0KPj4KPj4gLSAgICAgICBtZXNvbl9lbmNvZGVyX2N2YnMtPm5leHRf
YnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKHJlbW90ZSk7Cj4+ICsgICAgICAgbWVzb25fZW5j
b2Rlcl9jdmJzLT5uZXh0X2JyaWRnZSA9IGRldm1fb2ZfZHJtX2dldF9icmlkZ2UocHJpdi0+ZGV2
LCByZW1vdGUpOwo+PiAgICAgICAgIG9mX25vZGVfcHV0KHJlbW90ZSk7Cj4+ICAgICAgICAgaWYg
KCFtZXNvbl9lbmNvZGVyX2N2YnMtPm5leHRfYnJpZGdlKQo+PiAgICAgICAgICAgICAgICAgcmV0
dXJuIGRldl9lcnJfcHJvYmUocHJpdi0+ZGV2LCAtRVBST0JFX0RFRkVSLAo+IFdvdWxkIHlvdSBi
ZSBoYXBweSB3aXRoIG1lIHNlbmRpbmcgYSBwYXRjaCB0aGF0IHJlcGxhY2VzIHRoZSB3aG9sZQo+
IGxvZ2ljIGluIHR3byBtZXNvbl9lbmNvZGVyX3tjdmJzLGRzaSxoZG1pfS5jIHdpdGgKPiBkZXZt
X2RybV9vZl9nZXRfYnJpZGdlKCk/Cj4gSSBzZWUgdHdvIGJlbmVmaXRzOgo+IC0gc2ltcGxlciBj
b2RlCj4gLSBhIHBhdGNoIGxlc3MgaW4geW91ciBzZXJpZXMgKGxlc3MgbWFpbnRlbmFuY2UgYnVy
ZGVuIGZvciB5b3UpCj4KPiBXaGF0IEknbSBub3Qgc3VyZSBhYm91dCBpcyBob3cgdGhpcyBzZXJp
ZXMgaW50ZXJhY3RzIHdpdGgKPiBkZXZtX2RybV9vZl9nZXRfYnJpZGdlKCkgd2hpY2ggaXMgd2h5
IEknbSBhc2tpbmcgYmVmb3JlIGNvb2tpbmcgYQo+IHBhdGNoLgoKQXBvbG9naWVzIGZvciB0aGUg
bG9uZyBkZWxheSBpbiBnZXR0aW5nIGJhY2sgdG8geW91LiBZb3UgbWlnaHQgaGF2ZSBub3RpY2Vk
CnNvbWUgZGlzY3Vzc2lvbiBhYm91dCB0aGUgb3ZlcmFsbCBhcHByb2FjaCwgYW5kIEkgd2FpdGVk
IGZvciBpdCB0byBzZXR0bGUuCgpBYm91dCBkZXZtX2RybV9vZl9nZXRfYnJpZGdlKCksIGl0IGlz
IGEgdmVyeSBkaWZmZXJlbnQgZnVuY3Rpb24gc28gaXQgZG9lcwpub3QgYWZmZWN0IHRoaXMgc2Vy
aWVzLiBUaGUgbmFtZSBzaW1pbGFyaXR5IGlzIGNvbmZ1c2luZyBpbmRlZWQsIGJ1dApkZXZtX29m
X2RybV9nZXRfYnJpZGdlKCkgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIG15IGFwcHJvYWNoLCBzbyBv
bmUgbGVzcwpzb3VyY2Ugb2YgY29uZnVzaW9uLgoKSSdtIHNvb24gc2VuZGluZyB2MywgYW5kIEkg
aGF2ZSB1cGRhdGVkIG15IHBhdGNoIHRvCmVzb25fZW5jb2Rlcl97Y3Zicyxkc2ksaGRtaX0uYywg
YWN0dWFsbHkgc3BsaXR0aW5nIGl0IGluIDMuIEknZCBiZSBncmF0ZWZ1bAppZiB5b3UgY291bGQg
cmV2aWV3ZCBhbmQvb3QgdGVzdCB0aGVtIHdoZW4gSSBzZW5kIHYzLiBCdXQgSSBkb24ndCB0aGlu
awp0aGVyZSBpcyBhIG5lZWQgZm9yIHlvdSB0byBzZW5kIGFueSBwYXRjaGVzIHJlbGF0ZWQgdG8g
dGhpcyB0b3BpYy4KCkJlc3QgcmVnYXJkcywKTHVjYQoKLS0KTHVjYSBDZXJlc29saSwgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
