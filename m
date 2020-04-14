Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABCCC2BB1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:01:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A7720656
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRSWZ2cx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ltgZG4pY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A7720656
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtmkvcMAfoQgizNdfHLdrRGKRDOjOY4CCxCtFC+h+Qc=; b=PRSWZ2cxizdU7N
	KGtT4OQZJpY04T38Cjfmkrly9RPt1Jhh1DCkgsBNbOqhynxfvIWnbS3+S2BedHmTnvJ+PL7MdP8eG
	LdPAj48z2JKlRLtxJxKKIUuudzcNQpHzAUbdW9sdKeUPU0U69I0tpI9Trq468KXF1dT0FmklUYMZi
	q8ha9C9r77+cc0E2vaxjCsQd4y+F7uQ3buy8W+aRxbbC1/mteUbelk+6LyoFly2lOXF0PTRwW1TT6
	IznA/aJlM76wSScKobEkZmV91hNMUI1ZRgSq3NAPqrc3kxZd6MphbD0eXfT3Y5TJsGtV6dEocLori
	VKyA43f1p+0hr3CwnepQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORkM-0006RE-BE; Tue, 14 Apr 2020 20:01:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORjV-0005SB-QF; Tue, 14 Apr 2020 20:00:35 +0000
Received: by mail-wm1-x344.google.com with SMTP id r26so15757120wmh.0;
 Tue, 14 Apr 2020 13:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOT6jBh5RHTtvKF0ff1JDdUtPrhDEedCclbut6CMHz8=;
 b=ltgZG4pYMMJ6ZY7wVTwqMRmtGMNXJXPW1JBs5huXnLLaRWqURGzP/fixWgS5H8iSrx
 iHzXKkG0yUaEFarf2nj/Z68ZQ1wmM878ugSiUvGFF4tlyFYlh1GXKZu1CbnIfYra9r2I
 mBORt9ezjUeq+jxZ8rL+j07j1QOX4FdUKW6k9786hy0xN5t+HTUF1OPk7Q/sQObOoo7o
 SthNf1HbShAgFvvW3m9S1zZYlaCmc8RaOgAgkFX4F7SIo2Hc0BX6+3QZkxnI+NwClyRN
 70Nd0zBKyecbiGpKobA8HWVeI0DX+bhgRq0oEREm7avl6tmBOBBq8unBLCT691SoWiwS
 FDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOT6jBh5RHTtvKF0ff1JDdUtPrhDEedCclbut6CMHz8=;
 b=O5Nq2udUxNy9vHVIZExjDFUR1y8vNrth33Ay1fmeiPMSqOCTxRs4hKlSD71r9D87os
 wg7vnHx1pTp6O5WKG8sxAvUOW96KXPhS1CMDU26engKBUAMrf5sJLoHBM70dB66KmPIK
 qZ5y/ifEI8qpsoL8/bnJysKaufr3EcAHnKM3MhwP4KdyuwgExWzeE5y25BatGw+sgDTn
 AAFHxSXO/qK6N65p4DTOxxnZjRNpmnQ3U//zoTBiljg0IB6eo/vrq2DaDY32Pjs2OIS3
 zvOsoHXAEfgs+gXCTjBbZw58+UQAVMPO1CkbuzItDBeewpUkEGph7J9DMFQMul7WSXV6
 RCTA==
X-Gm-Message-State: AGi0PuZHJ4Xvh7FYHwn4W5kVNz+PcLsvujXADScv0xzN1VpK9lnDCW31
 gUv8dm1m5/pSJJtn/OHrxGs=
X-Google-Smtp-Source: APiQypJxSfupVcVY3tsTEfwY5Bo6ocg546NiCXQLE2PxKF7+H7AGFvO+rPQUNO8wobXymCcuF5vtjQ==
X-Received: by 2002:a1c:7d4b:: with SMTP id y72mr1493618wmc.11.1586894432487; 
 Tue, 14 Apr 2020 13:00:32 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13717DF00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3717:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b4sm15540253wrv.42.2020.04.14.13.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:00:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 4/4] clk: meson: meson8b: Make the CCF use the glitch-free VPU
 mux
Date: Tue, 14 Apr 2020 22:00:17 +0200
Message-Id: <20200414200017.226136-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414200017.226136-1-martin.blumenstingl@googlemail.com>
References: <20200414200017.226136-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_130033_874671_9407F67C 
X-CRM114-Status: GOOD (  13.79  )
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
index ed4b70c2d4bd..427392678fec 100644
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
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
