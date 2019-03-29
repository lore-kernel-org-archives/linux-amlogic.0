Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E4BC10F05
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 15:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08ADC218A5
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 15:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/KsZD55";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cFyX65t+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08ADC218A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5jirVh8kUE5NbCf3mkeTf5eVHFtv6Jj18pYpuLfwto=; b=n/KsZD55IeEcE2
	PbGKV9TwFPY+ZCvSlq9OE93v2SFWgGFDRMxaMeOMr6ZCrsR/o+thr04SKxUSEyShSQKmXt7KBKdCM
	XiO9aRjGIX+sLdnee9Q3ISmPaN4HVS7RYoz/RGB+N/9k+nwwAVJbfTr6UZx+FEG9MTrVPFOMbVBKY
	ticSKpSKRhBFHI8siQ52sgsGSXOXNzURJw+7AHv25POQHWmMwf6KDUFhFhll/iMH+wIl9aKvYBjc4
	VkfJ0FqmHvdCNPXTgy9SvplsnMQh9gCLUzNHiSITkpFCFhInf0G5OW/eF8VpHsg/BAEcyjumFDukV
	d+b0Zb7687l2ERrsbk0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9tWA-0005ah-B7; Fri, 29 Mar 2019 15:34:06 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9tVi-00054q-Sb
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 15:33:45 +0000
Received: by mail-wm1-x342.google.com with SMTP id y197so3321568wmd.0
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=StsbiAbV0Vt+lXEMy/BJGmoZrMBaAxbvBsCBZl1IPto=;
 b=cFyX65t+guMxH0r6wwSuBGb7zt9F3l3OAKQIUEhzCLXzE9CP1DjsgeoNuVQfOmgQ9y
 3E/6EPaEtzmqGcEH9hfmtSE7ExYLYk9jyUkcSonbTaAG0Q3Qg/SKCR6whaIsLf2y0pe0
 p1TmqbeqhCmxnkBkINo/3nH2dQ8k+Hay49Ayh6DwhFa+fwuJtSUi7FP3LxePzFlJpRJp
 zN3NkuPjWOXkDWZzcO9QaOPs+4MMfYbXS428Oj+P3uT/N7oHtV/j215UkGowhHb6JFyn
 kgS4PwzsxbTByarKfja5OCK9EBCgaGjwGaRlp7Ex0fp55rpLgW+SU7NIFFj/Gr/Cx+ix
 CoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=StsbiAbV0Vt+lXEMy/BJGmoZrMBaAxbvBsCBZl1IPto=;
 b=aTZVN08p+SJMiVGIoWe0UP6RiM6IEs2DtZcqtlSfa2v84+CC8nBZ7uT+tDWpDCI2Dh
 PRUftEtaXVb197IIzWO2UIMPaQxelsB42hiR0U51l8yI2YSkaFhCmrAJ/JXuw1iIFtr3
 2hKOZXts488ilgm1kZCrdL6yWh8e9X1Ins+DnRpfbCP0cgnGm75yy7P77k6EKmXivf5h
 6zF7blOmcvfQ43SWNMEaxcw2JBjS+hEzhgVmR60uVNLzzQPu6VjzIPlZ/ewfaVim78eJ
 LRzuHpDfJwCc9pjNVA5HCPDWZxYa4zDCmvoNT9Q9I9hegz9JPCdmPpURGb0+I9k4A9r/
 lyrQ==
X-Gm-Message-State: APjAAAUDVw/OeK0ict59OnMcBkRD2l83URQiPot+kITZcBTEpCr7c3jy
 j0wW/f8ZtO8cAeMajPhmJYCy0g==
X-Google-Smtp-Source: APXvYqzNbjnC9hVvavPvh6hiCMbrxTVwkUIlSPcCZxicH/X9jL4cLAFyRnst0XB/BIatQc++j61sgA==
X-Received: by 2002:a1c:2d91:: with SMTP id t139mr4275362wmt.102.1553873617383; 
 Fri, 29 Mar 2019 08:33:37 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s18sm1930173wmc.41.2019.03.29.08.33.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 08:33:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] clk: meson: axg: spread spectrum is on mpll2
Date: Fri, 29 Mar 2019 16:33:25 +0100
Message-Id: <20190329153325.23869-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190329153325.23869-1-jbrunet@baylibre.com>
References: <20190329153325.23869-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_083339_426466_04B6085F 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

After testing, it appears that the SSEN bit controls the spread
spectrum function on MPLL2, not MPLL0.

Fixes: 78b4af312f91 ("clk: meson-axg: add clock controller drivers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 7a8ef80e5f2c..3ddd0efc9ee0 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -469,11 +469,6 @@ static struct clk_regmap axg_mpll0_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.ssen = {
-			.reg_off = HHI_MPLL_CNTL,
-			.shift   = 25,
-			.width	 = 1,
-		},
 		.misc = {
 			.reg_off = HHI_PLL_TOP_MISC,
 			.shift   = 0,
@@ -568,6 +563,11 @@ static struct clk_regmap axg_mpll2_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
+		.ssen = {
+			.reg_off = HHI_MPLL_CNTL,
+			.shift   = 25,
+			.width	 = 1,
+		},
 		.misc = {
 			.reg_off = HHI_PLL_TOP_MISC,
 			.shift   = 2,
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
