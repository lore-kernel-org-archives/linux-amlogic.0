Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7928AEF36E6
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2026 06:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JNHN7HceoOopw3fOngDa1W9VR/hDCZlHPCstBIT7ARE=; b=1Qvp+TtycRfaye
	9iK6tlMIzaJVNHmi6pwOVzAaC/VfslEBdb03G1mJIosdasTy6w4OVFd+YvtLVnDuqVu7LYB5mnNwL
	eRpBCV80PaA7auGmaJmEXeBIoKC5yNIHtyq1ti+jEalulECeRHZ0J5htKhKEYQOC9DfpSInXqlFTI
	aPl0d3nVP56vEYybVa3Ym4vturbETRo79A68NeT8rQdNao/lps/UhP01ujLZS4QYdtoh9h9487fVh
	rujgg7vI2U+Z8mMOU8QuCQEAxr6aOzdVMIDz4ZGFyBtb74w65dV7r9QyghvzuypUJMC/ivsqQj+FU
	Sw20ERenBvBe5Qbew8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUBk-00000006jnu-0sGU;
	Mon, 09 Mar 2026 06:34:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUBh-00000006jmQ-1P8v
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Mar 2026 06:33:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD26440F7;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BE0CC4CEF7;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773038036;
	bh=+H1SBtc8kybh3elD3rirCxlwLPaSwRraLSvHJmDF8E4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NyL/1grL+FlzEdY1sTzgHJzbdTtNVTmvOIewCg92qaHrTibjwajWLx4iYST8FKJKk
	 OjZNQcJWhmmcIhrRzeF+Kak9qrLLOdS1Cr55g4C2MGnWF7HF1XQBBR/LE4hsFUmnQO
	 rwEkmpJsKnP6u70ISqcw1d3SCKawKVDH4oQcfCNHdWqkJtx6aZbhwa+26j7Xpm4sfE
	 U2lnNsMK1Ga8WmTgtkkaQqK0LPm35Yfun1WRwPTvluBWm4cehhopGu5yVeVpnZ/kOJ
	 G0iSeszaFDgYLrEgSnaw4hYcNCMaMjUujMhLgaiWmekA2gdS8DgB37lLC8MG6i1gQW
	 QC2IwllebuAXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACB7EF36E6;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v6 0/3] Add Amlogic general DMA
Date: Mon, 09 Mar 2026 06:33:51 +0000
Message-Id: <20260309-amlogic-dma-v6-0-63349d23bd4b@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM9prmkC/23OwW7CMAwG4FdBOS9T4tjJwmnvgXYItQORKEXtV
 DGhvjsBgViB42/r++2TGqQvMqjl4qR6GctQun0N/mOhmm3ab0QXrlmBAbJgSad2121Ko7lNOkQ
 Mgalh8KiqOPSSy/HatvqpeVuG367/u5aP9jK99/hZz2i10QJfUShI9Cl837afTdeqS9MId+2Nh
 TDXUDUSEDsIHJBftXtoME+3XdXk8zpmisIArxr/6efbWHUGEvQWJa7ffE4P7QzONVWdEpJji5n
 RzfU0TWet487doAEAAA==
X-Change-ID: 20251215-amlogic-dma-79477d5cd264
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773038034; l=2225;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=+H1SBtc8kybh3elD3rirCxlwLPaSwRraLSvHJmDF8E4=;
 b=YsKRnRu9GAuuBEBSc4m+ypfeQJSwNrarLK8/8kRoxQMzCzeQ8HKTSpvBnCXBDQH5miFxSyfeM
 i558RIZKp0tBRE80pNH7tupBE5qDvzwlw0fM9WQB6gRa1bZXvOueFRM
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_233357_434618_6C4CF871 
X-CRM114-Status: GOOD (  10.15  )
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

 .../devicetree/bindings/dma/amlogic,a9-dma.yaml    |  65 +++
 MAINTAINERS                                        |   7 +
 drivers/dma/Kconfig                                |   9 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/amlogic-dma.c                          | 585 +++++++++++++++++++++
 include/dt-bindings/dma/amlogic,a9-dma.h           |   8 +
 6 files changed, 675 insertions(+)
---
base-commit: 3d2d1059cae3abab771576a7ee7f59d9627cfb8e
change-id: 20251215-amlogic-dma-79477d5cd264

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
