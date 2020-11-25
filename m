Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB465C63798
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:45:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DF221534
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AyRdSCfk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n27UDteM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39DF221534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0plO70UvnHLNMnH8yxh9jl/8z4q7ppbREFzDP1Ypf2M=; b=AyRdSCfk0bfoyEtStixE8nqsmE
	AgYJ6nLLCwDi0YyQorKPruJGzS3GDmW8jLtNCRgk3Lm8DYvhDY4s7Ai6WyoLi14+7P/krP9GkrVAw
	p1Wn9TvBcdN7AlGB6vEdRIGy2RwBYYC4pnSCH03NkiApDovps+tJYe/AFGcVHNkLqdr03swdHJq9s
	To90Xq4DK6bQTzV9M3YhPVpRH/Nt4fQGZr6ZKaehOlN50bqha+lFes9HIcSrSXq8wDVLnMBZfrX2v
	Y/7AXDrJS8nujTcAfZDrhk5/P+CYDs/I3mLTa+sbR6qPOCq4UDfR7W5/kz8JDn7GzJvBVCi9hp+He
	0PxnhfGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxuw-0005wU-61; Wed, 25 Nov 2020 16:45:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxut-0005vW-AY; Wed, 25 Nov 2020 16:45:16 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A25A22158C;
 Wed, 25 Nov 2020 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322714;
 bh=ctDQgjmA21x1r/owXdM7d89mqspqDdIg/M7QN4BKZKg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=n27UDteMDBtJnq7aws5pmxFa2Jigq7brRnxFqGGu+usPftcv0Yp1Ahwdm29Bwubj7
 fpj8g9JooknZjAg6aKK8jhL1Jt5YlflP0qp6vpW8n+yf3cSE+UKdtGHL8jd7qukddc
 HTCpv4bbnHXtvuy/jDZO3sC9Lm/Tw6eH+52HZ6KA=
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
Subject: [PATCH v2 01/39] ASoC: ak5558: mark OF related data as maybe unused
Date: Wed, 25 Nov 2020 17:44:14 +0100
Message-Id: <20201125164452.89239-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114515_503365_DCDB333C 
X-CRM114-Status: GOOD (  17.12  )
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
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBzb3VuZC9zb2MvY29kZWNzL2FrNTU1OC5jOjQxODozNDog
d2FybmluZzog4oCYYWs1NTU4X2kyY19kdF9pZHPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBzb3VuZC9zb2MvY29kZWNzL2FrNTU1OC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvc291bmQvc29jL2NvZGVjcy9hazU1NTguYyBiL3NvdW5kL3NvYy9jb2RlY3MvYWs1NTU4
LmMKaW5kZXggMmYwNzZkNWVlMjg0Li44YTMyYjAxMzljYjAgMTAwNjQ0Ci0tLSBhL3NvdW5kL3Nv
Yy9jb2RlY3MvYWs1NTU4LmMKKysrIGIvc291bmQvc29jL2NvZGVjcy9hazU1NTguYwpAQCAtNDE1
LDcgKzQxNSw3IEBAIHN0YXRpYyBpbnQgYWs1NTU4X2kyY19yZW1vdmUoc3RydWN0IGkyY19jbGll
bnQgKmkyYykKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgYWs1NTU4X2kyY19kdF9pZHNbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIGFrNTU1OF9pMmNfZHRfaWRzW10gX19tYXliZV91bnVzZWQgPSB7CiAJeyAuY29tcGF0aWJs
ZSA9ICJhc2FoaS1rYXNlaSxhazU1NTgifSwKIAl7IH0KIH07Ci0tIAoyLjI1LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
