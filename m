Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897D0C32751
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:15:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E737206A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 12:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQrx0NX0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kzR+HTfy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E737206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0q+ep8D7Tmkt13YJ5zd6e7cuW5CYAQzPBCqY85tabsc=; b=cQrx0NX0XBM3xv4g5WeTEYMy3e
	Oa159TaMElARtqWBOUKndiIQ4RuEOabgwboHxx9I7vGRQWKyjuhAXJhKtiLaIqMUmHqnyzzcGNd6V
	vO2jeKv3vafWcwc0b8Fpw2+XZh+h560UiIzjeY4It55jk7YRqIYMAYT+n6MGP7PRKAQXgDeji89zJ
	MTYBQRc0+Xd4JdyBh5xB634MYiEc6f0KQzmAWTTqQMr9LrVlGqh8mkkMX31pZsa8SLBxqzCBXlQw1
	71EbXhtqzVjT8MicMmOelGxuq8VBxxVBqAd6hBvDIIf2pjOOmnYGwP+MTmYPtiDQCN/UZ5zow7Fm6
	7o4G3yHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsnWE-0008O2-9A; Wed, 31 Jul 2019 12:15:46 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsnUq-0005Ro-8T
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 12:14:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id g67so55499014wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/dy6tDwrDZyQwCbBNtI3rvHog6QhVWeb1hPHlqbhReg=;
 b=kzR+HTfyhqOF5B0psynwHitDS5M5lgyvesQmRWyJVlV9jqMOaUnE+AVFRXp1M4H1Yu
 xn4FMMwB3LiyZTWnm4rZ0nOG2r4OZqBi18gRFUqxrC9weYcDY1E0FavjRHhW5pTtUjuu
 gxUa5C1VfZtk9MXIbl82EBNGyUinA5CXVo/4O4u9V33NHCjscxUt0eSYo2B6krLA3bk1
 vKc85SttiGAvhvj2dTxKNq2vUcVJzUvA8dKoZlBzDKrMIJZL7WArbqHaQSRLTi/lwxCi
 m7RAxchFhPRZBW/pEkGuLftOLhfeEP3DBP283XWvwLO7iAb1GllGbdMntPm9eOZWUx1o
 hrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/dy6tDwrDZyQwCbBNtI3rvHog6QhVWeb1hPHlqbhReg=;
 b=AtwFW6cyIy/JNIOMy0KbXeLnHhSE/Ey0p7gGwoJeNd70QOPQLbQwi4iTjQoAbHMqr6
 EObgZ9Vs0M9yIUirVI37YB5RuxX0x4DrnGA4AYJZcY/DPjzWUFl0z8iF1zO6Wrqk/pdj
 SSquaPgr7Ri2swDvjhaij2BvyeFA0/MpKYn8/kbVr2y3ghe2ENAIvTCAbgSFlepjZeL7
 cmNzXN564M+uH6N7/Ldk2cnxBeXlDTyrzgQaU6OY9FAoqY31qClwkNoBUSbDaEsYTPoU
 UWpg2LqejCIACRzkgRM2kwPThzC5kKbL5N5/QmHp7wAd03D4DlvsUJizcSZUV/1KmiH+
 eDHQ==
X-Gm-Message-State: APjAAAU5YNkXWY1Mwelu2TQH08WkQSMTfwDNmmT+bjGZX9UzL/L6DNTR
 dc85uSOtI4mmUj2ClKdkE32hDw==
X-Google-Smtp-Source: APXvYqwiXLefKrRh2int86J1ClmPTnKB6ds2eofOnlZxzgE2XsT6NJ7qlB851jUxzNz+12Fsd6Bh7w==
X-Received: by 2002:a1c:3587:: with SMTP id
 c129mr114572270wma.90.1564575259044; 
 Wed, 31 Jul 2019 05:14:19 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a64sm3613713wmf.1.2019.07.31.05.14.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 05:14:18 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: daniel.lezcano@linaro.org,
	khilman@baylibre.com
Subject: [PATCH 6/6] MAINTAINERS: add entry for Amlogic Thermal driver
Date: Wed, 31 Jul 2019 14:14:09 +0200
Message-Id: <20190731121409.17285-7-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731121409.17285-1-glaroque@baylibre.com>
References: <20190731121409.17285-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_051420_350888_F4813EF2 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add myself as maintainer for Amlogic Thermal driver.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb2b12f75c37..299f27d11058 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15910,6 +15910,15 @@ F:	Documentation/driver-api/thermal/cpu-cooling-api.rst
 F:	drivers/thermal/cpu_cooling.c
 F:	include/linux/cpu_cooling.h
 
+THERMAL DRIVER FOR AMLOGIC SOCS
+M:	Guillaume La Roque <glaroque@baylibre.com>
+L:	linux-pm@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+W:	http://linux-meson.com/
+S:	Supported
+F:	drivers/thermal/amlogic_thermal.c
+F:	Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+
 THINKPAD ACPI EXTRAS DRIVER
 M:	Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
 L:	ibm-acpi-devel@lists.sourceforge.net
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
