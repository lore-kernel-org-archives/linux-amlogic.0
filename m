Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CF9C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:44:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC45861962
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC45861962
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yLYYd0sQz4/2bO+o+HBemY1XcjnVVmfGc6DJfozKN6E=; b=ZbOoLLIIQwTj2nb1f0ITJaCxn
	mX8M0QMhmlzB6yuNismHn/tyR4vAHI91WkEIQVC9HaVGYKxjGbprcLXUhDLi5zSifOD9Voe+hK+SR
	1INXJJD1ccHH3BwDxne4TTGPuIWrYttk75nhLkteCuQyw8ZOrs7yjfqPWCJuYVL9M0E+8E8RxKtDo
	duyrvBnLFx0yIlp9CMDFbOvy+Gj/2T58S1EO2Eydi+dNgYPt56NPFO06ryzoJ5w2Ei1rk39vAQ82z
	Tz6znGwGYJt1Vk563QimAweEsY5xm/tGWZKeemVYzbZtb0KsrT/3VkRGRU10Ld9q+8qJV1e9gsmj5
	YAM+xTfKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPLY-001QCQ-1v; Thu, 25 Mar 2021 12:44:20 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPKR-001Pmc-LG; Thu, 25 Mar 2021 12:43:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id g15so1950384pfq.3;
 Thu, 25 Mar 2021 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEn6qKJ0gN4j90BS+aCP3T+jQ0ecUWl0Idd4DLZOaBs=;
 b=kL4jghWXYvGUk9aIgwhEwP+eY/j/zpJ3JozsIHI2hc+IsM1pXFILpKYoxU5rJopvEw
 ze3qBMfeHzCOY4StFgCfP4dC2hKQCabNcWrmT4ewtyDxU123R7i6imjZsVFiV//fYXwG
 /ZkCa4/YFPV1bR1sRPSf79jKAtPuLJE4L931KenhOcqb5N1kOEZdWfpQa76jq8AZf8ny
 37j26Ll7SwtTzPrgH9ylSMyhb5u/xtxIksTHngThNfamA1Q6tV5GhCdze8/zWGH1s4E/
 phXS3SVLVZHtJ0313e4pkKoPCzuunpXGy0zwA+dinfQEVxX8iPVtjP+G3AtdI3CLaa1K
 GK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iEn6qKJ0gN4j90BS+aCP3T+jQ0ecUWl0Idd4DLZOaBs=;
 b=Ehbmp3CqloX5Yn2larkCYRuWdVOEvNIuMACc+AT+27PdMgLCYDtwe5qcR/mWGA82D+
 BQ6LBoX594kDQNboNOusMOqIYqV8z5z9AFXsLRxzLaXAAPT80ihsAaFW5G0YH21CoOd4
 ebUbpragXsh1WOoGeBPwDfTUpuAfc0vN1igDLrlU/92HTY1Mi6L/TFGj8NTovBrFDlLX
 ylexaLnpFqQY2a/Y/q/B00RqVKl3NA0zYwLx6qZr6Uw1r1cXZYT784s/XJ3Micquw0W+
 MS7FRwdfymEC0XyXqCPKUkFyvSsn/6EDbGXc/8gnTCrViwB3iqvf9Bz5WbbvulUO1xOw
 JSfw==
X-Gm-Message-State: AOAM530OHFRmIoCrsu4Iw8EhD4ZBOmO3LYQfw3Wfz90igmaSpUbJ2A2x
 lRN9eH9HD5aP8aY37T+/VW8=
X-Google-Smtp-Source: ABdhPJx/yBK25ROu+Q46FS9EPvSNS8ntot4VYxYvF1e0VDn1qlFEWnKCqXZe3VGsoMsUfPJSwVLAzA==
X-Received: by 2002:a62:8485:0:b029:1fc:823d:2a70 with SMTP id
 k127-20020a6284850000b02901fc823d2a70mr8120061pfd.18.1616676190304; 
 Thu, 25 Mar 2021 05:43:10 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.9])
 by smtp.gmail.com with ESMTPSA id t17sm6125917pgk.25.2021.03.25.05.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:43:09 -0700 (PDT)
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
Subject: [PATCHv1 6/6] arm64: dts: meson-glx: Fix the ethernet phy mdio
 compatible string
Date: Thu, 25 Mar 2021 12:42:25 +0000
Message-Id: <20210325124225.2760-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325124225.2760-1-linux.amoon@gmail.com>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_124313_851040_613743C2 
X-CRM114-Status: GOOD (  13.19  )
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

Fix the ethernet phy mdio comatible string to help
initialize the phy on Amlogic SoC sbc.

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/ethernet-phy.yaml

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index c3ac531c4f84..303f54384a9a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -773,7 +773,7 @@ internal_mdio: mdio@e40908ff {
 			#size-cells = <0>;
 
 			internal_phy: ethernet-phy@8 {
-				compatible = "ethernet-phy-id0181.4400";
+				compatible = "ethernet-phy-ieee802.3-c22";
 				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <8>;
 				max-speed = <100>;
-- 
2.31.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
