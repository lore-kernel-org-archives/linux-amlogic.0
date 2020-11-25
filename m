Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA49C56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:59:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D205206D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:59:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OaQ9t6fp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVYnSKo8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D205206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zctHPN+U0QBIJkk1gyNhhMfb0d0HERs27MyUS9SXLPQ=; b=OaQ9t6fpROYnLlt9llGb0Q2ZFs
	j2Hr67teMROtuiFHRUQbNJy7QBVvI+pS++GrA1IeHEAqq7h89Fr2NGPzSqE03iGFR6ghgG8fvAKwR
	4NBjBi0p2M/by0qAsRQPiv6v0kiGOKsVChr/sekVNyYyUeWjelw+6DI4WvhiXUq2hYyglqP02iBD+
	npGXG1fajyzYmBqEDE4zZiNCeqdrG8/T2Gy0XbUQ1tnYYu2GG3+6IGRuEq6qg3nKlULSU6yBJmos9
	UuZx6TOtqEK40qbMKmzPNSJdhe3iKXpBRXAHD262IuGX+OVF2HUw9p9mjkHX44uR+cYeZcChi+lIH
	fvT6ylIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khy8k-0004h8-1e; Wed, 25 Nov 2020 16:59:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxwp-0006k5-3l; Wed, 25 Nov 2020 16:47:16 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D21F32145D;
 Wed, 25 Nov 2020 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322833;
 bh=+j1OMI4byGz3lhkFhbKgRErhPASUUpHiO1mBssgMMAU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FVYnSKo8NZMKjj5jXrcsWobxdF2LQSLDQY4mHbY2krhz4fMjmEFrRofb0aVM1NxaJ
 T6KAGjDHcE4VI9E6YqSNVmTk6L9zM1dwoezG6tdZAL8uz6IX22oBZXzzttxn6FJLNv
 hNiuBHXOuyLF/Y3zLiPdYRZ7MGq2GPsTiE48T/Jg=
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
Subject: [PATCH v2 28/39] ASoC: pcm179x: skip of_device_id table when
 !CONFIG_OF
Date: Wed, 25 Nov 2020 17:44:41 +0100
Message-Id: <20201125164452.89239-29-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114715_341938_3EF2CF3F 
X-CRM114-Status: GOOD (  15.26  )
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
bnVzZWQgZm9yICFDT05GSUdfT0YKYnVpbGRzOgoKICBzb3VuZC9zb2MvY29kZWNzL3BjbTE3OXgt
aTJjLmM6MzM6MzQ6IHdhcm5pbmc6IOKAmHBjbTE3OXhfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQg
bm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBzb3VuZC9zb2MvY29kZWNzL3Bj
bTE3OXgtaTJjLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9wY20xNzl4LWkyYy5jIGIvc291bmQvc29jL2NvZGVj
cy9wY20xNzl4LWkyYy5jCmluZGV4IDM2ZTAxNjc4YmVmNC4uMzRhM2Q1OTZmMjg4IDEwMDY0NAot
LS0gYS9zb3VuZC9zb2MvY29kZWNzL3BjbTE3OXgtaTJjLmMKKysrIGIvc291bmQvc29jL2NvZGVj
cy9wY20xNzl4LWkyYy5jCkBAIC0zMCwxMSArMzAsMTMgQEAgc3RhdGljIGludCBwY20xNzl4X2ky
Y19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogCXJldHVybiBwY20xNzl4X2NvbW1v
bl9pbml0KCZjbGllbnQtPmRldiwgcmVnbWFwKTsKIH0KIAorI2lmZGVmIENPTkZJR19PRgogc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGNtMTc5eF9vZl9tYXRjaFtdID0gewogCXsg
LmNvbXBhdGlibGUgPSAidGkscGNtMTc5MmEiLCB9LAogCXsgfQogfTsKIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIHBjbTE3OXhfb2ZfbWF0Y2gpOworI2VuZGlmCiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaTJjX2RldmljZV9pZCBwY20xNzl4X2kyY19pZHNbXSA9IHsKIAl7ICJwY20xNzl4IiwgMCB9
LAotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
