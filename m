Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425CEEDE9A4
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 11:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=guCRd7jxbulMA2sG282vsxD9YAbl5wbYq3GIZu4otwU=; b=t+h7SstfaC6PHy
	SUCutYCmqNG4ZXJsDUPu5Swfzqvde8E/ulN2o/L92NixOHdG7Smixc0JYzA5Me3wcFaMelJHx9NDw
	2RETBKU/TXMrnfa+ExtBUT2YbjFZbbqMQ0DUL4tzRsmeEQQbjawdo2O03oHcYIImsSGf7W6SlxGKI
	go0H3rII4BlyA4uBjLGemTiBOZbHqj7xaoYLawoBQqpbq0VtDk0uzTmbegJA/JTp4SCrJVJpw4kJr
	FFuaQv/KYnfiPSA6M5mQFW6GAVrzq37wmZvp+dxYRTZySerBdUVP8a4OZ71Fszj9GJ8vC9GnF4L+o
	fS0wyTuBsaVHTw88o5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkLR-008DCs-1n;
	Thu, 14 Sep 2023 11:17:13 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkLO-008DAt-06
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 11:17:11 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-502a25ab777so1355655e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694690226; x=1695295026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JMk7fcL+OM7TMTCrC+x1UWkNtvLf41klCSKq8e0KE7Y=;
        b=LaecyjvOECRHC6mR3Wz8Clz3WQcvLwDDzfB8m28L3H2p+tyJF4rpm9yxU3f0ELCTLX
         1w/xiwPuBgVO9+c7Xmb0djvfHv5ROuPUlgCL46ZCYqHQI/e+iqLZ/PIPI3ksrYlZinQU
         vZj+CrCKlfbC1MH24Pr5UC7K23yswgS5JUUrg0+YpDb6El+0iHkK6B8n92W5zxrokiqS
         ashQ0uuq8NTSzn0K0dAjyD1h3g0byJDtmP4pF37z20c2w0jp72BE5EvS210Br9sak4cz
         HSIpqC3qsEDiArGyZUQ/59ldMdhqBk5qsbCfqJAtVtrXL+bcd2kM7YLmofo0iMsf20VL
         1eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690226; x=1695295026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMk7fcL+OM7TMTCrC+x1UWkNtvLf41klCSKq8e0KE7Y=;
        b=CEVK6S6gXAdJm/BpGTi4JcnNS2tqBU1X0vX6MsFRxfiTkl5x8xhrTkkjSfFUbgaVvA
         4zgSuPdIgvWONedrjWPkagOxxV+bCqqAswhXQ96+93GrV+2x7juimeMcvKLTITlkpd0V
         e6hb06MZEZjwO8biguSUFbNe/MX0I3PV8il3xiYF1uOwTTIE1mnHANprRgWyAXeqiNQw
         LIq9aRCdfJScYIOwBqpiEixphV/b3qgWYlgWLeirdk0z0yTMerDjwYEzgj2jrODZPScP
         RQ7pn1kMEiAqj7hGiz0BSTUV1BXhfE5U0KuFYqOIAUNj6Ri4aL++Ry7A0J9/3cmK/DdF
         nimw==
X-Gm-Message-State: AOJu0YxZEYBpO4l3voXi6N3ffkpR9VF0qtxNo51+TscjOhyAM4u8JIft
	dcOIA0YtYKclFyFtBOKkPAh7Mg==
X-Google-Smtp-Source: AGHT+IEHCRZ8RnlKrel3ZKeQ/pul7iLzreILlx20wrdZdHBApccysL2Xr01SwAAI3n4m5UV7sCVJ3Q==
X-Received: by 2002:a19:6918:0:b0:4fb:9f93:365f with SMTP id e24-20020a196918000000b004fb9f93365fmr3772353lfc.38.1694690226095;
        Thu, 14 Sep 2023 04:17:06 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id c5-20020a197605000000b004edc72be17csm235958lff.2.2023.09.14.04.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:17:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 03/17] pmdomain: amlogic: Move Kconfig options to the pmdomain subsystem
Date: Thu, 14 Sep 2023 13:17:02 +0200
Message-Id: <20230914111702.586501-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_041710_070442_87B7F3A1 
X-CRM114-Status: GOOD (  13.01  )
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

The Kconfig options belongs closer to the corresponding implementations,
hence let's move them from the soc subsystem to the pmdomain subsystem.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: <linux-amlogic@lists.infradead.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig         |  1 +
 drivers/pmdomain/amlogic/Kconfig | 39 ++++++++++++++++++++++++++++++++
 drivers/soc/amlogic/Kconfig      | 35 ----------------------------
 3 files changed, 40 insertions(+), 35 deletions(-)
 create mode 100644 drivers/pmdomain/amlogic/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 8acb10bcdec9..07d2f8165abe 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -2,5 +2,6 @@
 menu "Power Domains Support"
 
 source "drivers/pmdomain/actions/Kconfig"
+source "drivers/pmdomain/amlogic/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/amlogic/Kconfig b/drivers/pmdomain/amlogic/Kconfig
new file mode 100644
index 000000000000..ee1affffbce6
--- /dev/null
+++ b/drivers/pmdomain/amlogic/Kconfig
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Amlogic Power Domains"
+
+config MESON_GX_PM_DOMAINS
+	tristate "Amlogic Meson GX Power Domains driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on PM && OF
+	default ARCH_MESON
+	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS_OF
+	help
+	  Say yes to expose Amlogic Meson GX Power Domains as
+	  Generic Power Domains.
+
+config MESON_EE_PM_DOMAINS
+	tristate "Amlogic Meson Everything-Else Power Domains driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on PM && OF
+	default ARCH_MESON
+	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS_OF
+	help
+	  Say yes to expose Amlogic Meson Everything-Else Power Domains as
+	  Generic Power Domains.
+
+config MESON_SECURE_PM_DOMAINS
+	tristate "Amlogic Meson Secure Power Domains driver"
+	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
+	depends on PM && OF
+	depends on HAVE_ARM_SMCCC
+	default ARCH_MESON
+	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS_OF
+	help
+	  Support for the power controller on Amlogic A1/C1 series.
+	  Say yes to expose Amlogic Meson Secure Power Domains as Generic
+	  Power Domains.
+
+endmenu
diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
index 174a9b011461..d08e398bdad4 100644
--- a/drivers/soc/amlogic/Kconfig
+++ b/drivers/soc/amlogic/Kconfig
@@ -26,41 +26,6 @@ config MESON_GX_SOCINFO
 	  Say yes to support decoding of Amlogic Meson GX SoC family
 	  information about the type, package and version.
 
-config MESON_GX_PM_DOMAINS
-	tristate "Amlogic Meson GX Power Domains driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	depends on PM && OF
-	default ARCH_MESON
-	select PM_GENERIC_DOMAINS
-	select PM_GENERIC_DOMAINS_OF
-	help
-	  Say yes to expose Amlogic Meson GX Power Domains as
-	  Generic Power Domains.
-
-config MESON_EE_PM_DOMAINS
-	tristate "Amlogic Meson Everything-Else Power Domains driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	depends on PM && OF
-	default ARCH_MESON
-	select PM_GENERIC_DOMAINS
-	select PM_GENERIC_DOMAINS_OF
-	help
-	  Say yes to expose Amlogic Meson Everything-Else Power Domains as
-	  Generic Power Domains.
-
-config MESON_SECURE_PM_DOMAINS
-	tristate "Amlogic Meson Secure Power Domains driver"
-	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
-	depends on PM && OF
-	depends on HAVE_ARM_SMCCC
-	default ARCH_MESON
-	select PM_GENERIC_DOMAINS
-	select PM_GENERIC_DOMAINS_OF
-	help
-	  Support for the power controller on Amlogic A1/C1 series.
-	  Say yes to expose Amlogic Meson Secure Power Domains as Generic
-	  Power Domains.
-
 config MESON_MX_SOCINFO
 	bool "Amlogic Meson MX SoC Information driver"
 	depends on (ARM && ARCH_MESON) || COMPILE_TEST
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
