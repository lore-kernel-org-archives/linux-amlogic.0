Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B61C56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:47:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95ADC20857
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h0WY83QJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1P++KKY4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95ADC20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9OOp7l8692Kp/F3YU/y+blex2J6mkN2UYMaMB8S0IA=; b=h0WY83QJOflyIigLKXjpngb+zU
	lAI2MhwSQxiPGrEB5u2WmDlbwa7SDNm9LemGH4581MjoL+/FhJSzIGFw0wtom+GCvzKkIvu0bzYow
	aQHrHmPWF6UEBNvpxQwFF0TVFWNYR2dL4kMEX/wLJizmK6Z4S9vD4iVtU9hiyN3jeD6bato4nTHUK
	v9m00cuv4LJyuElahgx5tnoRpmeb3cFNCDsdK6Fn7iFInLAbGlRZw6XyONMjLYFVh0aK9LaotpxmI
	j7oBjqvuhylUazvKfPEx90ETG04E1Erys/QjqM9YstIQ2BdFb/oruDtn3q2LJw84ABdw1FMF8hVlo
	8NxfW36A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxx5-0006rw-Bi; Wed, 25 Nov 2020 16:47:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxvA-000621-U6; Wed, 25 Nov 2020 16:45:34 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22A632168B;
 Wed, 25 Nov 2020 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322732;
 bh=wL5Cw0v5IQ6jysCNVXuwfquOttUg6f8CA6LFRQYC+Ck=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=1P++KKY43sRG2yBWSyYwPday8o/UWaDuuB5wrAoSjTLKPdTxiAnsyuYUH9rakrCD8
 KE7gasuucq+j1O9VRu9Kq+MPIqZlRdHBhPjnrtps+YJqKMuIfnddhFladLMvAHWfRX
 XKviBMiTgPSVvX5/SVFFfQzOZWiX5usjzBLZIO6g=
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
Subject: [PATCH v2 05/39] ASoC: rk3328: mark OF related data as maybe unused
Date: Wed, 25 Nov 2020 17:44:18 +0100
Message-Id: <20201125164452.89239-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114533_163366_0A0299F7 
X-CRM114-Status: GOOD (  17.02  )
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
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBzb3VuZC9zb2MvY29kZWNzL3JrMzMyOF9jb2RlYy5jOjUw
MjozNDogd2FybmluZzog4oCYcmszMzI4X2NvZGVjX29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogc291bmQvc29jL2NvZGVjcy9yazMz
MjhfY29kZWMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcmszMzI4X2NvZGVjLmMgYi9z
b3VuZC9zb2MvY29kZWNzL3JrMzMyOF9jb2RlYy5jCmluZGV4IDk0MGEyZmE5MzNlZC4uYmZlZmVm
Y2M3NmQ4IDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvY29kZWNzL3JrMzMyOF9jb2RlYy5jCisrKyBi
L3NvdW5kL3NvYy9jb2RlY3MvcmszMzI4X2NvZGVjLmMKQEAgLTQ5OSw3ICs0OTksNyBAQCBzdGF0
aWMgaW50IHJrMzMyOF9wbGF0Zm9ybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCQkJCQkgICAgICAgQVJSQVlfU0laRShyazMzMjhfZGFpKSk7CiB9CiAKLXN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJrMzMyOF9jb2RlY19vZl9tYXRjaFtdID0geworc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmszMzI4X2NvZGVjX29mX21hdGNoW10gX19tYXli
ZV91bnVzZWQgPSB7CiAJCXsgLmNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzI4LWNvZGVjIiwg
fSwKIAkJe30sCiB9OwotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
