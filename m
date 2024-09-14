Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F3FFC6194
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2024 05:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=etp2XJSkcD2ptOdktnVG9gsLZaxpfFP7XFxqb5BdEWQ=; b=gk1wN54Oewz5e9
	zUkaV8wIi9kYLjJOvgt9Kwe/c1OJELx+QOrlLqm/1f52PPflQcw9YxAvrvcZ4u1KgvtEr0XM+xi5H
	JPX/wlSZ3igAeyQDB24Kc7v8C8WfQkDNihQTz/n0/33QpYQmJINC2fyL6vJQo6r57qTwF0fG/MK5M
	kuqJ3wMopPBLA6OdoXDVGy5Mw48LJcxMJHq9aJM5KDTEq8XDzX2r2h+uIdN2bvo3rD8gr78SDVgQG
	jwu/+3Wb/rn+jhh9nPzvHz+LsMWU0s0uLoZqgYaBJmAahT9LGnnn+5GPxMJZ3arfEtic8inUUDo1C
	DrtdtxQVb8ifZNCnIGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spLMU-00000000755-2Swr;
	Sat, 14 Sep 2024 05:30:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spLHq-000000005qU-17yB;
	Sat, 14 Sep 2024 05:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FACB5C53E6;
	Sat, 14 Sep 2024 05:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 541BAC4CECC;
	Sat, 14 Sep 2024 05:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726291532;
	bh=y10UL2fiKM6zXqdv45T+NCDp2jd43U6zrfE3QLH15qU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nPLP5TJYWkdJdEgOCEQ5vpb+KiRf/nRbnZ+G9jyjppMeoMFCGpD4ZQSdvHkYqtiCS
	 O9ySghrOtoXSZwuLmg/P635Lw4E2/2aiFzCtozHyXxFz9D/K8vB97L1FBkxC8CnNsF
	 WwoTJWdjIcYbospS/JHpDPpOWjKC+FMHe+teS1gQd2/7AMcPcU2Lmeccqod6S44pr8
	 gEOy4obLpVGS41j5G69tQsHkNvF8FHyCFMTexFSQVqosbku6Y/AZye6Xh51fPSXVIQ
	 1F5a69Cn7AiRkDn0rLrUr3bVoVzjtmOp3KtPkQsOKLk7pBT7dCK1PiWg3/46+Jr96V
	 xKtXcwJ23cLOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD82FA374E;
	Sat, 14 Sep 2024 05:25:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/5] Add A5 SoC PLLs and Peripheral clock
Date: Sat, 14 Sep 2024 13:25:22 +0800
Message-Id: <20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEIe5WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0ND3URT3eScbF1j02QTy8TkJGOTVEMloOKCotS0zAqwQdGxtbUAVqX
 Sv1gAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726291530; l=1750;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=y10UL2fiKM6zXqdv45T+NCDp2jd43U6zrfE3QLH15qU=;
 b=sUAB/u6hyKEzqV+R2fe113uLL+QgpGEdnrQzsqmHoS4LtwcUOpqrDytQM0YYlyT5HmDUqn3l5
 n9qfi5GZ0DwBdITVtOTKWoe3YbR/qVjhcoZn7RJXksRTcBduZShmnUR
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_222534_489407_18E7F9AC 
X-CRM114-Status: UNSURE (   7.04  )
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

The patchset adds support for the peripheral and PLL clock controller
found on the Amlogic A5 SoC family, such as A113X2.

Some clocks are provided by security zones. These clock accessed
througth SCMI driver in linux, inlcuding OSC, SYS_CLK, AXI_CLK,
CPU_CLK, DSU_CLK, GP1_PLL, FIXED_PLL_DCO, FIXED_PLL, SYS_PLL_DIV16,
ACLKM, CPU_CLK_DIV16, FCLK_50M_PREDIV, FCLK_50M_DIV, FCLK_50M, 
FCLK_DIV2_DIV, FCLK_DIV2, FCLK_DIV2P5_DIV, FCLK_DIV2P5, FCLK_DIV3_DIV,
FCLK_DIV3, FCLK_DIV4_DIV, FCLK_DIV4, FCLK_DIV5_DIV, FCLK_DIV5,
FCLK_DIV7_DIV and FCLK_DIV7.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Chuan Liu (5):
      dt-bindings: clock: add Amlogic A5 PLL clock controller
      dt-bindings: clock: add Amlogic A5 SCMI clock controller support
      dt-bindings: clock: add Amlogic A5 peripherals clock controller
      clk: meson: add support for the A5 SoC PLL clock
      clk: meson: add A5 clock peripherals controller driver

 .../clock/amlogic,a5-peripherals-clkc.yaml         |  126 ++
 .../bindings/clock/amlogic,a5-pll-clkc.yaml        |   62 +
 drivers/clk/meson/Kconfig                          |   28 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a5-peripherals.c                 | 1471 ++++++++++++++++++++
 drivers/clk/meson/a5-pll.c                         |  553 ++++++++
 .../clock/amlogic,a5-peripherals-clkc.h            |  139 ++
 include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |   24 +
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |   37 +
 9 files changed, 2442 insertions(+)
---
base-commit: c92651b5d51738859098d59692ff8ff4fa85bcd6
change-id: 20240911-a5-clk-35c49acb34e1

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
