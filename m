Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DA0C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 20:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fdv5AobFCdWDgU+nvIfuRzKfaivNYefsStB98lP53ZU=; b=Y1sWemkfZW+q6Q
	agzrRq0uXJJJzPAPhAb2Mp/x5vsUPpTKSsFaD0aAiWo7AMFq5XwtDWrDAfCSC3/1qS/nzCrcRFpnu
	Q7A7ocFYQuGMym3/UrKNN/yv2d5tzCpf8UQ7/uNUKXfBq4l6xpz3NaaDxDB3C6TsnYppDB4RI4rGA
	gS7RQM8CQrU9boteboEhoVe8yPKdM5xwdZcCW99k4bDkUfot03Gr2RfEDW8GvPu2B5WAhV/oE6weo
	RSrimco4zr51fl8GlmvtQwWbw9+7csXi7rKyKs+OAbvWTcGd44Tc8awag33c4dgYpAjIrSyMuno2A
	LYbxUXMLrbnlCHu8zD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNgSt-00HB8T-Rd; Thu, 02 Feb 2023 20:45:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNgSj-00HB79-Mq; Thu, 02 Feb 2023 20:45:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg26so2406534wmb.0;
        Thu, 02 Feb 2023 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJUiYTQ1taG/LOwyCcjL43MPAWD51ybFnY0ZUS3dCqY=;
        b=KXyqPG5tu737wJxVVX5VB2sp/LzI8W4VNgkRmihb/T66rfehZuq0dfR7ddT4ABwBWW
         b3Rz+D9MJ2+RRO7e2i5M/jgzfZObDXNIsavC20go4OglCqzZsVNKma8h6j4lRF/2sS1t
         f4akLv3rGBD/zl1qWPoFYzfIegCVC9Wm71ueB/4SwEz7TOxWHu1Odisz1uhvjmmL43FN
         5vXRQr/nTfNWLXuQkUd7pft3Hw1uq3wm38NFln7ETcdxVKTmqDon9i4dZ9a6KqraT5ti
         xibSAdetJ7gBGKyt1sxUyN1ludA5o4Tuablecow7tF5EmAxi0TKkETjo1uG5EpFtPYTc
         jZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJUiYTQ1taG/LOwyCcjL43MPAWD51ybFnY0ZUS3dCqY=;
        b=R46KiB67ktoQkiYvnuRjI4eWYPZ6IOOPrVXL+VecJtsh4p+2i5OK4WXtjCqgsdOsFw
         dlMlx46AtpL65QvIEgDHXCRtf1CryPT1ig3PgqHnIBW72XZ0Cyb51mIfpQpnHyr0FSzA
         J1f0Enjt576cG00j7wDQsQfJ/Q2zoc9J1G7hNz5/V9/RV1KFBrNAsMFSGszfwK6LM6OF
         BGs54//fEBqjA3eTF0sdE/J7Xt1W5b2Nezep2qqTWP24ccuUWMAz41QZ2xBNSG9byRy3
         EVbSMKDDN+7P/iUW5i8NHdmmTGsrHDrQIJISCQGikiEDK9cn9YaKw8m2p5I58LiH1Dcj
         Xctg==
X-Gm-Message-State: AO0yUKWeV3ztjn5NCiIy7Qv5mD68JHIYeN+1FMsPV5Utc1DlqWQHxrNy
	y8dyjo/s44MJNigqRZcu90Q=
X-Google-Smtp-Source: AK7set9ADFaNOhib79hvEJuo0y9MhgRtlRe07c7YZDBCDpcNWwrERWgr++a4PQ0y2CkFx0Wcm7FCdw==
X-Received: by 2002:a05:600c:3d98:b0:3df:50eb:7cd9 with SMTP id bi24-20020a05600c3d9800b003df50eb7cd9mr5645205wmb.14.1675370738204;
        Thu, 02 Feb 2023 12:45:38 -0800 (PST)
Received: from ?IPV6:2a01:c23:c579:1b00:d49:d5e1:60f0:ebae? (dynamic-2a01-0c23-c579-1b00-0d49-d5e1-60f0-ebae.c23.pool.telefonica.de. [2a01:c23:c579:1b00:d49:d5e1:60f0:ebae])
        by smtp.googlemail.com with ESMTPSA id j25-20020a05600c1c1900b003daf6e3bc2fsm8643763wms.1.2023.02.02.12.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 12:45:37 -0800 (PST)
Message-ID: <84432fe4-0be4-bc82-4e5c-557206b40f56@gmail.com>
Date: Thu, 2 Feb 2023 21:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Chris Healy <cphealy@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net] net: phy: meson-gxl: use MMD access dummy stubs for
 GXL, internal PHY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_124541_796017_8CE3840F 
X-CRM114-Status: GOOD (  10.57  )
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

Jerome provided the information that also the GXL internal PHY doesn't
support MMD register access and EEE. MMD reads return 0xffff, what
results in e.g. completely wrong ethtool --show-eee output.
Therefore use the MMD dummy stubs.

v2:
- Change Fixes tag to the actually offending commit. As 4.9 is EOL
  this fix will apply on all stable versions.

Fixes: d853d145ea3e ("net: phy: add an option to disable EEE advertisement")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/meson-gxl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index c49062ad7..fbf5f2416 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -261,6 +261,8 @@ static struct phy_driver meson_gxl_phy[] = {
 		.handle_interrupt = meson_gxl_handle_interrupt,
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
+		.read_mmd	= genphy_read_mmd_unsupported,
+		.write_mmd	= genphy_write_mmd_unsupported,
 	}, {
 		PHY_ID_MATCH_EXACT(0x01803301),
 		.name		= "Meson G12A Internal PHY",
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
