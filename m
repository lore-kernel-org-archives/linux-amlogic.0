Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2FBC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 02:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C034820776
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 02:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NMxlg1Cz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce2KN786"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C034820776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=28ynuAQVRYGIaJ8rbgJHpXhdonAuYNQrvJg4Hn45usA=; b=NMxlg1CzqsVgl+
	9An5E0IVG01eH/SOUoMm05TwewpZww6r+BJof09XSRxLoxTK8IbwY/O6KJK+FkL93HkDVq8bAQsP2
	FDdo9miQJyN0cVSocuHfp7TmdPih0bY+nwWOZS/6jkpVn7eH0rldKTmgZ2PfRZBNoynBaMUtiLSqt
	xN2lzmN7jgJOLjsxK7+5qMPXV9qgrtg18vzbS7K6IdGtqU+50Rq8SdP3gAqUp1/Bx4Uh8xB5SN6Qa
	8c2rJFbjGkw+QQZyN5EDdudGYKjSXdCubiRhdrp76rSGsGlC7w3ZkSy7cl1RyMu9IPGfOYkNKyuzy
	gkUFUmnGcleeuWUmfPIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlkm9-0007zq-El; Thu, 18 Jun 2020 02:59:37 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlkm1-0007tB-6n; Thu, 18 Jun 2020 02:59:30 +0000
Received: by mail-pf1-x444.google.com with SMTP id 64so2089440pfv.11;
 Wed, 17 Jun 2020 19:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=c+XBBSUJkbuSD8EzkachzbNQFLmI3baAWx8Tvz5SX9A=;
 b=ce2KN786GgRadse5m9yAoPlwSIL8pcph73/I//OEEO+UR3c+knDGQIQwQEMWusaoxR
 c7pEFVCQBTemK2twFjbMAprzclbJfSXlvxSwZEDK4NJZbg4jFJzsidCoszJm1akXutOb
 rBeEVOVOQRD8f6GCeckk6oBAjBoZwbCRaB99odubFDPTUCGyqe/N/9ls/xI2juTMYmth
 R+yaoAX6CqZQuUpynGvQ0vfBb4G7TFvCQGydsdX/oML2LpmHd6zFr82rEBqNOzbBhiZa
 AmwIQHb0fcd6R+jRtfplgvhLANX2HEniV8Nl6XyjIqgSE4/CqjpI5+DO9ALOVronKyJh
 SOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=c+XBBSUJkbuSD8EzkachzbNQFLmI3baAWx8Tvz5SX9A=;
 b=NUsS7fXk42av55Ot/w2BZjNO4SwhVHKkbuyaA0AnDlZsT9tzT0gyv4TGWUT/YYlvDL
 6c4/7AhQsgyJR0rZ+lJIAlR05SDRwnazBbLbNBuSM5vmY6ojh54A/oFldTxEGWkhY7tK
 bs3xjmnxio53U74LJzqp2SZIWgCfwyXAsIdFJkVRsgSxXv27JLt0LmmLq0pj0jUHIDIS
 eeAfE+WO+owTV3GD9rsiCXDI2V5u5NHnFfch+897gNWF4Cm5mdKh1oUrcLcoU4iSe4LH
 5hUUOOKFnrtV8T5VanaEkvpVCgYEr0LhRnWyV1n6fB+sDyUD3uj2Yr7Im+smE29DMJWi
 7veQ==
X-Gm-Message-State: AOAM533DZiEuSwIkXeMVxf/KXEzXiVOF7GfFBIuqJdrZWbOj0CCMJPRH
 wRXH1mFS4q8G7KNkuSPj6LY=
X-Google-Smtp-Source: ABdhPJxvua+/GIpND09OviVKdksZLCWgeWga/Ef+nBwx2A0d5tunbidPFHBYJKkdl+DxEaSXQcryAA==
X-Received: by 2002:a62:3582:: with SMTP id c124mr1694339pfa.298.1592449167930; 
 Wed, 17 Jun 2020 19:59:27 -0700 (PDT)
Received: from home-desktop ([114.204.138.55])
 by smtp.gmail.com with ESMTPSA id j184sm1094045pfg.131.2020.06.17.19.59.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Jun 2020 19:59:27 -0700 (PDT)
Date: Thu, 18 Jun 2020 11:59:22 +0900
From: Hyeonki Hong <hhk7734@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, khilman@baylibre.com
Subject: [PATCH] [v2] pinctrl: meson: fix drive strength register and bit
 calculation
Message-ID: <20200618025916.GA19368@home-desktop>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_195929_268147_77BB0612 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
or more registers. However, when register and bit were calculated, the
first register defined in the bank was used, and the bit was calculated
based on the first pin. This causes problems in setting the driving
strength.

The following method was used to solve this problem:
A bit is calculated first using predefined strides. Then, If the bit is
32 or more, the register is changed by the quotient of the bit divided
by 32. And the bit is set to the remainder.

Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index bbc919bef2bf..bf116c2e45c0 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -56,6 +56,10 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-meson.h"
 
+static const unsigned int meson_bit_strides[] = {
+	1, 1, 1, 1, 1, 2, 1
+};
+
 /**
  * meson_get_bank() - find the bank containing a given pin
  *
@@ -96,8 +100,9 @@ static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
 {
 	struct meson_reg_desc *desc = &bank->regs[reg_type];
 
-	*reg = desc->reg * 4;
-	*bit = desc->bit + pin - bank->first;
+	*bit = (desc->bit + pin - bank->first) * meson_bit_strides[reg_type];
+	*reg = (desc->reg + (*bit / 32)) * 4;
+	*bit &= 0x1f;
 }
 
 static int meson_get_groups_count(struct pinctrl_dev *pcdev)
@@ -314,7 +319,6 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
 		return ret;
 
 	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
-	bit = bit << 1;
 
 	if (drive_strength_ua <= 500) {
 		ds_val = MESON_PINCONF_DRV_500UA;
@@ -441,7 +445,6 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
 		return ret;
 
 	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
-	bit = bit << 1;
 
 	ret = regmap_read(pc->reg_ds, reg, &val);
 	if (ret)
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
