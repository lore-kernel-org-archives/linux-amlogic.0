Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CF4C0015E
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lJToFeKBFtlLnWEQ9HaHt8+PEfM6wG7nPnQ6hGMwyRY=; b=uhIwdtrR+UStSF
	52b0lzaQkIRNJdPlUzE/Uzyo4fVIvpVt2zeHfL4AmF2QnqFfCCOqU0a6fv622QR382Y+xaQfEaYW4
	vOEmySVkRSCBQbzLxGWKxFen5j4qQ66wUhAFxki4Ufwh8HR9O/Q6YI7SP5rYSYseYnS9GLinIYwtZ
	9PR4cEvlqhsRyDKIu3CrC2wAz3NiLbFIpAZbnGY8G6K0MWghm257/kMKpTuaIl65mJtVTfbRfWAAA
	ZjkJW6MmoP7rxcV0ymbZj5UIPsWBrugWAFjsHTlh42eblw6dVEYRB9hCNmASVdi6/MJAZkOzNa6ed
	A9VTyebuYFlKRH3El8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTr8N-005wqN-18;
	Wed, 09 Aug 2023 21:54:27 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTr8J-005wok-1R
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Aug 2023 21:54:24 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso4776471fa.0
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Aug 2023 14:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691618061; x=1692222861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkMEyGGNHjpLY2UEkMN7YcqkjDj9e0LTmbSFlK+KoK0=;
        b=VQqAQACYQv8GjP6RmCx4yk0ArjFakRxwqfuCKdZKFFDcf4iW4s5YuusU2csrIqKWV+
         h2w1pNtooaKj51cJfgZXblhg8/xZBk8HSazCyLJuxGwlQfEYGU3flDibNizuJ6Q3JnZl
         O80qxZmB9NdR5xTfOeHoVDh+RqbtQYtVPq21Ymcidnb3zuIZ9SwUc6Ku2fgCPyLR1nMA
         jLFM17Ip9W/l7Wn1B8kCQ+Mzwd9boqsPVaaf/Kt8L8cos3E4wy9bh/Ec2QsCAHp6IpXJ
         D9ZUOmpXbE9r00jHVY51+eTUEgm3A5rzSav8h9OirPhtUdyHdqBgBHA18KE0R/ClCPTQ
         2lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691618061; x=1692222861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkMEyGGNHjpLY2UEkMN7YcqkjDj9e0LTmbSFlK+KoK0=;
        b=T4OWLvab4Y0FRO7fpBbiS+AQjUQEC0/4bNQdIk6lpNPDrfUYLTmsbGDQHiBx/I2UVG
         SJ/0pfst+/EOOML2kHcJHPftsGix82dJ9Ic4414Cj3urMlkiJFGlaZWzC2OgVLlqI/P0
         jFDAbPzOpsuuc4eOTfH8GOa1dglunJAKDIl2JuxkK6KtP2sJYjRM1h1DSAy1e0ecFNAs
         862y3HCA+l8yFLhaEHWGpoCc9sR0gXbgt67MJBzxKSKJhwcL4TsCpx/a0d7Xqzqz8KN7
         Dsyk/pOsV0WPzJMjQmnJsE7S0zRptgmSnCNKmk/1rWQZ77/vSNpshPcQNGbQ9eZO+/iP
         8NOw==
X-Gm-Message-State: AOJu0YytIiZp/o27vwvcAg5WyLDenyFFzJoSOt/Jwe1ubd61K9tNn0LU
	jTdL5xSdWgwG7p65itEN54Z8cA==
X-Google-Smtp-Source: AGHT+IFLZ3XxvjmZxptWdKwKgWdhi9Xl+mBhFrej+tA4dJqxwRNQvSph1ArlQyTEWD7Vq+GK3SfMzQ==
X-Received: by 2002:a2e:700c:0:b0:2b9:4492:1226 with SMTP id l12-20020a2e700c000000b002b944921226mr402768ljc.11.1691618060835;
        Wed, 09 Aug 2023 14:54:20 -0700 (PDT)
Received: from bear.local ([69.165.74.129])
        by smtp.gmail.com with ESMTPSA id k3-20020a2e8883000000b002b6995f38a2sm6199lji.100.2023.08.09.14.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 14:54:19 -0700 (PDT)
From: Luke Lu <luke.lu@libre.computer>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Da Xue <da@libre.computer>,
	Luke Lu <luke.lu@libre.computer>
Subject: [PATCH net v4] net: phy: meson-gxl: implement meson_gxl_phy_resume()
Date: Wed,  9 Aug 2023 21:49:46 +0000
Message-Id: <20230809214946.18975-1-luke.lu@libre.computer>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_145423_480213_5494452A 
X-CRM114-Status: GOOD (  18.64  )
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

From: Da Xue <da@libre.computer>

While testing the suspend/resume function, we found the ethernet
is broken if using internal PHY of Amlogic meson GXL SoC.
After system resume back, the ethernet is down, no carrier found.

	eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state
		DOWN group default qlen 1000

In this patch, we re-initialize the internal PHY to fix this problem.

	eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
		group default qlen 1000

Fixes: 7334b3e47aee ("net: phy: Add Meson GXL Internal PHY driver")
Signed-off-by: Da Xue <da@libre.computer>
Signed-off-by: Luke Lu <luke.lu@libre.computer>

---
Note, we don't Cc stable kernel tree in this patch intentionally, since
there will be a cherry-pick failure if apply this patch from kernel version
less than v6.2, it's not a logic failure but due to the changes too close.

Please check commit 69ff53e4a4c9 ("net: phy: meson-gxl: use MMD access dummy stubs for GXL, internal PHY")
We plan to slightly rework the patch, and send it to stable tree separately
once this patch is accepted into mainline.

v4:
 - refactor commit message to better explain the problem & fix
 - check return value of genphy_resume()
 - add 'net' annotation
 - add Fixes tag

v3: https://lore.kernel.org/netdev/20230808050016.1911447-1-da@libre.computer
 - fix missing parameter of genphy_resume()

v2: https://lore.kernel.org/netdev/20230804201903.1303713-1-da@libre.computer
 - call generic genphy_resume()

v1: https://lore.kernel.org/all/CACqvRUZRyXTVQyy9bUviQZ+_moLQBjPc6nin_NQC+CJ37yNnLw@mail.gmail.com
---
 drivers/net/phy/meson-gxl.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index bb9b33b6bce2..9ebe09b0cd8c 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -132,6 +132,21 @@ static int meson_gxl_config_init(struct phy_device *phydev)
 	return 0;
 }
 
+static int meson_gxl_phy_resume(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = genphy_resume(phydev);
+	if (ret)
+		return ret;
+
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
@@ -196,7 +211,7 @@ static struct phy_driver meson_gxl_phy[] = {
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
