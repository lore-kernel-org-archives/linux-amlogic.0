Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F2DC3DA49
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMax56NIiHr0SDTbRgIxuTPTlblpVsxUd69lFOTV0Wk=; b=3K8UpovMUjLErw
	Lzg4o9dbhQ56pnFV1UFwipLtmFesPHSy/tXE887MTfI6y2IMC48eHyoY351n084Bq1E6ic8W8xMwR
	8pO0inYzQjdtJljynWOHJeWzeJrWNeLjQPdNy9zBSBEqNSX/ddwMTdJBeofqMnA7v676bWObDLqoA
	+5Hzm4uMgNUPO+rF8Uyrfy4IO3xTPWoKtdT2VkXIOZ0dcG30oAmYQsdYoO1/Tg42o6Y6XNc6q3L87
	R+xwjurvGVoATM+BPujWV4vRVvTcybTwgZSSzgYaIXpw5bu6l5MFW1GA69fLowcqLUXHdYrSOAoYj
	tnvJ2Li9U4KeedlKlZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtu-0000000Gd7j-3Kfl;
	Thu, 18 Jul 2024 09:58:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtp-0000000Gd2p-18X3
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso201699f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296687; x=1721901487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anoJ0A/eyMlcq4ZsnQ8nc5h5FKEq9eY7wJHK/pAFmYw=;
        b=otijz3JyH0N2l8wFefzbwG2DzxR4nPYRT0PmpwzNJoMXRTK3RCWjEQpwtfHfPOc+2c
         KB4dwHFSUEOznf5Xc04XASe++Qn15WPp3vZFyqrSXvpJLLyI6UclPJwYBtj2ovIHuE4W
         ygMQZiwFjNrVxGu7xk/x2gzlRH/Rg81G4+AOCxX4KF8BMshHNbMQN05cPXasyghPghO9
         oK2mDnOoE3Pnmw2QDq+5Th2JpD/b3AXaJRNu54Bw9qrK8oXShFXTqoEO4lu+LqDVGft6
         wLh+J6ffXZw/1T9rwx+nPkvpWZ9c0Mf8qxdlHe8MPXsuazGI/246ldn7yJcRYr8ZiLq4
         TVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296687; x=1721901487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anoJ0A/eyMlcq4ZsnQ8nc5h5FKEq9eY7wJHK/pAFmYw=;
        b=TaWpB1M7Bi/RX0lUErEWGedNVz4bOo+aaDUGq9sdRCkQ8Sn87lBI59nuuWAYnT55cv
         OfuVfAD1/V1ODSNLMrjNif1SKUH+9Hpg7MCnYaoTPBpus7rc7utxAjht7Ypmkmrz/zCC
         Ag98SBW+UmV7G/m2rw1mLwz2WK/uXr4CMLfI+5pTZnhxO7sktwuPvuNLo5lpbCmCeeem
         9XWbebGEcgREeN56y7vRK1V7bY+S26Rvc4qAyi/36JuRyfXCE/eD1IbK0z3wNSQHYDat
         Tw8ssccut79Uqolcql5qp0+ueQoV7cbAkRae47WoFMLctO8B2chRGx4V0VBFSkZBUTXL
         0M/w==
X-Forwarded-Encrypted: i=1; AJvYcCWYoQw9jNe3Z91p7exo3AkwLauFbFDuHtx7jc6lLerCkRPu7b7OTDhbY1Au/K/wkawTX7+pmGijj/oPt32NbZI7d+Ob6a391uQ72SIn/9y2Tjw=
X-Gm-Message-State: AOJu0Yw9hSQbhJD0VDmXJquImSvIEb0gNeWXktrt3AwQKxkM4ajZKnuq
	3HNBapKt80PjT+M57/i916LCPlmWsjHZJUlLYQuDNtxbo4PYgXmPZ9pPozGOSNg=
X-Google-Smtp-Source: AGHT+IGAJ2huYI+q7mn5ECdgrCiYMeaEBMdk8eW0Vl4o6RXhiCLf/tX+GMgpIK5T1/Tj+4ER838TOA==
X-Received: by 2002:a05:6000:44:b0:367:9d2c:9602 with SMTP id ffacd0b85a97d-368316f8052mr4039827f8f.49.1721296687407;
        Thu, 18 Jul 2024 02:58:07 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 5/9] reset: amlogic: use reset number instead of register count
Date: Thu, 18 Jul 2024 11:57:49 +0200
Message-ID: <20240718095755.3511992-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025809_405151_25638726 
X-CRM114-Status: GOOD (  11.63  )
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

The reset driver from audio clock controller may register less
reset than a register can hold. To avoid making any change while
switching to auxiliary support, use the number of reset instead of the
register count to define the bounds of the reset controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 09b23f320f57..5a5e1c2358b6 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	unsigned int reg_count;
+	unsigned int reset_num;
 	unsigned int reset_offset;
 	unsigned int level_offset;
 	bool level_low_reset;
@@ -88,21 +88,21 @@ static const struct reset_control_ops meson_reset_ops = {
 };
 
 static const struct meson_reset_param meson8b_param = {
-	.reg_count	= 8,
+	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
-	.reg_count	= 3,
+	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
-	.reg_count	= 6,
+	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
@@ -149,8 +149,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 				     "can't init regmap mmio region\n");
 
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
-		* regmap_config.reg_stride;
+	data->rcdev.nr_resets = data->param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
