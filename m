Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF133C48BC4
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Feb 2024 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB7L3e63d6IhC+sjjx3MDZGOxATVyfZzTWjsIA6H6A8=; b=UXMEprpgurEMQ/
	Pr0hpBDC1+l4IY4WY+u4ofddiWNlmkRGriYYZd5SvDAneY73Kqfg3+TJKOk2HzoN7y0fwbj0u9Iwf
	nw29wH+iDwqG/FhckvRLms0WuqHRDlC+3w7FRw8qnG4kXW036Kq/8uvE6p2vjMw9pgCm0DXJzJjQj
	iBwGMfAdVzxZtbCa7CN+EGFgWj2Eleq3shaSIHkJmyWJV8lI2BAONLbesXK1R1O0w2/0d5BzlknMH
	mtBho4mfbc0UIMRCxnO7IXdczBH5aW2qlgc9702ul2Hfejx07wpLIEWZTCkGS5UQB1DXcugeNaq66
	fNrWO2W8JuMj0a8lOnTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbHWX-00000005H1A-1QsY;
	Sat, 17 Feb 2024 10:02:21 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbHWS-00000005Gxo-37xf;
	Sat, 17 Feb 2024 10:02:18 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56399fb02b3so3497076a12.1;
        Sat, 17 Feb 2024 02:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708164134; x=1708768934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqfx68Stq1v6Qf4tIPhse4R7f6lQzjIJhU0OnU94194=;
        b=ORn1+V74WlurnvPEZshIHziCwbRWbhHwRAx9S2teFFIuyHAsAcZjebFj0AQw83dwnq
         yGHTdzTB36EFQ6zSsKCjJK5qTiJzzWQhAGN9F1g6uDjqYI7uomw0/g2FXGz/ESBYISxi
         La24QaGSavruW/rt+HlSqI1UWppvu2rkNegGgaDK7zJfcNo08uBN0Fv9Q3+bEvE4NjVu
         bB/JY8O+RKfco9VLV8nmjDa4Nzxpl9R16dZy7q0xKEzQlJQY5sgV2gTZ+GSGA+ZBwjEl
         evBmhzKBAme5QzSttW8IVBI66D+/Y2C3gqngw0ef8apoggd/Pr+W82M4noOnyQ4hGMle
         Jzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708164134; x=1708768934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqfx68Stq1v6Qf4tIPhse4R7f6lQzjIJhU0OnU94194=;
        b=N+zyCrrpUxWujJQgjGFHAM/IelKnpH3aspyhI7JUZXnXaTM9YFNI6etlX6xJBp2btZ
         JWp/VFGhBsBVb3ii8lYvMvND2GDTtDkUNu+Sf9kpK4MUrvq2K3Eounj1pYq70RuyMvje
         rGZiZ6s3eRSn02YiVyZ0NrPLXvDZZnHIQI3pcjMV3N0j+yYCB0Gdxai+EqEH5FbHhIwm
         RSfhoTOIg4WP/AU6uut1c73iifvBsbtgmax7rr3cvfIVM6AZKi0jhJcLiprXNJE1ihyN
         6Q8Ct6iNb1lS5TP8KQsPcgyWUe2tK4xLVzda5H0EP0oBR35w5VoMQ/vyQ6Gd34joN3/o
         93bQ==
X-Gm-Message-State: AOJu0YyXxzxOYqsEAvHkbcjafQ1hbMEiG33z85bm4/ZtvOGqsNfx32cn
	dem94spw6o3jTNvCAZSaGZJX7MXoa3azhLZEa627kQuk7V/b7uvmoFYx6/fk
X-Google-Smtp-Source: AGHT+IEb82KoWpU5FoV1SEo4/+fKxZ4+uJYz6Hsw8ouQNl0/LXhPOmil04C+qDwX+A36tj5/j83VzA==
X-Received: by 2002:a17:906:694b:b0:a3d:590:195e with SMTP id c11-20020a170906694b00b00a3d0590195emr6136810ejs.4.1708164134317;
        Sat, 17 Feb 2024 02:02:14 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c18b-3d00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c18b:3d00::e63])
        by smtp.googlemail.com with ESMTPSA id vu2-20020a170907a64200b00a3d2e690abfsm832444ejc.122.2024.02.17.02.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 02:02:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	ulf.hansson@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/2] mmc: meson-mx-sdhc: Remove .card_hw_reset callback
Date: Sat, 17 Feb 2024 11:02:00 +0100
Message-ID: <20240217100200.1494980-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240217100200.1494980-1-martin.blumenstingl@googlemail.com>
References: <20240217100200.1494980-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_020216_818154_B0C7F704 
X-CRM114-Status: GOOD (  15.24  )
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

Commit 32f18e596141 ("mmc: improve API to make clear hw_reset callback
is for cards") made it clear that the hw_reset callback is intended for
resetting the card. Remove the .card_hw_reset callback from the
meson-mx-sdhc-mmc driver because it's purpose is to reset the SDHC
controller (FIFOs, PHY, DMA interface, ...).

While here also rename and change the argument of meson_mx_sdhc_hw_reset
so it cannot be called by accident as a replacement for card_hw_reset in
the future.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index 1ed9731e77ef..31f750301dc1 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -65,10 +65,8 @@ static const struct regmap_config meson_mx_sdhc_regmap_config = {
 	.max_register = MESON_SDHC_CLK2,
 };
 
-static void meson_mx_sdhc_hw_reset(struct mmc_host *mmc)
+static void meson_mx_sdhc_reset(struct meson_mx_sdhc_host *host)
 {
-	struct meson_mx_sdhc_host *host = mmc_priv(mmc);
-
 	regmap_write(host->regmap, MESON_SDHC_SRST, MESON_SDHC_SRST_MAIN_CTRL |
 		     MESON_SDHC_SRST_RXFIFO | MESON_SDHC_SRST_TXFIFO |
 		     MESON_SDHC_SRST_DPHY_RX | MESON_SDHC_SRST_DPHY_TX |
@@ -116,7 +114,7 @@ static void meson_mx_sdhc_wait_cmd_ready(struct mmc_host *mmc)
 		dev_warn(mmc_dev(mmc),
 			 "Failed to poll for CMD_BUSY while processing CMD%d\n",
 			 host->cmd->opcode);
-		meson_mx_sdhc_hw_reset(mmc);
+		meson_mx_sdhc_reset(host);
 	}
 
 	ret = regmap_read_poll_timeout(host->regmap, MESON_SDHC_ESTA, esta,
@@ -127,7 +125,7 @@ static void meson_mx_sdhc_wait_cmd_ready(struct mmc_host *mmc)
 		dev_warn(mmc_dev(mmc),
 			 "Failed to poll for ESTA[13:11] while processing CMD%d\n",
 			 host->cmd->opcode);
-		meson_mx_sdhc_hw_reset(mmc);
+		meson_mx_sdhc_reset(host);
 	}
 }
 
@@ -495,7 +493,6 @@ static int meson_mx_sdhc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 }
 
 static const struct mmc_host_ops meson_mx_sdhc_ops = {
-	.card_hw_reset			= meson_mx_sdhc_hw_reset,
 	.request			= meson_mx_sdhc_request,
 	.set_ios			= meson_mx_sdhc_set_ios,
 	.card_busy			= meson_mx_sdhc_card_busy,
@@ -618,7 +615,7 @@ static irqreturn_t meson_mx_sdhc_irq_thread(int irq, void *irq_data)
 	}
 
 	if (cmd->error == -EIO || cmd->error == -ETIMEDOUT)
-		meson_mx_sdhc_hw_reset(host->mmc);
+		meson_mx_sdhc_reset(host);
 	else if (cmd->data)
 		/*
 		 * Clear the FIFOs after completing data transfers to prevent
@@ -728,7 +725,7 @@ static void meson_mx_sdhc_init_hw(struct mmc_host *mmc)
 {
 	struct meson_mx_sdhc_host *host = mmc_priv(mmc);
 
-	meson_mx_sdhc_hw_reset(mmc);
+	meson_mx_sdhc_reset(host);
 
 	regmap_write(host->regmap, MESON_SDHC_CTRL,
 		     FIELD_PREP(MESON_SDHC_CTRL_RX_PERIOD, 0xf) |
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
