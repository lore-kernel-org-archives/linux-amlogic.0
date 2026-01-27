Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B1D25923
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jan 2026 03:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FZymP3SJTeb1TyvXTy9HCpVHXKbhvW20+jzYUl352oI=; b=ZbDIS5FClJylxL
	wMFQxCiFX/jZUQzWOW4YcrdG0JpIuM2wDCoVjsyxTjUyxMlwihwLKgw2HnYnGzhZtWDdhOM0GiIF4
	zZsOUGPj9Zy94kqoBRyVOYT1CeuPmi9rNvoQdPoWcIUqGecI92z9uYLomSuEKh/2M/FpybBLNWbFC
	olIPJEu4k8hcNXbAHsEkNCUn4i+SW9jslrKIlPrnZ/xT62USWCyWF4a9mVu/rJP1stCp6hYkBlpR7
	cF5wY85EC6u5hvhYAVAuvNQCMywGTsArJ5wYf3EjEdyED2ERaeD2ES9wxIAx7aYF/mrA0/5Co5aqo
	SjP/uygsP6/YN88XxMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZkH-0000000Dawg-2w08;
	Tue, 27 Jan 2026 03:28:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZkG-0000000Dave-3IvN
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jan 2026 03:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A882600AD;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32FD4C116C6;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769484479;
	bh=82UInUPaZAsuTnm7Eq2Rk6+iYxY2ts69JzilZc2OUsQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XydDZ319/gvkFBkAWnYNjt25ao4WR3bvRPCk6It5k1K+z4Euvj+kn3oXIjz+3SP7Y
	 +6noowqFxso1ZLhMZFWyrLIIwweg2i06hfCoTodB5pcvOXHVVwruR+EuCeCNVLdbtS
	 06k6z90IHyuiiLNBFn3PvXieXJO8vj70x8k2AQAXNqSc6K+1UZehG8k4wGTHwQzHGw
	 mKjd5JuhmHylDMb7whhhjFTsG+lGeOT4xcTxwH56LnqEN09aXURjM6IvxGZ/pVAt+A
	 /ZQdwsEPRm8xjoV3ihX+zfL6QDKCtuokFYpPPjQBAMAXx62b/p2sZTxucBsNERx6zK
	 nFc7CBxZa/nGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200A2D25920;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] Add Amlogic general DMA
Date: Tue, 27 Jan 2026 03:27:51 +0000
Message-Id: <20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALgweGkC/1XMQQ7CIBCF4as0sxZTSAFx1XuYLgiM7SRSDBiia
 bi72OjC5T+T922QMRFmOHcbJCyUKa4txKEDt9h1Rka+NYheSC64ZDbc4kyO+WCZNoPWXjov1AB
 tcU94peeuXabWC+VHTK8dL/xz/Tnqzymc9QzFyaDUaJTV4/d7dDHAVGt9A/rhUiKoAAAA
X-Change-ID: 20251215-amlogic-dma-79477d5cd264
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769484476; l=1154;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=82UInUPaZAsuTnm7Eq2Rk6+iYxY2ts69JzilZc2OUsQ=;
 b=5pfGRD1ecIIB6hxFANgbOJ1NQmMd6kd+5Feseh7D/qlkLzwYFtI7HdbLloiExbeHw/v7Hsk5T
 EwCisl719kzCxW9iU3KyLM1/qj+3l2h1IAByGyQMcsZlhF09uAbbavS
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add DMA driver and bindigns for the Amlogic SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Introduce what the DMA is used for in the A9 SoC.
- Some minor modifications were made according to Krzysztof's suggestions.
- Some modifications were made according to Neil's suggestions.
- Fix a build error.
- Link to v1: https://lore.kernel.org/r/20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: dma: Add Amlogic A9 SoC DMA
      dma: amlogic: Add general DMA driver for A9
      MAINTAINERS: Add an entry for Amlogic DMA driver

 .../devicetree/bindings/dma/amlogic,a9-dma.yaml    |  70 +++
 MAINTAINERS                                        |   7 +
 drivers/dma/Kconfig                                |   9 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/amlogic-dma.c                          | 563 +++++++++++++++++++++
 5 files changed, 650 insertions(+)
---
base-commit: 3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2
change-id: 20251215-amlogic-dma-79477d5cd264

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
