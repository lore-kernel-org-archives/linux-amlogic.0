Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC849C433E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:14:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D4F422D08
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D4F422D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qrRcGsg26YKoVkZ5MnQxrYKDXQZlNCHG4MHr6+jv8g8=; b=uXXo0dVN6SOb8PTF0HjhNYQ0G
	rbyO2w38P3xUZ2ud8zo1q8EQMT0T2uou9x0Kf6Tr1HtJ276BKmnW6LQwZ1zltFg21OJ/DpM2E9Y6c
	Vxct3LDep5LBa37dHv+HEEGBgzks3M625lQdkcNSovtSC0xPZVUq9IsSu9YfDJrgO5cFbbH/Yv45s
	qKx1ds+oComsbwNKEcc9JDJ70EuXMFK32m9ZkGyD64Mn9OqFygGN7Niw9SSgqCEtPwTH3jWBCoxVk
	9ZRqXuAlmznBTz89KAhUiKZivUW8KofuLNTejIkxH6heSPf4JtP1+7ElwuaHXPZFIBelTyw0zODyt
	QYTYITzCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPhD-00021S-CI; Mon, 21 Dec 2020 18:14:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPgl-0001su-VG; Mon, 21 Dec 2020 18:13:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 190so10731332wmz.0;
 Mon, 21 Dec 2020 10:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYNvrmyBcR24qaTBP8yatBcY626HdS4K9apXn77mSNM=;
 b=lD267zahUVgA3DLau9u4L0oNjrXSi3d0rZHEzzA3ci0+hZfHJbDbQeSqa8dyZZgm8A
 Qiha3IP/O97P1NRVUm0/yueKbU9MfRiUZHURyi+oJEyoYaZM7wI6vFuICqR6Gc2kZRdw
 FwOC3bM/EiuB+KT3rgLfkgO+GNvW3GF6mmoRWejfhG1mIfGBt4ybgUSmynzTnDj25MP2
 JrWt0W1TCL+AK9vAssOHE5EH8fl7HjedxcbAkXmylnqJweqfKLeZK61Lywe7lAnDG9N+
 Lzlq+ssfe7dKMtc9646Gzs9+XgQ4WV6b5gJbQ7QGW1Mv/Az/unY+Zh2fkPyDh56cNYGW
 9jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYNvrmyBcR24qaTBP8yatBcY626HdS4K9apXn77mSNM=;
 b=gMDtrTEivDMyaG6pF7xgs41/Psym6IWnnqYmvSwxghhuZA+kfPH5+JV1CuuhdqBbFI
 L8urOWE5a4mA6SVsPZD9BJmphLK85d6rbPazwKlr10LKw6SuQOpoL+TrFgkrWJYPHOKG
 B63yIXruZ/pBS2oYz2nvPPGze7anwAsDbfPg8/1+4vrqMyLSlfklBO6ddaRqZZAn0X3Z
 s6aRTOUY2iM1aSgoy8PFFES4aw7ijiyZDIKsljwAg8Lm7xXZrf+WrVSzWbM4F8MJTBr8
 pgfMzxjrOMgpq7MK8Wb2dVx/NXjKnURc4+IUz0TXGt5TEW7S/Qi0DIptoeI4lxXyZu3J
 Chow==
X-Gm-Message-State: AOAM5325t58ylBdjg3jtPvEDREzcjnywefly2JpkGJMVQ1pQOKz7XfaU
 +YtMW6APrbQaaNGXsL0esKJU0Yn7CI0=
X-Google-Smtp-Source: ABdhPJxbLR3uHnt07Oa6Z3aVJYz+7qis1B/0BHuj/Kq0dNDM4BADbUR3yfKav7Fm5wX8dC42z5Lizg==
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr17698718wmj.104.1608574422400; 
 Mon, 21 Dec 2020 10:13:42 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id m11sm23434936wmi.16.2020.12.21.10.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:13:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 5/5] ARM: multi_v7_defconfig: Enable support for the ADC
 thermal sensor
Date: Mon, 21 Dec 2020 19:13:06 +0100
Message-Id: <20201221181306.904272-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
References: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_131344_101113_800F5F56 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

32-bit Amlogic Meson platforms are using a special ADC channel to read
the SoC temperature. Enable the "generic ADC thermal" driver so this
data can be used to cool the SoC for example by reduing the maximum CPU
and GPU frequencies temporarily.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c5f25710fedc..0a55240ce2fc 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -515,6 +515,7 @@ CONFIG_ARMADA_THERMAL=y
 CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
+CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_ST_THERMAL_MEMMAP=y
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_DA9063_WATCHDOG=m
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
