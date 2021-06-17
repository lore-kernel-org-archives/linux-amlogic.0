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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35339C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB886113E
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AB886113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujCXQalI8WrJP9R67YpUn2SG83Lhmwt4dkZlXcHqHLY=; b=c67pN+5jdML3Mx
	utPEfP4AUGP3PFQnDv1AKfUEiAEpVbbNObdSZV56wnnNkapMTJJRZ7DKgF+PAarc8IqAdWhKHT8jS
	GZhSPU5WppFomm2R5rUgFmVXzZ73jUmANXkt+5SksSNMwzf960COkcxsCVwln7dgkDRcglb1u1Not
	2B9j+0yiiERzjjeU4yQ2AAOcWOIOiCl6kIRvi5okTgBuQbilK+TBRRBapB2xHDYCWlSfoQ2kcLxJ6
	/pNLaOR1ChirxtGhQrki9lcTJQ9I52uyWK+x10D2WiXdS9bNIELX9uH0xFZVBYaPzuBUtTtpMnqIA
	/09EuypAHUgeZyf1NeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxvE-00BaNJ-SQ; Thu, 17 Jun 2021 19:43:28 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxux-00BaED-4w; Thu, 17 Jun 2021 19:43:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id h12so5872716pfe.2;
 Thu, 17 Jun 2021 12:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tzl7V45UMyttxYvjiG/RGthazfovWqPJvvGzwmVDhlo=;
 b=nX6c2e296ygCF1xZbasjThl+i6Ji+L2S4BwRH6Yqu5GAayLfXb/+7noHwKrOBgUhT9
 eg2K8QQKUCQtGI30BQjNCvkson1PiNZIydbEt4cn3X0jb3cSPVKu8RtW23Ga/do6cx8l
 s/i584YLWZFfY2swVuF0bgfLDDTAJDioZtSyV46rFruBtv95EFO/v26qprrx+naHMg6M
 lFwo2KSs4Ir8cAEpHhXJCuHOCzDuFlXqVr9mSZov9TiqBb9CS8s88/2qQbksE+oNykis
 D1BoDJgcAA4aFeSifOrKf3dxz8Zh9NnbDwFhbyRFV++z4+dmK99df1yl1LRUFxVEsCG/
 UX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tzl7V45UMyttxYvjiG/RGthazfovWqPJvvGzwmVDhlo=;
 b=IzchLielSxoYineBwHkkNDTp5HzfbYZ3lDACYTO49MwtnYWZ9EdOtkVdfqGhZetCk5
 rxrOAE+GIAfPtBjYKPN78ph1GP+bLhBEwj30TCCtSveekW2l/TlkH/JyV+HB5tJXOjyN
 OlR9ElvJ3nE+yKIJs8vnJ+KzrdnUWlnzRCj5Fc08F0N2Kbysw7z+WJNWecSKIbVBCOho
 uG/Horw2GsvCILVOIf+Xra7tu8KBoaxivo+QF11f+iTaFU+ZBdkdcTfSqDt5PAvNmstB
 dOU1pk1zZhOV4l3ObcuAsdslnO2GIA04zods8Ku/c5F5ZTKPuH8i4/FBYSnrg64KfmWA
 P8hw==
X-Gm-Message-State: AOAM530xXFc4UDO/ajDxIP59JQKncIw7uJlU2VxVq5VHHGxBHgib4V3F
 FSPmknOk7mzokMmdlFbbbB0+voknQxk=
X-Google-Smtp-Source: ABdhPJzSDzSC/y7Al0PHl13B+aX97fg7FS5mmLZ0StkNpzHKaEaV2uuutbLzj6Fs44BbtxcdaNvEGQ==
X-Received: by 2002:aa7:8587:0:b029:2f8:8439:c265 with SMTP id
 w7-20020aa785870000b02902f88439c265mr1528450pfn.38.1623958989932; 
 Thu, 17 Jun 2021 12:43:09 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:43:09 -0700 (PDT)
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
Subject: [RFCv1 2/8] phy: amlogic: meson8b-usb2: Use phy init callback function
Date: Thu, 17 Jun 2021 19:41:37 +0000
Message-Id: <20210617194154.2397-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
References: <20210617194154.2397-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124311_239573_207CA72A 
X-CRM114-Status: GOOD (  11.05  )
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

Reorder the code for bulk clk_enable into .init callback function.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 771b73f3b44e..d48171b0b32e 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -142,10 +142,9 @@ static const struct regmap_config phy_meson8b_usb2_regmap_conf = {
 	.max_register = REG_TUNE,
 };
 
-static int phy_meson8b_usb2_power_on(struct phy *phy)
+static int phy_meson8b_usb2_init(struct phy *phy)
 {
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
-	u32 reg;
 	int ret;
 
 	if (!IS_ERR_OR_NULL(priv->reset)) {
@@ -162,6 +161,14 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 		return ret;
 	}
 
+	return 0;
+}
+
+static int phy_meson8b_usb2_power_on(struct phy *phy)
+{
+	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
+	u32 reg;
+
 	regmap_update_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL,
 			   REG_CONFIG_CLK_32k_ALTSEL);
 
@@ -219,6 +226,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 }
 
 static const struct phy_ops phy_meson8b_usb2_ops = {
+	.init           = phy_meson8b_usb2_init,
 	.power_on	= phy_meson8b_usb2_power_on,
 	.power_off	= phy_meson8b_usb2_power_off,
 	.owner		= THIS_MODULE,
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
