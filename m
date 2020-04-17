Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57800C2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 199F320780
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiJq2Nht";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LB3xbvk8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 199F320780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxN1rPQGCfFvbvzD8Dz8evYXa7mBtscWoxVQ21GBta8=; b=HiJq2Nht5mVpYf
	ITJGf5q6+xQtYTcRunEwYrZudIyabLYOISdKsStXn/O9aMUT+LMhXEEuGKliRLUGirhd1WK9rmDQf
	IMJ1fsrPnU/YcP8l44rebqyVBayeG+jwfu1kqHy01dnwEBPVMsCiqq6JSsoYTGR+JVMjJC86rI58a
	gZ0mi1POdHvTuGqplrwEsRd5QvqnacvI48X6lU6/6+tl6M4DYmjGj4BFyBP7ThSmRzQMulzQk1hLT
	ew/btiysNVvoWs7HSPNLNf431uLL+A+v4896tAw2S1J+aL0sQmh1sRdXxAxReL/BU0EHDIS+hN4Cq
	SXIo8lxq7YE1Dsz27ZVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPVwf-0007qU-Kk; Fri, 17 Apr 2020 18:42:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPVvs-0006w0-GQ; Fri, 17 Apr 2020 18:41:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id g13so2160350wrb.8;
 Fri, 17 Apr 2020 11:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4RArEPtRb6yXEdgtQ3ovyy6FMchkA9pg/LkRnSfJR8=;
 b=LB3xbvk8qJejz7tCjtEyfb58WU6LIalruJuOoQB1Cneg3/jqPgHlbv12NNDaHlpzmV
 o4uu9ADrf4vAphiHiJGYnZeemkZ8JE8PszXtVht45LbV0jh+JbkeLCUgh+NQv3ew0EET
 5OiBadJ8IJ60jWXZcJ9Mh/m0VvlOUHi4cRATM4vw8O+eKPsyatKhe+icKhBA2UTl0dad
 OLrmY/o1wUQK/j6xSJ9Pka6ITAWn4HHjRddCbGUV2CsNveMOBp6rZIwhb03JPd0/FdGw
 erl8L7qmaKONyIRCGNvpUFl9zUFYxMecqk3JJryPWqoARSS8D+vPJJSMwceyE8a2smeE
 sQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4RArEPtRb6yXEdgtQ3ovyy6FMchkA9pg/LkRnSfJR8=;
 b=F08Xhn4Mv81QPwWAQCgS9SL1Jj08Awek1PrRAPEt8EM8HQxPg69BMwcsDFsoyoIpgG
 awzIdFTk6XPWSvSxgmmHA4Jn72TBkoK4EkbOI0r9WVEulLidscLokgX76Gi9nkts6lM9
 zNpWNBOh3xv36rDsn5XWqqNrsUpDPzOgkDKU7uc03XJrb8TCNESkGu1mQ69FcoyHEidb
 cF9b8MIqiWnrRTMQJll7ElWFjHAQKK2iCWRJCPfoKdcuHHdzDDK250sGk09jjtMF9ExK
 ZuzYUm8PaTgUE4VHGp2vYQGSE7oLoVec+O7LVfLHbfrPTNM+XQN2kG5FPYp8JLJq7L1m
 qtbg==
X-Gm-Message-State: AGi0PubrO+VVt529R1yKvgP1Jz5H3ZBCTDE/zA5gOLgjQiWaKF2Mhca+
 r6YDZdRz6tQDEfgvoFJqX/U=
X-Google-Smtp-Source: APiQypLp5qHymcuJPKjzUtOnmkQmLSVUjfmU7kNQvo46lL7qlgyByinKLdOTrFJU3TOKc0KrRY21yw==
X-Received: by 2002:adf:f884:: with SMTP id u4mr5203954wrp.171.1587148903269; 
 Fri, 17 Apr 2020 11:41:43 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c17sm33237391wrp.28.2020.04.17.11.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:41:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v2 4/4] clk: meson: meson8b: Make the CCF use the glitch-free
 VPU mux
Date: Fri, 17 Apr 2020 20:41:27 +0200
Message-Id: <20200417184127.1319871-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
References: <20200417184127.1319871-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_114144_553639_15639FC1 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The "vpu_0" or "vpu_1" clock trees should not be updated while the
clock is running. Enforce this by setting CLK_SET_RATE_GATE on the
"vpu_0" and "vpu_1" gates. This makes the CCF switch to the "vpu_1"
tree when "vpu_0" is currently active and vice versa, which is exactly
what the vendor driver does when updating the frequency of the VPU
clock.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 6d1727e62b55..811af1c11456 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2063,7 +2063,7 @@ static struct clk_regmap meson8b_vpu_0 = {
 			&meson8b_vpu_0_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -2134,10 +2134,18 @@ static struct clk_regmap meson8b_vpu_1 = {
 			&meson8b_vpu_1_div.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
 	},
 };
 
+/*
+ * The VPU clock has two two identical clock trees (vpu_0 and vpu_1)
+ * muxed by a glitch-free switch on Meson8b and Meson8m2. The CCF can
+ * actually manage this glitch-free mux because it does top-to-bottom
+ * updates the each clock tree and switches to the "inactive" one when
+ * CLK_SET_RATE_GATE is set.
+ * Meson8 only has vpu_0 and no glitch-free mux.
+ */
 static struct clk_regmap meson8b_vpu = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VPU_CLK_CNTL,
@@ -2152,7 +2160,7 @@ static struct clk_regmap meson8b_vpu = {
 			&meson8b_vpu_1.hw,
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
