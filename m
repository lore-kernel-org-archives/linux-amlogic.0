Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4760C44501
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f3xe3D1vEJyRnJAf9BQ9i6WNMgPvA8Eta1R13ul4rUA=; b=LAhSDJkhYbuX9P
	1POe+UOJgpdhUfVC8/f3zgJWepxFfjEEvFszG+lPBaz4t8u5tXjIY7euTXXJL0YuePjy9ehOD93CP
	TvJO4DkgyOIu0W+cgn3dbiJJTODWT6+diFh4aX9t7wPyzjyp0IiGgmrHncirpQRoo3tYQLRqvJB3+
	zC9a8rN4yyPBAtnVrwD+wijEcYHBNE9qLOGzvHsB1AR73TwzOJL8bP1Rc3cl0W0IFP3QlL7XpnPwr
	xgJ9qbV6i7XSOyfsbV6NR5uou6Lr2/dtXf3vRjdiRCxkCyCXMpXBt0hHyFy5WVZ02GWRDpnph+7OY
	fVuaDBuuzgS9xODGWujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi45s-00000004DW7-12G8;
	Fri, 10 Jul 2026 05:48:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi45r-00000004DVc-2QQD
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 05:48:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 058D5434DC;
	Fri, 10 Jul 2026 05:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD560C2BCB8;
	Fri, 10 Jul 2026 05:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783662490;
	bh=z3pHePbjn5THsI3EDo76LPycLmDQReOlyueKvBzMWeA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pn/cbiwNmnY97diM/KtUwPgrb0IScwW/qPd784hf6d3zRn7XWHkKjCZIBIS4r4mt4
	 n1IATu35oP1yBmsJ5njRox55RB42fFaNQpB0Sa3n7SojuPs4Xm/y7gUC7aly/YW/3y
	 AXg3XR/StlQ8e/TzmGmNEp7JSUWYzNwTtagWmKEK4hfAMi7xmQnRYVSuWMKsCwwqjh
	 vKHYxBRl2/Vb2mS6rlTjmeKseeiD3Z1LIAZo/lRcIqKJBimbEOAJ/F3ls/scl0GcAY
	 RoPVg7RmbWbLowIRAAdJb0DUnmQRmTv1x4e0FMxYpzmF8DQP46BWzXZNwzqew+yrc5
	 iMEYQhT5gIRJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A895FC43458;
	Fri, 10 Jul 2026 05:48:10 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v10 0/3] Add Amlogic general DMA
Date: Fri, 10 Jul 2026 05:48:05 +0000
Message-Id: <20260710-amlogic-dma-v10-0-ff4deae837e7@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJWHUGoC/23QzWrDMAwH8FcpPi8jliU72mnvMXZwbKU1rE1JR
 tgoefc5ZSVfPUri95fQTfXSJenV2+GmOhlSn9pLLnT5clDh5C9HKVLMDQUlkAZNhT9/tccUinj
 2hWN0LlKIYFFlce2kST/3uI/PXJ9S/912v/f0QU/dR45d5Qy6KAuBioWcsPXu/X/6GtqzmpIGe
 GhbanBrDVkjAUUDLjqMe21mDeVmt8mabFNzQywRYK9xobe7MesGSNBqFK6fXE6zNiWuNWXtPZK
 JGpuIZq/tUvNa26ytMcgRTB2x3mu30LDZ7abLq5q1iGYIeq+rWRPota6yrmwIEIRR45Ov8awtb
 H7O08+pitZBQM+01uM4/gGQ5kaRmQIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783662489; l=3115;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=z3pHePbjn5THsI3EDo76LPycLmDQReOlyueKvBzMWeA=;
 b=oJeoCJ0P+EdApXLCUbGChP5fW9JCvE/HSh4TUH/mt+k7IuhI0Pb1mVOPNaLZONPLlSoFd7Rdw
 qyh2o1pjjRHD8Qvu9WlN1zEShM8KUN7UGiZUE5cCJvXWjYFNIBoGDoV
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
Changes in v10:
- Free dma memory in workqueue.
- Deal with zero len sg (not consume sg_link),and reset status to DMA_COMPLETE when terminal channel.
- Add desc for #dma-cells in dt-bindings.
- Link to v9: https://lore.kernel.org/r/20260626-amlogic-dma-v9-0-558d672c4a95@amlogic.com

Changes in v9:
- Use each transmission request sg_link mem instead of the loop mem get.
- Fix some hidden issues which reviewed by ai robot.
- Link to v8: https://lore.kernel.org/r/20260521-amlogic-dma-v8-0-86cc2ce94142@amlogic.com

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

 .../devicetree/bindings/dma/amlogic,a9-dma.yaml    |  68 ++
 MAINTAINERS                                        |   7 +
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/amlogic-dma.c                          | 723 +++++++++++++++++++++
 include/dt-bindings/dma/amlogic,a9-dma.h           |   8 +
 6 files changed, 817 insertions(+)
---
base-commit: f53b2c30a192b35064be2584df7a800a8e6ac710
change-id: 20251215-amlogic-dma-79477d5cd264

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
