Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBF5EF06FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 05:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8uPl+9FOByRWnTELGgUSq9pylWnNpG1RwyxKSbvw7b8=; b=ZDx7EoO4GMvzWR
	+No7w4egba2t9CA4x1C6XOobqq+HY6huKMyCycr8KFg32JLHGQPtdVAp5+uyMoSmGm4u0FWLCO3ps
	Aw+2uj3rowSJiTRospvPSqMpcrwgZJofAWzbtHoAlUJlB9hFtExOWEY7erdHv+wQrDibE4mT659Zn
	HNCtSek6FY7GEabee1emw9J91nrf7tScKyTKaEeUgGoIYvd6ZmlbNuU6ZtVLhZ8nIz6THXKwp7w8N
	8qSoyTCWEY3HMTYNWNyt8twkW8Lo5c+eAI915sNQiSxgK9efLi8LHMaDR/rfNh/dyUCq0KwqYlxrr
	fOZm5kU6x4wvg33MeY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK91-0000000ErfS-3yEO;
	Mon, 09 Feb 2026 05:49:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK8x-0000000ErbW-38je
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 05:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B67342A0E;
	Mon,  9 Feb 2026 05:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A218C19424;
	Mon,  9 Feb 2026 05:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770616146;
	bh=ebLbpj1aW+Kz/xR5J14ie4MaN19ZepOR5F1hDJBpNPo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gySpQ9nnz39+fgc/D/7EzD0zxPRXwxnGokjoqSDL2jaMq32fa+1ks/6/HMNp/a2Oa
	 KdIJKF/aXNzmGnDQxmvh0PXsMl3Er1LnJlV39q75Y9m7A+LdGuAM/pDZ5zLSwPcQFx
	 /7HFm0BHah+S+AesUcH/pA2g3B8kMBaSb1NAzdU0LzjoRsCIfZykGuJP/FbYes1k0z
	 SjL7nQNz4iSKlyfOMlpL7AtOHcbfkNwvvvTxWHAEDi7B1/TMFCi0Q4VZZzhLLvgod9
	 lOn7AoPkf5roCgyenW9i6hL1pCG/fQoQMRKDNlSGNrYxDh/zllB6gAHKZUOnAaQrL3
	 0IfcpMWpBhTng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD80EF06FF;
	Mon,  9 Feb 2026 05:49:06 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 00/13] clk: amlogic: Introduce A9 PLL and CCU driver
 support
Date: Mon, 09 Feb 2026 13:48:46 +0800
Message-Id: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD51iWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ2MD3UTL+OSc/OTs+JSizLLUIt2UlBRLA2NTcwsTi2QloK6CotS0zAq
 widGxtbUA4Ft7hWEAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770616142; l=3749;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=ebLbpj1aW+Kz/xR5J14ie4MaN19ZepOR5F1hDJBpNPo=;
 b=lzoDOte3b+xv8Lht85pzHNT4bc9SCKzSJHu3j0g+C54rxft4OKN9wVoNSGsq/aF0aeGhuWILt
 HJSKa4eJLVkAudSDfO5EnhD0iLLehuVlS/aMg3Z+WdGdcWiSCsCcqap
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_214907_844842_F745ABE9 
X-CRM114-Status: UNSURE (   9.68  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds driver support for Phase-Locked Loop (PLL) controllers
and Clock Control Units (CCUs) in A9 SoC family.

In the A9 SoC architecture, PLLs and clock control units are implemented
as standardized hardware instances to reduce unnecessary differentiation
across individual units.

All A9 PLLs and CCUs are exposed as device tree nodes, providing an
accurate representation of the SoC's internal clock hardware structure.

These drivers are designed for reuse in subsequent SoC generations,
guaranteeing code inheritance and maximizing reusability.

Makefile rules compile A9 PLL and CCU drivers into clk-amlogic.o (see
drivers/clk/amlogic/Makefile), simplifying deployment and enhancing load
efficiency (single insmod for kernel module).

Since the foundational A9 DTS hasn't been upstreamed yet, I'm temporarily
pushing the PLL/CCU DTS files to github for driver comprehension [1].
These patches will be included in a later release after the base A9 DTS
is merged.

[1] https://github.com/torvalds/linux/commit/d6a82e4cce675fa5146c5f638c2a926c1c8cb1d9

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (13):
      dt-bindings: clock: Add Amlogic A9 standardized model clock control units
      dt-bindings: clock: Add Amlogic A9 PLL controllers
      dt-bindings: clock: Add Amlogic A9 misc clock control units
      clk: amlogic: Add basic clock driver
      clk: amlogic: Add composite clock driver
      clk: amlogic: Add noglitch clock driver
      clk: amlogic: Add duandiv clock driver
      clk: amlogic: Add PLL driver
      clk: amlogic: Add DT-based clock registration functions
      clk: amlogic: Add A9 standardized model clock control units driver
      clk: amlogic: Add A9 PLL controllers driver
      clk: amlogic: Add A9 misc clock control units driver
      clk: amlogic: Add support for building as combined kernel module

 .../bindings/clock/amlogic,a9-misc-ccu.yaml        | 523 +++++++++++
 .../bindings/clock/amlogic,a9-model-ccu.yaml       | 435 +++++++++
 .../devicetree/bindings/clock/amlogic,a9-pll.yaml  | 134 +++
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/amlogic/Kconfig                        |  52 ++
 drivers/clk/amlogic/Makefile                       |  23 +
 drivers/clk/amlogic/a9-misc-ccu.c                  | 970 +++++++++++++++++++++
 drivers/clk/amlogic/a9-model-ccu.c                 | 475 ++++++++++
 drivers/clk/amlogic/a9-pll.c                       | 156 ++++
 drivers/clk/amlogic/clk-basic.c                    | 219 +++++
 drivers/clk/amlogic/clk-basic.h                    |  39 +
 drivers/clk/amlogic/clk-composite.c                | 280 ++++++
 drivers/clk/amlogic/clk-composite.h                |  20 +
 drivers/clk/amlogic/clk-dualdiv.c                  | 365 ++++++++
 drivers/clk/amlogic/clk-dualdiv.h                  |  27 +
 drivers/clk/amlogic/clk-module.c                   |  42 +
 drivers/clk/amlogic/clk-module.h                   |  53 ++
 drivers/clk/amlogic/clk-noglitch.c                 | 584 +++++++++++++
 drivers/clk/amlogic/clk-noglitch.h                 |  29 +
 drivers/clk/amlogic/clk-pll.c                      | 701 +++++++++++++++
 drivers/clk/amlogic/clk-pll.h                      |  43 +
 drivers/clk/amlogic/clk.c                          | 464 ++++++++++
 drivers/clk/amlogic/clk.h                          |  56 ++
 include/dt-bindings/clock/amlogic,a9-misc-ccu.h    |  53 ++
 25 files changed, 5745 insertions(+)
---
base-commit: 4d310797262f0ddf129e76c2aad2b950adaf1fda
change-id: 20260130-a9_clock_driver-ddd90357848c

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
