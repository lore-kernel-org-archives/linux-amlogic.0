Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AC2ECE58E
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 09:49:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B802089C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 09:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dNgU29nD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NFsIVF7G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B802089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JCct2sEmwjSHwKWHbIZi6X4faMbsDQtgG9+sox+W9g=; b=dNgU29nD3KmnQe
	R4PCZeDHbxPlhH/8UE1DBn5R83MKrxDO7OtGid+jE39TnaeGJW0EYxqISIwJQGFwP5ZBzTNL9hFFP
	p9JCor1S9grl191nGik2fuEXVx7UlWzhdjoOin2qKKpPwSl6hYV3vv+jdiY5LbZVJkPtcbVn+/3F4
	RG8z7iBJtijXoUaoAoT7a1PsHjatJDHi/qg5xJYYTIkF5s46/mV0CXQq9GGRT+CSgCsiqMhJJQaZf
	BES8vO3TF6+aePjW9SfjRCJ27MgZ6F6NltH8vBpuq4FlZz159oR4Wo1j7wBp1hK3QyTj00jkoI7Ku
	fTpMlaMVjZF0lECAkB/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL2PK-0006Sy-SX; Thu, 17 Oct 2019 09:49:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL2OX-0005kn-LV
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 09:48:38 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5so1865961wmg.0
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Oct 2019 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDD2ziTUH4iVa0dzLE+0MqtrcwtEloFCQjzGa/0salE=;
 b=NFsIVF7GJNGlrx2CiQLzoaaPqufkq4LCcuyyTacBlGDvXiPQmVSQf/jUXrFjOmU+Jy
 JHcGYfM86tnAHyFM11lBeQ/YK+cAKLnarQqk0L7m1XuA6/hUsh+Bx8I3DuiHGLGP7RAt
 +TLdtF0trIIdTpbiPu6Jkp+3zywY8wOaJUtKf+u1S7+kdD6bqfGDc/u0gvMlRDb9TmN9
 Kqk8GD7pniTkIdStcrk67JEUlZc0OJKfHZuRve8BmZEnomYamB3zBH9g1HmNHB8CaXv3
 EA72mgobRCLe1qCfCbs6dyTzd890zlcwIm+fEhFQz/QzqHmW/wLZtar7eudJ8oHCDkaw
 1hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDD2ziTUH4iVa0dzLE+0MqtrcwtEloFCQjzGa/0salE=;
 b=HHp7B+KgcC0jH+nWBhhl3dpIcEM8f3lwt9RUcIRtFcu6M+b0f/H7ailf3L04+J7GJ7
 BwnheIs7qPK2IFBWzizN+Mk4nuSqxCo29OjH7xw2rNoSbmPLIOm57rdBzU+j3AJ11gKf
 NBD2P49tpCXoqub30EB98p0JkbDk2XIGtmsJySgU1R1iC8S9c6G2OBUCGnHB1Rog9W4s
 zOCQNrU0zlrDDDEYgzs6V74NJE3G9piuGBV4HokVStmTvVG1oIuBsPrpVFRKvttmyp/u
 UAv7MF/5/xxtN12TocRG+8sBtYw1BO8gv8Z5tdiw5ESSdKdQfWsmAomg02Q7j1/XeIZT
 r+zQ==
X-Gm-Message-State: APjAAAV1ETvne/rEvW6QKPgLrpz21rwJ67titvTocVc6J3L9s6GnVIEj
 y3wd5T7QZgdL8Q9QP2OcIV2/Zw==
X-Google-Smtp-Source: APXvYqz2ClI682VDR0wFRQNhhZO80VW3i4GPWHV8EKd2hUpUiFQaP3TYikXL6p9HH5HbE2XZnwkjug==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr2080225wmj.6.1571305711832; 
 Thu, 17 Oct 2019 02:48:31 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t83sm2764506wmt.18.2019.10.17.02.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 02:48:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/meson: add RDMA register bits defines
Date: Thu, 17 Oct 2019 11:48:24 +0200
Message-Id: <20191017094826.21552-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191017094826.21552-1-narmstrong@baylibre.com>
References: <20191017094826.21552-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_024833_878954_9A114FBD 
X-CRM114-Status: UNSURE (   7.28  )
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
