Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69F4606A31E
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QDWSD6rW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXV77g+x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WGtR1E4KsgqXYhnb9oPaf5n3w/a8/rj+Sf/UGNWFSs4=; b=QDWSD6rWNp4NEfmxYQg+vOapge
	y6sTc/LHH9xMIY3cGgyiLPQ7Yg1LE2BcRwOA9UrgXy5ZchN9c28fxn6iW9opfTXt0ZGPHgo9EM56E
	LngLG4f5nFpzXAoM3HvD8oCa3keAqyb5ZrArV454fhgnA16/qCAKFsFoWWB/Fubvfzvav2kJ9QhLK
	Z6FPWvHoQzBcZODqZ2DG7O4lIvvP1pGmoRqWmVOtmgdA/ImwsOmczEM55H6wSt1aiBNOb+7H2kVZi
	wqVcg9nM8cnw8fluRpUUw8+XYUn4TVErckqFSY4Bd4vdxS0ahHlkWspBrqH36/9nWkOGluJy6JuLc
	XLsAWaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZXQ-00000004dTN-3LWc;
	Mon, 23 Nov 2026 19:17:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZXP-00000004dSz-2SVd;
	Mon, 23 Nov 2026 19:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 133A24050A;
	Mon, 23 Nov 2026 19:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA881F000C4;
	Mon, 23 Nov 2026 19:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461434;
	bh=93LY7kxfE4k6lRlMsqn9aMoZqt0mdV8mOF8QxYg6ZSM=;
	h=From:To:Cc:Subject:Date;
	b=KXV77g+xEmHcy7JpHoLaeSS6FNFX59hjFuDeFdRUxf8bakm+MFK4B1tIxcAizka31
	 d/TYrffwOZ6eh2MYxzhBrE9U7xKPR5+FHseHQy3XVCEuumJvJPUtAspAB82Q6LKRcV
	 +o6jDteDq6bDsXTuRRHptp7IXtEnseEwH8XiKo1HADF54dAIvJi6/mXE3DU3W+rNYd
	 R8X9ukWTBJO7GV23deLPIpUYCKrTq3QNVJ0MEsYklQIkIINdoCFxejPEeZCuOl7VI+
	 42puN8d8vAQ5rB9YQ5J0VPQzofHnbk2b+w3U4zA8Rv2LuQfEh9+It5SOowCZK4UM5d
	 jxMn/yzINazhQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Al Cooper <alcooperx@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Allen Pais <allen.lkml@gmail.com>,
	Apelete Seketeli <apelete@seketeli.net>,
	Aubin Constans <aubin.constans@microchip.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Cavium Inc <support@cavium.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Georgi Djakov <djakov@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hiroshi DOYU <Hiroshi.DOYU@nokia.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Jan Glauber <jan.glauber@gmail.com>,
	Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Josua Mayer <josua@solid-run.com>,
	Juha Yrjola <juha.yrjola@nokia.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Phil Blundell <pb@handhelds.org>,
	Pierre Ossman <drzeus@drzeus.cx>,
	Pramod Gurav <pramod.gurav@linaro.org>,
	Ritesh Harjani <riteshh@codeaurora.org>,
	Robert Richter <rric@kernel.org>,
	Samuel Ortiz <sameo@openedhand.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Tony Lindgren <tony@atomide.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 00/13] mmc: Assorted bug fixes across MMC host drivers
Date: Mon, 23 Nov 2026 19:15:44 +0000
Message-ID: <20261123191703.179283-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlc2UgaXNzdWVzIHdlcmUgcmVwb3J0ZWQgYnkgU2FzaGlrby4KCk5vbmUgb2YgdGhlc2UgY2hh
bmdlcyBoYXZlIGJlZW4gdGVzdGVkIG9uIHBoeXNpY2FsIGhhcmR3YXJlLgoKQ2M6ICJNaWNoYcWC
IE1pcm9zxYJhdyIgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgpDYzogIk5pa2xhcyBTw7ZkZXJs
dW5kIiA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25hdGVjaC5zZT4KQ2M6ICJVd2UgS2xl
aW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSIgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5j
b20+CkNjOiBBYXJvIEtvc2tpbmVuIDxhYXJvLmtvc2tpbmVuQGlraS5maT4KQ2M6IEFkcmlhbiBI
dW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgpDYzogQWlkYW4gTWFjRG9uYWxkIDxhaWRh
bm1hY2RvbmFsZC4weDBAZ21haWwuY29tPgpDYzogQWwgQ29vcGVyIDxhbGNvb3BlcnhAZ21haWwu
Y29tPgpDYzogQWxleCBEdWJvdiA8b2FrYWRAeWFob28uY29tPgpDYzogQWxsZW4gUGFpcyA8YWxs
ZW4ubGttbEBnbWFpbC5jb20+CkNjOiBBcGVsZXRlIFNla2V0ZWxpIDxhcGVsZXRlQHNla2V0ZWxp
Lm5ldD4KQ2M6IEF1YmluIENvbnN0YW5zIDxhdWJpbi5jb25zdGFuc0BtaWNyb2NoaXAuY29tPgpD
YzogQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+CkNjOiBCcm9hZGNvbSBpbnRl
cm5hbCBrZXJuZWwgcmV2aWV3IGxpc3QgPGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNv
bS5jb20+CkNjOiBDYXZpdW0gSW5jIDxzdXBwb3J0QGNhdml1bS5jb20+CkNjOiBDaHJpc3RpYW4g
TG9laGxlIDxjaHJpc3RpYW4ubG9laGxlQGFybS5jb20+CkNjOiBGbG9yaWFuIEZhaW5lbGxpIDxm
bG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbT4KQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+CkNjOiBHZW9yZ2kgRGpha292IDxkamFrb3ZAa2VybmVsLm9y
Zz4KQ2M6IEd1YW5nc2h1byBMaSA8bGdzMjAxOTIwMTMwMjQ0QGdtYWlsLmNvbT4KQ2M6IEhlaW5l
ciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+CkNjOiBIaXJvc2hpIERPWVUgPEhpcm9z
aGkuRE9ZVUBub2tpYS5jb20+CkNjOiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3Jn
PgpDYzogSmFlaG9vbiBDaHVuZyA8amg4MC5jaHVuZ0BzYW1zdW5nLmNvbT4KQ2M6IEphbiBHbGF1
YmVyIDxqYW4uZ2xhdWJlckBnbWFpbC5jb20+CkNjOiBKYXJra28gTGF2aW5lbiA8amFya2tvLmxh
dmluZW5Abm9raWEuY29tPgpDYzogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+
CkNjOiBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4KQ2M6IEp1aGEgWXJqb2xhIDxq
dWhhLnlyam9sYUBub2tpYS5jb20+CkNjOiBLYW1hbCBEYXN1IDxrYW1hbC5kYXN1QGJyb2FkY29t
LmNvbT4KQ2M6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+CkNjOiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+CkNjOiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CkNj
OiBMYXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0YWZvby5kZT4KQ2M6IGxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtbWlwc0B2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1tY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW9tYXBA
dmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
CkNjOiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KQ2M6IFBhdWwg
Q2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PgpDYzogUGhpbCBCbHVuZGVsbCA8cGJAaGFu
ZGhlbGRzLm9yZz4KQ2M6IFBpZXJyZSBPc3NtYW4gPGRyemV1c0BkcnpldXMuY3g+CkNjOiBQcmFt
b2QgR3VyYXYgPHByYW1vZC5ndXJhdkBsaW5hcm8ub3JnPgpDYzogUml0ZXNoIEhhcmphbmkgPHJp
dGVzaGhAY29kZWF1cm9yYS5vcmc+CkNjOiBSb2JlcnQgUmljaHRlciA8cnJpY0BrZXJuZWwub3Jn
PgpDYzogU2FtdWVsIE9ydGl6IDxzYW1lb0BvcGVuZWRoYW5kLmNvbT4KQ2M6IFNoYXduIExpbiA8
c2hhd24ubGluQHJvY2stY2hpcHMuY29tPgpDYzogVG9ueSBMaW5kZ3JlbiA8dG9ueUBhdG9taWRl
LmNvbT4KQ2M6IFVsZiBIYW5zc29uIDx1bGZoQGtlcm5lbC5vcmc+CkNjOiBXb2xmcmFtIFNhbmcg
PHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPgpDYzogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPgoKTGVlIEpvbmVzICgxMyk6CiAgbW1j
OiBjYXZpdW06IFJlbW92ZSBNTUMgc2xvdHMgYmVmb3JlIGRlc3Ryb3lpbmcgc2xvdCBwbGF0Zm9y
bSBkZXZpY2VzCiAgbW1jOiBjYXZpdW06IFByZXZlbnQgc2xvdF9wZGV2W10gb3V0LW9mLWJvdW5k
cyB3cml0ZSBkdXJpbmcgcHJvYmUKICBtbWM6IHNkaGNpLW1zbTogUmVzdW1lIHJ1bnRpbWUgUE0g
YmVmb3JlIGFjY2Vzc2luZyByZWdpc3RlcnMgb24gcmVtb3ZlCiAgbW1jOiBtZXNvbi1neDogRmFp
bCByZXF1ZXN0IHdoZW4gZGVzY3JpcHRvciBjaGFpbiBETUEgbWFwcGluZyBmYWlscwogIG1tYzog
ano0NzQwOiBTa2lwIERNQSBjbGVhbnVwIGluIFBJTyBtb2RlIGR1cmluZyBwb3N0X3JlcQogIG1t
YzogcmVuZXNhc19zZGhpOiBHdWFyZCBob3N0LT5jbWQgYWNjZXNzIGluIGludGVybmFsIERNQUMg
aXNzdWUgd29yawogIG1tYzogdGlmbV9zZDogU3luY2hyb25pc2UgdGltZW91dCBoYW5kbGVyIHdp
dGggcmVxdWVzdCBjb21wbGV0aW9uCiAgbW1jOiBvbWFwOiBTaHV0IGRvd24gY292ZXIgdGltZXIg
YmVmb3JlIGRpc2FibGluZyBjb3ZlciBCSCB3b3JrCiAgbW1jOiByZW5lc2FzX3NkaGk6IERpc2Fi
bGUgaW50ZXJuYWwgRE1BQyBCSCB3b3JrIGl0ZW1zIG9uIHJlbGVhc2UKICBtbWM6IGp6NDc0MDog
QXBwbHkgRE1BIG1heF9zZWdfc2l6ZSBsaW1pdCB0byB1bmlmaWVkIHR4LXJ4IGNoYW5uZWwKICBt
bWM6IGR3X21tYzogRGlzYXJtIGNlbnRyYWwgd2F0Y2hkb2cgd2hlbiBlbmRpbmcgYSByZXF1ZXN0
CiAgbW1jOiByZW5lc2FzX3NkaGk6IEZpeCBTRElPIG1hbnVhbCB0YXAgY29ycmVjdGlvbiBpbiBT
RFIxMDQgbW9kZQogIG1tYzogc2RoY2ktYnJjbXN0YjogSGFuZGxlIGFic2VudCBvcHRpb25hbCBz
ZGlvX2ZyZXEgY2xvY2sgaW4gcHJvYmUKCiBkcml2ZXJzL21tYy9ob3N0L2Nhdml1bS1vY3Rlb24u
YyAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrLS0tLQogZHJpdmVycy9tbWMvaG9zdC9j
YXZpdW0tdGh1bmRlcnguYyAgICAgICAgICAgIHwgMTUgKysrKysrKysrKysrKy0tCiBkcml2ZXJz
L21tYy9ob3N0L2R3X21tYy5jICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKy0t
LQogZHJpdmVycy9tbWMvaG9zdC9qejQ3NDBfbW1jLmMgICAgICAgICAgICAgICAgIHwgIDYgKysr
KystCiBkcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jICAgICAgICAgICAgICAgfCAgNyAr
KysrKysrCiBkcml2ZXJzL21tYy9ob3N0L29tYXAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAg
OCArKysrLS0tLQogZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jICAgICAgICAg
IHwgIDkgKysrKy0tLS0tCiBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9pbnRlcm5hbF9k
bWFjLmMgfCAxMyArKysrKysrKysrKysrCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLWJyY21zdGIu
YyAgICAgICAgICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktbXNtLmMg
ICAgICAgICAgICAgICAgICB8ICA4ICsrKystLS0tCiBkcml2ZXJzL21tYy9ob3N0L3RpZm1fc2Qu
YyAgICAgICAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKy0tCiAxMSBmaWxlcyBjaGFu
Z2VkLCA5MiBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCi0tIAoyLjU2LjEuNzUwLmdm
NzBkYzY4MmNmLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
