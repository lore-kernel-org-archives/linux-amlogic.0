Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16E4C636CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:37:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC95A61153
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC95A61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUBh/w2fKeM2ODC0L/mk5q3dT2qxzN8650zoWQLf/Lw=; b=HZq1/De3yVqFHm
	GKdNDaVL+pWTFFqkcQ6y41UOQmGc1f+Mn0DxkC22StxE3tPG7zeFj4FK1sE5ikIhZO7RvgDh1Lqjs
	uCUpv8YhKxAhFqGf61W46YfY0SN3p7KSM5L5gr2PvAW5AMtRptLqoPjN2HHxSo3Uu3Sqen2a7Ai/R
	vRFgsyYpTxiBT3340gXnbwJgoQxEgXZ17OPTg0MsjKrF+VoUkcNSkkdqISecxk2CYDueEkFNdXo1u
	NBOpSdmg0um0hexbKN2o+yhFwdvpvBh43UjxVXy3sD2Nag6ataIJIcuGdYCiwmjcOtZuDgAE1h3Hf
	uH1A8v6XLSWxhzeItGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4tsR-0079le-P5; Sat, 17 Jul 2021 23:37:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4tsC-0079gh-1z; Sat, 17 Jul 2021 23:37:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id g16so16528024wrw.5;
 Sat, 17 Jul 2021 16:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=REQGLBJXt02T4HQW9YuEzMSqSjnRxM4DXHv1UWuNok0=;
 b=d12ID/+85BXhYp5lVxcM3+av/sgR1fUzvi31SIskiUqnbkoZYeOFeiRcMcoEYgztLz
 FwsxANXuvZ+IT5l9zr/eziTHJmqij97HqEZAUtNb1NTWYoJVLvn5jKvYccf1cJ0pZPEg
 Okgf3LPve3p+EXVZ86avEGkjxPsWI/Bg82ZVRjOkfYslrhCJaFvYoGRGy1nYef2zKp+Z
 bUS6ssLrMgOJIgYDOIYaxWgr8Bsnc2IlPl1g2kBuC1GT6sbZlGZcLwyAiSbXUbLbrSMK
 +gtz+p6TO24EXkceOVg3+3fkfiTlF+eKoro/sj++oLshKXC6gKZFuehJ0kFpDXA2AzeM
 Aaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=REQGLBJXt02T4HQW9YuEzMSqSjnRxM4DXHv1UWuNok0=;
 b=BuM6mi4Xq3dtWdKqmTbO2iBxrlKgAphjKgHKyciqZ/mbXRfwVTP5hz3iuCeD/mg8Zk
 plY5i+ecV2dev2T+psVK1TXMy+E03vBBnwTbr3KBfmcQp38glxmm6Plo1zjtkQNPds7J
 6AxQhXKxKbI88sHObM/v+4QvVwIkLwmKP770t3hfBaH/XVy8cxXwLSZpGGvX7yX4AZay
 +IFpD7mu44U0G976d2Ox0v5o/0KoQ3cgAvtn/DzmwJhQiF8ZhuazGYTcPdTTD1X2lAJj
 HsHPB7TehqscRYXAmGbquZM2qBtAmCQZ2tIgh/o/oikCg+3ziz3cnfbN62/hjH7oYdGV
 NCgQ==
X-Gm-Message-State: AOAM532rAQ4HoILt248fKVNJsteVORjgTAIvgiQ4RarllAbRN5rjloVg
 c7E2H4cZUc+XYNrXebtPDO8=
X-Google-Smtp-Source: ABdhPJyvf4zkAdXPasJYccDCqPa6lAGLKbFDFJmYoATC615OxyRHoI/KcyT2yzw3/QpGo/AYVELy+g==
X-Received: by 2002:a5d:59ad:: with SMTP id p13mr21145793wrr.139.1626565050573; 
 Sat, 17 Jul 2021 16:37:30 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id q7sm12347527wmq.33.2021.07.17.16.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:37:30 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lars@metafoo.de, jic23@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/3] iio: adc: meson-saradc: Disable BL30 integration on G12A
 and newer SoCs
Date: Sun, 18 Jul 2021 01:37:16 +0200
Message-Id: <20210717233718.332267-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
References: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_163732_138497_9895B1F4 
X-CRM114-Status: GOOD (  12.85  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

G12A and newer don't use the SAR ADC to read the SoC temperature from
within the firmware. Instead there's now a dedicated thermal sensor.
Disable the BL30 integration for G12A and newer SoCs to save a few CPU
cycles when reading samples.
Adding a separate struct meson_sar_adc_data is a good idea anyways
because starting with G12A there's some extra registers to read the
samples in a simplified way.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 66dc452d643a..e140db3e4016 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -1104,6 +1104,14 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.resolution = 12,
 };
 
+static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
+	.has_bl30_integration = false,
+	.clock_rate = 1200000,
+	.bandgap_reg = MESON_SAR_ADC_REG11,
+	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
+	.resolution = 12,
+};
+
 static const struct meson_sar_adc_data meson_sar_adc_meson8_data = {
 	.param = &meson_sar_adc_meson8_param,
 	.name = "meson-meson8-saradc",
@@ -1140,7 +1148,7 @@ static const struct meson_sar_adc_data meson_sar_adc_axg_data = {
 };
 
 static const struct meson_sar_adc_data meson_sar_adc_g12a_data = {
-	.param = &meson_sar_adc_gxl_param,
+	.param = &meson_sar_adc_g12a_param,
 	.name = "meson-g12a-saradc",
 };
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
