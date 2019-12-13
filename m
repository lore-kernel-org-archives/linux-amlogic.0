Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C33AC43603
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 10:33:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F795206DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 10:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/z8ZS5B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jHR12tbM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F795206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5HxdZ0HPb0BkWJU1OL5UbxI5qGHAj30HZEKXUA8XBhg=; b=u/z8ZS5B+8tKJJ
	aDOJuow/tLPeIXDLVJYecBBiee2ZEuReIYts9gJCQ4fxUd2RRB0ZHtwrfkZnxalu2DgikYY2yRhJk
	i1lr9GTteQS/kTrvFGd8wwAQsJRLx92rbxiCcn0dL791Jr9rbQuXKIpcgba9VrKzPOUnrOBljvcnl
	X9Iejz+5Gg27CatG5NWOVeD70yiICpTNmnwmIRcdELeBnKO5W81oe7lmlBn0i/b60h5zXBhS0Zbkn
	LPiFKeO4WA5yc4/I4y6aBKvcfA+d8YuY9k8sED/V/s5iC0vdpghM973edNTTwDV1Nw4Jeat5pgpCT
	GGdjIs3f5CzSfWYR7mCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifiGF-0008Kp-Bo; Fri, 13 Dec 2019 10:33:27 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifiGC-0008K8-L8
 for linux-amlogic@lists.infradead.org; Fri, 13 Dec 2019 10:33:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id q10so6043694wrm.11
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Dec 2019 02:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vFvEZv4fCEfnBjZuHaDEzhBGea5XsffkSnNCT16fvYU=;
 b=jHR12tbM06VD1AOyR9O5gcHoAjUBra8//xez4RFLOUxKSeZDIjslV5etdOMPGeDCm9
 e2HF6yTZBYeuXFOfepN5F1XNTW9ytm6jii1vfCNdrfx4Ldc9hM9GAqD5IbKj6evY4qjH
 HpBTF8Vpx7EpHBwrbGf0zpzNKC3P4h071RgRBXJQn/1k1lUr4o1FnSkrD7e8htNvApHu
 ABPDaeDWiml/L8mpAS3Bg7B2ZzIG2etXzL/fGi+AFqQcJ8ztKqZb4OiCkgDIU/Cz7ltf
 StZ5QYewoyP5dpAx7CxnpmhSfGpEljAO2sfvURWlydTJ4uBDiIGHZIaA9vXDlsFoY2bj
 EDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vFvEZv4fCEfnBjZuHaDEzhBGea5XsffkSnNCT16fvYU=;
 b=Sy80AFwZIXVN7GswTpBV0RXKTuBNfKdg2/aW21fqZtQ2LMCvrGpmVDqqziLWWsGn8S
 4wkaTAH7oGaDnHbw7fHmLZcW41yQR/ZRZQhPD0Gxkv0wYq/WKfxq6/sPfZ45ocfzwS4M
 TFBVnT6jZbObiCnQVAlJHNfah3zMcbPtQgcNozAZz1hCK77b6W3paV9YjEb/Vdo6QmJw
 Ue7dttMfsg7hBljO2rZyx+V7cq+JkOdzDxiaNaLspBJFoujFravK8V+ZotYYlSbeisyJ
 NYExus6/dD7IiAMucSUti3UayffEXi37875VWiCEEzd51KafqPqUNOXU8u5KKRBKZ8FT
 WqAQ==
X-Gm-Message-State: APjAAAWT0ELmQWwFdp65PJoviPbkyZtQAo7V8Zi6vICIJ58LwzbWUpMa
 XNBiSLgA2HyHPy3XzQXhEhHttQ==
X-Google-Smtp-Source: APXvYqz1VjXHLIdrv97zx5XQLMgpiEieswi1vjrpZ4azFHtBa2vKvdYyT7xQsTMMNMs1NvsK4hcUBA==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr12183832wri.378.1576233202363; 
 Fri, 13 Dec 2019 02:33:22 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id x132sm13375213wmg.0.2019.12.13.02.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:33:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] clk: meson: g12a: fix missing uart2 in regmap table
Date: Fri, 13 Dec 2019 11:33:04 +0100
Message-Id: <20191213103304.12867-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_023324_729452_06E5FBAA 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: Dmitry Shmidt <dimitrysh@google.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

UART2 peripheral is missing from the regmap fixup table of the g12a family
clock controller. As it is, any access to this clock would Oops, which is
not great.

Add the clock to the table to fix the problem.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Reported-by: Dmitry Shmidt <dimitrysh@google.com>
Tested-by: Dmitry Shmidt <dimitrysh@google.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 66cf791bfc8c..cd1de3e004e4 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4692,6 +4692,7 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_bt656,
 	&g12a_usb1_to_ddr,
 	&g12a_mmc_pclk,
+	&g12a_uart2,
 	&g12a_vpu_intr,
 	&g12a_gic,
 	&g12a_sd_emmc_a_clk0,
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
