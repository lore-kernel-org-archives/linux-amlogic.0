Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E85EE644D
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Sep 2023 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7cMT5L3tJBo5j2ma+XV8+KrzpRwi7wnU1G6twS94io=; b=j8GyEapvq/pCsr
	z0h1cHFOQTKeZyx4hEo4e6lApINUqtZtgsvrn6fKqbjCd1XVJPUIM0mYNoorI1ptNm/dwXzSK7TVu
	o1EpV9fv20tN8ln9G4T79VGM6mq6JMIhNlkEXDuActfSbI8/lP0a3XYcmhAZh1WoBXKu8iKZMf8Ti
	YCJbBBxWtU8q+NN8OQgHMNI251GiU+Ic2h/c4MKjTEkC7av+CSuQP123Zx+N3mPqcpHtvvdZ7+aft
	Ek+XBidKgkBKMRggZmq04VRtDrZRdwEULZ4Nsjt1tZtcksryrN2TsV0dUvwj0U1vLZZkltT8diKbE
	740mvHYDyHuIe/vyRdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh50v-00AFmh-2P;
	Fri, 15 Sep 2023 09:21:25 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh50p-00AFez-1L
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Sep 2023 09:21:21 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bce552508fso29092021fa.1
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Sep 2023 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769678; x=1695374478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtEkXdqn2AKXcoldY8q7JCFJLuqJ45MWZNi1FoZm5Ic=;
        b=K0wCOz5bZhC14mP3eRpamJJqVXlGOk6IRChvmD+2QQklj7c6Cz0e1Vz9VAiV33ifzT
         wX/JUgUvLG/bzDj8/mSPBHtQBJ4y2T3hjcFD/QxHcubP6CmFwQDTKqXMsXs5LW48gmGt
         wQhtSIxMAZkWdJSC8GIVjZcJVnKkvk0AXb5T49rD3yp1afRSjDcrxZW74988BEAeaqdm
         UFT155IlnMWtybkFAy9kmuBWfgE0R0b7PQL8IlpdH79GLzNEcchINIttpFauOwjFyxKn
         T+J7gSbQeUpdKKonruNm1NQhFp4FnxhOgIr/CsfVYpkK5AFQWTTS+Otpa9f41y+GQdhN
         50MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769678; x=1695374478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtEkXdqn2AKXcoldY8q7JCFJLuqJ45MWZNi1FoZm5Ic=;
        b=HhVbRny/KaQlq+dtdJZ8zguEdzVCF3ahymtyPm7eYA0mDKzd8Dl1sdVNac6Std/afl
         +YDGtUG2QxTIeoFxDgK+JXXINEwoFdl82wU+OjQyPNKfVjnXVZ6WlAvImB14S05fFmO6
         f/StaSftmWKX/QoHskIZRvUvY2ayH+5v1I83R+pTPB6cojR314OJy34ZIukFjEkyoIvr
         vX2YNXxvjbKTgRbALh6nWtcq+2HK7bm4bac8+SrTwmS4h8hJw9ntj69LlGEEmjc+dt7Q
         WYt8U5llWo62xdcE+y2Mba0H4dzkEXzUmgnY2PrgztPceZ0fvoK42Y6E2j/GxnV7ewQa
         RpcA==
X-Gm-Message-State: AOJu0YxFdUFWVUYocPstOwvBRYY3L0i56OPs9CjCGkG+Tym3VGNRtRQW
	oYOQV5VEMsW97izHzkcpwhe9zw==
X-Google-Smtp-Source: AGHT+IFx5SAj9k17uZVn4NqPVoiWz/nsVg3nOnzOEp+JkWLtAilL3VHRVFLGDM2LReEURtgNYbQOYg==
X-Received: by 2002:a2e:9987:0:b0:2bc:daa2:7838 with SMTP id w7-20020a2e9987000000b002bcdaa27838mr1012473lji.19.1694769677864;
        Fri, 15 Sep 2023 02:21:17 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id p8-20020a2e7408000000b002b9ec22d9fasm639376ljc.29.2023.09.15.02.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:21:17 -0700 (PDT)
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
Subject: [PATCH v2 03/17] pmdomain: amlogic: Move Kconfig options to the pmdomain subsystem
Date: Fri, 15 Sep 2023 11:19:49 +0200
Message-Id: <20230915092003.658361-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915092003.658361-1-ulf.hansson@linaro.org>
References: <20230915092003.658361-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_022119_461924_0C119C4C 
X-CRM114-Status: GOOD (  13.61  )
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
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig         |  1 +
 drivers/pmdomain/amlogic/Kconfig | 39 ++++++++++++++++++++++++++++++++
 drivers/soc/amlogic/Kconfig      | 35 ----------------------------
 3 files changed, 40 insertions(+), 35 deletions(-)
 create mode 100644 drivers/pmdomain/amlogic/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index e410c4b8071a..03c8991ad0fd 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -2,5 +2,6 @@
 menu "PM Domains"
 
 source "drivers/pmdomain/actions/Kconfig"
+source "drivers/pmdomain/amlogic/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/amlogic/Kconfig b/drivers/pmdomain/amlogic/Kconfig
new file mode 100644
index 000000000000..2108729909b5
--- /dev/null
+++ b/drivers/pmdomain/amlogic/Kconfig
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Amlogic PM Domains"
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
