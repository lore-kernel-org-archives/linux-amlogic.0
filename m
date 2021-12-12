Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6013C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 20:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MdBgm7beWtmqVqxWWo865T0Q0lVZmsOylyLmy1NUW44=; b=MjbTgUoyI5/CAE
	C+6fgTY/pLmzYHUEeex4zZdNl8HaATE0TElnZ0NDoKQ/71cklS0gh0+fGz9fDzd8hlC3Gqkvy0nrU
	Id7dgqa24Amj+hXcqW4lgSc+FWfN1nA8j67DhWQrhDZ6EtkSJ39mUVzkzxlQctBaoFf5Msnm+YqLn
	ujBMAyUcAGVuD+upU/knMdhkgubHHNS3QnyZR+wQ/jObP28BG9rKZ+v1VgG6ESGjmORME1IPrJ0x0
	XKsEKjJ8W8/J6NGLBQl84VYbFI44b5tskLaJyPIK3guzSORyBMW7IydsGHS9ZJbjIBuFn7GBHTgCz
	5FsZ0iVLaYTbiOclO/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwVJR-007BcC-NN; Sun, 12 Dec 2021 20:19:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwVJ9-007BVa-QW
 for linux-amlogic@lists.infradead.org; Sun, 12 Dec 2021 20:18:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id c4so23836608wrd.9
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Dec 2021 12:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DEqcYQHdC1ee15LjGbKeJnBTc82RghuCYEwGrhqwf58=;
 b=6QCZInTlhtGHs38K6PWllebPY8PZ+XsQY7+py5EcxK/xQEWqo2ZYxwOMD1TGr7kglD
 Wt/Ncm7hC9ZiYci4RWw/ubJhzWkzrFZd3HEwq7xF0LOLLJ2CXHmB1xmTVYN4cdEMfdBi
 lo6KEWy8FCtr3vgpXkTF3zx4hgEBZpnQny//4xw/HEf5C6k653SPMPPqjRSJby0LwOZ7
 oCyJxOaCy9IiFeKR68HBGnf7vx+ViNCe0U7TD/LpXfRNx02cfKrN8/0T/Z42mWX/q9G9
 TLa8lon0OVJUJnuaKqVr+deYpHj35k8GdoafyjFs/Exf2notApgT2P0/MEPy0+amvdUc
 aLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DEqcYQHdC1ee15LjGbKeJnBTc82RghuCYEwGrhqwf58=;
 b=oTP0dWlh68eH7YdTX2AoKu7FQ9HC0svtZDVw3iCnIMVFQ31yNrbuR2qP2Vznbv8hgS
 HUNLoDNV4y46IhjPNlbG4C1k63NgTmBHvrnz8w3iJjm1hgWVQDQU83k0l9Rtcx6EVOa1
 4/Fs/Z3pvIQvzZDKvGU+cpBx7SiI5ZKyoubkt02FqtJCYjVxfNJucZdXeOd5o4kupiyM
 RzQEXwCU9xPlZq3Uwm3H7X9zWwv1/C0caWzxFbe/KvnyglYu2KBXUw/7f45nmc0RxtMg
 8qjqRfCoQRNKrbhB14UbnWkjZ4v1fWYM5ymlKob2AerxKtbK5mksgyO2QthmUVb7Q6wX
 qs8w==
X-Gm-Message-State: AOAM5304UA72FJIqxf6SGWd6osf349zmfm6TxfpnkSRGioKd5TQMBD0u
 wDh6SAb1zkJ6b2JsZqr60j3fPg==
X-Google-Smtp-Source: ABdhPJzStHaYQvzjekJD0BKEjsvQ9ILU/QVO4EtStIMs6xGVZ5obEqnflRGFG/O+HRqSNlE3tT/vzw==
X-Received: by 2002:adf:a389:: with SMTP id l9mr27656312wrb.121.1639340332397; 
 Sun, 12 Dec 2021 12:18:52 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id p5sm9092710wrd.13.2021.12.12.12.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 12:18:52 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
Date: Sun, 12 Dec 2021 21:18:42 +0100
Message-Id: <20211212201844.114949-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211212201844.114949-1-aouledameur@baylibre.com>
References: <20211212201844.114949-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_121855_938437_78B010C6 
X-CRM114-Status: GOOD (  11.60  )
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
phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
and the reset line may be triggered again by other devices.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework. Therefore, use of reset_control_reset() on shared reset line
should be balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
changes since v4:
- Call reset_control_rearm() after clk_prepare_enable() fails

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 2b3c0d730f20..db17c3448bfe 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -114,8 +114,10 @@ static int phy_meson_gxl_usb2_init(struct phy *phy)
 		return ret;
 
 	ret = clk_prepare_enable(priv->clk);
-	if (ret)
+	if (ret) {
+		reset_control_rearm(priv->reset);
 		return ret;
+	}
 
 	return 0;
 }
@@ -125,6 +127,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(priv->clk);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
