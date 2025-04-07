Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80638C369A3
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Apr 2025 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVK3kgBIAm+qyIgJNbqrGUYCrWsOsZZzFrfCxSctl84=; b=GahE41n8brfi/Y
	7o5Lbpq6w/WrC/h3PMvWwNX/oycaZPtTboL9VUTZU2UetlWGhYYuFSXeZvg8+P/2p6VWQya8qYZAc
	1kYeih2SGJjTTPPK69+1EWxqaVwf0DImUh3Rv3axhz1J7lFdhqEj3w29QOXqTSFyViogrBZJzd0VO
	zrM4eYDNV7bioLBMGWX32zGPje/7EF+Q/tdln5yKDW3KZ1jGn5bdw02TYcvjNeJPM/vwHspc9kjs6
	iHGswpYkiF3M7LPulaf6T1TvGEH0PC0mw3pKoHld/SENfIsF9UIpvBe3dIngm84HbEXT3Ha32FYP7
	Qslek1h2orAbC7SBTggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pK9-00000001ArP-08j1;
	Mon, 07 Apr 2025 16:27:49 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nPl-00000000icm-2nVl;
	Mon, 07 Apr 2025 14:25:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ED98442B9;
	Mon,  7 Apr 2025 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/X88yeD1voD1ZKSu14DhZwpptFTgIWDAW6qq25rOxI=;
	b=IdnM/FzWiqmeC4QLFNCoiaAiunvmEJdv+JOhvr+KgITXbyea9Nb/myky8AH7792qyUIAKb
	GXChJ406E5DOWWT80omvrh/feLFLi+aIk58+t+KBfm0z03mJHu+hEYqrKl/aTnrBFlJVvc
	c8aqvDV6iPYgcQdNwZnwCugnaTUqZ0LDtS6pxqLPV5WCbQoCVRsy9JT8jtJj26+iTmD/VD
	yRqkLdUZGexZAY0xUGoYauDk71Y8kWnmJPldCFLXcjnL4IPlbbO2bbe5DNxNtTqDS8broP
	LLAbNMf78c2dwGGtF/1WDG75gmA8KnHEDd1366lJq5e9VN3RWurZpRmJ0H3fFQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:42 +0200
Subject: [PATCH 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
MIME-Version: 1.0
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-27-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeegpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_072529_900131_83942039 
X-CRM114-Status: GOOD (  14.10  )
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KClRoaXMgZHJp
dmVyIGFscmVhZHkgaW1wbGVtZW50cyByZWZjb3VudGluZyBvZiB0aGUgc3RydWN0IHZjNF9kc2ks
IHdoaWNoCmVtYmVkcyBzdHJ1Y3QgZHJtX2JyaWRnZS4gTm93IHRoaXMgaXMgYSBkdXBsaWNhdGUg
b2YgdGhlIHJlZmNvdW50aW5nCmltcGxlbWVudGVkIGJ5IHRoZSBEUk0gYnJpZGdlIGNvcmUsIHNv
IGNvbnZlcnQgdGhlIHZjNF9kc2lfZ2V0L3B1dCgpIGNhbGxzCmludG8gZHJtX2JyaWRnZV9nZXQv
cHV0KCkgY2FsbHMgYW5kIGdldCByaWQgb2YgdGhlIGRyaXZlci1zcGVjaWZpYwpyZWZjb3VudGlu
ZyBpbXBsZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+CgotLS0KCkNjOiAiTWHDrXJhIENhbmFsIiA8bWNhbmFsQGlnYWxp
YS5jb20+CkNjOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29t
PgpDYzogUmFzcGJlcnJ5IFBpIEtlcm5lbCBNYWludGVuYW5jZSA8a2VybmVsLWxpc3RAcmFzcGJl
cnJ5cGkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jIHwgMzAgKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9k
c2kuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCmluZGV4IGVmYzZmNjA3OGIwMjY3
NjRjNTljZmIyYTMzYjI4YTg4YjcwMThjM2EuLjMwNzFmYTM2ZmRmYThlM2Y0NDg1MDE5YTY0ZDgz
ZWY2OWZhYzczYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jCkBAIC01NTIsOCArNTUyLDYgQEAgc3Ry
dWN0IHZjNF9kc2kgewogCXN0cnVjdCB2YzRfZW5jb2RlciBlbmNvZGVyOwogCXN0cnVjdCBtaXBp
X2RzaV9ob3N0IGRzaV9ob3N0OwogCi0Jc3RydWN0IGtyZWYga3JlZjsKLQogCXN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXY7CiAKIAlzdHJ1Y3QgZHJtX2JyaWRnZSAqb3V0X2JyaWRnZTsKQEAg
LTE2MjIsMjkgKzE2MjAsMTEgQEAgc3RhdGljIHZvaWQgdmM0X2RzaV9kbWFfY2hhbl9yZWxlYXNl
KHZvaWQgKnB0cikKIAlkc2ktPnJlZ19kbWFfY2hhbiA9IE5VTEw7CiB9CiAKLXN0YXRpYyB2b2lk
IHZjNF9kc2lfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZikKLXsKLQlzdHJ1Y3QgdmM0X2RzaSAq
ZHNpID0KLQkJY29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCB2YzRfZHNpLCBrcmVmKTsKLQotCWtm
cmVlKGRzaSk7Ci19Ci0KLXN0YXRpYyB2b2lkIHZjNF9kc2lfZ2V0KHN0cnVjdCB2YzRfZHNpICpk
c2kpCi17Ci0Ja3JlZl9nZXQoJmRzaS0+a3JlZik7Ci19Ci0KLXN0YXRpYyB2b2lkIHZjNF9kc2lf
cHV0KHN0cnVjdCB2YzRfZHNpICpkc2kpCi17Ci0Ja3JlZl9wdXQoJmRzaS0+a3JlZiwgJnZjNF9k
c2lfcmVsZWFzZSk7Ci19Ci0KIHN0YXRpYyB2b2lkIHZjNF9kc2lfcmVsZWFzZV9hY3Rpb24oc3Ry
dWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqcHRyKQogewogCXN0cnVjdCB2YzRfZHNpICpkc2kg
PSBwdHI7CiAKLQl2YzRfZHNpX3B1dChkc2kpOworCWRybV9icmlkZ2VfcHV0KCZkc2ktPmJyaWRn
ZSk7CiB9CiAKIHN0YXRpYyBpbnQgdmM0X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQpAQCAtMTY1NSw3ICsxNjM1LDcgQEAgc3Rh
dGljIGludCB2YzRfZHNpX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpt
YXN0ZXIsIHZvaWQgKmRhdGEpCiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyID0gJmRzaS0+
ZW5jb2Rlci5iYXNlOwogCWludCByZXQ7CiAKLQl2YzRfZHNpX2dldChkc2kpOworCWRybV9icmlk
Z2VfZ2V0KCZkc2ktPmJyaWRnZSk7CiAKIAlyZXQgPSBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQo
ZHJtLCB2YzRfZHNpX3JlbGVhc2VfYWN0aW9uLCBkc2kpOwogCWlmIChyZXQpCkBAIC0xODEwLDE1
ICsxNzkwLDEyIEBAIHN0YXRpYyBpbnQgdmM0X2RzaV9kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVj
dCB2YzRfZHNpICpkc2k7CiAKLQlkc2kgPSBremFsbG9jKHNpemVvZigqZHNpKSwgR0ZQX0tFUk5F
TCk7CisJZHNpID0gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCZwZGV2LT5kZXYsIHN0cnVjdCB2YzRf
ZHNpLCBicmlkZ2UsICZ2YzRfZHNpX2JyaWRnZV9mdW5jcyk7CiAJaWYgKCFkc2kpCiAJCXJldHVy
biAtRU5PTUVNOwogCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGRzaSk7CiAKLQlrcmVmX2luaXQoJmRz
aS0+a3JlZik7Ci0KIAlkc2ktPnBkZXYgPSBwZGV2OwotCWRzaS0+YnJpZGdlLmZ1bmNzID0gJnZj
NF9kc2lfYnJpZGdlX2Z1bmNzOwogI2lmZGVmIENPTkZJR19PRgogCWRzaS0+YnJpZGdlLm9mX25v
ZGUgPSBkZXYtPm9mX25vZGU7CiAjZW5kaWYKQEAgLTE4MzYsNyArMTgxMyw2IEBAIHN0YXRpYyB2
b2lkIHZjNF9kc2lfZGV2X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0
cnVjdCB2YzRfZHNpICpkc2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAogCW1pcGlfZHNpX2hv
c3RfdW5yZWdpc3RlcigmZHNpLT5kc2lfaG9zdCk7Ci0JdmM0X2RzaV9wdXQoZHNpKTsKIH0KIAog
c3RydWN0IHBsYXRmb3JtX2RyaXZlciB2YzRfZHNpX2RyaXZlciA9IHsKCi0tIAoyLjQ5LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
