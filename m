Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B4FC4167D
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqNK3/JKdmBbvAlz2+gefCckZyigp1/fsgvzGH36Mzs=; b=gRmgSm5Nylyuci
	PznuapGBjMB042OUrnRi8Oln3WfqtjerZ7BxgY9ZIEH7BVZgnmVzNHBfr0yXgoaU7RIRxNrgtOEyO
	VoUkvFrNkYylhad4yXmDegCEJViESG7lx0uJxs5IbHJdcSJRfxLROkM45YkXDuzSxMJdf+TUewOz0
	0Cfsn4vNDh+i0WINivm/nhb4DkcP/Yk/qXLhS1UYnkv1egBgQbGPYfctD1gBAchkMb7/ZFTwRLLQX
	07gZZJ0D/ZpvSiT3es+kX1tUPisuZfeedxlKDg2dO2zH1sKJOrSTZxHyMLhsxFY0DSXlFHLvUZAAH
	/fvwHgh5yGxjEmYSje1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtzXE-0021Tq-L5; Sun, 05 Dec 2021 21:59:04 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtzXB-0021Rx-KD
 for linux-amlogic@lists.infradead.org; Sun, 05 Dec 2021 21:59:02 +0000
Received: by mail-ed1-x534.google.com with SMTP id o20so35093467eds.10
 for <linux-amlogic@lists.infradead.org>; Sun, 05 Dec 2021 13:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kg/EoUTvtJCV0eIOzDDw+a6fO7fnDbKWvif2j9QvU1k=;
 b=0jJjPzSB7Fr9IOmpAWko2usGi6G/gq1tsZf77t3EBt/V8TebTy+bB3tuuQ67tI9A8J
 W2JmJ5Q+UGzJkQggad7OqTJyJlgGYKegNGa74yG++PRfpu/NbxsjoVCB82YNi6EY9TbI
 E86uK3wKF4jnatmn7I+qmIXvxkWOJQtWco/OAXUQ1m3HynXc8A1g3s4YUgexmdjy+2Kh
 G3KNUNGkwm59fvzUsnBSeWaH//I1RwkSSPWI7lS/RuC1Z6HsCYia2tfAj0px6VGxhouM
 0CVi/KJf2cYmon2jgQ6SahAQrjXsDef7xzqTJzh1wYhiC7h2jxB+hd0kjNx4h12bnPBk
 vFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kg/EoUTvtJCV0eIOzDDw+a6fO7fnDbKWvif2j9QvU1k=;
 b=Hku1EvGAKdCOS+zJQBvKT2+eHBWA6eEF1vYXWy3gty5Gt2/2JZgU60DLzURGTwnQ12
 XmsX3qjHm/wDF6nPWdC13u+F2LYxNk4SMg5IZ3MjgjLbhRRWs7gZIU9k+xLrt6PLifIL
 CP2bcx+3taHn/DENURm2vlQPWknnlfV8+cYdeFiETlyK9gp6x+u6XyqYcFhZYNxbCnj0
 WEhsCWHMYiHB65McVd4kTnbtA5bv6qbV5lmP8PB1jAdI7zwOH0DgaotkXfYfK0rMdGUz
 E3rxjA3axsrx5aKJvg6RL+Ce/w7q1U2jjVGrbcRSKvCFUgLJ3qSyVE5fszG7QjvSjg3p
 fuAQ==
X-Gm-Message-State: AOAM533U4oHYzmPbwZm78L5x9i7pb94nVvdhMrDAuvB3uM3x3wE/TDVM
 1Vz+J+Ir4Rm4nfpgCnms79h2sQ==
X-Google-Smtp-Source: ABdhPJwMycCNqTJai4Fogj0S3vU9tnOWsCUMPXRynIPwKaqrJ8Vk7a5yVoJu72xQZYkFI2xyE7u5aQ==
X-Received: by 2002:a17:907:a0d4:: with SMTP id
 hw20mr41300607ejc.16.1638741540143; 
 Sun, 05 Dec 2021 13:59:00 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id nc29sm5724291ejc.3.2021.12.05.13.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 13:58:59 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 3/3] phy: amlogic: meson8b-usb2: fix shared reset control
 use
Date: Sun,  5 Dec 2021 22:58:46 +0100
Message-Id: <20211205215846.153703-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205215846.153703-1-aouledameur@baylibre.com>
References: <20211205215846.153703-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_135901_686096_EF50ABEA 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Use reset_control_rearm() call if an error occurs in case
phy_meson8b_usb2_power_on() fails after reset() has been called, or in
case phy_meson8b_usb2_power_off() is called i.e the resource is no longer
used and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework, use of reset_control_reset() on shared reset line should
be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 77e7e9b1428c..dd96763911b8 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -154,6 +154,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	ret = clk_prepare_enable(priv->clk_usb_general);
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB general clock\n");
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
@@ -161,6 +162,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB DDR clock\n");
 		clk_disable_unprepare(priv->clk_usb_general);
+		reset_control_rearm(priv->reset);
 		return ret;
 	}
 
@@ -199,6 +201,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 				dev_warn(&phy->dev, "USB ID detect failed!\n");
 				clk_disable_unprepare(priv->clk_usb);
 				clk_disable_unprepare(priv->clk_usb_general);
+				reset_control_rearm(priv->reset);
 				return -EINVAL;
 			}
 		}
@@ -218,6 +221,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
+	reset_control_rearm(priv->reset);
 
 	/* power off the PHY by putting it into reset mode */
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
