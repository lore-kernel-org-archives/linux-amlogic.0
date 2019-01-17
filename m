Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E0CC43612
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:49:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8DD020855
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 16:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+bqCohe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x5OMFGL8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8DD020855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKThtrdw4ghoZYPlsVN6Rt2vmpJ7ihPwiIjVUw/7fxY=; b=s+bqCohe14MgVw
	ZFhAF8k0M0odmUV2Zq/m+PCcWTJfh42Zu4XMFQQ9j2l/NL9x5YSTXCjluINPEjPum+yPreAYrq6G7
	szAq4fquQZOiPWLY7uCcgJ8HuTcPSH9OQSleROTSC9cIULGDrPpzVvWUzNG7mkqRsIZddI+S/aFsH
	mEsGPB+h8+0McFCjZX0jFt2cfED3HDkrdUR3mUZ6GGwIMq/YsvdoKs+exvP4Umwxt7bPcd1ZTxZX6
	6/I8jsPfap4GZBudgXYFhKDTG0Z3itGqGmwoUukWSOE2px74Nfbpv0mFlMwr/YJOOipzAiaOe7z4O
	Y5uw5zl+Fi6N5aEIte3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkAqi-0000a0-MO; Thu, 17 Jan 2019 16:49:00 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkAqb-0000Qy-Uf
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 16:48:55 +0000
Received: by mail-wm1-x343.google.com with SMTP id t200so1813385wmt.0
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 08:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qe4H+2eNPYWTy0WXwleWfBgLcKUZkINmGC1u6LYU6U4=;
 b=x5OMFGL8acKRnOqPLbojSEaTT9XYMuxLPZtLJibk4r/bocq9sUOE3dzBdIoVUHQMCC
 qGm0hEONYIaDXH43xd4sL4Jol3RQrNzmSkYsrbRDT8IGPJOtTwawLAB5zvO571pcPrV1
 o4iLQxwlxHrhKM5svOlXsUcJP1qxnReVv8SB+xG74ErV94h9/mEIdocafBp1yZaSjIw+
 Hgy9OpJBZY/FD/p5uMjDDD0Rcxvl8+iuAAp+bgFKyzDnfGrBINyB9COYYnPThf9aDStR
 ClaGAOTOnYFDyKTtiz5o63G7UFMXqpr01mLfNBNTyGUaLJk3pPjDVMFoWML0U2wxxNmA
 hFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qe4H+2eNPYWTy0WXwleWfBgLcKUZkINmGC1u6LYU6U4=;
 b=tBqyvd1j1D+UVIO2BMSBZFGHZOolUYZgkI579m4SVDmwwOC3nla9+DRykVw4ZkKsRB
 HyG/DXn15vumhi6tXgMeeNacmMPe0GbDA+XPxVnMhKbZULLsWpWZKfoKmmQ3/GHhJj9i
 E8X+hTUDPUovvH3SsUbOVS31/HMCgZhe71wAK/ikg0GbKNpNNGKR4dLS+d7n05M6AyUu
 U94IAwf4lkJRVbWoeXpNDz8JfG4FEr9eyU91OoAaiTG0ufAh3CMndVCDfEmOeddk1+a6
 97ZDx18fAR/mgil3U+Cq59IyXznBq5oZw/eKgFweebOiI/xrLDCWqZPf6s1JZbogKKup
 0zBw==
X-Gm-Message-State: AJcUukdsg2XfY9BAw1nGhCdVM1s3blY8oaCMzrGyocRJ7ulUs01U6QYj
 HarkLkt7FYHY0lHn34HRd1CWiw==
X-Google-Smtp-Source: ALg8bN5dBCqpxDPx5Fqv1K3bh7nZQBZfNVPzuMBKEHIofvXRO8AnLNWAJczTP81ePhXkARu5+ny46A==
X-Received: by 2002:a1c:dc86:: with SMTP id t128mr13203401wmg.42.1547743732589; 
 Thu, 17 Jan 2019 08:48:52 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j8sm99263199wmd.0.2019.01.17.08.48.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 08:48:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/4] arm64: dts: meson: g12a: add clk measure support
Date: Thu, 17 Jan 2019 17:48:38 +0100
Message-Id: <20190117164838.8008-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190117164838.8008-1-jbrunet@baylibre.com>
References: <20190117164838.8008-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_084854_130067_EA1BD541 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock measure device to the g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index bd24de947a5b..0d3d3af8ea6f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -181,6 +181,11 @@
 			status = "disabled";
 		};
 
+		clk_msr: clock-sensor@ffd18000 {
+			compatible = "amlogic,meson-g12a-clk-measure";
+			reg = <0x0 0xffd18000 0x0 0x10>;
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
