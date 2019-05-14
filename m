Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FD2C04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 08:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1811D2084F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 08:27:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AHBR4JP4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v3xu7tjv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1811D2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HCenSJUJ7G3K5kkNPL6/rmIoxYYkqf17qhRUDFau3QQ=; b=AHBR4JP4Jo/maA1V8MH+IBYENV
	MIfSGbonAlLT91DFnsffQTJ4A4V6StLZrfo8YO0kIdATw+gIRucriGavwoy+GqqRng0fjPXQaO3/O
	2I59M+8sR475jNV7yjb0uwznQYkyhbcOBF4yS92LgknhuUuLI0c2wx7FyqXx95XIZTyLPtxtK+f8l
	Ixnt5MqDciVpZvry4UKKVuHUA8tjerxxqqAXRDoJw2MDRENejdNo/DRjKw6SI0tdBswMDfrXnhxBT
	oocCLsFvQwWm5/oxWovTmSpMvMJ2gLWeNU1Kqn1R0jc185nyZieKIh4mh2pT5iICxkk9+pXda7DCg
	CQ7W+SpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQSmH-0004ou-TY; Tue, 14 May 2019 08:27:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQSm2-0004Ug-9D
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 08:26:59 +0000
Received: by mail-wr1-x444.google.com with SMTP id d12so18096356wrm.8
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=msbkGlp4GOhLlJp7h+ns/oU8AGbAhiOw2cYUQ/XgHZU=;
 b=v3xu7tjvWyfaSEtn4pHRnlXDCYWDQ73FPtqaZDcSMRAqeBkyLCwCElW4Etf/UHqdAS
 tmjpx/aldrU/FHEVSknXFUAO/q3MY5dWhKaSaQEWzbZHoCvb3CgRFFehThzxC/48XrKb
 L3CZO6ra+Lmv1EcITN8K2ww8dnm8/794sm8v0lm6v8TFWuEqfH11p7cZOzXe4+tEHc0U
 LOLY3Hsle0ZqEWNbdY3DMK354CZF4tqB6s/aEAqyEF5JPafQPStOY0z6xThkbVyVCMR4
 JKoMQY27au5l85fl4z9RoZJwD1YMLcpbFO6+jXpo+NQhZ4vS53L6svo33sUQiU1mjS/m
 T8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=msbkGlp4GOhLlJp7h+ns/oU8AGbAhiOw2cYUQ/XgHZU=;
 b=g/axnDxsySns/JC61v2z3uYLdfCvr1Uo2AhFVu3APYa1VT0ednSOmT8Zk1YVN5KNlz
 sNxMR/AZeWpNgYld8hYuvxomeVs9xbfWAC7Rze/ASxnV3/lcB6oenESkRvBvd/KzCr8+
 ZnP5DtFn5qzVQBpxkFHIp+YotM7kpTJNb0TustnGLzVBaFKigm5JrV2eImGNQwH5JVmm
 517IS5FvrGO3Fb/0+N+BizBF6ggFNhte+uYmkhTwab09NhVVjERYBuO3qkzX7D9JkksQ
 fweLuzV/4WRcvdO0Ru6kUwv9bWXO1/KVCWUIHU/jwVjakR7hleYJj19DBFgAuLf4+LMQ
 ERcw==
X-Gm-Message-State: APjAAAW1GQ42ddX/yBzwUvM2I1FtzjtoWlRt2p15vSbgg8/BiENqG6N3
 kXLmKGliXJIAMNVVjZHPLYCWjw==
X-Google-Smtp-Source: APXvYqwzs56xDJxA92pMFFuDkKZTbEVAiHK7h/pHSRnD43if/pfZrGEj7WlTCVebkgIwwFKkhSQ8YA==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr10730256wru.312.1557822417035; 
 Tue, 14 May 2019 01:26:57 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.26.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 01:26:56 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v6 2/6] pinctrl: generic: add new 'drive-strength-microamp'
 property support
Date: Tue, 14 May 2019 10:26:48 +0200
Message-Id: <20190514082652.20686-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
References: <20190514082652.20686-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_012658_320871_EDE45522 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add drive-strength-microamp property support to allow drive strength in uA

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index b4f7f8a458ea..d0cbdb1ad76a 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -39,6 +39,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", true),
+	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH_UA, "output drive strength", "uA", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
@@ -167,6 +168,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "drive-open-source", PIN_CONFIG_DRIVE_OPEN_SOURCE, 0 },
 	{ "drive-push-pull", PIN_CONFIG_DRIVE_PUSH_PULL, 0 },
 	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
+	{ "drive-strength-microamp", PIN_CONFIG_DRIVE_STRENGTH_UA, 0 },
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
 	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 6c0680641108..72d06d6a3099 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -55,6 +55,8 @@
  *	push-pull mode, the argument is ignored.
  * @PIN_CONFIG_DRIVE_STRENGTH: the pin will sink or source at most the current
  *	passed as argument. The argument is in mA.
+ * @PIN_CONFIG_DRIVE_STRENGTH_UA: the pin will sink or source at most the current
+ *	passed as argument. The argument is in uA.
  * @PIN_CONFIG_INPUT_DEBOUNCE: this will configure the pin to debounce mode,
  *	which means it will wait for signals to settle when reading inputs. The
  *	argument gives the debounce time in usecs. Setting the
@@ -112,6 +114,7 @@ enum pin_config_param {
 	PIN_CONFIG_DRIVE_OPEN_SOURCE,
 	PIN_CONFIG_DRIVE_PUSH_PULL,
 	PIN_CONFIG_DRIVE_STRENGTH,
+	PIN_CONFIG_DRIVE_STRENGTH_UA,
 	PIN_CONFIG_INPUT_DEBOUNCE,
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
