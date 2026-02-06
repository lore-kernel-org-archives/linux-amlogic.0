Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B03EB28F8
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Feb 2026 09:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvAZWtPmevURV4oAN/DU7ukREdX/Tal9W94bw38i8uE=; b=04uTJI7huAHF4C
	NdozrCCjCdz8MxklUT6M6z0+fDrRmt6WSgGodu/NkOKYDmbFvQjxu863akDRXm+mMerH5jR8nFHnS
	gYWRiXmZbJMk9G6DDTuaqjvSQkYwI7MnNDPU8hfD4CHc0gniN1FuC8PjxX8Df39Bs4PVaDhgiRG09
	QQBLtFnRd7gn9vlKQnFAmw8ScboDdIubA2UMz6iwEAv4DSXwtN4ZtQTaeOUKJvmPj3dIyc1Ba6M+B
	R17WJoC2TlNG4BJBLuxtYlIkjJkKyW26In6ulWUGJ/igzSFwoAT5fLwVhg9sZSKlDbNEjFCnEM1ME
	6gsHxZVRDLDrise7uyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHjp-0000000B4IL-2Xvj;
	Fri, 06 Feb 2026 09:02:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHjj-0000000B4Fy-0Sfu
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Feb 2026 09:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4CEF43EC3;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A18A4C19424;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770368565;
	bh=EDernAL12A1n+hBwQmDnp+GejoVHgA1r/zF1Ns85j5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BJhuVVz9IfiJrFbQq2qG759QHV+qSTleqIJeAlgpJonkQGl7ERqRGYuTiivpYrfkL
	 nVk8nDU7yCMfety0+/Kwu0lNPW1wPeDubCURRLhRSZZweBJSNpsKTp93lovTJyj4UI
	 654m2FfOfTPpOXkhp5yWBqUYBp678MZg/GVMecPFqyqNQFyIl4q3pA72cqGO5GKX5U
	 A2MNONn0v4vRrB/0QulLeZ4B9saajTXVD7Tr+CFp/l3IU9qBKUKMV0dnBoUaDFPVxX
	 er62j47qV/S6SeOuTqjfPW1m8wLPta+Ruqxum3SnoX1FRVbHlAvhvT2R5BS9CjY5Cs
	 ms0936TwO+g4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F9EEB28FB;
	Fri,  6 Feb 2026 09:02:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 06 Feb 2026 09:02:34 +0000
Subject: [PATCH v3 3/3] MAINTAINERS: Add an entry for Amlogic DMA driver
MIME-Version: 1.0
Message-Id: <20260206-amlogic-dma-v3-3-56fb9f59ed22@amlogic.com>
References: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com>
In-Reply-To: <20260206-amlogic-dma-v3-0-56fb9f59ed22@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770368563; l=791;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=bfzmsANkUP7tvKv82qbR7mHmRjOKAGovJZX8tW/lzN0=;
 b=ibTM7uQ/SuIxAsMoozUwilzAdgQsvoxrC98l/A9kQZZRNDgosQt675/GZBWPGR2qQQBXUz9bY
 AF7gb4E6k6fAY+tCnUAqMhYqqvRD51UOZiqQdUYn2qASbpMuiiVMV8r
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_010247_190445_328945C4 
X-CRM114-Status: UNSURE (   7.50  )
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
index 5b11839cba9d..9b471d580b32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1305,6 +1305,13 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
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
