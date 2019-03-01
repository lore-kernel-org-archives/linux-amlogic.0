Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC36C10F06
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 10:22:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0AA42087E
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 10:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDfZxLzY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1bWLjVae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0AA42087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAosRIKPET/AolerPekUpyVrZts7t1Y5pA5iGAt+Y5Y=; b=KDfZxLzY9zgvVO
	3dxBaDAIbzoI8jJruld6B0C13TBpz36pLiKUcKyJbTFVajvov3lt2Mv1onHNB2bPt2fEEsVhlcXCJ
	/Z1UP0N9OlPSfG+82pu31uBU/EKizqd0cWoZOHCxemYTI7rPwmTKW5+xUq2JTtBrNtaF+Q8Gp+b40
	LAUVOHgRyaF4/J7uAN806wXchXulvh8BbPhkRhzmDQbA76uh3ycAGbYlud1UmXe4XuogoF9BzD5wt
	eEBv0zF8iJ0+vw7nYOynIAf8lqcf3nVzmcxk4gcjfo3nCfHarVF7/wlqzfoz5vtf285gcJ8cL306N
	YwnVRPFZJhE8iUYIHWqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzfIk-0001Pb-7Y; Fri, 01 Mar 2019 10:21:58 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzfIZ-0001EC-5F
 for linux-amlogic@lists.infradead.org; Fri, 01 Mar 2019 10:21:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id l5so25251289wrw.6
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Mar 2019 02:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+56+BpEQ+JbsY5jIsG+5HwoLjz/jjEOEZma5vzKtt4=;
 b=1bWLjVaecO1Kwe5bWwvDDRYZaziz8Z5HOixwmyelDDE6QltSKocYM44r/FgPZw0ma+
 tgvKzgX1ripXsAT0c9c26b6QxF8siLn/ctI2hJrC7sZfWUDMIKsfHZx08XRuea2V1AZc
 66cHJa7SbS0rFkiGyZVCJzhb7wxCrUXFT5lSPuFval67fkSjbrgEmslFZKw5RSrG2i6u
 YGp64wlteKaIZcq/lG7PVmJ54GLxqQRP3lIergtmj96E1WWFLn0Ab8GF0EGGE0HW2FiG
 efbZJeKMUJF/LQUpH6EXDNGnDehmECgTT6o+83CKy0bD+4H9KCSmrsROYk5xJXvjgoY5
 x6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+56+BpEQ+JbsY5jIsG+5HwoLjz/jjEOEZma5vzKtt4=;
 b=Rvl0a4IHaPgpaNZD9TqnKdXPja5uBA5KwAnxsKKTIWpfs/FSo2tSRaPWtmXtMoVjNc
 XwoWmBF+aw8T2VLRYmXLz+naAqhFOnFDHafC8M912uixDAlm7B6XvmNUZssuqnC4F8JA
 sE0r6AShEWdwhrC0SvER9A4aCjfA4+SbqhsxhXj55oyn1L+FyXtyp7ZjXF4ZjIeYtW23
 FVLZquzidmFd1kWrOLz9e72puG+C6E0UZpBwYCnyWIW/b+pCGNddvVQ9m8iv19kWyIDJ
 hR8mUGDftnuEJBoPmsMFyOSgi+7l001TjwhygovfOB1UgUtnVtXAwmLSS1fi2NIryU2l
 Oo/Q==
X-Gm-Message-State: APjAAAUqp3p1HXn82YjQVZt4iQPdV0NsKIdiIKcPJk/2a1bugGhUQCwF
 QXVH7bevgF9CLeBa/yNhatoYcw==
X-Google-Smtp-Source: APXvYqwF4WLTCHup3GgNWVBASfxQaDJG/YFQq7/AFPxadwysFmn4Z3qJ1yFYFuP66LZK0pGgodqoog==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr2909974wro.16.1551435704900; 
 Fri, 01 Mar 2019 02:21:44 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f68sm14446626wmg.5.2019.03.01.02.21.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Mar 2019 02:21:44 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] clk: meson-g12a: add cpu clock bindings
Date: Fri,  1 Mar 2019 11:21:39 +0100
Message-Id: <20190301102140.7181-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190301102140.7181-1-narmstrong@baylibre.com>
References: <20190301102140.7181-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_022147_195572_81DAC674 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
it should be the only ID used.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.h              | 24 +++++++++++++++++++++++-
 include/dt-bindings/clock/g12a-clkc.h |  1 +
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index f399dfe1401c..4854750df902 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -166,8 +166,30 @@
 #define CLKID_MALI_0_DIV			170
 #define CLKID_MALI_1_DIV			173
 #define CLKID_MPLL_5OM_DIV			176
+#define CLKID_PCIE_PLL_DCO			178
+#define CLKID_PCIE_PLL_DCO_DIV2			179
+#define CLKID_PCIE_PLL_OD			180
+#define CLKID_SYS_PLL_DIV16_EN			181
+#define CLKID_SYS_PLL_DIV16			182
+#define CLKID_CPU_CLK_DYN0_SEL			183
+#define CLKID_CPU_CLK_DYN0_DIV			184
+#define CLKID_CPU_CLK_DYN0			185
+#define CLKID_CPU_CLK_DYN1_SEL			186
+#define CLKID_CPU_CLK_DYN1_DIV			187
+#define CLKID_CPU_CLK_DYN1			188
+#define CLKID_CPU_CLK_DYN			189
+#define CLKID_CPU_CLK_DIV16_EN			191
+#define CLKID_CPU_CLK_DIV16			192
+#define CLKID_CPU_CLK_APB_DIV			193
+#define CLKID_CPU_CLK_APB			194
+#define CLKID_CPU_CLK_ATB_DIV			195
+#define CLKID_CPU_CLK_ATB			196
+#define CLKID_CPU_CLK_AXI_DIV			197
+#define CLKID_CPU_CLK_AXI			198
+#define CLKID_CPU_CLK_TRACE_DIV			299
+#define CLKID_CPU_CLK_TRACE			200
 
-#define NR_CLKS					178
+#define NR_CLKS					201
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 83b657038d1e..33aba232282c 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -131,5 +131,6 @@
 #define CLKID_MALI_1				174
 #define CLKID_MALI				175
 #define CLKID_MPLL_5OM				177
+#define CLKID_CPU_CLK				190
 
 #endif /* __G12A_CLKC_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
