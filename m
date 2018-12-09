Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38FDC65BAF
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 19:51:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AB420672
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 19:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rF9icNut";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UQW5XaDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87AB420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qINPnkO20je72ZKToRZeJuMPBlW6zLLZTp6fSFFb0TI=; b=rF9icNutwiwdfY
	hQZVrqD5qyNUZT42oLHWq0Wq7aiRaAKHLf8VVppLrh4s23FsZ0rVKCA+UzbTmvnBACj5M4hTj2VbO
	UB/H9Xu7nA5SaWcN+HOJnNokvWdfAQvceXl+6WWXVW7ZsXTlhObJwUqkyWJfhd2m43i/Sua5aGEQ0
	sTydrUNPOn+7KZBIAE4eVqPLLKFBPB0oV+KQyN1ACyiLxaV+ObMTpaCcU9JEVkoySU2p+v0AgZ/TU
	UCY74ilbHHDQsq1QB+16DhamMZpmMtXFd38z0/HGmzejSAF+4BgNVGq9mQDXzDYRYqX6klqfbfFkw
	WxaI0TGhMrOxGjL+5L6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gW56y-0006Jx-Jw; Sun, 09 Dec 2018 19:51:32 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW56h-000649-GO; Sun, 09 Dec 2018 19:51:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id s14so8930162wmh.1;
 Sun, 09 Dec 2018 11:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RDqsZyP6j8JGDXWLyKC4bYcSMPWO8/JQO0c8SegjH6Q=;
 b=UQW5XaDSB1z/zM/+7M4jWdgmXjNhL6vYrLpFRo7nE8NDe9hqlyeWwetHJK4h52WYGz
 YkP4YtDnnq5JezkClHV+/TTYVaI51iUo/oBnsGbOrSKGWTEH3glTDyjpVoDj4gHpBPO+
 71u8fZLeN++bE1G7Y8Z4yysP21MuLtfrwfLWYg3D1fOS2ZcfXqiZ/kXFZ/OHFeme3w1t
 zgDwAqgOYWCSK+WEWa7kvo7EGQ8+0r5lQLXqEQLdtvnHr+avEOuYpCE2uVL3uX26C395
 G8AOH9GmGh1K+5OCtyXJqFJplAsoNpkKGS8Leigd8AkonInS+nO5E8ti0iouttZXdTAg
 o5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RDqsZyP6j8JGDXWLyKC4bYcSMPWO8/JQO0c8SegjH6Q=;
 b=gGsCzacpQuWD8gnQ8Yl/+mPw8P5o8hxDCbzN0Z1vMBNjLx6vW25NxFqD1i09FAv2Yj
 tpbreq/H/Wm7Ei5uVspMz0U03OI4WVt563vI7soI7zRFUnOyCtMJ+Y9SNj/vL8XDL/QV
 /DExYxyr51EwGMM2+7O9mbiIUnx/BqDr0ylCr7dQjqbBe6OUle6nBEeMqpLA66EGcqcC
 V+f00wnpO0axZiZGz4vagt1kdOpBXRimrHVbBIJBs/eKbsVWwi3MMVUNgSNtF4o5f2Uz
 ieVHBriBDCITlnXgIhtXLl3NHGP+8l1G8f+BmWgMeN0O4okbidRv/IdGGPFrpnHVzxSZ
 dhug==
X-Gm-Message-State: AA+aEWbhnI8CgVPw0fwkAfuQOOFfj/nr6Ck0PTApGCX2tbc4a1z+wwaa
 L99hamNkzoxOIdUNNoWQfYqmYBkq
X-Google-Smtp-Source: AFSGD/W236m2+8BHqCEGDXrqeWxw+vHplbkUfpeO4Y+NnSJsFn99FeYOeK3M6D06Ly6Bun/85yGn1A==
X-Received: by 2002:a1c:2902:: with SMTP id p2mr598wmp.19.1544385063554;
 Sun, 09 Dec 2018 11:51:03 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73FBA00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73f:ba00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x20sm20270941wme.6.2018.12.09.11.51.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Dec 2018 11:51:02 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org
Subject: [PATCH 1/6] pinctrl: meson: meson8: fix the GPIO function for the
 GPIOAO pins
Date: Sun,  9 Dec 2018 20:50:50 +0100
Message-Id: <20181209195055.26813-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
References: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_115115_542781_F447763F 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: carlo@caione.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GPIOAO pins (as well as the two exotic GPIO_BSD_EN and GPIO_TEST_N)
only belong to the pin controller in the AO domain. With the current
definition these pins cannot be referred to in .dts files as group
(which is possible on GXBB and GXL for example).

Add a separate "gpio_aobus" function to fix the mapping between the pin
controller and the GPIO pins in the AO domain. This is similar to how
the GXBB and GXL drivers implement this functionality.

Fixes: 9dab1868ec0db4 ("pinctrl: amlogic: Make driver independent from two-domain configuration")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 86466173114d..e482672e833a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -807,7 +807,9 @@ static const char * const gpio_groups[] = {
 	"BOOT_5", "BOOT_6", "BOOT_7", "BOOT_8", "BOOT_9",
 	"BOOT_10", "BOOT_11", "BOOT_12", "BOOT_13", "BOOT_14",
 	"BOOT_15", "BOOT_16", "BOOT_17", "BOOT_18",
+};
 
+static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3",
 	"GPIOAO_4", "GPIOAO_5", "GPIOAO_6", "GPIOAO_7",
 	"GPIOAO_8", "GPIOAO_9", "GPIOAO_10", "GPIOAO_11",
@@ -1030,6 +1032,7 @@ static struct meson_pmx_func meson8_cbus_functions[] = {
 };
 
 static struct meson_pmx_func meson8_aobus_functions[] = {
+	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao),
 	FUNCTION(remote),
 	FUNCTION(i2c_slave_ao),
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
