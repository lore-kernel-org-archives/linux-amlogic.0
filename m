Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D65C3DA42
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mW+Rk2K+u4cy7NdqaHLI7M4FR+qcmWJNJc3iACk20M=; b=jkOLTIgMNEcaVx
	ACDDXixb7cmHlKeF8aoD2o1MOmVyz8BHbHcmirhevFMavdL8pzLhaKQjzbyoy0sUlGehcwlF/o87f
	QvH2oTjNxNnPTP6yHplVoqpOYWG5gb8G4FiwbpnWrav2ROLyL18oYFTSjb2tFn2Lc9fUwF2cIZQYb
	hqZozHJQYJg2IBhC/zzYm6FOPprCvxMXtd09Gter7xlvBGePOx21w2eWhWUIg1xgEtgrzyRE1GcCN
	0HbLml7AYqtuKnIfPtymJh9dw3RLf7+bvvor94AfpSjnt4zbkw0zKCKNDTmuCWyKJWaiC81PRhUxV
	EDFzxKPBzVWtv7JQzkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8W-0000000B8hg-2zMD;
	Wed, 10 Jul 2024 16:25:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8T-0000000B8ei-2RHB
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42565670e20so6435225e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628739; x=1721233539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEvOpWPnO+AdwLbOiUNmMA/qUdgyKNblxOI/csLZzos=;
        b=F+9ODDdahN9Rdpgri7iWhljcWqoa+d27YQSJ3Atzii6HXymN4jcpq+Dvmy/nlVAvB1
         M/XNeY/g362OhB0eg0e2L3yWGRGO/iLhmbE4aDX+PzUxOlu+gkN+NVi0MedsboFxQCrH
         aw4CAaNU7GDe+jp5PuECmdMWBqelcvLUbsqVJjsIezIW59jWRC8FXqGPENvgo9FZu8RS
         8a3KPCqS1HzLqxLPvyLuKH9cDkj/pUvGswHA2Xkwd6oeB7ez9syrjao3lSekT3IL2f0b
         3IE2j5M1DhDxWedV03aflGt/2csvGE2lf0WVR2GS3ForDRw1+4cPUw8FaWRdVgdl6YiM
         RR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628739; x=1721233539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEvOpWPnO+AdwLbOiUNmMA/qUdgyKNblxOI/csLZzos=;
        b=de2CYi29Kr6DT4q2p45DTIjudWQ8rpeiL61JRbFobf7xE6T7CH3aq0NM0JtjRtC8JF
         yLL7Th87Ns1PVxwm7ZWewiyKrMaRh2Iq77PHYIPqVw6J2RSrI82mi72KuV053o6tJB3A
         CXdOJCfMlms70M9TB6u/PN7jQ/X1+O8IbkjIWLqB+JoTmGYT7gEvp5Fx8vafixB2Sj2M
         qnZQ+7DucXk4oxsCAOAYu97cUtWGEXMw5S1Uh1uWQVZek8m/G5hFFzOYqQ47x5ogm/Uj
         6XqiXkz2RJTauHDdsvikMWYSZgMk4QzhdjJLtmvGIqofTj1ZRZ0jg06BLtM4y5QWT4tI
         lTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMsiQJNY6RdYpo7UdeGRs72fmViDbPNesi8GM1cGLJ888VZQ0W2uvEiEOGLqjD+PDJT6d1GwbgJO3v4ydzW0Jg4VM1xifNPumnT6esWFXDKfw=
X-Gm-Message-State: AOJu0YwN2tIA+BXOoytbHiZRLgSg9C1nT6Pq9Zzt6CYQNA1L3o/4LmLj
	La3vT89vNj3RlEu3e8I3YXUm9qn5aRNUUWfdCCNssDfJ1SvTQewMEPXh/TBAgdg=
X-Google-Smtp-Source: AGHT+IGEAqgF56Q6WhhGNsntYmhXMllSRTjGVzvDJz7QmMwzchYfln7Fkm+0PHq8i2T834Jv9qxoxw==
X-Received: by 2002:a7b:c4c7:0:b0:426:6fb1:6b64 with SMTP id 5b1f17b1804b1-427981b7727mr1634915e9.7.1720628739119;
        Wed, 10 Jul 2024 09:25:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/8] reset: amlogic: add driver parameters
Date: Wed, 10 Jul 2024 18:25:11 +0200
Message-ID: <20240710162526.2341399-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092541_676458_B0FF7AA7 
X-CRM114-Status: GOOD (  13.21  )
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

To allow using the same driver for the main reset controller and the
auxiliary ones embedded in the clock controllers, allow to customise
the reset offset, same as the level offset. Also add an option to make
the level reset active low or high.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 8f3d6e9df235..59126c9f194a 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -18,7 +18,9 @@
 
 struct meson_reset_param {
 	int reg_count;
+	int reset_offset;
 	int level_offset;
+	bool level_low_reset;
 };
 
 struct meson_reset {
@@ -46,6 +48,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
 	unsigned int offset, bit;
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->reset_offset;
 
 	return regmap_update_bits(data->map, offset,
 				  BIT(bit), BIT(bit));
@@ -60,9 +63,10 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
 	offset += data->param->level_offset;
+	assert ^= data->param->level_low_reset;
 
 	return regmap_update_bits(data->map, offset,
-				  BIT(bit), assert ? 0 : BIT(bit));
+				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
@@ -85,17 +89,23 @@ static const struct reset_control_ops meson_reset_ops = {
 
 static const struct meson_reset_param meson8b_param = {
 	.reg_count	= 8,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
+	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
 	.reg_count	= 3,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
+	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
 	.reg_count	= 6,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
+	.level_low_reset = true,
 };
 
 static const struct of_device_id meson_reset_dt_ids[] = {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
