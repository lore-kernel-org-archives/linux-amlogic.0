Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA461C56202
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:51:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 349D5206D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:51:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4kdDN/k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAkP+/pw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 349D5206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yap59ZMawYY2u2JqxHATER+miisCY5DuaTpqz8KhkSU=; b=O4kdDN/kk3XyL15K0hc1b+ejlg
	e3wpenqJo6/HxXbtycjqudGjqlafo2ov8rrTMdH4p28/A0IVzkoA9iG3gbd/q4qNPNNiALG7EaCZQ
	yw+yapwvljYgSjOjKvBiuyNRdAppZ8zoIqlTvzd/rnJx+Y4xOF218WkZbEcmJA+a0hVD51tZUpilL
	r06x1+fhZgX5N7c7yZUwX77ymZrI7ZEWYRlL1RCybFLGSvc1QzuyIGgC2/NZtOrjwMuN0jQZ3n4nJ
	v+saoI3NFHPPCvUBIselvVOCF5PNMbOUSAw76EsA8rqjPTiD877IspfmqzBQmoTcIBET/n9OHRJCT
	9jBTgQCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khy0r-00005P-4n; Wed, 25 Nov 2020 16:51:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxvk-0006GN-TQ; Wed, 25 Nov 2020 16:46:10 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CAC02083E;
 Wed, 25 Nov 2020 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322768;
 bh=Ju113eZ9V9u7c87HH77J8+nB2ndVCZR+9BZ4I7nAeXw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WAkP+/pwlBjnuNLv/rDQVLWUufs2kpqEVzZNFgXH7fCkShOVgQXt0lJKmXqCEMwGa
 jaoLrqZP1MrTghK4oK4JHMrVxJMrhOHt8FnocGmOn8tirtBJ3msYKAaI7+cmLLcu2w
 uZwW3/96o66N+KeIYn8b0/Cv9vuwN/TcZab3amtY=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 13/39] ASoC: uniphier: mark OF related data as maybe unused
Date: Wed, 25 Nov 2020 17:44:26 +0100
Message-Id: <20201125164452.89239-14-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114609_154180_02DAFEB7 
X-CRM114-Status: GOOD (  15.99  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBzb3VuZC9zb2MvdW5pcGhpZXIvYWlvLWxkMTEuYzozNzU6
MzQ6IHdhcm5pbmc6IOKAmHVuaXBoaWVyX2Fpb19vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogIHNvdW5kL3NvYy91bmlwaGllci9ldmVh
LmM6NTU0OjM0OiB3YXJuaW5nOiDigJhldmVhX29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogc291bmQvc29jL3VuaXBoaWVyL2Fpby1s
ZDExLmMgfCAyICstCiBzb3VuZC9zb2MvdW5pcGhpZXIvYWlvLXB4czIuYyB8IDIgKy0KIHNvdW5k
L3NvYy91bmlwaGllci9ldmVhLmMgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3VuaXBoaWVy
L2Fpby1sZDExLmMgYi9zb3VuZC9zb2MvdW5pcGhpZXIvYWlvLWxkMTEuYwppbmRleCA4YjQ0Zjhk
YzQ5NzAuLjdiM2NmNWQ3NTFmNiAxMDA2NDQKLS0tIGEvc291bmQvc29jL3VuaXBoaWVyL2Fpby1s
ZDExLmMKKysrIGIvc291bmQvc29jL3VuaXBoaWVyL2Fpby1sZDExLmMKQEAgLTM3Miw3ICszNzIs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVuaXBoaWVyX2Fpb19jaGlwX3NwZWMgdW5pcGhpZXJf
YWlvX2xkMjBfc3BlYyA9IHsKIAkuYWRkcl9leHQgID0gMSwKIH07CiAKLXN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIHVuaXBoaWVyX2Fpb19vZl9tYXRjaFtdID0geworc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgdW5pcGhpZXJfYWlvX29mX21hdGNoW10gX19tYXliZV91
bnVzZWQgPSB7CiAJewogCQkuY29tcGF0aWJsZSA9ICJzb2Npb25leHQsdW5pcGhpZXItbGQxMS1h
aW8iLAogCQkuZGF0YSA9ICZ1bmlwaGllcl9haW9fbGQxMV9zcGVjLApkaWZmIC0tZ2l0IGEvc291
bmQvc29jL3VuaXBoaWVyL2Fpby1weHMyLmMgYi9zb3VuZC9zb2MvdW5pcGhpZXIvYWlvLXB4czIu
YwppbmRleCBhMWQwNWZlOWQzYzIuLjg5OTkwNGY3ZmZkNiAxMDA2NDQKLS0tIGEvc291bmQvc29j
L3VuaXBoaWVyL2Fpby1weHMyLmMKKysrIGIvc291bmQvc29jL3VuaXBoaWVyL2Fpby1weHMyLmMK
QEAgLTI4Miw3ICsyODIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVuaXBoaWVyX2Fpb19jaGlw
X3NwZWMgdW5pcGhpZXJfYWlvX3B4czJfc3BlYyA9IHsKIAkuYWRkcl9leHQgID0gMCwKIH07CiAK
LXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHVuaXBoaWVyX2Fpb19vZl9tYXRjaFtd
ID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgdW5pcGhpZXJfYWlvX29mX21h
dGNoW10gX19tYXliZV91bnVzZWQgPSB7CiAJewogCQkuY29tcGF0aWJsZSA9ICJzb2Npb25leHQs
dW5pcGhpZXItcHhzMi1haW8iLAogCQkuZGF0YSA9ICZ1bmlwaGllcl9haW9fcHhzMl9zcGVjLApk
aWZmIC0tZ2l0IGEvc291bmQvc29jL3VuaXBoaWVyL2V2ZWEuYyBiL3NvdW5kL3NvYy91bmlwaGll
ci9ldmVhLmMKaW5kZXggZDI3ZTljYTA3ODU2Li45NjM0M2QxOWExZTAgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3NvYy91bmlwaGllci9ldmVhLmMKKysrIGIvc291bmQvc29jL3VuaXBoaWVyL2V2ZWEuYwpA
QCAtNTUxLDcgKzU1MSw3IEBAIHN0YXRpYyBpbnQgZXZlYV9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgZXZlYV9vZl9tYXRjaFtdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgZXZlYV9vZl9tYXRjaFtdIF9fbWF5YmVfdW51c2VkID0gewogCXsgLmNvbXBhdGlibGUg
PSAic29jaW9uZXh0LHVuaXBoaWVyLWV2ZWEiLCB9LAogCXt9CiB9OwotLSAKMi4yNS4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
