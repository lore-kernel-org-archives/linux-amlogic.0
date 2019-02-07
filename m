Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E40C282C2
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 13:27:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50CA21908
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 13:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iuRyw+G7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S5Da9fZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C50CA21908
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXCss0xqaJNjoclMdB+E1axX5y4npFyRiRBlCdlBb2A=; b=iuRyw+G7Zm2w24
	K07VJJfMgsB/R5CkgxmWTFPcRas4IQt5TopeOAw2iilo3grin9KMVi8/YXwXMS5h0BcTysAUC467N
	EGShz/5O5bKkMEq6n2W1zqnVOZ7HVocA93rSm/e01AL+DQI9jXPTqzYHXu17pxhBKGHSBLMuB4dXX
	pkvvY2gGv06b4Iq3HGLBq1a7vUgITLnFwVyKOBNGqZQWpx8qTNupRJBXl1Q8QnuMR/noVXpkXum8k
	jnkwTaXwPs4pVX8vMa7ql/ZcwNibVdZmLNX02rvlKzok6AmDHx92Q0Lhrkkqgv9fn5c3k2/0dSfpN
	C3s3X+vSCFZ0QwUefAPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grjhi-0000QA-G8; Thu, 07 Feb 2019 13:26:58 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grjhD-0008Kc-KG
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 13:26:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id q18so11507787wrx.9
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Feb 2019 05:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=irDAtFzSD44qLeuz7xjCo1buACjRBJTzikViM/uGxI0=;
 b=S5Da9fZBJtEVAWWpk+jta2WSGqpAaCJdGgrZTstXL7WFAb2jyq8mKFO41p2tZoHp7d
 jHxRFGxUHbmWUhrOXy80xupoIv1ONEALGDpqgyPhNbZAc7wpS/B40GqfLttcMqguAo72
 a23fq+kqTsWDfAClOwNS73XURxWD1cJ7xbhCBpRjCZWw7XrxOzRtHsY+WSs3JVtvWU3k
 7+D4uMk3IRvN25RuVMScTUnwxHTpT1XJQiwUwy+LYpqkZZ2uC94WLRBiqvMGhBvVv4cB
 A8cJMnI5lBAO9ZGgN/DDYKjEN1z0YZevqJuvpqJUpm2n4yLiIChMUy66fMDZpzzPIcZn
 4sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=irDAtFzSD44qLeuz7xjCo1buACjRBJTzikViM/uGxI0=;
 b=iJPsnEDRjSxa6NcCQF0ZqM6w54lgSUUuPd3h3o9RoO+BW1eLW9EPgAHuXYpRGgUExu
 hpDnJ2DVEIMiN9L0bYXRpwJtKvzcImaUmuv3LdZ1EQXoe9LrY6wlYjdrzs+k9xd5u4Jl
 Ozk4d3vG3ZIiT76lyAmIuiuI/8dBB6a0LWavCueUKWCdDO3omHwxO0GhBniOwjwFHmKS
 Z9Ah7yS116PL4oyCWRRpzrwVZyvGXrG5LVxwz7CNDvQFF2i6SvbsnrGeXHKG+nd8daum
 3ZLp1dDxoaiQSGs0KF0tUla7e0/ENns6UpXLlr9qMyGy5AplVEe6zLrecsxn3jTkZWEf
 1Dkg==
X-Gm-Message-State: AHQUAuaQx6WS6EjX1v44qu2yR3UnA3JkJeG/SMjewKS1joTfTkiJSrkB
 RJIpEnrW/O/wQfm33z1eIQtqiA==
X-Google-Smtp-Source: AHgI3Ib7ZCQFroZzzM/u4zeLJ/0xQRPB/GHYwz8CzjqiGhLq8Xhb8jSxRw/MQHEcZ1VgEmBPLTGRag==
X-Received: by 2002:a5d:6b05:: with SMTP id v5mr3684072wrw.76.1549545986212;
 Thu, 07 Feb 2019 05:26:26 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id v22sm11061612wml.37.2019.02.07.05.26.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Feb 2019 05:26:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] soc: amlogic: clk-measure: fix-up some clock definitions
Date: Thu,  7 Feb 2019 14:26:03 +0100
Message-Id: <20190207132603.694-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207132603.694-1-jbrunet@baylibre.com>
References: <20190207132603.694-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_052627_664051_4C114ACD 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As pointed out in review, a few clock are not properly defined.

Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Fixes: 2a4c63e080cd ("soc: amlogic: clk-measure: add axg and g12a support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 drivers/soc/amlogic/meson-clk-measure.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 5570180b94a1..19d4cbc93a17 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -202,7 +202,7 @@ static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
 	CLK_MSR_ID(71, "audio_slv_sclk_a"),
 	CLK_MSR_ID(72, "pwm_d"),
 	CLK_MSR_ID(73, "pwm_c"),
-	CLK_MSR_ID(73, "wifi_beacon"),
+	CLK_MSR_ID(74, "wifi_beacon"),
 	CLK_MSR_ID(75, "tdmin_lb_lrcl"),
 	CLK_MSR_ID(76, "tdmin_lb_sclk"),
 	CLK_MSR_ID(77, "rng_ring_osc_0"),
@@ -268,6 +268,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(26, "sc_int"),
 	CLK_MSR_ID(27, "in_mac"),
 	CLK_MSR_ID(28, "sar_adc"),
+	CLK_MSR_ID(29, "pcie_inp"),
+	CLK_MSR_ID(30, "pcie_inn"),
 	CLK_MSR_ID(31, "mpll_test_out"),
 	CLK_MSR_ID(32, "vdec"),
 	CLK_MSR_ID(33, "sys_cpu_ring_osc_1"),
@@ -303,8 +305,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(65, "spicc_0"),
 	CLK_MSR_ID(66, "vid_lock"),
 	CLK_MSR_ID(67, "dsi_phy"),
-	CLK_MSR_ID(68, "hdcp22_skp"),
-	CLK_MSR_ID(69, "hdcp22_esm"),
+	CLK_MSR_ID(68, "hdcp22_esm"),
+	CLK_MSR_ID(69, "hdcp22_skp"),
 	CLK_MSR_ID(70, "pwm_f"),
 	CLK_MSR_ID(71, "pwm_e"),
 	CLK_MSR_ID(72, "pwm_d"),
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
