Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECD1C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jan 2022 09:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXKwyz8JNSAatph7MLfeiydCcpDI3EEKPznxROdcymw=; b=EAHwPFQournN7X
	ds0NMqAacarqGhcUDfsF1r6Y1VNkQdrWO9XHGtW5GKK8eFOZECi+3CoQBnyKeVQCj9fnNMATWoNDJ
	PeX3NVrvLBjL+X9ZkzXewtIHgla6M9ZCB4txiN/KbwKQFUNkffKC1qtiAbPrdYETGrWiyotC61uA8
	DH1SoudOiz1jaUVmMf+L02xVpufoOhnQQIO41SWQVHOYJbDATQoI3T/DY3LWh7TV0MX65egC1Kw3/
	gLIqNf+skbAnc7ffhEhhyQVqknpTH2HQn7fSgFwgkSj/XQofUUo4ZrIkwwKAXPHiZ+LzPRYMN1kw/
	HyKUm2DxInrF6eSTEK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7DqQ-00FfhK-7q; Tue, 11 Jan 2022 09:53:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7DqO-00Ffd4-FY
 for linux-amlogic@lists.infradead.org; Tue, 11 Jan 2022 09:53:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso1448428wmd.5
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jan 2022 01:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVh5nRmY/laQhXrJmZ8gLshP64K+NMdNAMHCgvzKe+U=;
 b=6sSuM/3s50L4vZ3q/tD7Z88/0gOxnko+TEETOKMcYK0cz7E3XMCiSyZcHcbtxNmSIg
 YW7hmCNasCfQs6VaJ5DK59epYQ1PdwwPQ+zIvAJFU6OvzhavqpLWmWE8bCa79TkTQgNV
 /CoQ8R5cgwTaVWgusSQBbGXmT5kjNqcHhpFPu68Tf1jeHbkREoDg75Kmj0GeF8ZdqrG8
 jqOxrtolkcjfBhN3+UFYs3IYXs95/d4epNrgZpmPVayBHXPWJPqTWeBlz8yk5cnGTLSL
 z7YL3dQNbIYM0AV8RTmPRPUlz6a/Kdjk6tQMuEeittcRceBEkVYLcvRZPzLI8302rbke
 o37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVh5nRmY/laQhXrJmZ8gLshP64K+NMdNAMHCgvzKe+U=;
 b=MPybDsiB8AzerdOg/Lw79yDRGS1hDFI1Kpug+9psFZvl2MGoXsJK1uSiRctmvmH7yA
 C7jXYswXJK2IRZdUtGExpBkpgXpCB6qopyCM67W62mPTz6WdRtXmKDOmgvy3/fCZhDQ9
 o1vMoqjBCnm9gALoej30pi1OvWQyNniaO1OrTqxP+T4GAztPTSFk8CsvI9mGl111MqSD
 FIU3dyTyMfnpvHHkYwtV1xn3Jkdof9clv3sVWm/MOShTP/3wRQsUJPVxa765RdmhwN2E
 rOmaMmzYai0PtJiMpLtiRRT0xr1VFiITZzR71MShBpVCc2Jzvhn1MyzM4e2msW0kOMdl
 ZleQ==
X-Gm-Message-State: AOAM531IR/sY9rDyJBwif7wvKdK78Jh+IhThgMuBSITdtL02EBl8m1E8
 z7KjfEvlK1TnBmGjDoqPwGAu7w==
X-Google-Smtp-Source: ABdhPJwc1I2GFw4Edw3Pe2DmYcavGYaYA9rtbMrUDdxBE5NcWt8EiDMa+1O+zf3FSo416HYOiZvXFA==
X-Received: by 2002:a05:600c:1c22:: with SMTP id
 j34mr1757958wms.1.1641894811138; 
 Tue, 11 Jan 2022 01:53:31 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id l18sm1248916wms.24.2022.01.11.01.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 01:53:30 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: kishon@ti.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 linux-phy@lists.infradead.org, vkoul@kernel.org, linux-usb@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 3/3] phy: amlogic: meson8b-usb2: fix shared reset control
 use
Date: Tue, 11 Jan 2022 10:52:55 +0100
Message-Id: <20220111095255.176141-4-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111095255.176141-1-aouledameur@baylibre.com>
References: <20220111095255.176141-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_015332_563699_456851D5 
X-CRM114-Status: GOOD (  10.09  )
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
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
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
