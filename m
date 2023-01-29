Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F192C38142
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Jan 2023 02:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNVUayrPStNnlSVJtru0GqTWXqov0/IxeL89lqU8q2M=; b=UKzKEF9C6NSKo2
	wNGr7PkvaPXrDzEmm5kMDNsymzDcbeo27dgjKpE0Wn/70iYZvnIqlb82Kg6x7MqZRKmOk4yG4TISJ
	v0nlUzzPzb3UhiU+SysZK7pxoWhXKw9d8c0BWYUPA/fBj4mJT2Ud1bQlj2GJgeLRTIeXlN4+6MpT/
	e7WGuNbOlooca9Rr79f4ZLPoNnuwmlFU+I0qjfd9wdj1izBF3zqs00wwo+MfdIcQLdNrd/MYl/HTU
	cTPZRscRVcjOfCc6DxNZrhvBN4Aw2cjExWMzIkyZPycVHV+Wnk+ydpQvT1gRpvhu81N+0XEfJfBpw
	bKpG62eZuoGgi7tYG/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLxPW-000uCv-P1; Sun, 29 Jan 2023 02:27:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLxPN-000uBp-0I; Sun, 29 Jan 2023 02:27:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id r8so1619879pls.2;
        Sat, 28 Jan 2023 18:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy9KvguFc2gDUCrzkC+qChu1ABG5IuB/NXRbpfk20C0=;
        b=WvbT2tInonx13nAi6GfeETQXmxg2vbMEdJEaGo/kXSVJPGaaMvTnEIUqJ567lFGDEt
         ddbMsrGUybFe7ewIczVzJ16c9uX2DSEbihjh4TWqiVyZjoXO44hpAMWIcuo3HfZAOg7O
         Sw2F2h4ZDP9dUm3FcQZLUimDNETpb4x2T1/LIS99zdJoJtvMoD93psRbjc1SNyVUtjxK
         FtoFaFLop+2PeCTwmK43LPCwdvYsHuJzmGpYxWIronqZe+mTx6jWF+hdJbL15qjmfYfo
         pIfLTEq8x4ahJZQ8DqoFaKdVxCYGo9Y0uf0UDhbma6Zqt+ejV53pZBE3IUkRpbOmbUAr
         AqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hy9KvguFc2gDUCrzkC+qChu1ABG5IuB/NXRbpfk20C0=;
        b=XgnbzAyqgU5sYe9BxzEtwVWupW7gGljuegrwTaCEte88Tb3fUgn+MpA2LPXjQpT3I9
         FX0xdrkCm+WRqmiygVo1FJOfqy5GWPPmDLsRYx76RXZFkBmekBY1HmhevmyhJH6OpY65
         WZrThf/XHlWHa/GR9CypkVOBc1bjNEYms7M4drEus1fFD7F+3XckGudR6shJGnHw6jWN
         9G4q6fCY8SeI79tjo6o7jxqSavjAJgSqqNe+28MDuaAUTJW6x4ueZfMEMq2NfuzI43qT
         /9jwNIfV2VWEkVJxgl48Jdq5teQivkjHois1kZ+gGm7C/Nj0394n4VacHvtgWSxEsO5p
         nk0Q==
X-Gm-Message-State: AFqh2koBAdp2cmeOodCjrLm0CKfvMMyspss9OvXuK6rqbc+2qP2gXl1r
	63YxC4GwUTiYwUHYZqlesPM=
X-Google-Smtp-Source: AMrXdXuvaM36unwlhcOHxtKzhidkbEqTMEzaTXPGrTe4vG4g0hG0lWMeXsNIxWaEYuYqw5wjJN87GA==
X-Received: by 2002:a05:6a21:3294:b0:a4:414c:84c5 with SMTP id yt20-20020a056a21329400b000a4414c84c5mr61940516pzb.12.1674959222534;
        Sat, 28 Jan 2023 18:27:02 -0800 (PST)
Received: from localhost.localdomain.com (2603-8001-4200-6311-92a0-3d53-9224-b276.res6.spectrum.com. [2603:8001:4200:6311:92a0:3d53:9224:b276])
        by smtp.gmail.com with ESMTPSA id t1-20020aa79461000000b0058da7e58008sm4904189pfq.36.2023.01.28.18.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 18:27:02 -0800 (PST)
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
Subject: [PATCH 1/1] net: phy: meson-gxl: Add generic dummy stubs for MMD register access
Date: Sat, 28 Jan 2023 18:26:15 -0800
Message-Id: <20230129022615.379711-1-cphealy@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_182705_090477_302A7A91 
X-CRM114-Status: UNSURE (   9.00  )
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

Signed-off-by: Chris Healy <healych@amazon.com>
---
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
