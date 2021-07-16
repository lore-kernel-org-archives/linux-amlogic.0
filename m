Return-Path: <SRS0=nqA+=MI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91D5C636CA
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 10:39:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9BFF613D0
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 10:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9BFF613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuFJBidii63bSilF9PSIMGSJWnRV20og+3AoPo3bZno=; b=zLyl4Ms8PgYyFM
	0IKx6bmFzYqVN7WwcU7U3hxJto6wLypZbZD4zn9y4YSYjTb4L9v5Bo1yc13eueE5J1smKc+KTvtSe
	h5qHNxB4q3U4JtntXgjN+Gby6GVGHxQBWGHJxXXO4OOlqa2sFTtWtdC3vsKt4Z4W30GQDOs6FRRdX
	BT8XpbDQSBTHM7JvJKgNDqBjxbuoRTuAoJq4zptXa17G5+B+387+ma5tP3rys3yMuZCYAVMgplmrt
	9bR06ZHbwv+u5Jf5ivcp0Rx8FHRnaQ++5ThhzCYANummBtqtYH1M7TpvM/qa03Hzc5Uh6hpv/3L83
	TmKcwrU3DdIcZZEeLU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4LFK-0049Ck-RS; Fri, 16 Jul 2021 10:39:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4LEd-0048ok-8f; Fri, 16 Jul 2021 10:38:24 +0000
Received: by mail-pf1-x42f.google.com with SMTP id j199so8562897pfd.7;
 Fri, 16 Jul 2021 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ijibuOn1o/zyXxVK7//BA8fe5lpTivScoHePVnxddFU=;
 b=Qf9SOx6QD4X/slJCbBN3lWyDjpm8rnJYlFnSC/XJk+r2LL92hc6zo+WOtnP91fFVP9
 tBS4WjcJvji4dkub0v6NU6k/wBh9Cz1PvNCFuH0oHzKURPH9YDtjlVPtskhmeYbMTej1
 WuohWqOG/YtBzDZ3TZqFHj7G8FRZ23T682i3tQ3v1OCnl/E2ttkFVxvaipcM16pADatb
 dvdawIST8n+R8jieSnYb0y9oCqZUgwthwXXuEQnnF9nKqtfeSWdihPHE815Dfmrn8Pnv
 noafRwT/Ncmk3Ct4XeXxNL+ONmErwWKEEqs4a/TxDBib2LoSjDIWnCG4pRXMRbPWJVFU
 QDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ijibuOn1o/zyXxVK7//BA8fe5lpTivScoHePVnxddFU=;
 b=UqVi/BKto1iVecWogoiB1R5Te4r4wq0V5grBgpg+mbqe/2bnQAEtYVFFrAisT7ea8j
 if/TZrpTFR8t9nT1atYobuewZmdGNQPjWCU5/TdaT0a8cOFL7JWBTQg57LAHp+6+S3m4
 tSOzFy1LTtRwUQQ8RVOIOHD5sCjcwyeS+Uoz3PJjj94DrBfXJSlqQn1RRTbePRqzzMOp
 BHD/djyPxLywMR3XDhq2bC8gdZP0jrn2Bu5HYAtHYLGe/CAKzXLWaLqvJBQ0YEd379NF
 /a7Dxd1CFkR58ZVwr2lF0WjnT3VD+zYugU7rfyKxMNaPrHkrb3jmWanq+2WYCmyXdD+S
 fgCA==
X-Gm-Message-State: AOAM530dsEGtUBjJ3MvArT1TjIDByaw+YbwP4SIoQhunuAi34VIexWRu
 wHEIaONsFjtnrog8mpuq45Gq5G/mdtk=
X-Google-Smtp-Source: ABdhPJwzFIVx2DLzzS7/EOrIoZqSrUxxZHYoV9gOL39E9P3TfTI27j0dDyl6BT242VupYDs0781MUQ==
X-Received: by 2002:a05:6a00:7d7:b029:32c:b12a:d65d with SMTP id
 n23-20020a056a0007d7b029032cb12ad65dmr9602132pfu.44.1626431902028; 
 Fri, 16 Jul 2021 03:38:22 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id d29sm10070111pfq.193.2021.07.16.03.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:38:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 3/4] phy: amlogic: meson8b-usb2: Power off the PHY by
 putting it into reset mode
Date: Fri, 16 Jul 2021 10:36:35 +0000
Message-Id: <20210716103651.1455-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716103651.1455-1-linux.amoon@gmail.com>
References: <20210716103651.1455-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_033823_368841_38000354 
X-CRM114-Status: GOOD (  10.99  )
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
None: Added Martin's Ack
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
