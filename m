Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93840C43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2B02078E
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G8Mu+EKW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GXRL2jcA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2B02078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kq+9Xac8OFPHnk1Tsr4eJAklwSoIV5dXliKLki4F88U=; b=G8Mu+EKWDCMKZg+GK3E0oUKba
	xGv4Z9JibgBvtVoSKmCO0GiPeMG2CB9zRV950TT//M+j2HcwHK6rcF9Tw77fd+FsZwpMLzMu5kupf
	ooh6YjLJimwGf1Ny7YRtRspudaNH8nEgfjh74p2udjjGACA8YBmUoGpWXz6tXZ0kdB3+31ifsxP69
	nq44Z7arfCXxM4Vyw0/GKamk0tWX05NFl8ziqmeSnLtotXfpIgJFo0Ap2wCMQy27YghqHqWjxSqjl
	1OFUAOf+f+oKX6F/JGt1y11iMI0ms0pMD+3Xsq9Rm3nNTEyCS9RP6yjZpzajJce1oVsH3UgJnzVoE
	Gi3P9O9zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFDbV-00047t-Mb; Mon, 07 Sep 2020 09:38:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDbM-00043l-3Q
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 09:38:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id a65so13695298wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 02:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lY1f6BPUzB++HrA2WRJHkdA8MgAHqDCMG4dVPqyy2dw=;
 b=GXRL2jcAHETtaAy+Yd8N2jg3wSJQNHn0HFB2TA7y/8aY0wUVjOXkzBJybLwaE7Mc2l
 FAuf+CuUtSXhL5Vw5QoZU5/kDJsy6yFx8p7Jfz8m1CQRqHLCP9V9UgB9GsQBP4T8yshE
 o14cpplTvFvxO7wc296KgfxPPbVuQ3lCmjTFKzyTRHAuyaQve1J+hnlUEDUj8GFOYX3W
 +W/Mb+667M/roOs5/xmC25VNY5/7XDqHPWhGLYdRYhB2GT/Kb0sPOK/AxC/F5/nuQVg0
 b0BNXAHTekSzhkqVKMR++HHawyTODucH8CZUphUSrPYAQTdhTqhh5otNZud+IwqZUzVM
 QOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lY1f6BPUzB++HrA2WRJHkdA8MgAHqDCMG4dVPqyy2dw=;
 b=NF9qz4q2shXDJCXxBdy6NU1VTYA4No3xwJhhWnL7PyADG5ZL5GRUbMzc1dNBoIiLP9
 lPM4vCk3u0rcphWPxxgVu0jpf9dNySxTACm6drIbjMsNL1YfgQKpiVLG/FTBAmN48msy
 OhFvBnt+xfaNAMV/wxwttMQWHKSirNEiFGAlk6rjADPXAtzmjvpt6TGYFqwjRo9mAq6F
 apW0YSMsQtsnC+ImlRph9lsOUbdDOTtVWlQjZXvlPKt/p10WN9wefkiwwQREV0lpGhjF
 GQ+DnVV8nUGk0619o3YzSZEuyGuXlvClfUZjyGXk2b903tUAGsDrXOj+2NbUtiEwooto
 AmZA==
X-Gm-Message-State: AOAM531dDQiDMkFs1dAEfS6B0vpofKkcOA36aMMELooXHxtC459mDLve
 ALuVAy0w+Nl3/IiV6txEJTbKfdcsE0upB6yM
X-Google-Smtp-Source: ABdhPJxpmUTuMWXELB/h2Tver8381dpQKTFZfsyv5TkXWK3JfwYLS+IvAXEN1+5gehJPeOMWmvHZQw==
X-Received: by 2002:a1c:7e16:: with SMTP id z22mr21381797wmc.117.1599471494913; 
 Mon, 07 Sep 2020 02:38:14 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id n17sm25170687wrw.0.2020.09.07.02.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 02:38:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clk: axg-clkc: add Video Clocks
Date: Mon,  7 Sep 2020 11:38:07 +0200
Message-Id: <20200907093810.6585-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907093810.6585-1-narmstrong@baylibre.com>
References: <20200907093810.6585-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_053816_172397_46092C9D 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add clock IDs for the video clocks.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/axg-clkc.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index fd1f938c38d1..281df3e0f131 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -72,5 +72,29 @@
 #define CLKID_PCIE_CML_EN1			80
 #define CLKID_MIPI_ENABLE			81
 #define CLKID_GEN_CLK				84
+#define CLKID_VPU_0_SEL				92
+#define CLKID_VPU_0				93
+#define CLKID_VPU_1_SEL				95
+#define CLKID_VPU_1				96
+#define CLKID_VPU				97
+#define CLKID_VAPB_0_SEL			99
+#define CLKID_VAPB_0				100
+#define CLKID_VAPB_1_SEL			102
+#define CLKID_VAPB_1				103
+#define CLKID_VAPB_SEL				104
+#define CLKID_VAPB				105
+#define CLKID_VCLK				106
+#define CLKID_VCLK2				107
+#define CLKID_VCLK_DIV1				122
+#define CLKID_VCLK_DIV2				123
+#define CLKID_VCLK_DIV4				124
+#define CLKID_VCLK_DIV6				125
+#define CLKID_VCLK_DIV12			126
+#define CLKID_VCLK2_DIV1			127
+#define CLKID_VCLK2_DIV2			128
+#define CLKID_VCLK2_DIV4			129
+#define CLKID_VCLK2_DIV6			130
+#define CLKID_VCLK2_DIV12			131
+#define CLKID_CTS_ENCL				133
 
 #endif /* __AXG_CLKC_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
