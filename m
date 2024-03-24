Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A5DCD11DB
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2024 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozo5i42JShHv7XZSPKVgZAU7WC2hUiTwhvrYoelcYyM=; b=paHsMvxb+tlAp5
	5/UHHRjuzq0XX3lWxF/suTAeeoCNf72oBUDkeE/5wsl8dBw8fZD5YmcGrKpyzddnG3sErunMDgors
	9p0u+LWrFAXznm7A0h/ihZLwfLzHoBzCn2tStZqn3u8dmbJ6GMo7YlGNkakcQH2K3ZkqXxH0zb67T
	0X6Nbh9wacNMUyZ2VH2cUtTWDm00FPsg/39j0O+kecJWnGcAiHjBNI7nn/VWtJD+UIXePyOqJz+xn
	T1F2quoQTlFJ1AKiN1x91qZGjTUPMQBerszjsTWDJdw7Q3WAdh/6Z1OVjjWGZ1j/PQFezlIvkrgXi
	v737SFVtYRugY7jYWePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roPd7-0000000CqDQ-1qEN;
	Sun, 24 Mar 2024 15:19:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roPd3-0000000CqAh-1GDR
	for linux-amlogic@lists.infradead.org;
	Sun, 24 Mar 2024 15:19:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-56c1364ff79so92882a12.1
        for <linux-amlogic@lists.infradead.org>; Sun, 24 Mar 2024 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711293551; x=1711898351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze781fdYMJC8X6yPwfz4FQS/isO5gR11eLckzIKPCfI=;
        b=Fu3ZLc1m7CwFavpGuJgmKlFEjKHAetzaoPCTCm7EoWq9IPH/bEXFUWhIlJ1R/ZhPrA
         IDfdCDUeegZg0Gxx+Qg+rr5WSFVLd3MlHpaJT0al+DnxKeKpmhqjxyI5nq84J2JDeLgR
         T5zCrCY5Vo9GHiGJkGbS41cOpP7RJZDFYuBWRR5ujK9tZlPyRcqFCY9E/m9LeMmW2sJw
         Um02GSsWQ400tcHR4k0miwBsTNBlM50dtE7GUGuDb+wA0/1vEhwwML9Mho5TaA5U3UO7
         KBc7dffzk08TX4TxJLFYlDL7lNB+yFL9iItZ5ocsw5Smsb9uRyi931x41X4dF6o7r1E6
         65Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711293551; x=1711898351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ze781fdYMJC8X6yPwfz4FQS/isO5gR11eLckzIKPCfI=;
        b=uZH/5AkRjtsGAa3VE9ttIx6E1UWaNi97ks8JQESvUmHVHOvoeXJgzLK9TWcJHtcNfS
         coEurq/7D+H74OSmnavxRk3nGOGEUpDEuDceEaWDs2qSzw3FhmbcOkTPF3bNa5gcEssV
         L/JxoAESmxDSTIeUBRa+lPNGuzKz5TxUVL6UkOq6zT5fkFSK8IuUSb1aUjtEOP9+mTxF
         4PZSf7ha7pRSsCAw++YRWf09L9KrEJu2JaY3R/H7a46jFT070MTx1xk6nmgk6BjeHprc
         HJtFEaUnJ5qqg19vUc3l6KMsN3JZ3/1KDGkahbQ9nh3zFb7ybvffjDnX/iQJsL9wFpqa
         Q8iA==
X-Forwarded-Encrypted: i=1; AJvYcCUI5H0jS3KPc4kMdACzUha3nt/dcpwZirR9E6HU2I3TP8n/91tK4I/x029LeExy42bxBs19MFTloLvupdZ12qKi3FHPbUZ8tRaJ4QCO/DSULUc=
X-Gm-Message-State: AOJu0YxXrBFAhxFYxOEKfBlJu7PCjct3pdySrvHaSlBZbQAq/MxlM+H6
	gIhIPBwP7HwP321AjHdQ1joAszEI3WSLDF/ZTUF95/nyZrHDV/+KT0hH9M/7mbc=
X-Google-Smtp-Source: AGHT+IGWop+tRdvatwhyMLUo6vB2OpRCupGJ56dqduh0sfpCfS2PruM3icraWlMqlzpjp74V6KKbQQ==
X-Received: by 2002:a50:d594:0:b0:56b:902e:b144 with SMTP id v20-20020a50d594000000b0056b902eb144mr2966510edi.12.1711293551532;
        Sun, 24 Mar 2024 08:19:11 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id o26-20020aa7c7da000000b0056bf34d656dsm1996114eds.29.2024.03.24.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 08:19:11 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/2] ARM: dts: fix Ethernet on WeTek Hub/Play2
Date: Sun, 24 Mar 2024 15:19:04 +0000
Message-Id: <20240324151905.3817732-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240324151905.3817732-1-christianshewitt@gmail.com>
References: <20240324151905.3817732-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_081921_381821_3826B484 
X-CRM114-Status: GOOD (  10.87  )
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

Placing the snps,reset content needed for Ethernet to probe in a common
uboot.dtsi results in the content not being used and broken Ethernet. Fix
this by creating two board specific dtsi files with the right content.

Fixes: 67d5128df950 ("ARM: dts: add support for WeTek Hub and WeTek Play2")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 ...u-boot.dtsi => meson-gxbb-wetek-hub-u-boot.dtsi} |  0
 arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi     | 13 +++++++++++++
 2 files changed, 13 insertions(+)
 rename arch/arm/dts/{meson-gxbb-wetek-u-boot.dtsi => meson-gxbb-wetek-hub-u-boot.dtsi} (100%)
 create mode 100644 arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi

diff --git a/arch/arm/dts/meson-gxbb-wetek-u-boot.dtsi b/arch/arm/dts/meson-gxbb-wetek-hub-u-boot.dtsi
similarity index 100%
rename from arch/arm/dts/meson-gxbb-wetek-u-boot.dtsi
rename to arch/arm/dts/meson-gxbb-wetek-hub-u-boot.dtsi
diff --git a/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi b/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi
new file mode 100644
index 00000000000..3743053eb9c
--- /dev/null
+++ b/arch/arm/dts/meson-gxbb-wetek-play2-u-boot.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include "meson-gx-u-boot.dtsi"
+
+&ethmac {
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
