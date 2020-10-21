Return-Path: <SRS0=FfFd=D4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E466C55179
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:39:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1D121D7B
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cxP9zFpU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lPxbJARn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A1D121D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hz9yt4gU5SIFwdzeuzy0jiWanGPV4/wpLXE7/cKNqE8=; b=cxP9zFpUFPqFH6RbZ5pTwd82l
	xjCV25VPwU6r1O1VMCs8caEXyU0C+ttRRpvGSQVmVB+9umPIeJIUUOI3kuRu21X8tMxzXJ0wd9Yzy
	U2wZGIO2GzFQCp5ANqb9m+mkOZEXh0JzCkPbGsZyAKoCdBoFOIBNfRH0VK1dE8abOHnxiFkPpb6JM
	jbNb0NFfxaHEkKrcV49wx4Xlc9h+338zv1jDUU+WFmidCC46moOBSVTbDFvDAGgc+aE8weI7Q8VO/
	N9NAiXZoU7sPkLLXKW9kbJaPSHRECyFoDOhsCCPa1ayCIvOEhGZjRBgcsQ6ggDju95T/zb0ELJ7H/
	SBAtWgXWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVH8d-0005u6-5G; Wed, 21 Oct 2020 16:38:59 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVH8Z-0005sV-Jb
 for linux-amlogic@lists.infradead.org; Wed, 21 Oct 2020 16:38:57 +0000
Received: by mail-ej1-x641.google.com with SMTP id o26so4165771ejc.8
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2020 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4bmUTvMmlGLQ9tv2GMEVx5tSGz9QfWz+dgoSRCgpsLM=;
 b=lPxbJARnZj8JhrahTb3CjQMfx4CZRZOYvvm8mjwTYwa8kdX0yMwbt7TCZZYwkXfp6d
 4uBWD01DtroiklOaL04FsnIhXq4U0IbcH3ijPSWYpFKzVXi12Lhkd9zjFHa6ED8pLTPR
 1NENAgPG0doUEG1O3YMt7Zs2Lp1qruYCDiwG8Gq1E4r0cy9SsKTjud5/ALTHjvmhe7Eb
 PB2EK9lVlIcQBRYJLyqBdXf6AeRZVc794I1sMVm5D1kY8amgYLr9VIMe1kDGRgucd+tD
 jt3dHTd0k5W1YObSv6pV2AOK2KKBTXZ0ClPwkJ4AMOaGrLUaGrXlRgqrccLQec9IXSNg
 k0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4bmUTvMmlGLQ9tv2GMEVx5tSGz9QfWz+dgoSRCgpsLM=;
 b=qFwCaySure1gXfMGiFcDYbVQA4jb/tZ9AECbHGgLOg/2VEKrU/ORoYzikxFKe4GWlL
 lRIPaPYjTcHBwscK8DwNdcgHyJcm7PRvu+6skDzizvXs2XcVQbhU6dhoak+XPOimoHdo
 1e1vQgIt9OmolufZI1AsbsCGxUX/3VIILW3sOW/roM9iu1GSQbxNtRz2gk5FWGqH74PH
 bgNn4peM5FqWrHOYH+eMVU+f1tAo2mFMbaolMEuwW+KTbrXMMRlaDkHGa1IHLIxbUDv8
 k1Va1hMzjs3E///JQQbYorHknr9tptAk468UuQJd91rk/D5KkT1blLfEfmIdScyMgbRx
 URrg==
X-Gm-Message-State: AOAM532oEy7vzcVoeFC7cEywyX/u7mwZ+vt8os34Wx8quJUXuDesCMoA
 vRic2yBeT92lKVY7QbNtcJyGBQ==
X-Google-Smtp-Source: ABdhPJziCr8SmylxJQYZgyuvCkU84PCcMSnmPqhvy6/7Z6BFqIqIijfs88QhRpuWwaRtfMv4imMi6A==
X-Received: by 2002:a17:906:5594:: with SMTP id
 y20mr3928287ejp.196.1603298334729; 
 Wed, 21 Oct 2020 09:38:54 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id f26sm2549747ejx.23.2020.10.21.09.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:38:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 2/2] clk: meson: g12: use devm variant to register notifiers
Date: Wed, 21 Oct 2020 18:38:47 +0200
Message-Id: <20201021163847.595189-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201021163847.595189-1-jbrunet@baylibre.com>
References: <20201021163847.595189-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_123855_688738_F2BA252D 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Until now, nothing was done to unregister the dvfs clock notifiers of the
Amlogic g12 SoC family. This is not great but this driver was not really
expected to be unloaded. With the ongoing effort to build everything as
module for this platform, this needs to be cleanly handled.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This clean application of this patch depends on
 https://lore.kernel.org/r/20201021162147.563655-4-jbrunet@baylibre.com

 drivers/clk/meson/g12a.c | 34 ++++++++++++++++++++--------------
 include/linux/clk.h      | 10 +++++++++-
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index bbb75541dad9..bb4fa19442be 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5171,8 +5171,8 @@ static int meson_g12a_dvfs_setup_common(struct device *dev,
 	g12a_cpu_clk_postmux0_nb_data.xtal = xtal;
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk_postmux0.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk,
-				    &g12a_cpu_clk_postmux0_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_postmux0_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpu_clk_postmux0 notifier\n");
 		return ret;
@@ -5181,7 +5181,8 @@ static int meson_g12a_dvfs_setup_common(struct device *dev,
 	/* Setup clock notifier for cpu_clk_dyn mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk_dyn.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpu_clk_dyn notifier\n");
 		return ret;
@@ -5207,7 +5208,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	/* Setup clock notifier for cpu_clk mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpu_clk.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpu_clk notifier\n");
 		return ret;
@@ -5216,8 +5218,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	/* Setup clock notifier for sys1_pll */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_sys1_pll.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk,
-				    &g12b_cpu_clk_sys1_pll_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12b_cpu_clk_sys1_pll_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the sys1_pll notifier\n");
 		return ret;
@@ -5229,8 +5231,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 	g12b_cpub_clk_postmux0_nb_data.xtal = xtal;
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_postmux0.hw,
 					   DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk,
-				    &g12b_cpub_clk_postmux0_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12b_cpub_clk_postmux0_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpub_clk_postmux0 notifier\n");
 		return ret;
@@ -5238,7 +5240,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for cpub_clk_dyn mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk_dyn.hw, "dvfs");
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpub_clk_dyn notifier\n");
 		return ret;
@@ -5246,7 +5249,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for cpub_clk mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12b_cpub_clk.hw, DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpub_clk notifier\n");
 		return ret;
@@ -5254,8 +5258,8 @@ static int meson_g12b_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for sys_pll */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_sys_pll.hw, DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk,
-				    &g12b_cpub_clk_sys_pll_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12b_cpub_clk_sys_pll_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the sys_pll notifier\n");
 		return ret;
@@ -5277,7 +5281,8 @@ static int meson_g12a_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for cpu_clk mux */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_cpu_clk.hw, DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+				    &g12a_cpu_clk_mux_nb);
 	if (ret) {
 		dev_err(dev, "failed to register the cpu_clk notifier\n");
 		return ret;
@@ -5285,7 +5290,8 @@ static int meson_g12a_dvfs_setup(struct platform_device *pdev)
 
 	/* Setup clock notifier for sys_pll */
 	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_sys_pll.hw, DVFS_CON_ID);
-	ret = clk_notifier_register(notifier_clk, &g12a_sys_pll_nb_data.nb);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_sys_pll_nb_data.nb);
 	if (ret) {
 		dev_err(dev, "failed to register the sys_pll notifier\n");
 		return ret;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 79fb52f93053..db113495d315 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -117,7 +117,8 @@ int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb);
  *
  * Returns 0 on success, -EERROR otherwise
  */
-int devm_clk_notifier_register(struct device *dev, struct clk *clk, struct notifier_block *nb);
+int devm_clk_notifier_register(struct device *dev, struct clk *clk,
+			       struct notifier_block *nb);
 
 /**
  * clk_get_accuracy - obtain the clock accuracy in ppb (parts per billion)
@@ -196,6 +197,13 @@ static inline int clk_notifier_unregister(struct clk *clk,
 	return -ENOTSUPP;
 }
 
+static inline int devm_clk_notifier_register(struct device *dev,
+					     struct clk *clk,
+					     struct notifier_block *nb)
+{
+	return -ENOTSUPP;
+}
+
 static inline long clk_get_accuracy(struct clk *clk)
 {
 	return -ENOTSUPP;
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
