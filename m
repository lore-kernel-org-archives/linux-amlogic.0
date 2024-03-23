Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81135C54E58
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Mar 2024 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUuGq5F+JILde6MOBOBiqzV2VAfJ+yLU5m6P0DlrGvw=; b=rpQELB4Q3AveJS
	77R8RPbDDOe/AK26ka962A0KRmzHF3OJUOPmKGJ+iDuR0VxSm47hcLAigrfG7VAoE72wfounSwnrJ
	msmKBtPTV/tpXcSKG3Yfp+13wMOEbSrr0ankR1JaoCcBezzIUaBV0sLA33VE8frbNRt+CaGiUZB3U
	fML0SjcL1sP/vEfGdjT8GHFvj7u+CwleU/LGWKYRrq0ZrLX5jblXX6FTphzMxpFdYPGDrjaRlR8Db
	s+oy3pQQHEySdVg5v/u155VIVcUQ7reDnP6LdNvViSiESyL/MTbFD3O1Ywt2mMXJ9IlSQ51OvVAvM
	eCvtnpNkuJ5eHejXbtyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAYL-0000000BMqh-1An6;
	Sat, 23 Mar 2024 23:13:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roAYF-0000000BMo8-3gVe;
	Sat, 23 Mar 2024 23:13:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56bf6591865so1225254a12.0;
        Sat, 23 Mar 2024 16:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1711235600; x=1711840400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHLbndzNw6n0/nPPeX+nkHQjigbGF8h96E5IS2x3kqs=;
        b=dkv4VBOChvBS/ceyfhIi4C8LC2xuE45eyWRgLZaYBhJ2k350ROh8y1p4YYKUaQckZT
         4ohzP9LSr+ylFsPy4VVguQHG/pctXMzMepnRAZ9cZu1Ka86vwz+ZalRO4zomWrA2hZty
         hz0UrHhjZKgobF0SC/l9BKuh064SYAJaeiiAPm9JhXQD4RccnUagynYvOLUMA23hPWrJ
         PsdxlFckcjz8jbTFJfJnLpVEjv1xvGzeAbcmfFeqwCSMPKehAiM8msSYPNGMxXokJ+MQ
         pY0jjZMHCkOsDbZVvIpsMUBGmAzu2p8S4r4l2PO1S68hZNfgFfCeiXhancc+Ugyl5gpk
         lsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711235600; x=1711840400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHLbndzNw6n0/nPPeX+nkHQjigbGF8h96E5IS2x3kqs=;
        b=vdEZuHak6bpcIDd7wnJsPlQskYpRf7vXGl9tXTUqS/eYA+D9a/+JRtr/P/Lj/aotui
         sPhWsHDTeCwk4bR+RlquKhdeASTXa5WHWt/8/nHZGIxKsJulpyUiKKULi5Z1NDMgCiXf
         H9YXNstk7piUaiTMTnSeA7G02H7qBXzXT9UZpJ+PALFdMDdFF8WJRjzJnMuQvfx2DcmC
         o2vaWsF4EKybVe4lc8ajRbHkRpQjhSt/jUuA2YcmoOZDLq84kIEihdmE9lBeIAxWbXIJ
         lnKn/Hy9py5u0gIlR12cNTyhSQHDbt4PkmHTbZuI2qEtqisX/8NaX+8C7MjNR8HL9xuB
         Gfgw==
X-Gm-Message-State: AOJu0YzFqgVy0P8pjqpkxXUtr/jdvllkfhAFg1unbsAk9QhPk/n9iAAl
	n4D2edWS8+GtRtCpcYnDFfiqq1xafhzDDFxYmliEGT/e2sDwq71vOj2c8/t6
X-Google-Smtp-Source: AGHT+IGKgRWuPCIDQnTEsPJfYK+IWle8bUn2rzzxJVKVFHXQcHm8/BEUgXlEOTD90GzgyTG0xNxLUw==
X-Received: by 2002:a17:906:d0d7:b0:a47:5265:9aac with SMTP id bq23-20020a170906d0d700b00a4752659aacmr52570ejb.55.1711235600176;
        Sat, 23 Mar 2024 16:13:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-6fc3-1a00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:6fc3:1a00::e63])
        by smtp.googlemail.com with ESMTPSA id h10-20020a170906590a00b00a46196a7faesm1375116ejq.57.2024.03.23.16.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 16:13:19 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gnstark@salutedevices.com,
	neil.armstrong@linaro.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/3] iio: adc: meson: fix voltage reference selection field name typo
Date: Sun, 24 Mar 2024 00:13:07 +0100
Message-ID: <20240323231309.415425-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_161323_945628_16D7022E 
X-CRM114-Status: GOOD (  12.80  )
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

The field should be called "vref_voltage", without a typo in the word
voltage. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 13b473d8c6c7..2615d74534df 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -327,7 +327,7 @@ struct meson_sar_adc_param {
 	u8					vref_select;
 	u8					cmv_select;
 	u8					adc_eoc;
-	enum meson_sar_adc_vref_sel		vref_volatge;
+	enum meson_sar_adc_vref_sel		vref_voltage;
 };
 
 struct meson_sar_adc_data {
@@ -1001,7 +1001,7 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 		}
 
 		regval = FIELD_PREP(MESON_SAR_ADC_REG11_VREF_VOLTAGE,
-				    priv->param->vref_volatge);
+				    priv->param->vref_voltage);
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
 				   MESON_SAR_ADC_REG11_VREF_VOLTAGE, regval);
 
@@ -1225,7 +1225,7 @@ static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 10,
 	.has_reg11 = true,
-	.vref_volatge = 1,
+	.vref_voltage = 1,
 	.cmv_select = 1,
 };
 
@@ -1237,7 +1237,7 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.resolution = 12,
 	.disable_ring_counter = 1,
 	.has_reg11 = true,
-	.vref_volatge = 1,
+	.vref_voltage = 1,
 	.cmv_select = 1,
 };
 
@@ -1249,7 +1249,7 @@ static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
 	.resolution = 12,
 	.disable_ring_counter = 1,
 	.has_reg11 = true,
-	.vref_volatge = 1,
+	.vref_voltage = 1,
 	.has_vref_select = true,
 	.vref_select = VREF_VDDA,
 	.cmv_select = 1,
-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
