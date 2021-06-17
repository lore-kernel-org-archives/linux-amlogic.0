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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EB1C48BE5
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F33656113E
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F33656113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zORQgo5XJbL6y/SzY600Rkr2AljXOJjJWI7vdAVgvR0=; b=dQAKV++aAJM6hg
	7mi42WPsBOk++8iVGjeQMCF6aMVG/7A7DsXs+2oRNRXwZAnnXm0R3fMpzM6MX2E95dfRZbtsEarWq
	CaNpY0TSxdDmEiMgYLdmZljfMm3NJ9BWZprl9QNf18Mh3jiwTVla1m5rpApchndBQn69mxoKMttBZ
	fKKs3N8kSs38QSkJ3eqEqJh68v/vdYQP+aiyEiqsck6KtyN3PVMZCwRUYf5cAWWe3NmZcB4YBYSwJ
	ORq7JJw9jgC4lrzwpaxX/bnBPXI/05absB9CpSwbF5MbfGzm/PlEaQ4Bcgy+kafVqqZg53wTVYvZT
	sbANmw6u1q6YBbqYS3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxwW-00Bb4Q-Oq; Thu, 17 Jun 2021 19:44:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxvl-00Baee-Ed; Thu, 17 Jun 2021 19:44:02 +0000
Received: by mail-pl1-x635.google.com with SMTP id c15so3406909pls.13;
 Thu, 17 Jun 2021 12:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hdzvs1xs4XG3cpyN4NkJEKqbHLmgGkruX+DR+rsCUB8=;
 b=KzJwSd6ASPVS70vFaIeoMnaFl69YBeca53kGHvijVtBhgsWbanwrpO8qZcVlpjhzGy
 oqCWhUzPocyp1GqUVxqQDpd+pdcZV1buOgaveUqgEA/lu9wT5s1/sOtP99BFFCoIUB9h
 GrFF+nn++sPbetBCyrdoZDL3Mj7Kr6RTEYETq17limuCSOIk0ZIfVM59aw31RIiXxuJ6
 AjKTH1Y0cpascG4sdEbQxbdRZZBIIWd85cV/dvG0FOUXPWqeNcMnfw1EOOLCS9Kdyb3P
 3CjoywJ+C4DOZz3YxtWeZZJJ1MGuYNJBJeWQ7jgqaT8avdVT4bWQbRypsrfPvmWe+vB3
 cbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hdzvs1xs4XG3cpyN4NkJEKqbHLmgGkruX+DR+rsCUB8=;
 b=bUuVhSmXfBynl7pFDyMUetpMvIlT3dFXIPHI7qnHYw4fuBYMirdspcSKJ67IRGJV4i
 wZ55a7N3m/ZnznqscZbkZ6eqttj0+FQJbdg1gN/sUjnLsUs7ZnGYy8TtdP5IPlHEyf6h
 3cmjtE0rJrALnhde+u+L48vmnpf3vUV1eaQP/2iehSORkTVPmSfrZNe33QZXeWfgGEWD
 bgieQGkvR8hMrqIzP4CJW6rOHrflSNaqif+eApgaJRCW3uY4ZJWIoRvBmAzQ72Vv0Uts
 dDjmqbwb/mfH3WO9kTw8XwmBMcPhSqK26Xn9ldanN6DRfa5WKVobu21Z3/HA2NF8tL0+
 Vm3w==
X-Gm-Message-State: AOAM5302pdgUkQm4vAQF6xkyJ+X8s8PPzhal4AdsccBGu7j1LavKzb/R
 7zBTD3MnKKvGuTGtlKs2rtp8X7sWrw4=
X-Google-Smtp-Source: ABdhPJyONX1RytaqS/1Abh60D0SZ6YpWdjvwgyXHIGp/cDL0NRrUFyKJEfDLIqaBQz0JNR6EF1p1Lw==
X-Received: by 2002:a17:90b:3147:: with SMTP id
 ip7mr7180115pjb.8.1623959039950; 
 Thu, 17 Jun 2021 12:43:59 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:43:59 -0700 (PDT)
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
Subject: [RFCv1 5/8] phy: amlogic: meson8b-usb2: Reorder phy poweroff callback
 function
Date: Thu, 17 Jun 2021 19:41:40 +0000
Message-Id: <20210617194154.2397-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
References: <20210617194154.2397-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124401_535343_7EFF1112 
X-CRM114-Status: GOOD (  11.46  )
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

Move the phy_meson8b_usb2_power_off fundtion to avoid compilation
error.

drivers/phy/amlogic/phy-meson8b-usb2.c:247:3: error:
	implicit declaration of function 'phy_meson8b_usb2_power_off';

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 18e0986f6ed2..ab23a584d7b7 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -205,6 +205,17 @@ static int phy_meson8b_usb2_setmode(struct phy *phy, enum phy_mode mode,
 	return 0;
 }
 
+static int phy_meson8b_usb2_power_off(struct phy *phy)
+{
+	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
+
+	if (priv->dr_mode == USB_DR_MODE_HOST)
+		regmap_update_bits(priv->regmap, REG_DBG_UART,
+				   REG_DBG_UART_SET_IDDQ,
+				   REG_DBG_UART_SET_IDDQ);
+	return 0;
+}
+
 static int phy_meson8b_usb2_power_on(struct phy *phy)
 {
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
@@ -240,19 +251,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	return 0;
 }
 
-static int phy_meson8b_usb2_power_off(struct phy *phy)
-{
-	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
-
-	if (priv->dr_mode == USB_DR_MODE_HOST)
-		regmap_update_bits(priv->regmap, REG_DBG_UART,
-				   REG_DBG_UART_SET_IDDQ,
-				   REG_DBG_UART_SET_IDDQ);
-
-
-	return 0;
-}
-
 static const struct phy_ops phy_meson8b_usb2_ops = {
 	.init           = phy_meson8b_usb2_init,
 	.exit           = phy_meson8b_usb2_exit,
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
