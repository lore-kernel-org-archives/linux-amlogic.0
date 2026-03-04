Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFFDEDEC12
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 06:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AVm9wvAMGh9Wd/0CyZdfBbV3Yl2yKYpLYea2TaEmGTw=; b=2eEtCindwtF3Q+
	fZ9WuL+fsD9eeB55sp3mRVonKQzIOTMQwhqdYcvMcKGuu6e30DskWc0Pj9CZMqB9n7fUnfKYx/qjY
	c2Vj31eOxt8LBbNe6t+7zVeXBBO44jWH0CE9pBr9bif6gHbY8ZUjQK61oRhBwc2jXiZuxyT2PqUkl
	pqOStK3inP+n9KJBOIKX2V/AgC/XG0PelaX5GdXuwjJToOfxnFEPgkx5hCyKga2xAANbFA/XuZ5R1
	KIVBW+cJc5fQQ/IEEauxO54UDCFancenGPVeDe8NM6I8zKJE4Bb/xTpaR15pvtDAJFAWlLKfzOypC
	b87wU6t9haUBpVpSFE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxfUy-0000000GVuu-3EG3;
	Wed, 04 Mar 2026 06:14:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxfUv-0000000GVtG-22QB
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 06:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C41040E22;
	Wed,  4 Mar 2026 06:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 622BAC19423;
	Wed,  4 Mar 2026 06:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772604856;
	bh=ITg/ig7wrS1ZXLm9pbAOjF/U8W9JlHhbHX5MT6WlX0o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fKHlI7vo1WRqwM3r6iUYfH2eCl3o6uuf8ooLroJYoSX5D8+i16HONe+LOlWSmDEA/
	 mqk7hrCz5mEVO5rfIH63sQjS2lkg63L5KAjDPORjOO5wdUJdMspfosnG1ui75SQ8vl
	 IJijRTXhwc/mz5xrV50MyQbdKz3yLCnG4fINIlHnTOyZiFGRZxljIbT3neRuNOdhds
	 GXuw6BntbiLRWCRaNtFcKeNsM7fDUZv1SwonUwPnDz03y8Zg32UyVlSOtwICKVsGMT
	 gn6rtZPwy1W3oEcQhYgwG41WULqySM9/c7m4g7NUBecE2P7yyroZxNaxmMX/vHpoXV
	 VT6rk6l3zxvTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490B5EDEBF7;
	Wed,  4 Mar 2026 06:14:16 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/3] Add Amlogic general DMA
Date: Wed, 04 Mar 2026 06:14:11 +0000
Message-Id: <20260304-amlogic-dma-v5-0-aa453d14fd43@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALPNp2kC/2XOwQ6CMAwG4FchOzvDyro5T76H8QCswBJhBgzRE
 N7dQSQKHP82398OrKPWUcfO0cBa6l3nfBMCHiKWV2lTEnc2ZAYxoACBPK3vvnQ5t3XKtZFaW8w
 tKMmCeLRUuNfcdr2FXLnu6dv3XN6Labr0qFVPL3jMCU6GUJNRqb58t8fc12xq6mHRKhag1xqCl
 ghoE9BWS7vXyU9DvLmdBI2qyEyBhizAXss/vb0tgy4ASSohyWSbz8dx/ACL32ScYgEAAA==
X-Change-ID: 20251215-amlogic-dma-79477d5cd264
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772604853; l=2054;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ITg/ig7wrS1ZXLm9pbAOjF/U8W9JlHhbHX5MT6WlX0o=;
 b=fjpfIMWfqpeL8CRxzINA9C5cxUZwVJX06v1o7F7JQow0xOWuh2fpVIvPAHYGlMbwtr3l+1uCn
 aoKAGr7CJO1BirRlQeYQnLP4NaWu+m1AD99kRobQCjxde8i/uaFBgtH
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_221417_572620_305DFA08 
X-CRM114-Status: GOOD (  10.08  )
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
