Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D7AD5C0D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vG4hRdlVPhx6AktIQYLYH3Xul0RkPpdhFIpel9jBJ1c=; b=ud1g4OqlqhyzU1
	sd/jIgXrvDP59Cqj0w59N2NdK4VzgP1nnlzRZn6LlzdvX61OyX0k/inlMLCsaksjq1vHihIKKLdlb
	jkWr8howQ0rN5O0by8PadgFNzqMM0ibGX/ipiFzN+k4WaDJ/4eIBB13OU/WNpAVCd0IsTUy2lsy+8
	O58LSWP7pXPnlkGImGtpRPZ6ewcWUuHXso5zT64SmRR40zNbZRwVCZ/ajETflO2UpH/f8cIc1BcAe
	kaFLQdzpo+kMgQINryQ4DrDtD7QyaMNItE2qLc5JVz2gqq+d1PpJIZpt3dq9WMzm1+9s0f/ILe9cs
	Rj0/h3qJZKieop1gtv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ1j-00000004tK6-2rAW;
	Tue, 16 Dec 2025 08:03:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ1i-00000004tJR-23uP
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 08:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3B2C60010;
	Tue, 16 Dec 2025 08:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91513C113D0;
	Tue, 16 Dec 2025 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765872200;
	bh=5OeYvXMSFntRvGG5qfE6GBqZZ5Co1CPYfzo/K+UvU6w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aMkSjah8vnsdLaFUzroWf0jvqN1ZvuIuEICVU7DNc7L9zybmy2P5Gb3y6/NCee6iX
	 oUj1+003mOAtr5NRXY+QSS784eo4dcFYJI9OPFiYICGHr0eFW0GkmP2MZK3uF7IkyE
	 3x6+ie6pTkTU75mqFfKXCMlnjvcPVFNfKlkZLbNcljn+I3M4BHmWDq4vXbeDRuIO/n
	 aC/12ae1uID564LQ2Lm8Kys/LLXSWzx7wjzjiZHEqeUsoJwj5fdoePgVh0jcz/SIaF
	 3nCT2Ml6RDq8oKvCgmPOVs1sV8QIqZuk6MWZqlmCk35Ch+qhoi8RC/f8okjwlJ82i6
	 pA+D9yuIXyp9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687B9D5B16C;
	Tue, 16 Dec 2025 08:03:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Add Amlogic general DMA
Date: Tue, 16 Dec 2025 08:03:16 +0000
Message-Id: <20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEQSQWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0NT3cTcnPz0zGTdlNxEXXNLE3PzFNPkFCMzEyWgjoKi1LTMCrBp0bG
 1tQAShWYnXQAAAA==
X-Change-ID: 20251215-amlogic-dma-79477d5cd264
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765872198; l=826;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=5OeYvXMSFntRvGG5qfE6GBqZZ5Co1CPYfzo/K+UvU6w=;
 b=wWM4MMb1w1IBw2bhpp5tF6jlfbiSZWVDh/2dF4DWMbv9j6YXf0iFkErQOd59LS4px15OCDLq6
 r7c5aLSdljMBKVGwXcMBrmumCstimx/SqopZrkCoRZLQWYEzlw7Ci2p
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
Xianwei Zhao (3):
      dt-bindings: dma: Add Amlogic general DMA
      dma: amlogic: Add general DMA driver for SoCs
      MAINTAINERS: Add an entry for Amlogic DMA driver

 .../bindings/dma/amlogic,general-dma.yaml          |  70 +++
 MAINTAINERS                                        |   7 +
 drivers/dma/Kconfig                                |   8 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/amlogic-dma.c                          | 567 +++++++++++++++++++++
 5 files changed, 653 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-amlogic-dma-79477d5cd264

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
