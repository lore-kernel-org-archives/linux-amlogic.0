Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FCACF58DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=twiFnxceAExZJeBwaD2uo9/br/yemaBHNe3lpSSq8Co=; b=RURE0wXO9h2HJv
	bg84FzwduxU16d9QAYnpfD3q1uL3cyfYyhXX1CjH8bX9D8hrIubm3CN+Tm3nAPd16aBl3FAFxc5ED
	MpFXpa5ZLkIF9gbBRVQOOc27VLtxZsq3UvWmWawYCjbHWlxQN6TmO4r7D9HkqjyP3FV+CW1yVIxsi
	ypGfY2WlqNfDAywvmccxddSnzBcGGp9QL8D8LyXwczGkdRndiwFKIVp5aG5qqFPuK+H51xFltO5Wk
	z4NNOum5Vz/8IX3lTKFahTBvn7dIx5SQB7KlbDgEA7IVfR6UGOjArUxUilw7lPfd2NsVKugLSXMPD
	W6lXk/CAAJPeLWLDoipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYm1-0000000Bi6Y-1dFi;
	Fri, 20 Sep 2024 08:13:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYly-0000000Bi67-3mO1;
	Fri, 20 Sep 2024 08:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DD92A4419D;
	Fri, 20 Sep 2024 08:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD219C4CEC5;
	Fri, 20 Sep 2024 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820028;
	bh=9hmMsURfWQvQALeUJoUpEIlJ5bSjiG5NcrH3pWDEfjA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AmQdpQUW4VQVNjjs1Mab7sJO5EUTftLM5IK8CyRi3A53qii1LSKP1sQeD4llp4VHV
	 r0vEKZ46AJSoWj7i7/7LvGae6i8svaLxVvXUy5o5fg/RsTtXcrJsYdHci3mYq+Irqp
	 n04RfQyEf8vdIlOjJiPSI3Lb2Hceh8iZexI4SVLh0xp2QyDk+m70IqJTQyq+nhUzTK
	 xVSJpQ1DGPSYQHA3OKNoOq0vD/5cNtXpmfF1HLTaE5IdV0Buj3IQB1JtkT3awcKns+
	 1NCayfrra1d4ppsJJw2mcTusLiAXS7Upwem11mwWY5e0ynKeCHq4D9TLxeOgozAW3m
	 7hQgSgikkZ0Mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCAFCF58DD;
	Fri, 20 Sep 2024 08:13:48 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 20 Sep 2024 16:13:13 +0800
Subject: [PATCH] clk: meson: pll: Update the meson_clk_pll_init execution
 judgment logic
MIME-Version: 1.0
Message-Id: <20240920-optimize_pll_flag-v1-1-c90d84a80a51@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAJgu7WYC/x3M0QpAMBSA4VfRubZixOFVJC07m1PD2iSRd7dcf
 hf//0CkwBShzx4IdHLkfUso8wzmRW2WBOtkkIWsi65EsfuDV75p8s5NxikrmhYVopaVQQmp84E
 MX/9zGN/3A4BHfd1jAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726820026; l=2429;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Bxi0pv+eCzIxvYRz/WWiwYenjJWhGAFp4yX+VQVeYR0=;
 b=SHfpgZJ0kfXUg89lZ7xFZh4+atixE7c7aAQxxNKPJ4Pj5PBehGSJ/C39ZYFB1y/QIK1IadLCz
 53bEMsO8fveCj1E6BYhN0C3BkiwU/wYlJIhy/UB7GJvLoLoI4Jb/f73
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_011351_111719_26183089 
X-CRM114-Status: GOOD (  14.12  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The hardware property of PLL determines that PLL can only be enabled
after PLL has been initialized. If PLL is not initialized, the
corresponding lock bit will not be set to 1, resulting in
meson_clk_pll_is_enabled() returning "false".

Therefore, if PLL is already enabled, there is no need to repeat
initialization, and the judgment "CLK_MESON_PLL_NOINIT_ENABLED" in
meson_clk_pll_init() appears redundant.

---
The hardware property of PLL determines that PLL can only be enabled
after PLL has been initialized. If PLL is not initialized, the
corresponding lock bit will not be set to 1, resulting in
meson_clk_pll_is_enabled() returning "false".

Therefore, if PLL is already enabled, there is no need to repeat
initialization, and the judgment "CLK_MESON_PLL_NOINIT_ENABLED" in
meson_clk_pll_init() appears redundant.

In actual application scenarios, PLL configuration is determined during
the bootloader phase. If PLL has been configured during the bootloader
phase, you need to add a flag to the kernel to avoid PLL
re-initialization, which will increase the coupling between the kernel
and the bootloader.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 3 +--
 drivers/clk/meson/clk-pll.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 89f0f04a16ab..8df2add40b57 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -316,8 +316,7 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 	 * Keep the clock running, which was already initialized and enabled
 	 * from the bootloader stage, to avoid any glitches.
 	 */
-	if ((pll->flags & CLK_MESON_PLL_NOINIT_ENABLED) &&
-	    meson_clk_pll_is_enabled(hw))
+	if (meson_clk_pll_is_enabled(hw))
 		return 0;
 
 	if (pll->init_count) {
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..cccbf52808b1 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -28,7 +28,6 @@ struct pll_mult_range {
 	}
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
-#define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
 
 struct meson_clk_pll_data {
 	struct parm en;

---
base-commit: 0ef513560b53d499c824b77220c537eafe1df90d
change-id: 20240918-optimize_pll_flag-678a88d23f82

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
