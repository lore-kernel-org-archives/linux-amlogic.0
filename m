Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C5FC00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNp+3nlpGevtkB0WSjCrXcfa8musT47JLK6I8H3tNZg=; b=oI968oWQqJusV9
	mziygjyd4Mm1syBoG7ev10sWbvO/cihWTg6n6pUvM3+8SzGEAo/e+JfS51RVh9EZ+HxPYzdCkJwYD
	kSzOGEe+M3RGJzHvNb7pVYL8891r2pTdb3/MER+5MGCTU2JXDadrMmQcTwdoVg5Me5CwMrN6d/t5G
	DOCseFtFrf5BBNtvbWxnVwVJJ/5jjyvb2X0iXdBBBPcTA/lZvFU8Xt1AA1OJSuW5p0++xTZzsXTJY
	VgxMwzk4Pf9Dg3erbLu8Q5jfugEhvVQxZAEbrbu3iEQ+b5dEcDwYdhORz5YqGOZu4ieGjBVqnyQRF
	D25MFyX55V+MOuX5qSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL1uS-00DhoD-V6; Mon, 08 Aug 2022 12:31:04 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL1uC-00Dhe5-Ih; Mon, 08 Aug 2022 12:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aTFI4YVbXZ6usAs6qmL4aqawvxutNGWZ+bPJxb56Zzs=; b=Zf4scpgkroyhRk+7M353lZ2dAj
	GI38loaZk0z2PjpD8QJloqFrxZSPJOneXn9eX16cNTxVJ5l9a0+J+oFOqYDouS2eRMd3y6ll+d3mB
	rRyYXnvzsxNqH3gcZv0WBmHarSLpw0zJ7Ho0DxrA0YLvB/QxyfzdE9j8dm1aHcccDbYD1vMStJ2EM
	qF5qUJckHqLKEdcElFzosBjdoxzWrTFfDU8OOsFluME14BT6mElYm+e6uTugqAXcjEN34ji8HvUCl
	8xJpumDOA98zo4Huk+fgh/sS8iHQt0PzCxyb4ev0Y822Zktqj2EBWABiwyFM2VRF1vlO/Z12wcnDo
	rm0p7o2w==;
Received: from [2a01:799:961:d200:fd91:af1e:9da7:f964] (port=64170)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oL1u9-0000q8-GR; Mon, 08 Aug 2022 14:30:45 +0200
Message-ID: <6e47ce2d-25c7-7254-703d-2a1d3bb64373@tronnes.org>
Date: Mon, 8 Aug 2022 14:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 03/35] drm/atomic: Add TV subconnector property to
 get/set_property
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_053048_637310_78CCCDFB 
X-CRM114-Status: GOOD (  12.97  )
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

CgpEZW4gMjkuMDcuMjAyMiAxOC4zNCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBUaGUgc3ViY29u
bmVjdG9yIHByb3BlcnR5IHdhcyBjcmVhdGVkIGJ5IGRybV9tb2RlX2NyZWF0ZV90dl9wcm9wZXJ0
aWVzKCksCj4gYnV0IHdhc24ndCBleHBvc2VkIHRvIHRoZSB1c2Vyc3BhY2UgdGhyb3VnaCB0aGUg
Z2VuZXJpYwo+IGF0b21pY19nZXQvc2V0X3Byb3BlcnR5IGltcGxlbWVudGF0aW9uLCBhbmQgd2Fz
bid0IHN0b3JlZCBpbiBhbnkgZ2VuZXJpYwo+IHN0YXRlIHN0cnVjdHVyZS4KPiAKPiBMZXQncyBz
b2x2ZSB0aGlzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJu
by50ZWNoPgo+IAoKSSBqdXN0IHJlYWxpc2VkIHRoYXQgdGhpcyBhbmQgdGhlIHNlbGVjdF9zdWJj
b25uZWN0b3IgcHJvcGVydHkgaXNuJ3QKdXNlZCBieSBhbnkgZHJpdmVycy4gRG8geW91IHBsYW4g
dG8gdXNlIHRoZW0/IE1heWJlIHRoZXkgZG9uJ3QgbmVlZCB0bwpiZSB3aXJlZCB1cCBhdCBhbGwu
CgpBbnl3YXlzLCB1cCB0byB5b3U6CgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21p
Y191YXBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMKPiBpbmRleCBjNzRj
NzhhMjgxNzEuLmMwNmQwNjM5ZDU1MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2F0b21pY191YXBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMK
PiBAQCAtNjg4LDYgKzY4OCw4IEBAIHN0YXRpYyBpbnQgZHJtX2F0b21pY19jb25uZWN0b3Jfc2V0
X3Byb3BlcnR5KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gIAkJcmV0dXJuIC1F
SU5WQUw7Cj4gIAl9IGVsc2UgaWYgKHByb3BlcnR5ID09IGNvbmZpZy0+dHZfc2VsZWN0X3N1YmNv
bm5lY3Rvcl9wcm9wZXJ0eSkgewo+ICAJCXN0YXRlLT50di5zZWxlY3Rfc3ViY29ubmVjdG9yID0g
dmFsOwo+ICsJfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPnR2X3N1YmNvbm5lY3Rvcl9w
cm9wZXJ0eSkgewo+ICsJCXN0YXRlLT50di5zdWJjb25uZWN0b3IgPSB2YWw7Cj4gIAl9IGVsc2Ug
aWYgKHByb3BlcnR5ID09IGNvbmZpZy0+dHZfbGVmdF9tYXJnaW5fcHJvcGVydHkpIHsKPiAgCQlz
dGF0ZS0+dHYubWFyZ2lucy5sZWZ0ID0gdmFsOwo+ICAJfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBj
b25maWctPnR2X3JpZ2h0X21hcmdpbl9wcm9wZXJ0eSkgewo+IEBAIC03OTYsNiArNzk4LDggQEAg
ZHJtX2F0b21pY19jb25uZWN0b3JfZ2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCj4gIAkJCSp2YWwgPSBjb25uZWN0b3ItPmRwbXM7Cj4gIAl9IGVsc2UgaWYgKHBy
b3BlcnR5ID09IGNvbmZpZy0+dHZfc2VsZWN0X3N1YmNvbm5lY3Rvcl9wcm9wZXJ0eSkgewo+ICAJ
CSp2YWwgPSBzdGF0ZS0+dHYuc2VsZWN0X3N1YmNvbm5lY3RvcjsKPiArCX0gZWxzZSBpZiAocHJv
cGVydHkgPT0gY29uZmlnLT50dl9zdWJjb25uZWN0b3JfcHJvcGVydHkpIHsKPiArCQkqdmFsID0g
c3RhdGUtPnR2LnN1YmNvbm5lY3RvcjsKPiAgCX0gZWxzZSBpZiAocHJvcGVydHkgPT0gY29uZmln
LT50dl9sZWZ0X21hcmdpbl9wcm9wZXJ0eSkgewo+ICAJCSp2YWwgPSBzdGF0ZS0+dHYubWFyZ2lu
cy5sZWZ0Owo+ICAJfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPnR2X3JpZ2h0X21hcmdp
bl9wcm9wZXJ0eSkgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgg
Yi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBpbmRleCBmODA5MWVkZjlhMzMuLjFlOTk5
NmIzM2NjOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBAQCAtNjcyLDYgKzY3Miw3IEBAIHN0cnVj
dCBkcm1fY29ubmVjdG9yX3R2X21hcmdpbnMgewo+ICAvKioKPiAgICogc3RydWN0IGRybV90dl9j
b25uZWN0b3Jfc3RhdGUgLSBUViBjb25uZWN0b3IgcmVsYXRlZCBzdGF0ZXMKPiAgICogQHNlbGVj
dF9zdWJjb25uZWN0b3I6IHNlbGVjdGVkIHN1YmNvbm5lY3Rvcgo+ICsgKiBAc3ViY29ubmVjdG9y
OiBkZXRlY3RlZCBzdWJjb25uZWN0b3IKPiAgICogQG1hcmdpbnM6IFRWIG1hcmdpbnMKPiAgICog
QG1vZGU6IFRWIG1vZGUKPiAgICogQGJyaWdodG5lc3M6IGJyaWdodG5lc3MgaW4gcGVyY2VudAo+
IEBAIC02ODMsNiArNjg0LDcgQEAgc3RydWN0IGRybV9jb25uZWN0b3JfdHZfbWFyZ2lucyB7Cj4g
ICAqLwo+ICBzdHJ1Y3QgZHJtX3R2X2Nvbm5lY3Rvcl9zdGF0ZSB7Cj4gIAllbnVtIGRybV9tb2Rl
X3N1YmNvbm5lY3RvciBzZWxlY3Rfc3ViY29ubmVjdG9yOwo+ICsJZW51bSBkcm1fbW9kZV9zdWJj
b25uZWN0b3Igc3ViY29ubmVjdG9yOwo+ICAJc3RydWN0IGRybV9jb25uZWN0b3JfdHZfbWFyZ2lu
cyBtYXJnaW5zOwo+ICAJdW5zaWduZWQgaW50IG1vZGU7Cj4gIAl1bnNpZ25lZCBpbnQgYnJpZ2h0
bmVzczsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
