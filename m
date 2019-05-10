Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36DDC04AB3
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B374C217F9
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdaUQ0FK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KEXGh7nm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B374C217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HCenSJUJ7G3K5kkNPL6/rmIoxYYkqf17qhRUDFau3QQ=; b=NdaUQ0FKPvYmFcQ+hX/bchSdvF
	j6VLZ+YD8LXNeSD0etP1GAMIcttH/j+4RfRuWen59Roi+yhyOAYQggrTabcdJGDyXUo5+RLTs2Pis
	d0v64DW1YDn+bcIGBpleB3LGPjurFXWqCl8mp+DAJzzU1N0/o3HEHB+Yi/Aj3LQDUPvEW3qlhk/DW
	18LRI3ZGD5JkMw6RlBhkamw+c8LS/dSFnv0+lOY2Tc5ntNfnucu5CLit11l85l0e5jIkPcakocLA5
	S7hlqUXN6k6IKb/NPhjdgiFGcWgk+kEFR800t1HZSipPvRyz9+HsK2zs2XEPQWDixYqOW/APBo6M+
	uko1+FUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP0ob-0002X2-DL; Fri, 10 May 2019 08:23:37 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP0oT-0002LR-Q2
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 08:23:33 +0000
Received: by mail-wr1-x442.google.com with SMTP id w12so6714725wrp.2
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=msbkGlp4GOhLlJp7h+ns/oU8AGbAhiOw2cYUQ/XgHZU=;
 b=KEXGh7nmUykMyg4yXJZT+cyBY0RHBUaLKxbcmNjZm0Ue2syRxhUuLCc4400XQLSZgB
 S+GhphIVuI3lFYTP8irlP2sQH40kocQ0hixEGpeLhj6czFzDPD1Jz8ckItkX8rc0cxY2
 Z/mWafEhmGgCFn+vKOw0+80CkwXD19tLEpWn+rRttIw/cKqhdJxk+2VJRa4Vm5fjxBBt
 MWhM/MwyzYhHezij8GnP1YRmHWdl1+NFQ505YEhvwWJAHgGJk+t0CjjZ16nf3grszchd
 i+I1gjdrY+fkg82fWnFx0gl396JA7lutRJa6ODULUeUT2qJ9sgsRJbRrPfgeczOtLvKZ
 8AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=msbkGlp4GOhLlJp7h+ns/oU8AGbAhiOw2cYUQ/XgHZU=;
 b=mDJnF/eHGoPPlPctacdYUZVBx6uKhW3/h6Ggv/z3Z4mt4DitMnHPHjkEkqv3B/qwUO
 y5ogRqSRLSkdDYoKMUm45MoEjJlRJUxDQXdSkVIvGCDarTQgk3OwjaQQeOh5GN/Bhn08
 khIbiEzonf7DyvtzHP+AXl8+NLIhaSTItIAaRTgRt9vl8kUXAIC5zY1JJBkHv+86lzKP
 F+UbzhZYu/EUr1XPsxT4CbsItp0nKyC5z3+lKDpqzz2ByVNYQtxR0Nr29Mih4NMeH90S
 vXbf1oJzV579iFoiumMIGK1fw04iImV576QjGoio/GDG8RQTomSd+xJ1/kIxqWlVu6gb
 vp2A==
X-Gm-Message-State: APjAAAU1XgGfzjb7xN/HStvlAgdi/39DbGYUAM6J3DtoTArCkgqedk2/
 hKqmDq1eu8qkbN15l5HRIMbDQg==
X-Google-Smtp-Source: APXvYqyVjzp0+hFVzgtYATfdbzr59K01hLStgvR1iexvFc+PiLzKfBuLpxquocim6U65M+dIkCbloA==
X-Received: by 2002:adf:e908:: with SMTP id f8mr568698wrm.124.1557476608527;
 Fri, 10 May 2019 01:23:28 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z4sm3790285wmk.5.2019.05.10.01.23.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 01:23:28 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v5 2/6] pinctrl: generic: add new 'drive-strength-microamp'
 property support
Date: Fri, 10 May 2019 10:23:20 +0200
Message-Id: <20190510082324.21181-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_012330_109899_A7E7627A 
X-CRM114-Status: GOOD (  10.03  )
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
