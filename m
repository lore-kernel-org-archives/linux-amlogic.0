Return-Path: <SRS0=UCsf=E7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C7BC56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:55:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C61D92145D
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2020 16:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vmeTlhZk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqziEorJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C61D92145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyUmhxrXkwvy8JUgU0BJuZXCIpVJdOSYZwQ7ePp8EMw=; b=vmeTlhZkFX1RreE17hhLwGohZv
	TWRGNQEPH0F/2sV1tj1FlFuoDCIc35NGsyVxKBYYnJ6mRlfWsR5rZbNBheaBavNejl2mOxoo1rkRh
	XiJ2y8qQynL/Px8qYjlzpkxWw0rIeIcmNFD2hdUVmrLeStCb6+oSG7RPbIkoWslkBG9GvAXmt/lir
	p05WIcnHNlNuJkETYydTGGOOZ5vPDMIIa/FFpGjUF8tg+DNthJjkyDIRW3ncKBGO6xth1WDXcdyx4
	nRLUrR4dVAZRW3Bwmc8DsU+HK9mwb5omjNVjqUkmgX0zqK9ZladKfo59jD3RTX8cjrHRfF7DcJSTW
	OA5ilqTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khy4T-0002ND-BK; Wed, 25 Nov 2020 16:55:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxwL-0006Ve-F8; Wed, 25 Nov 2020 16:46:46 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6806721D40;
 Wed, 25 Nov 2020 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322803;
 bh=pK2aXxPdlgp8adWwLZSWyw3m60lda9J3oEtug2jUDCo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iqziEorJZqjMF0FeFXrafyN5oupLBprN/afGgnN0gGmm5eth7tmomx29q+MoR2z5g
 6NNn9xPZW6Fs6ErA4K1ZMjsgbCmVVsZ0u+aandDllFd/k9fxIeF92ayis8C9kwRSaf
 l8zQFfpGfVYvLS2xhzawbWhKYJYNDN5f1FCc4PkY=
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
Subject: [PATCH v2 21/39] ASoC: max98090: skip of_device_id table when
 !CONFIG_OF
Date: Wed, 25 Nov 2020 17:44:34 +0100
Message-Id: <20201125164452.89239-22-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_114645_671997_BA2B9361 
X-CRM114-Status: GOOD (  15.18  )
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
bnVzZWQgZm9yICFDT05GSUdfT0YKYnVpbGRzOgoKICBzb3VuZC9zb2MvY29kZWNzL21heDk4MDkw
LmM6MjY3MTozNDogd2FybmluZzog4oCYbWF4OTgwOTBfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQg
bm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBzb3VuZC9zb2MvY29kZWNzL21h
eDk4MDkwLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvc291bmQvc29jL2NvZGVjcy9tYXg5ODA5MC5jIGIvc291bmQvc29jL2NvZGVjcy9tYXg5
ODA5MC5jCmluZGV4IDk0NWE3OWU0ZjNlYi4uMDYyNzZmZjVmOGEzIDEwMDY0NAotLS0gYS9zb3Vu
ZC9zb2MvY29kZWNzL21heDk4MDkwLmMKKysrIGIvc291bmQvc29jL2NvZGVjcy9tYXg5ODA5MC5j
CkBAIC0yNjY4LDEyICsyNjY4LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9p
ZCBtYXg5ODA5MF9pMmNfaWRbXSA9IHsKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgbWF4
OTgwOTBfaTJjX2lkKTsKIAorI2lmZGVmIENPTkZJR19PRgogc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgbWF4OTgwOTBfb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gIm1h
eGltLG1heDk4MDkwIiwgfSwKIAl7IC5jb21wYXRpYmxlID0gIm1heGltLG1heDk4MDkxIiwgfSwK
IAl7IH0KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtYXg5ODA5MF9vZl9tYXRjaCk7Cisj
ZW5kaWYKIAogI2lmZGVmIENPTkZJR19BQ1BJCiBzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZGV2
aWNlX2lkIG1heDk4MDkwX2FjcGlfbWF0Y2hbXSA9IHsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
