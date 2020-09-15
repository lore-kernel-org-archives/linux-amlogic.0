Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230DFC43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:46:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C42E220756
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9XtdvFZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="maBZ3Vb8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C42E220756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kq+9Xac8OFPHnk1Tsr4eJAklwSoIV5dXliKLki4F88U=; b=q9XtdvFZZTGCgqUCU3zQ85GHS
	o/gR+kRy1ryyA2ckn9wbBNPmeIsaBKCClJrDU4JIAPtDcSdhBOh0E8QLrfOJUU0aAPxf3aW/iAcRk
	0RDI1zqiC7MhsmwQhLvhBdUq4DDgzPYGOnV0txAfWX6VMXl0f/Nk292wrFdz2rG6uj8ilC7uFmssd
	Edqtwad/bgxzEcY9lGzRvsrC6WpuxiTdGflfBWijN+/iO3GybHrgo3OpYvjgq28E7h3cGbiPnkeUO
	0BWmvJ8G5MVz7VkgrnG3bY3UkWJoIIa4A9FzG/zo4JlnPTdoZg08QtcXyCBmDt/9bJxF+Xctm64qm
	mOBr+Ff/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIALp-00031A-FK; Tue, 15 Sep 2020 12:46:25 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIALO-0002r3-T8
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 12:46:01 +0000
Received: by mail-wr1-x444.google.com with SMTP id m6so3213913wrn.0
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lY1f6BPUzB++HrA2WRJHkdA8MgAHqDCMG4dVPqyy2dw=;
 b=maBZ3Vb8DL4XTv3jqb6hlktNtUC+mPnj7ioFAFOv8/3UOIWFfzdKHlgzW2ssBnnwyh
 6fmP4vBycJ71D5tbvixxeSaGBgX4MjlhCVFc9XsncbxLqnRPUaVbDiysZL5+a9ejIm+9
 75VZJtf5AsstRbHXqKc4wATG17L5+BfQzRJzGKZyLw3RXp4MZgRZ9hqYNQ8RIYHYOOzK
 Kh1aSVnWhxbDHFJTA+VTKphT/g3O/5Kt/t+9WPvEv6B0pcUtfIghsiJsx1IvVFn+bvI0
 7FQDHoCY1S3UHFaQsQJ5krZzE0o+eCIgpPdbtdyY93rgmb/1Z164HA2DY5F05D/OPbud
 ILJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lY1f6BPUzB++HrA2WRJHkdA8MgAHqDCMG4dVPqyy2dw=;
 b=fE1RGSl0V9+xvBW0ywNsKODUz3HbvKZJiQcLbpTJHxKn9+DPwV9H0IUajT3EOC8P1X
 9ww1SlPFrsfeiHER8YQu8IErUOc0eumA84NrGfcrr2xACbaozZVPYV0QMx5SReLj6XrJ
 Q5Y3tlkmv6tx/V210Pk9nmqX+h/S3iHZpsarRpyfFhGJTm3AOBPtfdQkszg4GPsYgsUn
 gbouzYxHNkrtd/1QgCNNZ6az2X8y9hEqttpoHKrto57IQw3fD4QoDGvShG/+972djoLv
 y9BlvMrI0QXmD1rQ6btADk+wxTyqXJTrKNP6+NX+DlJdFumXT+x4+Por9wYaJ3pfrEI6
 K3dw==
X-Gm-Message-State: AOAM533LPWq8+Vw6CYquz4UBpUSPFooKQO/lLRaZP0lbmtOOQFWP3BxY
 xnjg+Oj2qOc14uVr1epVBPii+KOu0LCzUxq3
X-Google-Smtp-Source: ABdhPJy2eRTWQ+g6UmDXlmlM53iqWF2j0sszPGZYETQLzBt+ugwiGbmbWIu+s6aMP/ZkXhMe28KDEg==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr21433215wrb.307.1600173957934; 
 Tue, 15 Sep 2020 05:45:57 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 q8sm26548589wrx.79.2020.09.15.05.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:45:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clk: axg-clkc: add Video Clocks
Date: Tue, 15 Sep 2020 14:45:50 +0200
Message-Id: <20200915124553.8056-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915124553.8056-1-narmstrong@baylibre.com>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_084600_197048_13F96906 
X-CRM114-Status: GOOD (  10.41  )
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
