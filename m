Return-Path: <SRS0=LORm=7X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C67DC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 04:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091A72072E
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 04:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WjQuiJUn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRJmMAcS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 091A72072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=I/OGKxiKxpkwdkufC6kFz7Ob/MoXx469jMmKTFcMbDw=; b=WjQ
	uiJUnWOFvhY4B6XOujuDedZIJkg71XS3UZCwecdfPGgRWRUKTkPoefsp0PElGE8VJxAl6KZ3w2cVB
	ZDunBk0z4NgMCubAj1fQQvtBvYZEVlVaz+gUit6lyK6nZib2zlSPWz+T4SoYQHoky83/huNLcgt5D
	uxRbHBHVodDPxGani91wpBws0r7dz5Nq1yNsccWQEROM4oYku1pYZclkTupn1gp+bmaHuYdBYVyMy
	WuL2QakThfI2g+wXi5b3cNs0qoDKPYk6Z1oe1J6aBOTKgBzIKVkrHzUZLSAm15jGRI4peQdCyzyav
	0vQSxiG88vm3QLIgITnB8LvwacU9H4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jis7X-0006BW-9G; Wed, 10 Jun 2020 04:13:47 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jis7P-00064y-I5; Wed, 10 Jun 2020 04:13:40 +0000
Received: by mail-pj1-x1043.google.com with SMTP id q24so341995pjd.1;
 Tue, 09 Jun 2020 21:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Aos11RqaPZ+e2YnSb8NYoxbzf85DJlijsegumQu5D/4=;
 b=FRJmMAcSqqHwvC+rKTP0lt2u8OtvhL7uroLmmCqAc/7ctmav8v1cWVkjWskgNFmz/X
 JA8lGiG6OGwHNc79nqRPaN2ciqerP3jopIdAbeXAdjm6b1BmYs/S8hLZNUeSDv+69R4t
 s2fQcVbU8jRh5ItTQMFOp0qVsvoJ8qbYrTYnWsNbIlSTqQCgaATVYDKRxguUOFnWdhLS
 H44w8FVqyMdKBAK5C2kv0vb7wsmyBbOxy/B8j+5jZiQSEOk4A1agFUM7bZa1u0CczU7M
 eaqLiXzrydUY6us2zy81s25jumAdN7pC5eb7yDs20zPGJHgRlN8EICX1QghnqL+7/lZ/
 AWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Aos11RqaPZ+e2YnSb8NYoxbzf85DJlijsegumQu5D/4=;
 b=ETvD/szoxX89Uqo1yR+pQhV6yf7cSSt+mIl0hm6ZfVveOWSA7p+SvivxUf1QO9tx3H
 zTYLTGNGIBtviXNOkDEIuY8AvZXo4Qw+kJtNCUnsHyMOzREdtKGqiRyI0COKjhP6rR3A
 y+TYnlkyXbpRDYJ7ny+2Rx6vje+MPVuh4eY7mcGjdrjsyXQXB1yErdRCStRDouDFw3FQ
 vz0u9m+EYNlUFwbsITmCau+x4xi8EwEhckZONHcBgQ4nIRfFnKa0+6+acWxZrhjrod0J
 xNnI7kMD2iuvw8yvJ5XEqRsm+NBOnP27IP8gypSVVZcaIUaGm2veKaKsC1fDWuDw1k4r
 5kbQ==
X-Gm-Message-State: AOAM531dl+9EAiQUXnWI04VSnj26EojkSi7DkpwqWYz8v3lF1LRFWfdI
 eafLRUjCjA9bbm2brK87JgEgOfh5CHK6CQ==
X-Google-Smtp-Source: ABdhPJx6zMAjL6TpjNgXSxp7AZ0zuAmfpF4vKmHcy5qsE/ExouW65YcElpKUv6vOARbGNm3FLTgNIQ==
X-Received: by 2002:a17:902:848d:: with SMTP id
 c13mr1361408plo.289.1591762418532; 
 Tue, 09 Jun 2020 21:13:38 -0700 (PDT)
Received: from localhost.localdomain ([114.204.138.55])
 by smtp.gmail.com with ESMTPSA id o1sm11887461pfu.70.2020.06.09.21.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 21:13:37 -0700 (PDT)
From: hhk7734@gmail.com
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH] pinctrl: meson: fix drive strength register and bit
 calculation
Date: Wed, 10 Jun 2020 13:13:29 +0900
Message-Id: <20200610041329.12948-1-hhk7734@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_211339_617557_F75AA25E 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: linux-gpio@vger.kernel.org, Hyeonki Hong <hhk7734@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Hyeonki Hong <hhk7734@gmail.com>

If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
registers. However, when register and bit were calculated, the first
register defined in the bank was used, and the bit was calculated based
on the first pin. This causes problems in setting the driving strength.

Solved the problem by changing the bit using a mask and selecting the
next register when the bit exceeds 15.

Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index bbc919bef2bf..ef66239b7df5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -98,6 +98,13 @@ static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,

 	*reg = desc->reg * 4;
 	*bit = desc->bit + pin - bank->first;
+
+	if (reg_type == REG_DS) {
+		if (*bit > 15) {
+			*bit &= 0xf;
+			*reg += 4;
+		}
+	}
 }

 static int meson_get_groups_count(struct pinctrl_dev *pcdev)
--
2.17.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
