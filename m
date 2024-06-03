Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA9C25B75
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2024 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4eEsuxIzIanll+AUW4eGqtyBSxJfmRuTYg5PXI7uZR0=; b=afeLBrlbp1IYyD
	Rm6hLqg8CG0rPmHqq3UcyzIJatZc82lKKUPQ/F6u3DFk2zCFvpj9aPf/0sz9qT4HlcTGwsAXK1dhO
	WSI+psuObXxXKckniObcod52l+LTCnOnPjgSLIlfWBa/NKNs0bmn9MyQVl2nArnOwBoAPLk4SIdie
	k/xaKMWKxrt+AQv1zmGgOSo4/SHeQeJa0cXFMI1m9wzna/ru4qtVlvBJgKH+2Zlwvteff1yza6uzY
	e4JObSoYFUSOtN3OiSZP5sjX1Vcduf3UpN7aEzGCCOFEKuQju2cDuqnQ/1hdegFRs7GYrU2eS6GVm
	lXM9FD4kXKzNuPO1QlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE4YS-0000000GLA9-2zxH;
	Mon, 03 Jun 2024 10:04:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE4YQ-0000000GL9h-21pC;
	Mon, 03 Jun 2024 10:04:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 438BD60D30;
	Mon,  3 Jun 2024 10:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3BE1C2BD10;
	Mon,  3 Jun 2024 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717409077;
	bh=Wlp7cZUIlE4IOHsusBnYh5vU2mzpL9FERd+nACxXsNk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jitBqWF1HmyfocksqKrVWvoUdLzYHte1P62IPlwRvfzXXcj+S+Ew3u5pSPaWdaPqC
	 TnDYquRgSjqKGrddFCEt7XSQ2cu5R1FDLVNrI8HO+NJ4M7EQof9EPK/ATJ8PRsLXYI
	 19qmKeJBi2NkOyLWdIMmyOSP2tCMrawtG9YrDEO4G9FzMfqjlDJHj0fPqvnfP3hANW
	 BrPlGxBnGwWfVQhdCf/hCRbjjoXK2VyZThPXUOTq2ZISjEA1N7gooblakjh0z3oZPZ
	 AbfyUkJVJvQMLuOJKYLmKsjRanem+wocNewNB2m5Yx6jyx1zCDLIMBMSvl74XkSBpQ
	 9ZV3CNB1BrPlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9170C27C44;
	Mon,  3 Jun 2024 10:04:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 03 Jun 2024 18:04:33 +0800
Subject: [PATCH] clk: meson: s4: fix fixed_pll_dco clock
MIME-Version: 1.0
Message-Id: <20240603-s4_fixedpll-v1-1-2b2a98630841@amlogic.com>
X-B4-Tracking: v=1; b=H4sIADCVXWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNj3WKT+LTMitSUgpwcXWNLo6QkM6PUZEtzCyWgjoKiVJAcyLTo2Np
 aAPgIUCtdAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717409074; l=969;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SOD0rIzjB9of1yjvijBbI9sErwBPGjkFM4JLYIAkE/M=;
 b=EWCSOcnNVVrdnL4wLFgNl2+yIEH8TlQrvcy01wiM/tm0IMyHU3b5njMf9swxD3EF8sp0fC7I7
 SQIYVaOz7myArhV3xPZMCbNAf8qNc/P/MP4qsyCyZEF6SHCnNBeF3vx
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_030438_698088_1FBBC6F4 
X-CRM114-Status: UNSURE (   8.93  )
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

The fixed_pll_dco output frequency is not accurate,
add frac factor for fixed_pll_dco clk to fix it.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/clk/meson/s4-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 8dfaeccaadc2..47c0c105e32d 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -38,6 +38,11 @@ static struct clk_regmap s4_fixed_pll_dco = {
 			.shift   = 0,
 			.width   = 8,
 		},
+		.frac = {
+			.reg_off = ANACTRL_FIXPLL_CTRL1,
+			.shift   = 0,
+			.width   = 17,
+		},
 		.n = {
 			.reg_off = ANACTRL_FIXPLL_CTRL0,
 			.shift   = 10,

---
base-commit: ba535bce57e71463a86f8b33a0ea88c26e3a6418
change-id: 20240603-s4_fixedpll-392bb62ec978

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
