Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD33BC369A4
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/LtS1H6gPcGk1UUCdA2T+u0IKaCATnXZLs0W6dj+Sk=; b=ZI+AMlnT8i44Rb
	0LfxCIgay1b0ZtMiDPb4Aa9yqkHBPrpTrC+KJygDjN4XIu29FId5rFXaZU/Hz1O3cUShqCpbEAZfU
	fI8tutb8iFdKzifg6Iz3TuXRZ+d/qy2tEINnjCHGgcVYQOu3pkrGAxMkx8tv9meEsV/PxkRN9CTqf
	M4f2dt89uEF/cjQghH8bNKZ5oKTMHsMtWc2grcnk2cNyx70yCP8VmExEChMFVuzki6XqZw0iyQZTJ
	UXf0uDYdDHZCnHEnpMCvxQrs7j/ifmh8e0Ge8dOo+hVsg+mgnIYBKNrey4R8arZZSDVSmFyYWzYZl
	FhZ/ZtSy+NqktkYJEngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1Q-00000001VAY-2M0r;
	Mon, 07 Apr 2025 18:16:36 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oO6-00000000xcn-2Y99;
	Mon, 07 Apr 2025 15:27:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72646431EA;
	Mon,  7 Apr 2025 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744039667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgX6S64ngnXsjU0lQPqeLHBfnA+UnbXv6BjQk1oGXZU=;
	b=LBZvLE2G+afaVJ2bwhuBl1x1YRR/aqaZ2Xm5yU+xaLjjIqM+WbNAKPx85Swnqti9EdXmCR
	jxm3gIWcOaG1co2jTwQSHLMwRfa/o37ZW3TL5sERhaicxQw3i4iyp8UcVcTXkH1w4KSGdk
	Y19KevZYjLYHr3HXXP8AducFPd1YdMFTPsJeGctmaMWsKIGeEO+n7SDKrX8kxYN5Z1gWgI
	+UT+rfLgfI9oZV+al0AMr7X1Hj0w9CZsV0S3DJwxwGrF5CvYlrRAnPH725fFHTQ9VF1+RR
	KAa03YipbyuRmYOv8qQstJ9OZTNaCvUkN6DRY2d/JonMQilxNjXgv50w/l7c9A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 34/34] drm/bridge: panel: convert to devm_drm_bridge_alloc() API
Date: Mon,  7 Apr 2025 17:27:39 +0200
Message-ID: <20250407-drm-bridge-convert-to-alloc-api-v1-34-42113ff8d9c0@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudffiefgvdfftdffkeejjefhffduleejleeuieetieetgeehtefhjedtgeegieegnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihrdhfrhhithiirdgsohigpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvp
 dhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_082750_777767_7C253C47 
X-CRM114-Status: GOOD (  16.93  )
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KClRoZSBkZXZt
IGxpZmV0aW1lIG1hbmFnZW1lbnQgb2YgdGhpcyBkcml2ZXIgaXMgcGVjdWxpYXIuIFRoZSB1bmRl
cmx5aW5nCmRldmljZSBmb3IgdGhlIHBhbmVsX2JyaWRnZSBpcyB0aGUgcGFuZWwsIGFuZCB0aGUg
ZGV2bSBsaWZldGltZSBpcyB0aWVkIHRoZQpwYW5lbCBkZXZpY2UgKHBhbmVsLT5kZXYpLiBIb3dl
dmVyIHRoZSBwYW5lbF9icmlkZ2UgYWxsb2NhdGlvbiBpcyBub3QKcGVyZm9ybWVkIGJ5IHRoZSBw
YW5lbCBkcml2ZXIsIGJ1dCByYXRoZXIgYnkgYSBzZXBhcmF0ZSBlbnRpdHkgKHR5cGljYWxseQp0
aGUgcHJldmlvdXMgYnJpZGdlIGluIHRoZSBlbmNvZGVyIGNoYWluKS4KClRodXMgd2hlbiB0aGF0
IHNlcGFyYXRlIGVudG90eSBpcyBkZXN0cm95ZWQsIHRoZSBwYW5lbF9icmlkZ2UgaXMgbm90CnJl
bW92ZWQgYXV0b21hdGljYWxseSBieSBkZXZtLCBzbyBpdCBpcyByYXRoZXIgZG9uZSBleHBsaWNp
dGx5IGJ5IGNhbGxpbmcKZHJtX3BhbmVsX2JyaWRnZV9yZW1vdmUoKS4gVGhpcyBpcyB0aGUgZnVu
Y3Rpb24gdGhhdCBkb2VzIGRldm1fa2ZyZWUoKSB0aGUKcGFuZWxfYnJpZGdlIGluIGN1cnJlbnQg
Y29kZSwgc28gdXBkYXRlIGl0IGFzIHdlbGwgdG8gcHV0IHRoZSBicmlkZ2UKcmVmZXJlbmNlIGlu
c3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3Rs
aW4uY29tPgotLS0KClRvOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgpUbzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpUbzog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+ClRvOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAZ21haWwuY29tPgpUbzogU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPgpU
bzogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+ClRvOiBOZWlsIEFybXN0
cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KVG86IFJvYmVydCBGb3NzIDxyZm9zc0Br
ZXJuZWwub3JnPgpUbzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgpUbzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgpUbzogSmVybmVq
IFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KVG86IEphZ2FuIFRla2kgPGphZ2Fu
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgpUbzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3Jn
PgpUbzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgpUbzogUGVuZ3V0cm9u
aXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KVG86IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT4KVG86IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9t
aXVtLm9yZz4KVG86IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgpUbzog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgpUbzogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPgpDYzogQW51c2hhIFNyaXZhdHNhIDxhc3Jp
dmF0c0ByZWRoYXQuY29tPgpDYzogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWxrQHN5cy1iYXNlLmlv
PgpDYzogRG1pdHJ5IEJhcnlzaGtvdiA8bHVtYWdAa2VybmVsLm9yZz4KQ2M6IEhlcnbDqSBDb2Rp
bmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KQ2M6IEh1aSBQdSA8SHVpLlB1QGdlaGVhbHRo
Y2FyZS5jb20+CkNjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4u
Y29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogYXNhaGlAbGlzdHMu
bGludXguZGV2CkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBjaHJvbWUtcGxh
dGZvcm1AbGlzdHMubGludXguZGV2CkNjOiBpbXhAbGlzdHMubGludXguZGV2CkNjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGlu
dXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBwbGF0Zm9ybS1kcml2ZXIteDg2QHZn
ZXIua2VybmVsLm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBs
aW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQotLS0K
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyB8IDExICsrKysrLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFu
ZWwuYwppbmRleCA3OWIwMDlhYjkzOTYwNDhlYWM1N2FkNDc2MzFhOTAyZTk0OWQ3N2M2Li5kZGQx
ZTkxOTcwZDA5YjkzYWE2NGY1MGNkOTE1NTkzOWExMmEyYzZmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5l
bC5jCkBAIC0yODcsMTUgKzI4NywxNCBAQCBzdHJ1Y3QgZHJtX2JyaWRnZSAqZHJtX3BhbmVsX2Jy
aWRnZV9hZGRfdHlwZWQoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwsCiAJaWYgKCFwYW5lbCkKIAkJ
cmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAKLQlwYW5lbF9icmlkZ2UgPSBkZXZtX2t6YWxsb2Mo
cGFuZWwtPmRldiwgc2l6ZW9mKCpwYW5lbF9icmlkZ2UpLAotCQkJCSAgICBHRlBfS0VSTkVMKTsK
LQlpZiAoIXBhbmVsX2JyaWRnZSkKLQkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CisJcGFuZWxf
YnJpZGdlID0gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKHBhbmVsLT5kZXYsIHN0cnVjdCBwYW5lbF9i
cmlkZ2UsIGJyaWRnZSwKKwkJCQkJICAgICAmcGFuZWxfYnJpZGdlX2JyaWRnZV9mdW5jcyk7CisJ
aWYgKElTX0VSUihwYW5lbF9icmlkZ2UpKQorCQlyZXR1cm4gKHZvaWQgKilwYW5lbF9icmlkZ2U7
CiAKIAlwYW5lbF9icmlkZ2UtPmNvbm5lY3Rvcl90eXBlID0gY29ubmVjdG9yX3R5cGU7CiAJcGFu
ZWxfYnJpZGdlLT5wYW5lbCA9IHBhbmVsOwogCi0JcGFuZWxfYnJpZGdlLT5icmlkZ2UuZnVuY3Mg
PSAmcGFuZWxfYnJpZGdlX2JyaWRnZV9mdW5jczsKIAlwYW5lbF9icmlkZ2UtPmJyaWRnZS5vZl9u
b2RlID0gcGFuZWwtPmRldi0+b2Zfbm9kZTsKIAlwYW5lbF9icmlkZ2UtPmJyaWRnZS5vcHMgPSBE
Uk1fQlJJREdFX09QX01PREVTOwogCXBhbmVsX2JyaWRnZS0+YnJpZGdlLnR5cGUgPSBjb25uZWN0
b3JfdHlwZTsKQEAgLTMyNyw3ICszMjYsNyBAQCB2b2lkIGRybV9wYW5lbF9icmlkZ2VfcmVtb3Zl
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJcGFuZWxfYnJpZGdlID0gZHJtX2JyaWRnZV90
b19wYW5lbF9icmlkZ2UoYnJpZGdlKTsKIAogCWRybV9icmlkZ2VfcmVtb3ZlKGJyaWRnZSk7Ci0J
ZGV2bV9rZnJlZShwYW5lbF9icmlkZ2UtPnBhbmVsLT5kZXYsIGJyaWRnZSk7CisJZGV2bV9kcm1f
cHV0X2JyaWRnZShwYW5lbF9icmlkZ2UtPnBhbmVsLT5kZXYsIGJyaWRnZSk7CiB9CiBFWFBPUlRf
U1lNQk9MKGRybV9wYW5lbF9icmlkZ2VfcmVtb3ZlKTsKIAoKLS0gCjIuNDkuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
