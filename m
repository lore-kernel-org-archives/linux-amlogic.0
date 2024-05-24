Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35FAC25B74
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2024 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mw3wBdmFoWGce9m/mKgkuH/NknAYPlNrDCZdr9TJYIE=; b=039fOH3niEnM1S
	6o914UeeCouV5PxsJry0VdAdLkpGcNkapkWsVyuYPVKoa2Q9ueaX0vGVPv+Q9JL/b5nf5Uw4yeWrk
	74pxD0yM4wInEyXd1txSVHt2LusRfizZrVjy33aFrgVNhdWxAQvZ0/PesWKWOOknZuBIGmpDVS5kY
	BdfhzBl+WIdMMoFd9fzaf84cIBEcaJLGH3ueHz6q4fwWryOIkOAaE6faOynIosAkUb1/HV6CD9z1A
	oGRSSt+urldUUlt7R+p+yTMCb737KWKeMOzye/RkfZHU9icFCc9WLoSf7LCesMP8qESFi/q7WBXXc
	mOCVyKtYV9E8l9ooxByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAOWh-00000008Big-3JPq;
	Fri, 24 May 2024 06:35:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAOWe-00000008BiB-2SGP;
	Fri, 24 May 2024 06:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D131663016;
	Fri, 24 May 2024 06:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E9DAC2BBFC;
	Fri, 24 May 2024 06:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716532534;
	bh=ks0yyEHzhf2hoBGsWlNtWBNlJ0xLFKy7RtVEWtXzxmo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OuiGhPX8IeGhydH4T5uM2zrVtgddGh8fRBotyAOxMasXGLObsKIxYovpv7KZuHbhI
	 qet+0+kKOdUjb0okaM/7ksfSOmZGQ1V1L2x4xpalN1ttcnleXF+CPqwkJsLtwy5H7B
	 fg6fifz2lR0tHcK8KOK2lory+rX5ce31y2ov9CyuVp2OS2Lh6dEkx+5NTjVrEA7IyK
	 ZzrdDpruIyyDgkEmAI1Lo6LnzlQeIcRuWXfbFAkQQToCXbkr5psW0az6Bwp0Sk0uvt
	 OZq8ib7hJZRD+Pwm4sBlot6OiYdCMCJbZEO/lLy93gU3RbTOBRz8KaJq9bxQKtJqc8
	 S7/J4UpUCxpIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E97C25B74;
	Fri, 24 May 2024 06:35:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 24 May 2024 14:35:09 +0800
Subject: [PATCH] spi: meson-spicc: set SPI clock flag CLK_SET_RATE_PARENT
MIME-Version: 1.0
Message-Id: <20240524-spi_pclk_setparent-v1-1-99e0ce70b66f@amlogic.com>
X-B4-Tracking: v=1; b=H4sIABw1UGYC/x3MQQqAIBBA0avErBNyyqCuEhFiUw2FiRMRSHdPW
 r7F/wmEIpNAXySIdLPw6TN0WYDbrF9J8ZwNWGFTGWyUBJ6CO/ZJ6Ao2kr9UO1vsajRO6xpyGCI
 t/PzTYXzfD52+YXpkAAAA
To: Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Sunny Luo <sunny.luo@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716532532; l=1803;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=i2kf4hjt27aFCniu/cvi7M+Wdce80gPI7LhS2KX7ULY=;
 b=ehUpQ96FcIL43Duzap4N1C5TOSDRp6ZTDXvwx0+NTo1ezJmCXPgZdeqeFOUDsub3YptIpzR9q
 oATZyZAAqSYC18IypOtnO7eSAWfPzir+KMzfpkM//iyvrIIRc6AhJXK
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_233536_803443_8115EB38 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add SPI clock flag CLK_SET_RATE_PARENT for using pclk as parent clock.
This gives SPI more flexibility in frequency selection.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
---
 drivers/spi/spi-meson-spicc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index fc75492e50ff..8a4a8ba9dfed 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -644,11 +644,13 @@ static int meson_spicc_pow2_clk_init(struct meson_spicc_device *spicc)
 	snprintf(name, sizeof(name), "%s#pow2_fixed_div", dev_name(dev));
 	init.name = name;
 	init.ops = &clk_fixed_factor_ops;
-	init.flags = 0;
-	if (spicc->data->has_pclk)
+	if (spicc->data->has_pclk) {
+		init.flags = CLK_SET_RATE_PARENT;
 		parent_data[0].hw = __clk_get_hw(spicc->pclk);
-	else
+	} else {
+		init.flags = 0;
 		parent_data[0].hw = __clk_get_hw(spicc->core);
+	}
 	init.num_parents = 1;
 
 	pow2_fixed_div->mult = 1,
@@ -708,11 +710,13 @@ static int meson_spicc_enh_clk_init(struct meson_spicc_device *spicc)
 	snprintf(name, sizeof(name), "%s#enh_fixed_div", dev_name(dev));
 	init.name = name;
 	init.ops = &clk_fixed_factor_ops;
-	init.flags = 0;
-	if (spicc->data->has_pclk)
+	if (spicc->data->has_pclk) {
+		init.flags = CLK_SET_RATE_PARENT;
 		parent_data[0].hw = __clk_get_hw(spicc->pclk);
-	else
+	} else {
+		init.flags = 0;
 		parent_data[0].hw = __clk_get_hw(spicc->core);
+	}
 	init.num_parents = 1;
 
 	enh_fixed_div->mult = 1,

---
base-commit: 3aac9f4885922ad0fc01b86f85903768219475a3
change-id: 20240524-spi_pclk_setparent-6da29325c113

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
