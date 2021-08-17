Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFF7C432BE
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:19:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC01960F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC01960F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0bmLCZyShx0Mjacq7xO/DE0H3gGZJMdvFXb0sQWZmY=; b=A3zo52VAatCMXf
	g2NvkGz4cel9eqf9CmR36WV3q0MHr7a4npIKsrHNBamDzfnLnYe8sIBw4JS1y7cl83ynnp9y0Jz6H
	EAnojlHfRTIEp3lFBKH+Vk1PRrBXtB+9tiMKls1th29RD4B8Kx79jn2Bjlx4gck9ugCpGZ0np1viM
	513XmPyCHNX9cmrvTi+dcZzhYrwDBF5Lf9/H7rNBrygzVDjt5cbddvkjDSR22RTiQ0rYIAKEmHTcz
	BFndbV2U0gfTPwrtvvJ857UDj798fRB+h6ePPR/UT5rZyOjjtjAKc563336KIWgun5CxYTtIDdO+I
	WbVb+I3Z6vxNMdce3NtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFqZ9-0015gE-1o; Tue, 17 Aug 2021 04:19:07 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFqYX-0015KE-07; Tue, 17 Aug 2021 04:18:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id a5so23309095plh.5;
 Mon, 16 Aug 2021 21:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/De+hbEmJZRZ6r7uVfFxTcLTqZUJMY0uXYnWBmH2jqY=;
 b=UPAVPx813tLu01hoTQDKKDPD4TQMFuDerro+n95jRRkWNy/RT0SO9DflqJSdOXEpo8
 NF945T3KYbr2dkLX7mCJrv7oCbijYqRDHaaGyMnJAsNhPak4th2ei+E7Fx/hS4KXN17u
 9Bfr/UD9Ljtn0WCNc8MIlqC0XMbkiSx2HxBediZuEJLik+RtWAcjsSIaacEN3TjxETqM
 5Pjlfvj/l/d2CcCrQqXYRj0uiAIO378u913DdfIfKVZaYqz5sFVbHUQWYDkVgVc44bxA
 955YSQk32VnaKwoPsd81yupWYX4H7s0Ycddn8ref6yXZUkWdwAZdb2fzYlvDPWU1ucyO
 bV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/De+hbEmJZRZ6r7uVfFxTcLTqZUJMY0uXYnWBmH2jqY=;
 b=pKQe20spHwyKwuwUQOe7CtSKMRDq7KH5MkF+Wvlykxg5WQEYRLCndRD8vPEpbMPrZY
 KJ0z9Jjkx5KZBllf9gVeQhruK32MrT0VSnSegCK4QGJUJ62W295sU0lmhaei34yFgTF+
 zMNJoQj5crFbodNxsQzef1l5lHgBcVoCmSrrKOMyCqx4GjNDW1xUky7rrTp7ZZDOEmhj
 lgoWA24qAj7AeqdD3hCv3QW1Z0HPLC8mYJLByTI010mYHrM7G3DTR67aiJWb50asj6kG
 TV40K4pyox/sByaJw4yHTxMK6mMLQ46k9Ywtevaz2ELOZnr/TgvJQr7W0wqkhQFO8ITQ
 vljg==
X-Gm-Message-State: AOAM531WVvbcWU4OjN5O99HPaVfmhQ1iZE1CMz7JaFua/+esu4RjXrJ0
 CC3iW8BAp+QGl/mdq3c1bLi4fsoga3AUAg==
X-Google-Smtp-Source: ABdhPJywvJvBG8K/pH/TB32oj8Wb9Zx5SLgjCuvw5NL08QMtDpkX72qoocsfu3ggRwCUPivhw60K4A==
X-Received: by 2002:a17:902:7294:b029:12d:2434:6d26 with SMTP id
 d20-20020a1709027294b029012d24346d26mr1359556pll.59.1629173903805; 
 Mon, 16 Aug 2021 21:18:23 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.143])
 by smtp.gmail.com with ESMTPSA id g11sm705676pfo.166.2021.08.16.21.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:18:23 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
Subject: [PATCHv3 5/6] phy: amlogic: meson8b-usb2: Power off the PHY by
 putting it into reset mode
Date: Tue, 17 Aug 2021 09:45:39 +0530
Message-Id: <20210817041548.1276-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817041548.1276-1-linux.amoon@gmail.com>
References: <20210817041548.1276-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_211829_099564_48C4771D 
X-CRM114-Status: GOOD (  10.86  )
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

Power off the PHY by putting it into reset mode.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2 - None
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 03c061dd5f0d..2aad45c55494 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -219,6 +219,10 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
 
+	/* power off the PHY by putting it into reset mode */
+	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
+			   REG_CTRL_POWER_ON_RESET);
+
 	return 0;
 }
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
