Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE02C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 23:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aOP/6nUgOa4auf/CZj2Jw8OvgyNdRtTdhVF55RUkLdg=; b=squuHJ/ORTop3o
	mI+/V30Aj0kS8STIQk8Le7HWF9DXzUqCGnTWckTrIovtBY8fiFDAKav2lm2kxLkoQfGZ9Uv3qHBn1
	kTPDri9L0LsZuSrhqU32FOwZKHQH9YCELg9B7UVZTdf2jxHMyasx04UTp0bMZBMTAsacLEVKmP1X+
	wDn5uGx7sOgsM35M4oLdY0TkCXyQQOB3j/UkT1uE4JEku3j5NNZyI15Du5BqcHLLlfRcGZo8fkCZC
	CdznxFMfgGSXRzv8GuhiK85zrBRSIQwraV2aWETkVBZ9q556rs0Wrt94LmGRxgbYSCqwL5+ICThWM
	KhBfNyHnsSHR3Q91sTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMdM5-005lRS-Nd; Mon, 30 Jan 2023 23:14:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMdLu-005lON-TM; Mon, 30 Jan 2023 23:14:20 +0000
Received: by mail-pj1-x102f.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so2241842pjd.2;
        Mon, 30 Jan 2023 15:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKu+kd9X+GTaWdLAQUJinb0Z7Cb02sWxRt1ZBDZ1tPw=;
        b=SpwzlWusL1iiV7vQ35dwUjrZC7Z+QLqzZQFGcjkd1UAs/oQ57Et6T8HYbzjSfWefj1
         zNwfPNWHuhVlbHLgAMKTv9HUnXkZfMisbamlbb+U4BCr1fZSN7R6YlILyMjP34fA1X6V
         i2O0zJNBT1cGtT0cI16KFj1xJYBfc/mc6Gpt/fv0SCUvxyVbd2IAmY/KmwDahoDiZQuA
         1jRsKfGummyhtGAywSKzRlGpFx9q/G0HpdxuwQFHvCIuzsunfCZEdmqb++k7xpTsAgrU
         kWZzo5cwCPt2GzmR9HxrwpI0OYMS/lRZQ9wvM4iGQ1anmGrxzm69ZnlzZVmFJpQk5g8u
         yjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKu+kd9X+GTaWdLAQUJinb0Z7Cb02sWxRt1ZBDZ1tPw=;
        b=p5icfj5dZhII0xPnwhqD0cyz7kASUk75FCpoRbcGJPKAJ1N3PEtrGqIH+1FvXZFWOZ
         Yiz0UouYocxdHGCKwCC/prGjhDhWAXoOrkNTwnvNJB0X7YTKMxF7TAMrY63SwO1fP8N3
         vEy8Cl7YA+cnRCJJDpofxLR5P89WhBaN6x+2GH/jo0bzEqMxUlwvZxL8iDMMdRlE1ULZ
         4calq9H46CdI0oZiXas4QQvsiJRzZsuBlHoC4YBJETMV9jS3Y3cwqesgKztMrMbOwOVn
         0xd5nu9p3dGTP0bdIXYgHywSvLTUcY/a4b2lw1t9xXvMjfPNUIv4Q2yZBmsYXwlOFfHb
         nOpQ==
X-Gm-Message-State: AO0yUKU8y3no5pZvcwIhgL6ggMff51tRYGFph4UmC8lAyj24OEB1dX0F
	L+3kd12V5x6LNNsfFTf1YKc=
X-Google-Smtp-Source: AK7set9foVYSvp+tV1JKInjXZGdAvVr+C0n/JwJUa1GLBHkpNyK7L5AUtM1fVSoN+j+2fi3W2A/FEQ==
X-Received: by 2002:a17:902:cec2:b0:196:5035:98c0 with SMTP id d2-20020a170902cec200b00196503598c0mr18082248plg.23.1675120455748;
        Mon, 30 Jan 2023 15:14:15 -0800 (PST)
Received: from localhost.localdomain.com (2603-8001-4200-6311-92a0-3d53-9224-b276.res6.spectrum.com. [2603:8001:4200:6311:92a0:3d53:9224:b276])
        by smtp.gmail.com with ESMTPSA id x26-20020aa7957a000000b0059393d46228sm5102765pfq.144.2023.01.30.15.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:14:15 -0800 (PST)
From: Chris Healy <cphealy@gmail.com>
To: cphealy@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jeremy.wang@amlogic.com
Cc: Chris Healy <healych@amazon.com>
Subject: [PATCH v3] net: phy: meson-gxl: Add generic dummy stubs for MMD register access
Date: Mon, 30 Jan 2023 15:14:02 -0800
Message-Id: <20230130231402.471493-1-cphealy@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_151418_985553_B698E18D 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Chris Healy <healych@amazon.com>

The Meson G12A Internal PHY does not support standard IEEE MMD extended
register access, therefore add generic dummy stubs to fail the read and
write MMD calls. This is necessary to prevent the core PHY code from
erroneously believing that EEE is supported by this PHY even though this
PHY does not support EEE, as MMD register access returns all FFFFs.

Fixes: 5c3407abb338 ("net: phy: meson-gxl: add g12a support")
Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Chris Healy <healych@amazon.com>

---

Changes in v3:
* Add reviewed-by
Change in v2:
* Add fixes tag

 drivers/net/phy/meson-gxl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index c49062ad72c6..5e41658b1e2f 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -271,6 +271,8 @@ static struct phy_driver meson_gxl_phy[] = {
 		.handle_interrupt = meson_gxl_handle_interrupt,
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
+		.read_mmd	= genphy_read_mmd_unsupported,
+		.write_mmd	= genphy_write_mmd_unsupported,
 	},
 };
 
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
