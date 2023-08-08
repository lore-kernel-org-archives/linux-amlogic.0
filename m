Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1D3C001B0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 05:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WGSOSZHhGgvpAU++XsctPP/w6gogTNVcl2iOAzZQeak=; b=Lv7ZI69ZCIxR8q
	SRq6xMkj9yIcdg9xGAqW4yDbwrMEK0RZSnZktf+joeI+bFAXqQckfW41ta+GysoWdx3+As6qNWfc2
	QmI2Q8ZX3FqO/fbCkpnGueLzUha7HQuaOrUCgJYHpbRCzUHUTs0DnTbhRgWTVGyPCrjN1qfEf8WWF
	hWUZI7w+GL40mJmlnLJF0hdbTv4lQw2iNaVqnw27Bg3auKfnOD08O/0mn64hL14DytPSlDcykkLfI
	/gzSS2YyKIFSB3Ft1UFt9of20GO5I/WrUkMm0pX/W5UmAFGHBIaUq0x2jqoHwJTg3r/CuBeJ3ZeR/
	EsFZjRPoFof5v953dMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTEpr-001jwz-0k;
	Tue, 08 Aug 2023 05:00:47 +0000
Received: from mail-vk1-xa62.google.com ([2607:f8b0:4864:20::a62])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTEpo-001jw8-1R
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Aug 2023 05:00:45 +0000
Received: by mail-vk1-xa62.google.com with SMTP id 71dfb90a1353d-4871f9928edso1291073e0c.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Aug 2023 22:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691470842; x=1692075642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkyQ6QEBJ5R+A4KzXauS14DJOe2NQamik93pPPAJ9ek=;
        b=DtCxRcMkLQ/R+ymX7FzAMJS99OZMN05pESUIfkD2jM0AzNyECi2mkyBe6/NfCcWa8l
         5pas6dYbyCFUoUyTWelW+4XVIXuhWBZkoQgHo8yD65d12AeXBQQ6NgAp8MijmIHtpjvL
         1lM9ZtmsLoArXN9CFEludqtQRCnS/t+3Mmj8MaKNtG/toPS6qisTODrSIB8v6iYwRgIC
         8QRwq3TZlaIowc9Plptkrz81wU6rg83xuvehrR1lNBKCDQNkkQI3vOjSKabwhZn8TpCt
         SnbX7bEIKbJibCHasId34cCC3Z0GltGB5t3ruwhgrgi3bpiitgAxDray52bHQBVomaf/
         JbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691470842; x=1692075642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkyQ6QEBJ5R+A4KzXauS14DJOe2NQamik93pPPAJ9ek=;
        b=N+MYJzmotWz5cz7ouc8bpf9ufT9KEy/ExbzXzkNGGv/kZA2eg+Pj7QyhraDigwx+IP
         +ad66j3i+TcYgaXpBU5oQvueq+pAfYqY2N/JoOzpPKDMyuQj9DB8T5qfn5etwU9EB8V1
         tagz5SPkLoR5M+6VRP4E4fQl2azJ/dHtnJnLm7VKn5anqgPyOmNa9B3V6Epq/2SC8qd9
         pp/B6Bp0rKh+wsimdViCygscHGo54dDtKuQbW+c12oisSkVfx84j2WJlcUTavv4vJgSP
         gtaO5oO0ovrZMJwJkCzIQh3lSqulw2xPHzS+na0dZvzLkJnFh/NH0GT3XSax2CcwD7Hz
         fDUQ==
X-Gm-Message-State: AOJu0YyuPhNz8YXeXt8oB1ZnJskZ3onNiF2jAqg9Fe9pe9hYzZcWS4jJ
	AjOLO+kKWt6dnMi6KjNTltCn/Va9p1eu79epdbxEoCghlaGZ
X-Google-Smtp-Source: AGHT+IGOiebSl22GAJa1Vqszzuk5r+Le/tkscMQwKLAbyswQsnfaT24eZusPYQGYRv08JMU2SVc/f7X59f9M
X-Received: by 2002:a1f:c1d8:0:b0:487:1962:7495 with SMTP id r207-20020a1fc1d8000000b0048719627495mr6886859vkf.1.1691470841920;
        Mon, 07 Aug 2023 22:00:41 -0700 (PDT)
Received: from dxue-amd-5700g.libretech.co ([72.76.64.93])
        by smtp-relay.gmail.com with ESMTPS id c11-20020a02a40b000000b0042911ed0da5sm584619jal.11.2023.08.07.22.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 22:00:41 -0700 (PDT)
X-Relaying-Domain: libre.computer
From: Da Xue <da@libre.computer>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	Luke Lu <luke.lu@libre.computer>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] net: phy: meson-gxl: implement meson_gxl_phy_resume()
Date: Tue,  8 Aug 2023 01:00:15 -0400
Message-Id: <20230808050016.1911447-1-da@libre.computer>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_220044_484398_F75A0B2B 
X-CRM114-Status: GOOD (  12.81  )
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

After suspend and resume, the meson GXL internal PHY config needs to
be initialized again, otherwise the carrier cannot be found:

	eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state
		DOWN group default qlen 1000

After the patch, resume:

	eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
		group default qlen 1000

Signed-off-by: Luke Lu <luke.lu@libre.computer>
Signed-off-by: Da Xue <da@libre.computer>
---
Changes since v2:
 - fix missing parameter of genphy_resume()

Changes since v1:
 - call generic genphy_resume()
---
 drivers/net/phy/meson-gxl.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index bb9b33b6bce2..bbad26b7c5a1 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -132,6 +132,18 @@ static int meson_gxl_config_init(struct phy_device *phydev)
 	return 0;
 }
 
+static int meson_gxl_phy_resume(struct phy_device *phydev)
+{
+	int ret;
+
+	genphy_resume(phydev);
+	ret = meson_gxl_config_init(phydev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /* This function is provided to cope with the possible failures of this phy
  * during aneg process. When aneg fails, the PHY reports that aneg is done
  * but the value found in MII_LPA is wrong:
@@ -196,7 +208,7 @@ static struct phy_driver meson_gxl_phy[] = {
 		.config_intr	= smsc_phy_config_intr,
 		.handle_interrupt = smsc_phy_handle_interrupt,
 		.suspend        = genphy_suspend,
-		.resume         = genphy_resume,
+		.resume         = meson_gxl_phy_resume,
 		.read_mmd	= genphy_read_mmd_unsupported,
 		.write_mmd	= genphy_write_mmd_unsupported,
 	}, {
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
