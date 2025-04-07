Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB99EC36010
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Apr 2025 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzPhVoOY1QqO4V8QgLk4kQSU5Uu96xpmji+rxOIzFao=; b=EywHU1OTyoyUoR
	LF4eokVB6nc9hlWo2sT8mSLpOOkMdeT8X8jFN2VWgL6tt5I3J9W59NHFCDoiag7aUn+70J1crMs/f
	iY58cr/K5TQv0ZVL8PIRsi6pa26HiopvMrgKjbl85s1bwLu0eQPZmWwVR0XF/P18ohpMfP6q1wV75
	Vbt2zlUjet4xcVFTQcfZEJcZZBR2OanihIRnJGW2pWyEvWEvgyTAkQBvdNkf00GQLExNqhAag9M7E
	JngUAAzGrFoYiUaNgqBynPcJESbvqhpko7JS/HujxqzYwAJoWQlqJZQ2++RDwOMvriONCkUEI7b/m
	1602k14rqIeeOzslCu8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pFR-000000019fF-0m9V;
	Mon, 07 Apr 2025 16:22:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oNu-00000000xVZ-08WG;
	Mon, 07 Apr 2025 15:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s0/FGDDEEv1bADImBm72Eb+o2LF4PnN49TpkyA00SwI=; b=WzOx6DEXiD/2vE71t5avdUTg1P
	t1RM7Shc98oXDhtzZW5NtjTPus1nNk7/xoa+arGYxbej+MMA1dpOeuqQCsYt9bdlYWXX8ZLmAtuI4
	vxqBZpc8mXuifxBGuTEV4rUionuR5uHQyDUUzPERGH70+9Ieh+D4Q3yTRQcvYnxxGr0HE8CUkSSeG
	0R1gB5tC/CCe9QE34kf8CctR+4Z+9brqqvNR/HB97n0IgmOZA4ou6RFNKvRrMuLKaSDM+S+7Yf3nw
	a/Cs9K+3Bb5OvStmYUP8AhD3AuX08Y2ZqRKC9rnoQWotN6Z2VMjUHCCd3K0jKv4n1+1k608W9qoM6
	9dzlyjig==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oNr-000000081Ho-03Ww;
	Mon, 07 Apr 2025 15:27:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 140D5432BC;
	Mon,  7 Apr 2025 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744039652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0/FGDDEEv1bADImBm72Eb+o2LF4PnN49TpkyA00SwI=;
	b=KukuFIp0YBL5FQjQWYQ8SGM7gkfrYmCM7nnmPpRASGoNkxuFJbGM0XKXsIwRRilROfUgwq
	ad6wshOz6uKHYkrgtVWgjy4lERLiqko/2OkisS6SdDhqulm4Nde6vJUFhfeICP0joX9rW+
	3HUdgGa3QxSuhSCz2y4T3lB+J8qt3L4ijmDvhjZX1lopmA+XqDyWMcsDNRLcOkAi7xnxeT
	xwZM4PbX4ciQYE4BNO87a6N1atu3bnOtMYTM1+0ptAhQlt+DC6n7wdkkhv9LPFzdVK55zA
	KzbvA57i8wz/lR9Epi8aAVu2EkCKVxnqEqmhObAGuQpYi3hgphLud2IDm1Wngg==
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
Subject: [PATCH 33/34] drm/bridge: add devm_drm_put_bridge()
Date: Mon,  7 Apr 2025 17:27:08 +0200
Message-ID: <20250407-drm-bridge-convert-to-alloc-api-v1-33-42113ff8d9c0@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudffiefgvdfftdffkeejjefhffduleejleeuieetieetgeehtefhjedtgeegieegnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihrdhfrhhithiirdgsohigpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvp
 dhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_162735_239494_DD8502AF 
X-CRM114-Status: GOOD (  15.00  )
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

QnJpZGdlcyBvYnRhaW5lZCB2aWEgZGV2bV9kcm1fYnJpZGdlX2FsbG9jKGRldiwgLi4uKSB3aWxs
IGJlIHB1dCB3aGVuIHRoZQpyZXF1ZXN0aW5nIGRldmljZSAoQGRldikgaXMgcmVtb3ZlZC4KCkhv
d2V2ZXIgZHJpdmVycyB3aGljaCBvYnRhaW5lZCB0aGVtIG1heSBuZWVkIHRvIHB1dCB0aGUgb2J0
YWluZWQgcmVmZXJlbmNlCmV4cGxpY2l0bHkuIE9uZSBzdWNoIGNhc2UgaXMgaWYgdGhleSBiaW5k
IHRoZSBkZXZtIHJlbW92YWwgYWN0aW9uIHRvIGEKZGlmZmVyZW50IGRldmljZSB0aGFuIHRoZSBv
bmUgaW1wbGVtZW50ZWQgYnkgdGhlIGRyaXZlciBpdHNlbGYgYW5kIHdoaWNoCm1pZ2h0IGJlIHJl
bW92ZWQgYXQgYSBkaWZmZXJlbnQgdGltZSwgc3VjaCBhcyBicmlkZ2UvcGFuZWwuYy4KCkFkZCBk
ZXZtX2RybV9wdXRfYnJpZGdlKCkgdG8gbWFudWFsbHkgcmVsZWFzZSBhIGRldm0tb2J0YWluZWQg
YnJpZGdlIGluCnN1Y2ggY2FzZXMuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNh
LmNlcmVzb2xpQGJvb3RsaW4uY29tPgotLS0KClRvOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpUbzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPgpUbzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+ClRv
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpUbzogU2ltb25hIFZldHRlciA8c2lt
b25hQGZmd2xsLmNoPgpUbzogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+
ClRvOiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KVG86IFJvYmVy
dCBGb3NzIDxyZm9zc0BrZXJuZWwub3JnPgpUbzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpUbzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9v
LnNlPgpUbzogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KVG86IEph
Z2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgpUbzogU2hhd24gR3VvIDxzaGF3
bmd1b0BrZXJuZWwub3JnPgpUbzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRl
PgpUbzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KVG86
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KVG86IERvdWdsYXMgQW5kZXJzb24g
PGRpYW5kZXJzQGNocm9taXVtLm9yZz4KVG86IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBr
ZXJuZWwub3JnPgpUbzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgpUbzog
RG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPgpDYzogQW51c2hh
IFNyaXZhdHNhIDxhc3JpdmF0c0ByZWRoYXQuY29tPgpDYzogUGF1bCBLb2NpYWxrb3dza2kgPHBh
dWxrQHN5cy1iYXNlLmlvPgpDYzogRG1pdHJ5IEJhcnlzaGtvdiA8bHVtYWdAa2VybmVsLm9yZz4K
Q2M6IEhlcnbDqSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KQ2M6IEh1aSBQdSA8
SHVpLlB1QGdlaGVhbHRoY2FyZS5jb20+CkNjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0
YXp6b25pQGJvb3RsaW4uY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogYXNhaGlAbGlzdHMubGludXguZGV2CkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
CkNjOiBjaHJvbWUtcGxhdGZvcm1AbGlzdHMubGludXguZGV2CkNjOiBpbXhAbGlzdHMubGludXgu
ZGV2CkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpDYzogbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBwbGF0Zm9y
bS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5r
ZXJuZWwub3JnCkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgfCAxNCArKysrKysr
KysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAgICB8ICA0ICsrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYnJpZGdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCmluZGV4IGI0Yzg5ZWMw
MTk5OGI4NDkwMThjZTAzMWM3Y2Q4NDYxNGU2NWU3MTAuLjQ1NjM2M2Q4NjA4MGIyYTU1MDM1YzMx
MDhjMTZhZmE0ZjllNTdlMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdl
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwpAQCAtMTM5Miw2ICsxMzkyLDIw
IEBAIHN0cnVjdCBkcm1fYnJpZGdlICpvZl9kcm1fZmluZF9icmlkZ2Uoc3RydWN0IGRldmljZV9u
b2RlICpucCkKIEVYUE9SVF9TWU1CT0wob2ZfZHJtX2ZpbmRfYnJpZGdlKTsKICNlbmRpZgogCisv
KioKKyAqIGRldm1fZHJtX3B1dF9icmlkZ2UgLSBSZWxlYXNlIGEgYnJpZGdlIHJlZmVyZW5jZSBv
YnRhaW5lZCB2aWEgZGV2bQorICogQGRldjogZGV2aWNlIHRoYXQgZ290IHRoZSBicmlkZ2Ugdmlh
IGRldm0KKyAqIEBicmlkZ2U6IHBvaW50ZXIgdG8gYSBzdHJ1Y3QgZHJtX2JyaWRnZSBvYnRhaW5l
ZCB2aWEgZGV2bQorICoKKyAqIFNhbWUgYXMgZHJtX2JyaWRnZV9wdXQoKSBmb3IgYnJpZGdlIHBv
aW50ZXJzIG9idGFpbmVkIHZpYSBkZXZtIGZ1bmN0aW9ucworICogc3VjaCBhcyBkZXZtX2RybV9i
cmlkZ2VfYWxsb2MoKS4KKyAqLwordm9pZCBkZXZtX2RybV9wdXRfYnJpZGdlKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKK3sKKwlkZXZtX3JlbGVhc2VfYWN0
aW9uKGRldiwgZHJtX2JyaWRnZV9wdXRfdm9pZCwgYnJpZGdlKTsKK30KK0VYUE9SVF9TWU1CT0wo
ZGV2bV9kcm1fcHV0X2JyaWRnZSk7CisKIHN0YXRpYyB2b2lkIGRybV9icmlkZ2VfZGVidWdmc19z
aG93X2JyaWRnZShzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsCiAJCQkJCSAgIHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UsCiAJCQkJCSAgIHVuc2lnbmVkIGludCBpZHgpCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fYnJpZGdlLmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKaW5kZXggZGY5
YmJmNmZkMWZiNTIyYWRkMjhiNzY0MDZiNzRjZGI3MzkxZmM1Ny4uNWI0ZTVlOTM1YTE3YmE2ZmM0
YTZhNTNhZDBhMzAyZTI0OWNhNDE4YiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRn
ZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaApAQCAtMTE2Nyw2ICsxMTY3LDggQEAg
c3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX2JyaWRnZSAqZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZShz
dHJ1Y3QgZGV2aWNlICpkZXYsCiAJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiB9CiAKK3N0YXRp
YyBpbmxpbmUgdm9pZCBkZXZtX2RybV9wdXRfYnJpZGdlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRybV9icmlkZ2UgKmJyaWRnZSkge30KKwogc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX2Jy
aWRnZSAqZHJtbV9vZl9nZXRfYnJpZGdlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCiAJCQkJCQkg
ICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKIAkJCQkJCSAgICAgdTMyIHBvcnQsCkBAIC0x
MTc2LDYgKzExNzgsOCBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fYnJpZGdlICpkcm1tX29m
X2dldF9icmlkZ2Uoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKIH0KICNlbmRpZgogCit2b2lkIGRl
dm1fZHJtX3B1dF9icmlkZ2Uoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlKTsKKwogdm9pZCBkcm1fYnJpZGdlX2RlYnVnZnNfcGFyYW1zKHN0cnVjdCBkZW50cnkg
KnJvb3QpOwogdm9pZCBkcm1fYnJpZGdlX2RlYnVnZnNfZW5jb2Rlcl9wYXJhbXMoc3RydWN0IGRl
bnRyeSAqcm9vdCwgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsKIAoKLS0gCjIuNDkuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
