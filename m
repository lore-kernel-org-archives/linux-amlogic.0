Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CAAC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 08:27:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 687B720854
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 08:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mLiP18IE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ROfsAq4E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 687B720854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IT99yowqzyne1BEl4zXDBghz+Lfg+ae1nxcOJ1MfhBE=; b=mLiP18IEVTqWeA
	HCAONe6Vt4l0RXlSZH1wzz69hkpASuNGTsQ5xZP/ebkWwKEozhiW+4//TFfRJMPS6gc6Imu7+9xHm
	GejLYj3ys/B4XwkPDRD+JM8TwdKj7PS3O8v39+xlXkdt1Ll1MJpoc5DuRwNcnelE1+1361SgH4OZg
	P5PQA9TiuR8Y8/6xYl8sJ2Lk9tDSK6y8hw2BRxMT6CfstUEjVCIrEa1o8EyyKx9V+gcE5p1EBL6Kt
	5ySBAYJa1YMzlHaE2ORYnBzSmqluXtCQ7LEjzKGqQdxhd4Y8BN6mfjq6+V2K+SXu+eOOIKAN0Aeq5
	QZ/to6Cz1MGF0b/EYIRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6A5K-0003e0-6j; Tue, 19 Mar 2019 08:26:58 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6A5B-0003Ut-4y
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 08:26:50 +0000
Received: by mail-wr1-x442.google.com with SMTP id q1so4293169wrp.0
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CLzEElnP3dxyv8R6IH/C8LDRIdXF93RnCixM1ah2hMo=;
 b=ROfsAq4EycQSAWNhwT+bJP3yHo6sajvh/DOVf1X6KgoGiI9FciHoxYEc8Df3XiPt8S
 isAXnU6PNkc8HO1CnCg006HJ5iUkDYpup3J6p/mAUbDjenokGDTiv4VhxEVQAAIebk6Q
 aE1Fr4xSzuTBWBe795UPFcLrsV/bxyiRI8SwxxwIsJVZR7WLEbKjRlWpwNAnXOrjAb9f
 6+B3YAOwIAD12R5cg3Y239tijtDUv6iCa24wFPXsXOL/Cb7GDoNLB6QZYOEEyTrrcrpp
 iQ2MILTCPTjt6pxLId9hVTDaxKKizya9OtgAPFr0qMI0Egw+jwvLaPF/wipx58PnrCp/
 y3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CLzEElnP3dxyv8R6IH/C8LDRIdXF93RnCixM1ah2hMo=;
 b=hB5yERpq6/QfAVfL1kJFlqO3gqOUyupgWVV1AhLD9y/XzeKxyFWutdQyjyk9LTRGB1
 J2qXojjiq4LUhZrMiVr+FRVGhWdFOB8zeaLgO+MjOUTRzxzfzTFUyngN6V5i1PDT0TaJ
 oGEPTQDiGjKgDge4HCP6cVe41KqfS61lMlEANvusPU+Wqqu2IX6Oh1gkILocpHF2sYRS
 pqGS014Fl3yCBGWLoK+z872Q2IlUJr1BjJgb7ZnIgl3ze31yxrk+nRwGOWjvEgQfLg6E
 mSy2XqZZPNpJJ0Q+toGDTEIw5Y+TktATHOe0QZEziBVUmDO1y3b2s2hyKMRlgUBdHzKq
 xATg==
X-Gm-Message-State: APjAAAWaD/PbFgO4rYBcqy/Nay/Qye7tgG4bS4WDPbUztw7QZRBuuzNo
 MriuvOIzlXl+bNmQXGJb1Nd+WA==
X-Google-Smtp-Source: APXvYqy21IQIltfVclIGabKt/9gSbK6VRtrToMVt+v8yERTtliPMgJyxHa9zJTAcoNBGOm7UuHmRHA==
X-Received: by 2002:a05:6000:104b:: with SMTP id
 c11mr16704504wrx.9.1552984003549; 
 Tue, 19 Mar 2019 01:26:43 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id 12sm3267104wme.25.2019.03.19.01.26.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 01:26:42 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] clk: meson: g12a: fix VPU clock muxes mask
Date: Tue, 19 Mar 2019 09:26:11 +0100
Message-Id: <20190319082611.6215-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_012649_193284_DB9037E0 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There are 8 parents, use 0x7

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index cfb91df884cb..e52b0b53f398 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1391,7 +1391,7 @@ static const char * const g12a_vpu_parent_names[] = {
 static struct clk_regmap g12a_vpu_0_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VPU_CLK_CNTL,
-		.mask = 0x3,
+		.mask = 0x7,
 		.shift = 9,
 	},
 	.hw.init = &(struct clk_init_data){
@@ -1435,7 +1435,7 @@ static struct clk_regmap g12a_vpu_0 = {
 static struct clk_regmap g12a_vpu_1_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VPU_CLK_CNTL,
-		.mask = 0x3,
+		.mask = 0x7,
 		.shift = 25,
 	},
 	.hw.init = &(struct clk_init_data){
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
