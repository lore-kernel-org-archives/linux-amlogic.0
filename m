Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD2DC56202
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:56:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4415D21534
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VThseGiG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2NpP58kJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4415D21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLLHtAClKQMo/upUtpvH0HEqnCv8tTw6IIIHXXfrRGo=; b=VThseGiGslEhCjN1bexG+KQVNj
	lz/pTMHMMoY78PNihkpwjUYQbTt4OngyVY3sRpfyJ+mO7Q38eHFd6Eemnmz5mDiIoRyHwTmHbA2wU
	kVjI6SZcLLX34nA3I/OfViZ+NL4tIiGGz3+C1vRCYFm+F3AL/6FHKl6tnKSnnt6nEhG+R/PnknvsB
	C0TD2X29rw/2mzhZzdkWzIs8ACrSavdekGigPp0JvHcq62W/PnG9H70K2DGFaXTGLUbVTyauCewrk
	vW3uipnxoIYLSHtwAzhA5jS0l9Mf5BIdiAreQulnhwWZZ3v0RwkhJJD2l/bSlBWj/P6N+uKkHQGB9
	XkO2URtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khy5q-0003FU-VU; Wed, 25 Nov 2020 16:56:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxwX-0006ai-AG; Wed, 25 Nov 2020 16:46:58 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 723992158C;
 Wed, 25 Nov 2020 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322816;
 bh=j+GEylzAMN2zUvEnkSfnfv3ZaAJlkD6Cx2txUHPz7Zw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=2NpP58kJtfVLmSrLTQ6pf8XyjdLabHWhrOktOmySQRZq/6/ILu6Bpw3khn/I4JQYR
 oTQRly3B9p8O5On3tjoYbPWgfikR70pOVj6ErJzZGWMT1WwRL2bC/o4TZGqCQ41GsW
 dLiJYKh5u35kBp8QZi/ax9+XHkpWUDXFHlJ73uYA=
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
Subject: [PATCH v2 24/39] ASoC: max9867: skip of_device_id table when
 !CONFIG_OF
Date: Wed, 25 Nov 2020 17:44:37 +0100
Message-Id: <20201125164452.89239-25-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114657_511203_D870E19B 
X-CRM114-Status: GOOD (  15.49  )
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

VGhlIGRyaXZlciBjYW4gbWF0Y2ggYnkgbXVsdGlwbGUgbWV0aG9kcy4gIEl0cyBvZl9kZXZpY2Vf
aWQgdGFibGUgaXMKcmVmZXJlbmNlZCB2aWEgb2ZfbWF0Y2hfcHRyKCkgc28gaXQgd2lsbCBiZSB1
bnVzZWQgZm9yICFDT05GSUdfT0YKYnVpbGRzOgoKICBzb3VuZC9zb2MvY29kZWNzL21heDk4Njcu
Yzo2NTI6MzQ6IHdhcm5pbmc6IOKAmG1heDk4Njdfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBzb3VuZC9zb2MvY29kZWNzL21heDk4
NjcuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9zb3VuZC9zb2MvY29kZWNzL21heDk4NjcuYyBiL3NvdW5kL3NvYy9jb2RlY3MvbWF4OTg2Ny5j
CmluZGV4IGFlZjI3NDZiZmI5NC4uNTEyZTZmMjUxM2QzIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mv
Y29kZWNzL21heDk4NjcuYworKysgYi9zb3VuZC9zb2MvY29kZWNzL21heDk4NjcuYwpAQCAtNjQ5
LDExICs2NDksMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIG1heDk4Njdf
aTJjX2lkW10gPSB7CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIG1heDk4NjdfaTJjX2lk
KTsKIAorI2lmZGVmIENPTkZJR19PRgogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
bWF4OTg2N19vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAibWF4aW0sbWF4OTg2NyIs
IH0sCiAJeyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWF4OTg2N19vZl9tYXRjaCk7
CisjZW5kaWYKIAogc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIG1heDk4NjdfaTJjX2RyaXZlciA9
IHsKIAkuZHJpdmVyID0gewotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
