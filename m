Return-Path: <SRS0=A5vq=MH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871D3C07E96
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 09:23:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB7260041
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 09:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BB7260041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TElxAJOxeqiwOUG7fgvFnS5kSIru3Tu2SG9tGKnAR1Q=; b=qD2q0pI8qCbyfn
	yL7qnw+353GW9tpjRjPRFBO886leJW+am+r2HESs2De4UT7cZxe/5OssZKhaUKaB9m8CGErbA/Klu
	Rd/y0xADqgGYzUCdBKSG/k5fTxfj6NPYUS2oH+c5rvxyn38uhiI0XJWzkXsawoqF5ZLSehYf5F6W/
	gDcDeeJuRgbM0q0rdmSmS5p8n+gANsac9CzN1td8cLeOYQAwPqcwocLhpApCaC1ONI62bQIQtnSMu
	UlrymC8l0TmDa/9a4dHCTCIA9eyRUXiawHBTLzwpm2y6CSn7c7c6SW76Q1qamI4+O8ck73jF7cNik
	aP9W4r9KnQhvrtdc+YKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3xaD-0008xu-Bg; Thu, 15 Jul 2021 09:23:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3xZu-0008qw-6c; Thu, 15 Jul 2021 09:22:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id n11so2908312plc.2;
 Thu, 15 Jul 2021 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NYwMREptpH+SMYjUdvFTHh1r7G+lr2bq6Llrywdvilo=;
 b=uR3vskA5gv8/lie36FQ5MbR6XsNMJ+dgsZwEBrZUImZoufJFrJn2lNe1jNOwbcg+Y1
 nwLfUVpZvLAsY8yVOdNI/vXhfy5qFjLVqatDwW4kIhxvilbJom9SJjXSB5H8QVau/ZMY
 /do2Z+ngWIspm+KEbATbMSLjYGM4urexTID36AbqJ4KFEupxT0x9Ei0s/7G84xsxn4MF
 uZZ/XVesEOFnkMyk9dMbJPjeXRzkkHgl6GKpiA+e3qaaoCRZAIIBBiJ0cNZqPgQkZ9Ou
 1c1SYWGNQRTvIAIe4Go6N9aQIQWSVdiROCJLL58afmDlTHukf/VzARGb5Jhgwi2SZXtJ
 AGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NYwMREptpH+SMYjUdvFTHh1r7G+lr2bq6Llrywdvilo=;
 b=cbkkeP9tYQKsuvahTovOSJni0FDaPDvHbO+7UFJ1QgqCPQ2sjRbeZNX/gWT463IXHf
 DJffakP8EAIouUZqcAOunyo4MoX6tEbvIPyRbS0uTFJI5clluMWNej3DNFm6s3cb8Qdk
 /+XwQx7nLrg1EGS70RoTsbkPPGhg2Gl0ELTiFiZrOm2PMTT6dCP3E44Oe0YfGYWLRPz2
 A9B7tg08WyT8XZaebA3LTIbGDePFCzl7gfSUlX0PxQZK97G1KoghIPc2NrOw3wSb7s8/
 s6uz3WvrVKZ/ld853P9HocRMh/tUxcch4Xgu/XXTq10nEvPEhNDjihlcz72TBy/3m2kf
 unFA==
X-Gm-Message-State: AOAM532gVNT/DvpS4OME4yUvBbs05UWLj9tMuBdWpEgxu+iDNZ1JYSRv
 zbIz7TxbQvpkPm+T8w1kuqDVYjOkpQg=
X-Google-Smtp-Source: ABdhPJw3PICK0TgRXinqxXnC3NhR0qntn+uH2ZB9tj7hrsee2GJQV0H51Ymleus68Z7IM8DFvZ5Uhw==
X-Received: by 2002:a17:90b:3756:: with SMTP id
 ne22mr3506101pjb.144.1626340964712; 
 Thu, 15 Jul 2021 02:22:44 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id k25sm5571603pfa.213.2021.07.15.02.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 02:22:44 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCHv2] ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC
Date: Thu, 15 Jul 2021 09:22:25 +0000
Message-Id: <20210715092233.1084-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_022246_346748_9E18A388 
X-CRM114-Status: UNSURE (   9.86  )
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

Enable CONFIG_MMC_MESON_MX_SDHC so that SDHC host controller
on Amlogic SoCs boards enable support for eMMC and MMC drivers.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Tested on Odroid C1+
V1 > fix the typo Anlogic --> Amlogic
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 52a0400fdd92..8b3f62a0eb22 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -870,6 +870,7 @@ CONFIG_MMC_SDHCI_PXAV2=m
 CONFIG_MMC_SDHCI_SPEAR=y
 CONFIG_MMC_SDHCI_S3C_DMA=y
 CONFIG_MMC_SDHCI_BCM_KONA=y
+CONFIG_MMC_MESON_MX_SDHC=y
 CONFIG_MMC_MESON_MX_SDIO=y
 CONFIG_MMC_SDHCI_ST=y
 CONFIG_MMC_OMAP=y
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
