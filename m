Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B337C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649C3613D5
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 649C3613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3HutMD6+ggCb47OIukg77UlYwRSIpIAWtOaiQ4ObIk=; b=JFU5Sa6s82KJoj
	jhTxpa40u+F74j/5cH7/fekV+oRidVhh5mVZaSCq+hfuyyBY7Be0OsQVEaS9VBUg143iuOf/4utcr
	RjLV//C3dkhrO1ApNYVXbXPXOHWWhuVLzLFIQKFXbsOWCubxiWLSVszEMM5gQZwrr92MvSouv6SGg
	wjW5w02aZvsUgJ1CrUTbwZCY2cJFbtwQC7fhOu2vOuAHUSN1L6u+wDTiql5w9CHF7pxaUyBiljG3O
	vsv6ZfGQzoHJisv9QNeXXtQljj4AZuWZVC2mhknkfD+7phTOFntYX9Pl6CIubvpDY+E/Qs2Spw6jK
	HAPDdwZt1RIDzMXfPhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxxz-00BbtY-EK; Thu, 17 Jun 2021 19:46:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxwJ-00Bax4-0p; Thu, 17 Jun 2021 19:44:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so4477202pjq.5; 
 Thu, 17 Jun 2021 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQPEi5A9nnMFKoiOKyymsLKzhX94jE2VAyrLXIfg84k=;
 b=oF7qwt4MVyLOPRPRZwU7w3KvEGQIUotgOr/2Rooi6tbscOBcNqcc1XD3ENr3WptRU8
 UdhBxiQR1tOYZjcJVD1fa4KleHtJqN7KxHtvJS754EFzMoK4T9Gh2Jx2st8Iz/a2/nhp
 22a8md8h3WN1OnjpWFJrD9iYAxM0o2F6ADNX5fQMR/pQ/e0CWYI4RO+/aMakKaTPHohm
 7RDU6QSEhU2D2TGadIdObyZPW+phnQWWMo1OkSF4NVgn2lFG/8slNhESNif5h22IWKa0
 yAY/349fJ48TmmziwVVoRA40NUaR3gcQ33rXNNwdSCQLCPJQyq7+SGHFi7JBBTMHceDV
 fJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQPEi5A9nnMFKoiOKyymsLKzhX94jE2VAyrLXIfg84k=;
 b=X+e5QMUDSp5aariSadXgXm35MfcYxfhw3Slo4+S00OmhZKcVfGsi/pp3TlKrbYFY8P
 G4Mg3DURD90wR9Ms9Tzq1rd0MiOHbnMLFKcva/QaWgkeJXZi0CDl0thRW4Wqcza02yR0
 WpMBNwOqpUhHxLFYGVfHC2am3SNRae2ADAGq4Dnch77tM00Q3LQEdLJ8JXzF29IWLDYR
 RHLeXhFajQPG/h0lFAvLJ6fFcjcAwRpuu1wXZBZ53rcWcEYN2jKz6ByTYFiDiVQr+I5h
 eLQ1t+JXo/ARjSoYTHnFkMPz4d7wDAUPdE1z3hBqjaowVdABpAc4fp3IpHj2tQOR6WgA
 xplQ==
X-Gm-Message-State: AOAM533WOmigIWF14xogR5b0xDJ7rGbexQ6mTxrIVZuIbVUhv886q4KO
 0VL/FK7/cCLJqZELNLPAUXoFoTG/HfM=
X-Google-Smtp-Source: ABdhPJzZxNqxDhu1JuR1k4gJl697ElF7Ci5dtFWC4BPWfy/748J3KooaJwzRJ6CEUCMpmbkiVKZ2KA==
X-Received: by 2002:a17:90a:5795:: with SMTP id
 g21mr6992169pji.235.1623959073592; 
 Thu, 17 Jun 2021 12:44:33 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:44:33 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: --to=linux-phy@lists.infradead.org,
 --to=linux-arm-kernel@lists.infradead.org,
 --to=linux-amlogic@lists.infradead.org, --to=linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFCv1 7/8] phy: amlogic: meson8b-usb2: Power off the PHY by putting
 it into reset mode.
Date: Thu, 17 Jun 2021 19:41:42 +0000
Message-Id: <20210617194154.2397-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
References: <20210617194154.2397-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124435_128005_CDAB79E3 
X-CRM114-Status: GOOD (  11.17  )
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
Drop the phy power reset since we are doing reset of phy
after we configure the phy. No functional change.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index c1ed2e5c80d8..d5edd31686bb 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -226,6 +226,11 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 		regmap_update_bits(priv->regmap, REG_DBG_UART,
 				   REG_DBG_UART_SET_IDDQ,
 				   REG_DBG_UART_SET_IDDQ);
+
+	/* power off the PHY by putting it into reset mode */
+	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
+			   REG_CTRL_POWER_ON_RESET);
+
 	return 0;
 }
 
@@ -245,8 +250,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
 			   0x5 << REG_CTRL_FSEL_SHIFT);
 	/* reset the PHY */
-	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-			   REG_CTRL_POWER_ON_RESET);
 	udelay(RESET_COMPLETE_TIME);
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET, 0);
 	udelay(RESET_COMPLETE_TIME);
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
