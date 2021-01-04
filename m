Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFABC43332
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96477207AE
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96477207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sanrPHQM3bkczWUPrcxhbcsuABX2Rf4cJo0EycZT7us=; b=XivMyJuWrQQLQS5bFxyDWjyWM
	+UKln4swxQ4BHY2XrB/im9TfzhuT3nLoGdwZ1SUD/fLMBY1Y1iQquYkkKaoALeH4jshDdzwczK7bg
	ZB9/l58zVrFJc9ade6EkEP2TA2bKf4oJeB3j3xw2oPjnN3ZBOIz/ZA8dHuavicr4pXIku3QKKpIgs
	MCb4Xn1hXS3eiAL8BXOg1vqVCZcGvPAo3MOS6AonMiDORAKpS7SMElmteVi1Uz5Xo8nsmLvFyX3bc
	mwkbtZJk0KEOokihu4OdrfQmdjkUdVWfkvF87jCTYg7MJNVYE9xjaNorE5ET+CixyYPqCblx3ZXxY
	S4SXA30zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPvF-00075s-TL; Mon, 04 Jan 2021 13:29:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPv8-00071o-DQ; Mon, 04 Jan 2021 13:29:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id v14so18435869wml.1;
 Mon, 04 Jan 2021 05:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0ICd7gjWpI+u44o7fGulyQewlvcHmYQ4mPyDcl0N/Y=;
 b=KYr5DfgA5liPJkd48Mrj1k+lb8ObI4YW8MoTs/LZJSQY1rQkG5bQuKaPlkHHq/2WdC
 Uz4QdeAVD43drFI2JM32/IE/V0IgPHiI0yI7H5Nnd2cUk3LiLtB3kYk+dAMNZVErqt0Z
 WIsDVjV1229ydaJNNxe27vSHnLa6SdUW38jlpTTBm+ElH+mhieunnn3xO5M5oiM0zppP
 2fDAYZZPc33b5kH5CbUew073VctIkaL3zwyKY5z00NXmacvlWXkmqSmJAeiIlpOTrTtE
 Io3rotHVY1oDq0/Bqw7KzUg48kRlw3ToWBgS5mInL0mTVTfsXw9VhyGPdxEqbjvSPBlb
 gecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0ICd7gjWpI+u44o7fGulyQewlvcHmYQ4mPyDcl0N/Y=;
 b=G4LvfPvFGOwDoUqp4gIAeGt2T3/Kd95jaCqIf0xHvl01mIxcfHP/5F7rzsBDA7N7pg
 wJX1WN0BhLAeN+KCluhbWyfe2tVJIurDeGdYJyWfyXMsqnoZSKtQfuAWwe3ENWgz8/U1
 WYvpNZLfOsoqCMHuEQc9+7v08/iJCmNz8v0STGyghNMpkw8tSR9DilDCeKyrCpToIzfJ
 vNW2v67cnnVk2bL4vn5LCJi+j+4ITU5MdQandz1Gh/8l1dYEChZl3ePMClCfCMUyrohv
 GvlzHC+HesdlY4WjrSC4yH531JpKmcuC4RrURTGJGp5VkRi5oGPHSZ83i7ywhczeXRdJ
 DSHw==
X-Gm-Message-State: AOAM532bE1PJsYzj/TNMwKR86G1fbqq+MheoE+VxAuXHJDLKG7aqr7SU
 +HemuuXSP5FoMz1kv/9BIhABRxtWrUE=
X-Google-Smtp-Source: ABdhPJywuE2u9mR3LAhtBrTJHq+1D8WBmP3LHVUQJhGBFbugfODpsKR6wzD1kLMNzPlpsdtU8xmBMw==
X-Received: by 2002:a1c:ba07:: with SMTP id k7mr27284102wmf.34.1609766952936; 
 Mon, 04 Jan 2021 05:29:12 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c4sm99916521wrw.72.2021.01.04.05.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 05:29:12 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/5] clk: meson: meson8b: don't use MPLL1 as parent of
 vclk_in_sel
Date: Mon,  4 Jan 2021 14:28:02 +0100
Message-Id: <20210104132806.720558-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
References: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_082914_551334_3DBC560A 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MPLL1 is needed for audio output. Drop it from the vclk_in_sel parent
list so we only use the (mutable) vid_pll_final_div tree or one of the
(fixed) FCLK_DIV{3,4,5} clocks.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index a844d35b553a..f8bd211db720 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1154,6 +1154,10 @@ static struct clk_regmap meson8b_vid_pll_final_div = {
 	},
 };
 
+/*
+ * parent 0x6 is meson8b_mpll1 but we don't use it here because it's reserved
+ * for the audio outputs.
+ */
 static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
 	&meson8b_vid_pll_final_div.hw,
 	&meson8b_fclk_div4.hw,
@@ -1161,7 +1165,6 @@ static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
 	&meson8b_fclk_div5.hw,
 	&meson8b_vid_pll_final_div.hw,
 	&meson8b_fclk_div7.hw,
-	&meson8b_mpll1.hw,
 };
 
 static struct clk_regmap meson8b_vclk_in_sel = {
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
