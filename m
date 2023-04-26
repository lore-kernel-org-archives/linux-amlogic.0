Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B96C77B60
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Apr 2023 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRzyEfgNZ/5wb3/dXpsdk/UXYSXMr9grYqr8KRAEqD8=; b=YBtH/v3XBgyr09
	JuPZa2CcMUaUxdWJ9wuz4Kf+WvkFpBkQlWjH2UpaRmf2Z8RnE6CCO9TWvkcQrE4Otz33jxm7qMc5e
	Q6qLyP8G0WzUsc41jctP3v0yvwxRFK+RoGiYbWpWjox/BcaEgxx+1PDtvIh3zzMNxe805PIjw2nL3
	bRP9cTK9Wpgfx4Jmeev6Yqk2ymY9LXlTAEoDDr7h619ixq3OiAe2B1AiLGxXTxuIK99SMd1Nd9qvd
	GIEimNmabCvD2JXYmJYwLFKfwFdEEHbvJdu0yYcopaBrl/GO8ugn7Q2Rm2pLt+rdACKfOsAYxi7j3
	MpKV2IKJ2fmtL5rtXuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcPT-003SK4-0Z;
	Wed, 26 Apr 2023 10:30:03 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcP8-003Rxp-3C;
	Wed, 26 Apr 2023 10:29:45 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id C65D65FD7B;
	Wed, 26 Apr 2023 13:29:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682504977;
	bh=2iTDEsndR82cnln9Q9SqkIaok7IFFDU8o3YeSEDTGF4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UWTpX6duaX2IAVpAWjNY+DnGpWEl9biaL1HpLEZLhnPWQd/jmgFvtA3iUtcTECWhL
	 jnvnlvuNHprUDG+ktoCUwdHZb13SylUlo9lKBdudwwuXH1Pe4slJqyZLo703hNW55g
	 wXN5GtR7mKp5t7x2P4JhAKLRSNfa5ru9NSCj2csc86NG67suAlfUEuEhI4lTCM7r5z
	 wUykuePqRAg2KKNoE5B8YbhGgvAhzn9+jdU6LIOQ7KnebKcDf26DQTkv6QDWmL35V/
	 3kIS1G1C/lSsnHrIUsmOUGEtw1lJLjfiwMtJiO8cuY/tzdTbRMVKEbm6KbvDQhTI/r
	 nSjkT05vE1vRA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 26 Apr 2023 13:29:37 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>
CC: <yue.wang@amlogic.com>, <hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v3 1/5] phy: amlogic: enable/disable clkin during Amlogic USB PHY init/exit
Date: Wed, 26 Apr 2023 13:29:18 +0300
Message-ID: <20230426102922.19705-2-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230426102922.19705-1-ddrokosov@sberdevices.ru>
References: <20230426102922.19705-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/26 04:45:00 #21166225
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_032943_407033_F3BC3CD3 
X-CRM114-Status: GOOD (  13.44  )
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

Previously, all Amlogic boards used the XTAL clock as the default board
clock for the USB PHY input, so there was no need to enable it.
However, with the introduction of new Amlogic SoCs like the A1 family,
the USB PHY now uses a gated clock. Hence, it is necessary to enable
this gated clock during the PHY initialization sequence, or disable it
during the PHY exit, as appropriate.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 9d1efa0d9394..ec2555bb83d5 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -172,10 +172,16 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 	int ret;
 	unsigned int value;
 
-	ret = reset_control_reset(priv->reset);
+	ret = clk_prepare_enable(priv->clk);
 	if (ret)
 		return ret;
 
+	ret = reset_control_reset(priv->reset);
+	if (ret) {
+		clk_disable_unprepare(priv->clk);
+		return ret;
+	}
+
 	udelay(RESET_COMPLETE_TIME);
 
 	/* usb2_otg_aca_en == 0 */
@@ -277,8 +283,13 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
 static int phy_meson_g12a_usb2_exit(struct phy *phy)
 {
 	struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = reset_control_reset(priv->reset);
+	if (!ret)
+		clk_disable_unprepare(priv->clk);
 
-	return reset_control_reset(priv->reset);
+	return ret;
 }
 
 /* set_mode is not needed, mode setting is handled via the UTMI bus */
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
