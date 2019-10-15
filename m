Return-Path: <SRS0=EyFj=YI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FA7ECE588
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 11:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D619721848
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 11:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uxX1xvZQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UKUn63uY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D619721848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JCct2sEmwjSHwKWHbIZi6X4faMbsDQtgG9+sox+W9g=; b=uxX1xvZQ1oDsqn
	8Kg68GAN4WbOQU6zlQSANUZpuGf246hWylQmyYsWJ0Jtjuo/UyIfBa1U2l2NE3YIHz5mRsX+NXkaY
	9D/eaflmyQ+FXzjGqcYktry14klJ8bzmQfjwQNukXlIypPpoRVK0WVoP/dW6mnu/AU3p0YjJlh6c1
	iO4qhlU49+G9KIWccp+OL+z+4jfIzIAvuOtnUr7BJNW/gOQm4jEjcv0c5q2HR5znhbxNtMwAz4GQ1
	dHGfaN51fXmVRQrEwxXY42ArUL1qBo/eMaY61RlCFeerj0YvsEz6/qoevk/qAgKxfBGMzU5kjWcXU
	n+7nJV66pFU5Itk8UpAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKL59-0003ps-2R; Tue, 15 Oct 2019 11:33:39 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKL4r-0003dE-RD
 for linux-amlogic@lists.infradead.org; Tue, 15 Oct 2019 11:33:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id p14so23408716wro.4
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Oct 2019 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDD2ziTUH4iVa0dzLE+0MqtrcwtEloFCQjzGa/0salE=;
 b=UKUn63uYSPaK29ydxiYmSknSs81jDHNuTMRX1J5rZqWRKtzQRtgYKONVZBUv4gEPso
 5GeJinkiduOh0IbwrGej/wJPrKKqCP0ASaiobuINL9/sQoCl4eBw1LHdGEZ+qgUqdIhL
 is6wfVj2XvWrXp9TvdGXppR4eGhs3YvjUht8aBRq8xi4UWX+88iPKhcyVYgNWHU4ZGg0
 utp8lrJFUvERfqO7bMuSCegmjZCKVbEmA0HFyJmDKkZLVPcpXycMW3Qx/Q/XRA/+Xcu3
 OL2BJHCuipRRgJZnImMjaXbO9cYA4zwpBcAzc2cFSAxp1QChHTL9iIJ5wi2ZjOQrNG+J
 lHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDD2ziTUH4iVa0dzLE+0MqtrcwtEloFCQjzGa/0salE=;
 b=SXsV386ZRW612nngsuh15riGA/xYwAEpAks9McjTcb18v13d4mz2KM8munh5Ye70aw
 CNR9wR8A3hsddruMwo1+CBEMJ7IeOmh8FLrgV7fvtP3iMBUSJHE23mnLJ3PCoOUfUOhA
 EntxI49HDzlomt7C9j4rO3w8DAGpMF6r86hU0bUTCj799pgiJEKJWs6z19SmXl8SADBl
 EWyDgzZaO8CMYq2UyzQbrzclt8ZKYC51mYVpZBLtf6Lb9rtpbEk1iYK2C+0zNJjUUcDX
 KTUyfruoCTeTzj1HeJlkIUUE6GGgvZLItTH+hK+a9PUH4DaCbsz7503lwtTc43NF+kXD
 3evQ==
X-Gm-Message-State: APjAAAVFO8b3rv7qvIlmIEwPcm4+kgUu8p9WxyCRuyvG7Q/EApXchy4a
 JTd2SLtQ3iLpaGaba6gOfrLFbQ==
X-Google-Smtp-Source: APXvYqzvHDrAswuxfaKhLlsc6gVx/1CV0JI9RaDviWLgIieIrtHFyZ5gMV1lLmSdngWnO/oDbDSaIA==
X-Received: by 2002:a5d:50c9:: with SMTP id f9mr28942541wrt.36.1571139200081; 
 Tue, 15 Oct 2019 04:33:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 63sm32395096wri.25.2019.10.15.04.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 04:33:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/meson: add RDMA register bits defines
Date: Tue, 15 Oct 2019 13:33:15 +0200
Message-Id: <20191015113317.8870-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191015113317.8870-1-narmstrong@baylibre.com>
References: <20191015113317.8870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_043321_876621_42F30AEE 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic VPU embeds a "Register DMA" that can write a sequence of registers
on the VPU AHB bus, either manually or triggered by an internal IRQ event like
VSYNC or a line input counter.

This adds the register defines.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_registers.h | 48 +++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 547bee04b46e..8ea00546cd4e 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -1211,11 +1211,59 @@
 #define RDMA_AHB_START_ADDR_7 0x110e
 #define RDMA_AHB_END_ADDR_7 0x110f
 #define RDMA_ACCESS_AUTO 0x1110
+#define		RDMA_ACCESS_TRIGGER_CHAN3	GENMASK(31, 24)
+#define		RDMA_ACCESS_TRIGGER_CHAN2	GENMASK(23, 16)
+#define		RDMA_ACCESS_TRIGGER_CHAN1	GENMASK(15, 8)
+#define		RDMA_ACCESS_TRIGGER_STOP	0
+#define		RDMA_ACCESS_TRIGGER_VSYNC	1
+#define		RDMA_ACCESS_TRIGGER_LINE	32
+#define		RDMA_ACCESS_RW_FLAG_CHAN3	BIT(7)
+#define		RDMA_ACCESS_RW_FLAG_CHAN2	BIT(6)
+#define		RDMA_ACCESS_RW_FLAG_CHAN1	BIT(5)
+#define		RDMA_ACCESS_ADDR_INC_CHAN3	BIT(3)
+#define		RDMA_ACCESS_ADDR_INC_CHAN2	BIT(2)
+#define		RDMA_ACCESS_ADDR_INC_CHAN1	BIT(1)
 #define RDMA_ACCESS_AUTO2 0x1111
+#define		RDMA_ACCESS_RW_FLAG_CHAN7	BIT(7)
+#define		RDMA_ACCESS_RW_FLAG_CHAN6	BIT(6)
+#define		RDMA_ACCESS_RW_FLAG_CHAN5	BIT(5)
+#define		RDMA_ACCESS_RW_FLAG_CHAN4	BIT(4)
+#define		RDMA_ACCESS_ADDR_INC_CHAN7	BIT(3)
+#define		RDMA_ACCESS_ADDR_INC_CHAN6	BIT(2)
+#define		RDMA_ACCESS_ADDR_INC_CHAN5	BIT(1)
+#define		RDMA_ACCESS_ADDR_INC_CHAN4	BIT(0)
 #define RDMA_ACCESS_AUTO3 0x1112
+#define		RDMA_ACCESS_TRIGGER_CHAN7	GENMASK(31, 24)
+#define		RDMA_ACCESS_TRIGGER_CHAN6	GENMASK(23, 16)
+#define		RDMA_ACCESS_TRIGGER_CHAN5	GENMASK(15, 8)
+#define		RDMA_ACCESS_TRIGGER_CHAN4	GENMASK(7, 0)
 #define RDMA_ACCESS_MAN 0x1113
+#define		RDMA_ACCESS_MAN_RW_FLAG		BIT(2)
+#define		RDMA_ACCESS_MAN_ADDR_INC	BIT(1)
+#define		RDMA_ACCESS_MAN_START		BIT(0)
 #define RDMA_CTRL 0x1114
+#define		RDMA_IRQ_CLEAR_CHAN7	BIT(31)
+#define		RDMA_IRQ_CLEAR_CHAN6	BIT(30)
+#define		RDMA_IRQ_CLEAR_CHAN5	BIT(29)
+#define		RDMA_IRQ_CLEAR_CHAN4	BIT(28)
+#define		RDMA_IRQ_CLEAR_CHAN3	BIT(27)
+#define		RDMA_IRQ_CLEAR_CHAN2	BIT(26)
+#define		RDMA_IRQ_CLEAR_CHAN1	BIT(25)
+#define		RDMA_IRQ_CLEAR_CHAN_MAN	BIT(24)
+#define		RDMA_DEFAULT_CONFIG	(BIT(7) | BIT(6))
+#define		RDMA_CTRL_AHB_WR_BURST	GENMASK(5, 4)
+#define		RDMA_CTRL_AHB_RD_BURST	GENMASK(3, 2)
+#define		RDMA_CTRL_SW_RESET	BIT(1)
+#define		RDMA_CTRL_FREE_CLK_EN	BIT(0)
 #define RDMA_STATUS 0x1115
+#define		RDMA_IRQ_STAT_CHAN7	BIT(31)
+#define		RDMA_IRQ_STAT_CHAN6	BIT(30)
+#define		RDMA_IRQ_STAT_CHAN5	BIT(29)
+#define		RDMA_IRQ_STAT_CHAN4	BIT(28)
+#define		RDMA_IRQ_STAT_CHAN3	BIT(27)
+#define		RDMA_IRQ_STAT_CHAN2	BIT(26)
+#define		RDMA_IRQ_STAT_CHAN1	BIT(25)
+#define		RDMA_IRQ_STAT_CHAN_MAN	BIT(24)
 #define RDMA_STATUS2 0x1116
 #define RDMA_STATUS3 0x1117
 #define L_GAMMA_CNTL_PORT 0x1400
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
