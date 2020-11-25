Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA42C56202
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:46:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7DA2083E
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jMSvJ4FX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYblTLo2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7DA2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCfg1F58zrRrsFKWgqKIhh3/g9dvCiIqL4aBA/cyIQE=; b=jMSvJ4FXWTtnEBaLctnCsz2+mB
	xqkKSqF9ZuNxIUJTU9x36e9BZwy6PY6/SCRaltdtW3Y9BZEHn6i9uLNmsMmCiDfdb+5jVcX2h2vju
	vaKJi3xjkxsaKfbkotUDbVVcgjTVu0T43xQFgvVIucWgTJRsdh/zOSq9jJmHo2KE7WYUXvEmGOrut
	3QKJGJcoCBeyTxXfQYVTdBS6OGrw7LfjHviCuU38frXCkvzsGoHscIBbE4SMlNZkDt3KbLqPswECY
	0pBiLHr7Eb00fySGVdCoiap+0rLW72Wrh43L3BmiY2udN/rN4nimTUgmRtUQdghvTJO615uR/ADME
	P7bFE9KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxvZ-0006Bk-7Y; Wed, 25 Nov 2020 16:45:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxux-0005ws-TL; Wed, 25 Nov 2020 16:45:21 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08FA621734;
 Wed, 25 Nov 2020 16:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322719;
 bh=p0iU7eyvJZz7Wv8jtuRMKD46FTeF8l+5uENnprnbVOU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sYblTLo21J3bUS5TXJXRrd/SYXi9nK5ICGDKN0xk1+/Of241tbKU9/MnNRERurtxt
 LP5c2rnnUbWCIEVxEavMhKaQki/66s3YU2lEDzG2GRmqLNEwbDbOIp6OFLmR/8WDkM
 xOv2AwCYR2EVzJfqY4UNrxtnKo+vxV6pljqVWa+8=
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
Subject: [PATCH v2 02/39] ASoC: bd28623: mark OF related data as maybe unused
Date: Wed, 25 Nov 2020 17:44:15 +0100
Message-Id: <20201125164452.89239-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114520_148269_165B88BD 
X-CRM114-Status: GOOD (  17.22  )
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
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBzb3VuZC9zb2MvY29kZWNzL2JkMjg2MjMuYzoyMjU6MzQ6
IHdhcm5pbmc6IOKAmGJkMjg2MjNfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4KCi0tLQoKTmV3IHBhdGNoCi0tLQogc291bmQvc29jL2NvZGVj
cy9iZDI4NjIzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL2JkMjg2MjMuYyBiL3NvdW5k
L3NvYy9jb2RlY3MvYmQyODYyMy5jCmluZGV4IDMxOTA0ZWY1Yzg4Yi4uYTYyNjdjYjg2ZDg2IDEw
MDY0NAotLS0gYS9zb3VuZC9zb2MvY29kZWNzL2JkMjg2MjMuYworKysgYi9zb3VuZC9zb2MvY29k
ZWNzL2JkMjg2MjMuYwpAQCAtMjIyLDcgKzIyMiw3IEBAIHN0YXRpYyBpbnQgYmQyODYyM19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQkJCQkgICAgICAgJnNvY19kYWlfYmQs
IDEpOwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBiZDI4NjIzX29mX21h
dGNoW10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBiZDI4NjIzX29mX21h
dGNoW10gX19tYXliZV91bnVzZWQgPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJyb2htLGJkMjg2MjMi
LCB9LAogCXt9CiB9OwotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
