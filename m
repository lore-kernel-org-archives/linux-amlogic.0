Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C8FC43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759A920657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uEO3pod5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QbubSx7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759A920657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwn41uycdje2x30qe/K3tkT6Wb/J2nImDP99wLy55fk=; b=uEO3pod5TZjyBo
	v0Sc20XJqYH/n5LR6FQex1TwFUgjv8nMMhINDpOPorOrH/9jAGJgDnKeD4E+8fjGnsCMenTgsXxhs
	7XDTe1A5OMQzqJRrz8GSo+sMowkiHIp4G9KyiJKq1aj/hpOU6w3GCNnrcaWOfp2lENQwPhWEJvziV
	wE9JJzTbB+da4fkxQHdXuLpSM9K0zaLc1EU6Bcs+CPWkT/OL1zFWDDZ9xnb39J8DJ12j8HwWNc/9D
	vFT1tHM7ofNtdDEdkAjmMojOfFBao2nBfsKaJVEnSbDmhw2f82jzfJSRPPpvuLSFYsMPkhf2R/UoK
	cgeofC8gdQhFNmNlM0gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRPm-00074D-CA; Tue, 15 Jan 2019 16:18:10 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPi-000730-W2
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id m22so3829817wml.3
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tRHoOLzANOKPpIizn+G1Oshx9wIFqFpicnZ6nwIBycw=;
 b=QbubSx7Su6eE21BV8BuRZZ8Md+wxZ17ESB98oR/+RbaeG+VK5TdS8GB6vYFTdveAES
 bUuEm4fln4aZfAEa6vxLckfkbskQQffEs+0B+rhs6B8D5ZtD5F3bVhZmFsD8M267A7/m
 65yUun0Jth9fXDLRsW+WkjHrTzHfAyuEFAi+SY4RuGTwTH+4byABLDFPZ9HCYhi7M2wg
 YuGdSpTpsb1sLdKOsfTysdEfwOiRkTmty7yOmlcxVEdDJhT2vp8YVDVyUDldd02gKvAe
 z83PLBF6xHaplCNjInv9m1uZCruI0BWjSTIk3XOWRlSsfdVksXs0N88sr5yC/vM4Fag0
 l5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tRHoOLzANOKPpIizn+G1Oshx9wIFqFpicnZ6nwIBycw=;
 b=P2Ispfv8lgIW5IzJHy8D9NE73bvE+4K1eoxHQPniHH+XfuaUzXAYaIoeuU6gG8cJbp
 eLMX1aal6y7N5prkN8VfaUXzCIQIVUbawEJj4l60zk9dTJhexwN7AAa4BZ0QNO4ve5/D
 lacGa2uF6g4vQ71gbSG4xRxjrMYdRVnY0BV6LRXnr032ebN0yPhZpgII4/0tiZPkR+PZ
 eeJdN1tvqSzqiYochKh+qynNW3XG827VsC/8FMZnWyRoV7wKuA0+yGX6xRC9Lmzp/5Ui
 n8CdOqZAL5TDHhfVsak9F/AaMfjC9+yyc9qviBPkcAewKj00zswnYemMjQ+9eGBrp0vv
 wvNg==
X-Gm-Message-State: AJcUuke3SE3SMrs1q+Ub2+G1qv/fOB8dM3H7d8zeFnHHh29yAFGUWA4x
 Fv8IUd6BJ6kLY2pWGIE0Snd7vWHUraLpVw==
X-Google-Smtp-Source: ALg8bN7EnNqoEaovaYLlzic4sjmMiqJOi+Zlb5915yxsi4+CIWVKNIXJ5tCJPuE9If2wFWVfKZXfZA==
X-Received: by 2002:a1c:d00d:: with SMTP id h13mr3891939wmg.13.1547569084612; 
 Tue, 15 Jan 2019 08:18:04 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:04 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de,
	jh80.chung@samsung.com
Subject: [PATCH u-boot 01/11] power: domain: meson-gx-pwrc-vpu: add missing
 depends
Date: Tue, 15 Jan 2019 17:17:49 +0100
Message-Id: <20190115161759.1657-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081807_096977_C75DDC5B 
X-CRM114-Status: GOOD (  11.46  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

MESON_GX_VPU_POWER_DOMAIN should depend on POWER_DOMAIN.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/power/domain/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/domain/Kconfig b/drivers/power/domain/Kconfig
index 93deaef809..06bba6220b 100644
--- a/drivers/power/domain/Kconfig
+++ b/drivers/power/domain/Kconfig
@@ -32,7 +32,7 @@ config MTK_POWER_DOMAIN
 
 config MESON_GX_VPU_POWER_DOMAIN
 	bool "Enable Amlogic Meson GX VPU power domain driver"
-	depends on ARCH_MESON
+	depends on POWER_DOMAIN && ARCH_MESON
 	help
 	  Enable support for manipulating Amlogic Meson GX Video Processing
 	  Unit power domain.
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
