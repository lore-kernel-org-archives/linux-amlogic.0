Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D0CF532F1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C54Y2FA6CGEY56w1QTeVN+gw5pLUZmxT73rS0LX+NlM=; b=NP0J+mXUf0Lt1N
	Jt63kmHOxloYtrv0pLiycY3Vb5csuiIyMW23QyzQwfq6d5U69gkt4bN8OzTB5DGlkn9XwFc8W9muW
	kd80Mlq1+L10DfEKZzwHyWZj4LHuU917e2ywfnekoY9NeEPgXc9mvWD4wjxKWVGj+Wd4i2EjOQp0h
	5uHYN4aaE10No3Op/YWhfHnV3Iyu+a6HVQWxYeGdJpEii3qWKtohei953McPGbCeG0XwkhwwwCEP2
	pv8o3gwMEQhVcjug7t5JoAWIYaKjD/JTnMqMSJ0qn/Pfes0JnCBfKGvfS/0g+5a/vrbBD95WUk3L2
	Rj7XAkn5WfAiKuBZq7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4x7q-0000000101a-2DC8;
	Tue, 24 Mar 2026 08:28:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4x7p-0000000100w-2w8q
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Mar 2026 08:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE99560121;
	Tue, 24 Mar 2026 08:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68B44C19424;
	Tue, 24 Mar 2026 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774340912;
	bh=GUHvuweWwDEanr6pMLHDaloqrj5OS4LjWFK/HLlQMOc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jQlt1XvcUUbFdhQ0mEw+Ns7DDoHzzkJXO41dHvq6NsFRx0bAEh9OoqFU9wruNzEgA
	 rLqsKybK0Cgqy5RpTo54w5gRGXTfyjEc643yMHx1Bsz5FqUHGtwJBc8zbeaQohb/ay
	 FcwkeSNb6rZSuheSklloaUcY54v+Mb5ZlkuSsqtqhoi5DpyeC1eVmZ10/TDkM03uZ5
	 qchAOoH6IZ17aPRZiUdZhY3lVjI5Ez9ewhY9AdhZCrtV8M0LenzzrLWu8YZBUt5OhO
	 EvjlatUSq/F8T3SkkaaBZdx3Lrn+SgxbLci0nR26+xLtr/IbqiI5XtayhH6Xhu/W67
	 ch0cudFjMTKsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556E8F532F2;
	Tue, 24 Mar 2026 08:28:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v7 0/3] Add Amlogic general DMA
Date: Tue, 24 Mar 2026 08:28:26 +0000
Message-Id: <20260324-amlogic-dma-v7-0-f8b91ee192c1@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACpLwmkC/23OwW7CMAwG4FdBOS9T49jJstPeY9ohrR2ItFLUT
 hUI9d0X0BCE7vjb+n77rCYZs0zqfXNWo8x5ysO+BP+yUd0u7reiM5esoAEyYEjH/nvY5k5zH7U
 P6D1Tx+BQFXEYJeXjte3zq+Rdnn6G8XQtn81leutxVc9sdKMF3oKQl+Ci//jbvnZDry5NM9y0a
 wz4WkPRSEBswbNHXmt719A83bZFk0ttSBSEAdYaH/TzbSw6AQk6gxLafz6nu7YN1pqKjhHJssH
 EaNfaPepQa1e0sxYDg20Z21ovy/ILUrO8B94BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774340908; l=2377;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=GUHvuweWwDEanr6pMLHDaloqrj5OS4LjWFK/HLlQMOc=;
 b=9EbQS3w9WGhhASrwGp6av1fS9ubYNcbdzl6H7tFdfQXVqNoQRyy//Fwsl9BXqmVal+z5WwGax
 BNpu30ZxB6VCfB5sbyGNRZMveLyCnkCGQZzumBokWkK4RZ0fqlCEfCo
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
base-commit: 18171b875aa51c7b1770005f048528c95bd95e40
change-id: 20251215-amlogic-dma-79477d5cd264

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
