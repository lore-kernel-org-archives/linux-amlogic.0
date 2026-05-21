Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8666BCD5BAC
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfljTiKFJSU5U5RwYuoQA6tvaIBDYgotgJEArgG0Xmg=; b=TqdCkhSXl3pEgV
	8YgYEl+zplvXllpyShiACNwvI1gkB3LVo0ozp0KHF/NVxlhqKvfBg/+4olBU3+kJoZbSKj0veICwQ
	b6TUTMFykb7tVygAVe3xSMHl1BPj1qX57CQNqd+LM/1YxEPj4DTxiDyqTBWgYjK9n8zZ72qvPK1lZ
	Lno7H5q4kABdKdZN2crCwyQvB0LnXfkiZ7VLWh26dF38vzxKXbbwziG7SUgcvHOPDgnkbfZFnrdNr
	J32maCw0Np64ho1H+rAcorhiTrdlmXCNL0kRcl+K7tB87OY0MW15uxS27Jx06t3OAGmTilv6hgGBe
	S1IT8zEUWNyhhCf4Jb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWX-000000075QR-49x7;
	Thu, 21 May 2026 08:12:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyWV-000000075OY-0IUQ
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 08:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CF2444571;
	Thu, 21 May 2026 08:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FB10C4AF11;
	Thu, 21 May 2026 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779351174;
	bh=dVB8HV59AKDkbplOU4oG6hOnwwfesLEdFNSBUC+kk5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JUe1K9ItL9utIDCjWchfDEhhKbcAiSOP8gego+oGKfJXemHuc+xMefZCGPBx9AxfV
	 9kJBQYYlnz7edUL9YU1ATCN7w9orR72viP3YaGHv4UivzcoiQg2EHX+lMQsftGj229
	 bb94NKb1nYevbQvD+P8KQYkMh+0hJdOGEazZ1JBgp7CBGx5uWjkucn+FSQA8LWmTtI
	 ucdcZVD6bf5iQdZ0T9/r9TcFfggdQBumz68SJd5p86bn5Wb5NKF3XKfkZYarx4mt2R
	 OMt2WUDYzU4tkO8BdEXLZObV542/J3Vxs28TB0/FmlxP9kF4CXKs03UyQtJfas3+KF
	 cubzarQCXJ+yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA8CCD5BA4;
	Thu, 21 May 2026 08:12:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 21 May 2026 08:12:45 +0000
Subject: [PATCH v8 3/3] MAINTAINERS: Add an entry for Amlogic DMA driver
MIME-Version: 1.0
Message-Id: <20260521-amlogic-dma-v8-3-86cc2ce94142@amlogic.com>
References: <20260521-amlogic-dma-v8-0-86cc2ce94142@amlogic.com>
In-Reply-To: <20260521-amlogic-dma-v8-0-86cc2ce94142@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779351171; l=791;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ea/JI9Hvv+vNA+wMdcjhON7BZ5DBq9Qj6Fijtk3no2I=;
 b=VpqzypwBr2y9x03dnOyMlDKg41NxGl/t7n+gGtYbqaf6oAUkGiYlKLKck8RlIagVU/PkcMbNG
 41UH4rtA0NzDdL+2vwxO71uFPNwtQmnTcj3ZHqRFekiADQCKwplBirx
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_011255_137353_8612D4A5 
X-CRM114-Status: UNSURE (   7.67  )
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

Add Amlogic DMA controller entry to MAINTAINERS to clarify
the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b38452804a2d..e7530b1e7152 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1316,6 +1316,13 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC DMA DRIVER
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
+F:	drivers/dma/amlogic-dma.c
+
 AMLOGIC ISP DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
