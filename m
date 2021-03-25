Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE1BC433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:43:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9387E61A1B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9387E61A1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hwic63Hl4UyAXZPGpoFqQqVBAfmuAq7ZGO68vesl938=; b=miZpLyJ5M146btUpTJpWwQK09
	x79ReWReKs2g7lallJS6XKlJZBTRCrL5IU/sY37J1DveJ1Yms3bQlYsnLbQJxJdoGj/gYAP/3VI5O
	g+EzEOVhE1YnkBdLeoIk6pyfRjRPLdynvSz3I+RXPZu3lg5ROjiDKS1qANpyNHYY7/SH5rjC5OOvi
	gZt/IB1SJ8XZweTen+MQ54bkkKnpP1BnssKEWMy7iZVo/tLWlVFJ5LZc8JpF2i5QEV8F72nBWXnTX
	x4Th1OvdIkB/xx0lIExZ9p3OkFYYC/Zm8ZKKkF/ffnpAEPaspxeVi/10AA/bXSSbPP6QcbuP9vFbj
	Q7WkS+mqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPKW-001Pnw-7n; Thu, 25 Mar 2021 12:43:16 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPK7-001PfJ-C8; Thu, 25 Mar 2021 12:42:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id l3so1927566pfc.7;
 Thu, 25 Mar 2021 05:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ltQuHjZ2Dx4rM2etKJdZXBIVzAy3G8OeRSAF5zKHFQ=;
 b=cYD37tfOFxTIQc8pJCixMPHtDMuFqTAvYYbzQ7/LVeS3NqXIBN4+xS/LGlRm5sSokt
 pW3f1J73gTaXNYEFV0e4sbX5AEGWIg89n2MpFW3JynzDsTKZFA+gT2mg7YSb5fY46tfm
 z8dSWDw9aB+nrgQSzzDiH34Yqmc624BJKqWoKuLjsR3YTbT4kZ6zok8Vqh1um2uno5Xf
 yIqBnAMof7CatTLO/aU4Oz+DVIPLWb6EW2U25VjdOxmsMUKFdiCWRCKT814oV/NUCh66
 +G5AMqcU8Mpo3PjFqzZR7AYMrLPRx0irq+Otmq53hdrj2lvwzcKE2ZkC2hho1A2/Rhr3
 ThZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ltQuHjZ2Dx4rM2etKJdZXBIVzAy3G8OeRSAF5zKHFQ=;
 b=M2A4Qj7u+RbxKZDiHAjD6jnmJOZ5SJcsgnxZawlbwq2r4wnixjpAYNqO1+jRINsDBq
 wZGlCFTVMANwt0VfijkMQnfTkcw1JIYHRInUyzJ+JdZWX/AUQAtDGljgCFn5Wx45IaT9
 NRAkGvmBlooABppp5QOzAL8mhZ2fFAv6PX8fNz5BN65jN0+3/yv3xWLSt1SAH/WjYv6C
 J46dziIf7s8RuQKN7zEQf/LRI2o3G6btMALKXWAdtkVxxkJtSceOFZmBtdGx2FpNcXNa
 RdHUjC26GE2lpmuQ5SOK6Mxr8v6fs4TfE3f/y0h3lHphTM0rbCFMCvb3G2Kb4KnGDMbS
 BoNQ==
X-Gm-Message-State: AOAM530OUCRXmXuQVuGGhjr1KZeKG7JLtwFxDjOpOrtlliWM2UDJLoqI
 vxnG1A6FGYx8hufuRtWRoSM=
X-Google-Smtp-Source: ABdhPJx9Tv1NUnOleZSOzJFANweJXp9b3HT9f3ckzmcerGk/AvLG0xmMKAxIrI79ze9FvHFKQOfXgQ==
X-Received: by 2002:a17:902:bf92:b029:e6:bc0:25ac with SMTP id
 v18-20020a170902bf92b02900e60bc025acmr9622503pls.49.1616676168868; 
 Thu, 25 Mar 2021 05:42:48 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.9])
 by smtp.gmail.com with ESMTPSA id t17sm6125917pgk.25.2021.03.25.05.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:42:48 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>,
 linux-amlogic@lists.infradead.org
Subject: [PATCHv1 2/6] arm: dts: meson: Add missing ethernet phy mdio
 compatible string
Date: Thu, 25 Mar 2021 12:42:21 +0000
Message-Id: <20210325124225.2760-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325124225.2760-1-linux.amoon@gmail.com>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_124253_064800_8DF5750F 
X-CRM114-Status: GOOD (  11.72  )
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

Add missing ethernet phy mdio comatible string to help
initiate the phy on Amlogic SoC SBC.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts       | 1 +
 arch/arm/boot/dts/meson8b-mxq.dts         | 1 +
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 1 +
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 8e48ccc6b634..09ce822308de 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -262,6 +262,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* IC Plus IP101A/G (0x02430c54) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
index f3937d55472d..c1638f3c9edf 100644
--- a/arch/arm/boot/dts/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/meson8b-mxq.dts
@@ -109,6 +109,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* IC Plus IP101A/G (0x02430c54) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index c440ef94e082..ca439302c74d 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -216,6 +216,7 @@ mdio {
 
 		/* Realtek RTL8211F (0x001cc916) */
 		eth_phy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index fa6d55f1cfb9..6c9b22605264 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -73,6 +73,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
-- 
2.31.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
