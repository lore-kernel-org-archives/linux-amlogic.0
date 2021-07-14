Return-Path: <SRS0=cPU3=MG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3D3C07E9A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 13:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CFDA613BE
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CFDA613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sXwzWoPLbRpQ/NrOyzBVX8VtHSTidDqFd0ZBzFPJ/1k=; b=FtL/9xh0EiPlyb
	X0tWLEEuT3+UGFWm9Xm1Gmtm/RkuL4k30hRb/Y/J4dGl6q8JqTA/4xlxd5LErkeoqW2UzS4VFu37v
	ymYoo2zU2E0hn7G5bADnbMO8dITyNpIN7W0dzsMj2uYKAiapp/dHQum3MunpIXIX852lEjEhEqUAG
	PomfrqtVt8Dgj6WECjQy2JLIn6sB57uSwWLn9APGggJZ1J85d6cO+p/L/TfXn56e+v5BLjmd5PNPS
	gbUIls35WaPUbbEVjH1amROwmleGNgwc7sNNl6yD8lUTyU2/0L0Pow003KAPeu44+5tz8s/GKQGt6
	8YN+kNzt3cToKGyMLKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fDD-00Dhwt-6K; Wed, 14 Jul 2021 13:46:07 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fD0-00DhwM-Ak; Wed, 14 Jul 2021 13:45:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so1476388pjb.0; 
 Wed, 14 Jul 2021 06:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YEHNelSphOfhN2CYAYUItmw3NXf1k9VBjpF1JvYJEVg=;
 b=Zy2/ynkygPoMjSuWqCGo4hfTMMhOP6yP+Sl0eFkkgaPX8y53+jbbMLHIZ0XpS7AxgV
 kY5VpSM8GUG6XZNTmg+cZvomjzhFte4va1maXe8xmMMtfeDgMTi6fM1DCj65UpV+B6nc
 9aT2Fx6yWcv8n06o04B62h6M8i9Xe0tC9ocBPVrSzEigLK+zENbKgYsTlzsrNqVjU9Ry
 iIQBFKw3MrAmKjHSoCrgO3GJu143h+hNB749z6balhWG5Hj0AuiT2a9LTFlf/xysn8DU
 eLOXLZe6v7Ii/9kX3Gvu6SK4JAZv686/nGnmHFkRdk4iKoiOeSHh0k4kdvTOqLpQ2bEr
 2yLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YEHNelSphOfhN2CYAYUItmw3NXf1k9VBjpF1JvYJEVg=;
 b=rilWAltwk940VEEhse+k+FNtUDDlZQbbPArNNZT32pcjguAO1LApujLrufd/nk2gsL
 7tqAAqvmT9YPC0nIouKzcyWcqQaPxX4KjDNLksLaadBsVF9NOv73G1ERH4ifSv25CIXR
 4iU3kIBCUvumxrvJUnjo6S6zttYZQT6PfioYa43XnAz03OFdd4wMqMZpV1cSLBV4CbrL
 y9Y/K7AsPUbHSsqys+YpHyFbmA6YCgc+YQ3xr4FpNa37HHZ6p2EoRHcYIKL7OtPGdBoi
 dux0ppe4HEPQT8/nSMmiYhvGERf9iE7p68vLe2V+8dwWlVPaHQQEMb47tRelok59WgSO
 coXw==
X-Gm-Message-State: AOAM530sLqAgNtqq4tWBK4oh/vjDrOvi68r7r8eAGEjTlNPTpWm2OfpC
 6GgTAmZku6+dXIemljh5TyepYKd3f1A=
X-Google-Smtp-Source: ABdhPJxJFc4V0yHzNyzRNPg3A4LXlzSl3Qxlx870Trim8fuLxBUSW33NVSfCoxUymp5cwf8BWeoHeA==
X-Received: by 2002:a17:90a:1c02:: with SMTP id
 s2mr9796635pjs.172.1626270352963; 
 Wed, 14 Jul 2021 06:45:52 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id d2sm3033625pfa.84.2021.07.14.06.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 06:45:52 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Lionel Debieve <lionel.debieve@st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC
Date: Wed, 14 Jul 2021 13:45:32 +0000
Message-Id: <20210714134540.1722-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_064554_415299_345ABE9F 
X-CRM114-Status: UNSURE (   9.81  )
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
on Anlogic SoCs boards enable support for eMMC and MMC drivers.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Tested on Odroid C1+
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
