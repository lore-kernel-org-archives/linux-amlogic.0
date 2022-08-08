Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C24C00140
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utM+417L295K73N0bu8Lw+3lom2sj7D5tBMM0BU+mdA=; b=IC4Wu3Hq3aP8BN
	seTAEYYbSqtelkqQgudcTEuHA1XFKumJlYqOdsauQev4ouaJM0ANHPh+WopJkud7b3yvVygZkprn3
	F+PZZT+h/Az9/z4LyQdLi9B41wDfkIiqSqumTX/iGaLaEx0moxuduUJK5QH/oE6WlvHJ+tkpAc6Qw
	z9Nyp3S0kUHEP3w4OyuVyhZ0wBsXWTpviYCEAi4kTt713AQUXvQPglllMiLu+lzvtjxTUrbQKUJqX
	VpU8uOCXqq54gi8ILSV/vt46XBH5P8j72yL4zIRza4WdSUyTMYeGr9ngYs/pcrsVVaE6ZnAHGz9MZ
	fa1oNM3PWqsbMBQtPMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2CC-00Dpj2-QA; Mon, 08 Aug 2022 12:49:24 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2C1-00Dpfb-48; Mon, 08 Aug 2022 12:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G3MaW7kSYZuMclka/Q3KdMVcnRc0tc/Et8yfYULCynQ=; b=iqw5Csu28VnoEc7vARcIhbwfqu
	yMk2QZCnoa7Y+Nq1c4OYg/on/3g0JXfDfDVLkVT2gtS65R3lLIJjJhdlyn2NwE6tl6/gyCfDid9h4
	oIxM+W1wXM2ysGLQkxbxjtCH4eD9j2zbJs96qAMuUGEl6tM0J2RrWRu7hNGpJYGyTTfkkolsJkQCz
	NIFEpFgOiD9VVYG62zaxc+mn35nfaigoFiS4zh2ZrIhBTzBFyah/nnlJviuqjYXYv3SjClAAfMtAq
	nITFsMIMI8UCuXYMcJjdvJAfgfbH14cvX/qrbI5IYd9pj1EpH/C9qok5onYfzdunbnNb5WbCuDH2e
	krpv+m2w==;
Received: from [2a01:799:961:d200:fd91:af1e:9da7:f964] (port=64771)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oL2By-0006Tp-QU; Mon, 08 Aug 2022 14:49:10 +0200
Message-ID: <d96df677-a1a7-ae49-bda6-abad025dc974@tronnes.org>
Date: Mon, 8 Aug 2022 14:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 06/35] drm/connector: Only register TV mode property if
 present
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
 <20220728-rpi-analog-tv-properties-v1-6-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-6-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_054913_182278_CC9DB3D2 
X-CRM114-Status: GOOD (  13.10  )
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

CgpEZW4gMjkuMDcuMjAyMiAxOC4zNCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBUaGUgZHJtX2Ny
ZWF0ZV90dl9wcm9wZXJ0aWVzKCkgd2lsbCBjcmVhdGUgdGhlIFRWIG1vZGUgcHJvcGVydHkKPiB1
bmNvbmRpdGlvbmFsbHkuCj4gCj4gSG93ZXZlciwgc2luY2Ugd2UnbGwgZ3JhZHVhbGx5IHBoYXNl
IGl0IG91dCwgbGV0J3MgcmVnaXN0ZXIgaXQgb25seSBpZiB3ZQo+IGhhdmUgYSBsaXN0IHBhc3Nl
ZCBhcyBhbiBhcmd1bWVudC4gVGhpcyB3aWxsIG1ha2UgdGhlIHRyYW5zaXRpb24gZWFzaWVyLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPgo+IAoK
SSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIG1ha2VzIHRoZSB0cmFuc2l0aW9uIGVhc2llciwg
YnV0IGlmIHlvdQp0aGluayBzbzoKCkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9y
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gaW5kZXggNjhhNGU0N2Y4NWE5
Li5kNzNhNjg3NjRiNmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0
b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiBAQCAtMTY4NCw3
ICsxNjg0LDYgQEAgaW50IGRybV9tb2RlX2NyZWF0ZV90dl9wcm9wZXJ0aWVzKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCj4gIAlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICp0dl9zZWxlY3RvcjsKPiAgCXN0
cnVjdCBkcm1fcHJvcGVydHkgKnR2X3N1YmNvbm5lY3RvcjsKPiAgCXN0cnVjdCBkcm1fcHJvcGVy
dHkgKnR2X25vcm07Cj4gLQl1bnNpZ25lZCBpbnQgaTsKPiAgCj4gIAlpZiAoZGV2LT5tb2RlX2Nv
bmZpZy50dl9zZWxlY3Rfc3ViY29ubmVjdG9yX3Byb3BlcnR5KQo+ICAJCXJldHVybiAwOwo+IEBA
IC0xNzIzLDE1ICsxNzIyLDE5IEBAIGludCBkcm1fbW9kZV9jcmVhdGVfdHZfcHJvcGVydGllcyhz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCWdvdG8gbm9tZW07Cj4gIAlkZXYtPm1vZGVfY29u
ZmlnLnR2X25vcm1fcHJvcGVydHkgPSB0dl9ub3JtOwo+ICAKPiAtCWRldi0+bW9kZV9jb25maWcu
dHZfbW9kZV9wcm9wZXJ0eSA9Cj4gLQkJZHJtX3Byb3BlcnR5X2NyZWF0ZShkZXYsIERSTV9NT0RF
X1BST1BfRU5VTSwKPiAtCQkJCSAgICAibW9kZSIsIG51bV9tb2Rlcyk7Cj4gLQlpZiAoIWRldi0+
bW9kZV9jb25maWcudHZfbW9kZV9wcm9wZXJ0eSkKPiAtCQlnb3RvIG5vbWVtOwo+ICsJaWYgKG51
bV9tb2Rlcykgewo+ICsJCXVuc2lnbmVkIGludCBpOwo+ICAKPiAtCWZvciAoaSA9IDA7IGkgPCBu
dW1fbW9kZXM7IGkrKykKPiAtCQlkcm1fcHJvcGVydHlfYWRkX2VudW0oZGV2LT5tb2RlX2NvbmZp
Zy50dl9tb2RlX3Byb3BlcnR5LAo+IC0JCQkJICAgICAgaSwgbW9kZXNbaV0pOwo+ICsJCWRldi0+
bW9kZV9jb25maWcudHZfbW9kZV9wcm9wZXJ0eSA9Cj4gKwkJCWRybV9wcm9wZXJ0eV9jcmVhdGUo
ZGV2LCBEUk1fTU9ERV9QUk9QX0VOVU0sCj4gKwkJCQkJICAgICJtb2RlIiwgbnVtX21vZGVzKTsK
PiArCQlpZiAoIWRldi0+bW9kZV9jb25maWcudHZfbW9kZV9wcm9wZXJ0eSkKPiArCQkJZ290byBu
b21lbTsKPiArCj4gKwkJZm9yIChpID0gMDsgaSA8IG51bV9tb2RlczsgaSsrKQo+ICsJCQlkcm1f
cHJvcGVydHlfYWRkX2VudW0oZGV2LT5tb2RlX2NvbmZpZy50dl9tb2RlX3Byb3BlcnR5LAo+ICsJ
CQkJCSAgICAgIGksIG1vZGVzW2ldKTsKPiArCX0KPiAgCj4gIAlkZXYtPm1vZGVfY29uZmlnLnR2
X2JyaWdodG5lc3NfcHJvcGVydHkgPQo+ICAJCWRybV9wcm9wZXJ0eV9jcmVhdGVfcmFuZ2UoZGV2
LCAwLCAiYnJpZ2h0bmVzcyIsIDAsIDEwMCk7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
