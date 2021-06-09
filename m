Return-Path: <SRS0=+B/b=LD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5994DC48BCD
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 20:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526D5613DF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 20:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 526D5613DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LdGpCwuTImIVS2YWoEF/aDllwygNg5+GtgpNCi2NQHE=; b=yddF8i9IWq3T5p
	LeD35zyvjonRn5XEXILVy2gBJT9Mb1ibdeYXO8tofnJTqUjfQSlQdbdFAu3u514GM8FN5PL4tIKfh
	Dbae8EiFk+PeFmgFIQSZ0TMD5tIXEcXQyHlUBWqDjBOIraYMJPwsvEJtq/n9PYA0is4/OgcsRFnGU
	IenIX6It/zZrhvehL4rF2J39yIIqU0dlkpgnqDp0PN1j7/V+r4HEVTZ4u2LBcGymhpYgGEemavRdR
	9AfjvU+unGG35DeUI8X8EaalXstu1K3OhWVhWYeIOQNlKUhYtA1FgeGHoruGMNouabrkaxOCyEr8a
	lYS2fOGZfcRQNG5LJ+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr4gf-00FnAm-4O; Wed, 09 Jun 2021 20:20:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr4gc-00FnAK-4z
 for linux-amlogic@lists.infradead.org; Wed, 09 Jun 2021 20:20:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id ho18so29342517ejc.8
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Jun 2021 13:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1GjlLUDtM2mEAEvdu2FMZEVrykbRH7EpEHQNoxkDU4=;
 b=niZu8GLvw1ayIHdeNNDj6brBfFOpWsKB3p1cyzLN9Jq5nuciCUMYN1nwj0n16gtAfZ
 0vvSwPQRNEhEXTLkwsfH92bR5I0qMebE00KEDCdOezV/q0xXI3+u03aS3PVsWsmfJbad
 2xAbeKyA8nCuyXC/cpKA5QwasrWMdkqJhE8x1vDr0oowPr6vStNZjz3NauwJVkVXR7uW
 S6+kmLOsx3+Nslxgc2lGCuv5AFbgaL/q/fiFwL7UNCfnQFxA/JvmqM8zir9rGLOeaaUd
 MQwkQZDE9derH7iIOIEXQvL1JNNr2jozF3TpVoURl4hvLuG1Q1Swnfa4BxNRm0HR4mWw
 aGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1GjlLUDtM2mEAEvdu2FMZEVrykbRH7EpEHQNoxkDU4=;
 b=GqRfFIqh+tM8MwTAX5QO5gKocaRdPiX37BXsfW1WWfLQioN97IqbEzyJBc7nznvEGD
 i8fXfKMV3pg9iFRPfXWtyv0NMYxc8u0gWGztWPrnYYRTeEnfTwtpdm5DBzbk5kOK8eD8
 1PL4vZZJnWI304RLHf6SgYzi8qORMbbaXpTWnWx2PHyE/+iP4mXMgBt/82i+NCnqfMX4
 0tMTqKEedCEJsLWeZ/jpzr6BvMrTulNyTeOtBSu2VS5NGSn0Ox58VOTM7je0l8TJwbge
 tw7eh8LspPUDFCLMZTIWINfe2dhtyjjt3xTXcYCVDAS533mJy6r8nJkGEZSo8x014Nwr
 xGgg==
X-Gm-Message-State: AOAM530kYisCmRuzeimcxBXCkYwYC4lcZdIF8XvbM84lu8YnqZtX+Tke
 W46vpuj693xU18OPZJi/jEDEeA==
X-Google-Smtp-Source: ABdhPJyE2We8oSGaqvQe0DO/z+AqXv4xQ+RUCvWYLtVth4uml/OhWI+D1bK/0hDRlO4uR5ZM27ZHYA==
X-Received: by 2002:a17:906:520f:: with SMTP id
 g15mr1510005ejm.126.1623270023173; 
 Wed, 09 Jun 2021 13:20:23 -0700 (PDT)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id u19sm249358ejt.74.2021.06.09.13.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 13:20:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] arm64: meson: remove COMMON_CLK
Date: Wed,  9 Jun 2021 22:20:09 +0200
Message-Id: <20210609202009.1424879-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_132026_279712_97775517 
X-CRM114-Status: UNSURE (   8.05  )
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

This reverts commit aea7a80ad5effd48f44a7a08c3903168be038a43.
Selecting COMMON_CLK is not necessary, it is already selected by
CONFIG_ARM64

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 7336c1fd0dda..6409b47b73e4 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -165,7 +165,6 @@ config ARCH_MEDIATEK
 
 config ARCH_MESON
 	bool "Amlogic Platforms"
-	select COMMON_CLK
 	select MESON_IRQ_GPIO
 	help
 	  This enables support for the arm64 based Amlogic SoCs
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
