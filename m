Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCF3D25930
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jan 2026 03:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvAZWtPmevURV4oAN/DU7ukREdX/Tal9W94bw38i8uE=; b=NpoJCOKzUcTjdp
	WpD39JztcYD/kDxUi3QxGE/ztV5udzrIJWN7wvg02LLF+Wg4zMRLiVKDMMv8SGOu7Su9oqIuOsC0L
	RvJoxKJtdgEC4x7YP8g2iBMwV7yhbLmgE337G3k7eHhHqCHI4uRyRCC7sAEcXy0IhHkjapLelfyve
	8bthBAoc8mc2RMuukYWU2TOiRiTaBUBqPZyZPqNdt+H8elDvLITlrq5Zqk/euITP33XRZrHTB4V4X
	p645QMSNGzH3/O9TIUxjVNyy4DZQt4gg6S4X1vzQZXYMyaArfYLdyT6xjqbp9csNNj0SQS+woOiwj
	zqZOf73PCNiyLfOJTQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZkK-0000000DaxO-1EBB;
	Tue, 27 Jan 2026 03:28:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZkG-0000000Davd-3CRg
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jan 2026 03:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9501A444C5;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61158C2BCB0;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769484479;
	bh=EDernAL12A1n+hBwQmDnp+GejoVHgA1r/zF1Ns85j5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DknKqfiU85HkBJ/K7RKbgggtlb8AGROqYxL0CwgTZh/InnkAFg6jTSWtU1ceQj002
	 t+70O5Ie4yMI6EKOkJHZcG4kPQ79pYzaMdFxtMc5tE8I7UmUxFfTJ/wpS8HOCYpQ+i
	 rQBIqmJT03mR2D8MF6sAkj0hq88zMtc+yRsXD8LgU2m1GtCJSG5miFodF3bsVUJxKX
	 Tfnoe9tsReT882O2Tx9zdn6E1/CNPDyya+6YdO2j7Nv86+Xm6Bbm15Je7uys9Gh130
	 Uve0b5soeyKqFJIQiSeXClM97wmDtlz6A5nAFX7mFlhT1ARRmAYeH23Y/yukUSr7KM
	 O2cZes+CQiG6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57363D25930;
	Tue, 27 Jan 2026 03:27:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 27 Jan 2026 03:27:54 +0000
Subject: [PATCH v2 3/3] MAINTAINERS: Add an entry for Amlogic DMA driver
MIME-Version: 1.0
Message-Id: <20260127-amlogic-dma-v2-3-4525d327d74d@amlogic.com>
References: <20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com>
In-Reply-To: <20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769484477; l=791;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=bfzmsANkUP7tvKv82qbR7mHmRjOKAGovJZX8tW/lzN0=;
 b=IiWEkWAYw6ouDz4BxbCO0eKHnk38kMZHv5bZfgvwF8RoWcrqkoiQDodYY+MpLVa6b3Skj8pZQ
 jQ1i48ANME+DexD03EdNLHTb66UHluw0dI5SNog85A5syV/RkkKkofT
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_192800_827376_62EDC3D9 
X-CRM114-Status: UNSURE (   8.00  )
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
