Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863F4CD4F5E
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bKtCaILH6YKQA4QetWLIJYKhENvUkujaUZ3s0kMFhkg=; b=HWfvnUfNLaOeIe
	xEImfmclo6r632nx/lWLsMbiFkp1qE1/bW04WgJEAD81UruIUsOBNyEeQlD2HmdW9mwwKS6aBRKNS
	0/98CUElbfcLWAGRSduXh9YSX1/lL4KZ+g3z4tK9w+IZzmzXpKo7n6Rlcb1nQx73CBcpBfhlhSPjO
	KoBJeqbvcgKUMjDWrjAHpGk3HmTp4GTAnS57t9IuxzxTcf2JIFQfXlkgbZmqaYi6Z0xcO/iqyaL2a
	cgp6qpsI4V1Td7brT9Hxe1fJnVXJ1eTu3qWpbCovj+wUurUBBvrQ+8TrCAgL3603kjHfMtsO7mc4O
	up5hzICrVa8iwuboSukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWY-000000075QV-0BQ9;
	Thu, 21 May 2026 08:12:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWU-000000075OU-3vcc
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 08:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6486C440F9;
	Thu, 21 May 2026 08:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36642C2BCB4;
	Thu, 21 May 2026 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779351174;
	bh=hzuY+yyFO4sjo8dhrrxQOewW27XSqB9N4XeCHFH8Bqw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jDvWzpJ0Tg46huG0qtCO6n9siW+ORI289/aRALbc6QT+6699spl/L80hID+tYJgSC
	 fqg6qzuBkhG+mOGIlHmbBW40Mq2ZGpqBcMgvvvW76D0XPh9EmdsaML9LjIQXYE/SXT
	 09piLu0PzZ675f7rCW663JQGlHut9sabtncz1TdeYQcJXahfHZvRoDETSixVLY48hX
	 /UJvZZeczBdCUWwnN1Q4aFe7uyhhFyT09o4Ug9tbPHIVX7pCIrwVQE2NCU7/24VDVN
	 DiUH0PuSvtyQaKoJZJO7uqVD38DAiomIoq553pOl7xnWHpk2P8dDPF8+PNlvkLWJEc
	 Xp3o5MAI1cldQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6BBCD5BAC;
	Thu, 21 May 2026 08:12:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v8 0/3] Add Amlogic general DMA
Date: Thu, 21 May 2026 08:12:42 +0000
Message-Id: <20260521-amlogic-dma-v8-0-86cc2ce94142@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHq+DmoC/23OTWrDMBAF4KsEratijWYkq6veI3Qhe8aJoI6LX
 UxK8N0rh4b4p8sn8b03NzVIn2RQb4eb6mVMQ+ouOZQvB1Wf4+UkOnHOCgogA4Z0bD+7U6o1t1H
 7gN4z1QwOVRZfvTTpem87fuR8TsN31//cy0czvz563KpnNLrQAmUQ8hJc9O9/v69116q5aYSHd
 oUBv9aQNRIQW/DskffaPjUUm22bNbmmCg0FYYC9xoXebmPWDZCgMyih+udyempb4FpT1jEiWTb
 YMNq9dksd1tpl7azFwGArxmqv/ULDZtvPl5dVMCImQG3WepqmX6z2Ue0cAgAA
X-Change-ID: 20251215-amlogic-dma-79477d5cd264
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779351171; l=2587;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=hzuY+yyFO4sjo8dhrrxQOewW27XSqB9N4XeCHFH8Bqw=;
 b=oEdhIYPsTCEUZteX9hT0ke1NATls0bgvNDdiBomI7mCB0YBdDQOlt1AsoeipLBqwO+ctQwEiH
 xWcwlvsf3dwCcQOUnc1657XU3u1U/SGz75RMgtXZv+XGdmpUQGFEQLb
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_011255_020814_3938801C 
X-CRM114-Status: GOOD (  10.89  )
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
Changes in v8:
- Use kzalloc instead of kmalloc.
- Initialize the temporary variable and fix a spelling mistake.
- Link to v7: https://lore.kernel.org/r/20260324-amlogic-dma-v7-0-f8b91ee192c1@amlogic.com

Changes in v7:
- Take use vchan to support mltiple txns.
- Link to v6: https://lore.kernel.org/r/20260309-amlogic-dma-v6-0-63349d23bd4b@amlogic.com

Changes in v6:
- Some minor modifications according to Frank's suggestion.
- Link to v5: https://lore.kernel.org/r/20260304-amlogic-dma-v5-0-aa453d14fd43@amlogic.com

Changes in v5:
- Rename head file and rename macro definition.
- Rename the subject in [2/3] from "dma" to "dmaengine".
- Link to v4: https://lore.kernel.org/r/20260227-amlogic-dma-v4-0-f25e4614e9b7@amlogic.com

Changes in v4:
- Support split transfer when data len > MAX_LEN.
- When a module fails or exits, perform de-initialization.
- Some other minor modifications.
- Link to v3: https://lore.kernel.org/r/20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com

Changes in v3:
- Adjust the format of binding according to Frank's suggestion.
- Some code format modified according to Frank's suggestion.
- Support one prep_sg and one submit, drop multi prep_sg and one submit.
- Keep pre state when resume from pause status.
- Link to v2: https://lore.kernel.org/r/20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com

Changes in v2:
- Introduce what the DMA is used for in the A9 SoC.
- Some minor modifications were made according to Krzysztof's suggestions.
- Some modifications were made according to Neil's suggestions.
- Fix a build error.
- Link to v1: https://lore.kernel.org/r/20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: dma: Add Amlogic A9 SoC DMA
      dmaengine: amlogic: Add general DMA driver for A9
      MAINTAINERS: Add an entry for Amlogic DMA driver

 .../devicetree/bindings/dma/amlogic,a9-dma.yaml    |  65 ++
 MAINTAINERS                                        |   7 +
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/amlogic-dma.c                          | 682 +++++++++++++++++++++
 include/dt-bindings/dma/amlogic,a9-dma.h           |   8 +
 6 files changed, 773 insertions(+)
---
base-commit: 0b1f98df9cf024e9f1a43e0ef9c16d3466d17746
change-id: 20251215-amlogic-dma-79477d5cd264

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
