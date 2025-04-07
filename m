Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1451C36010
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Apr 2025 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qk4v+pyiOgr8F2cN/3Hz+FO1qgRr+RBF/PeJrNLQ1zw=; b=jVdlyInDrcBwn1
	pEFaWZTwFiZAahvKGApzfRUEZZoNpuEcpXhT+WNu4DcJVtBkMdkgDFuvRYxqpsZbojS95ADAOXjxd
	EqkONSuUuRPSwsG/DsxcGbYzQGYlYud+6ofguZX6fCSoCWucHxZ+MdDe4lBTzKqU1FPkRTKOrjT+P
	5F1IosaUmgA3kb/f/plgQYtzHEFr5UpGHxMODEKkSlABfFk6ZcPWGJUawIxJJrSiwEztOCQvvTV6B
	KGscrhrTGOYA7+AUtG7xevBwG/T6TJ5CwJSY5PyoH5H2JkqA6QZ/OYWS02b1FjOu4nmrYDKVemmZU
	O9Wq/UcPnHXnBBzVdiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nRw-00000000jRw-2OGI;
	Mon, 07 Apr 2025 14:27:44 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nOS-00000000hwi-3RJn;
	Mon, 07 Apr 2025 14:24:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A7CB442B9;
	Mon,  7 Apr 2025 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtT82CTCAJi7GIQsdFWvOD88JDJ6rvOOMJtHFDPWzVk=;
	b=CdOix076zY2dsvoFeunrgd4LWuCU+L4H3Kr5x9w+AJ+6d64WjgTuaKyPvgk0JwZNaNSuc1
	Yk6J6XTdlCKxt2ZgfvPQtWq4DgO+p/J9UiTe5mstIGQL3jcq73dgQP4RBzJJZEmQ55wCS5
	vnnvGgCPKhW6w1KZVJhxX5Yu7bSG+SAzSY4MzpyLi9W355Y6Q3EXApH8j53+A6+dyqYHu7
	km4pLGPQF+NzfHn37BZr5vYFnnGn8kyj0FmVBrOW0E5Ds+O8pZIhdZLdzcWqJVe5lLL7Sh
	pU4jW53itNYhKW2eR8sJqhRLwvbaKYoLVCRpTsAFMM4tKFD3F8ZU4WPzGBRS1g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:17 +0200
Subject: [PATCH 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeegpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_072409_002977_606C3E89 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KClNpZ25lZC1v
ZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+CgotLS0KCkNj
OiAiQnJ5YW4gTydEb25vZ2h1ZSIgPGJyeWFuLm9kb25vZ2h1ZUBsaW5hcm8ub3JnPgpDYzogIkls
cG8gSsOkcnZpbmVuIiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0vYXJtNjQv
YWNlci1hc3BpcmUxLWVjLmMgfCA3ICsrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9hcm02
NC9hY2VyLWFzcGlyZTEtZWMuYyBiL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvYWNlci1hc3BpcmUx
LWVjLmMKaW5kZXggOTU4ZmUxYmY1Zjg1YmI2OWFjNzk2MmYyMTdkZTlmMGI0MGNkZTlhMS4uNDM4
NTMyYTA0N2U2ODc5OWFjNTNhMTZhNGM4MTNmYzE2YmU5OTdiOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wbGF0Zm9ybS9hcm02NC9hY2VyLWFzcGlyZTEtZWMuYworKysgYi9kcml2ZXJzL3BsYXRmb3Jt
L2FybTY0L2FjZXItYXNwaXJlMS1lYy5jCkBAIC00NTIsOSArNDUyLDkgQEAgc3RhdGljIGludCBh
c3BpcmVfZWNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAlpbnQgcmV0OwogCXU4
IHRtcDsKIAotCWVjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCplYyksIEdGUF9LRVJORUwp
OwotCWlmICghZWMpCi0JCXJldHVybiAtRU5PTUVNOworCWVjID0gZGV2bV9kcm1fYnJpZGdlX2Fs
bG9jKGRldiwgc3RydWN0IGFzcGlyZV9lYywgYnJpZGdlLCAmYXNwaXJlX2VjX2JyaWRnZV9mdW5j
cyk7CisJaWYgKElTX0VSUihlYykpCisJCXJldHVybiBQVFJfRVJSKGVjKTsKIAogCWVjLT5jbGll
bnQgPSBjbGllbnQ7CiAJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgZWMpOwpAQCAtNDk3LDcg
KzQ5Nyw2IEBAIHN0YXRpYyBpbnQgYXNwaXJlX2VjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpCiAJZndub2RlID0gZGV2aWNlX2dldF9uYW1lZF9jaGlsZF9ub2RlKGRldiwgImNvbm5l
Y3RvciIpOwogCWlmIChmd25vZGUpIHsKIAkJSU5JVF9XT1JLKCZlYy0+d29yaywgYXNwaXJlX2Vj
X2JyaWRnZV91cGRhdGVfaHBkX3dvcmspOwotCQllYy0+YnJpZGdlLmZ1bmNzID0gJmFzcGlyZV9l
Y19icmlkZ2VfZnVuY3M7CiAJCWVjLT5icmlkZ2Uub2Zfbm9kZSA9IHRvX29mX25vZGUoZndub2Rl
KTsKIAkJZWMtPmJyaWRnZS5vcHMgPSBEUk1fQlJJREdFX09QX0hQRDsKIAkJZWMtPmJyaWRnZS50
eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX1VTQjsKCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
