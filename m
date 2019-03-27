Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9038C4360F
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 15:14:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94BF4206B8
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 15:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aSLh4bNy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i1jTiAj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94BF4206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K+9+cZIDHIX5NhwhfUZZL65qkCgek6+Ct1pYEHGpuQA=; b=aSLh4bNy0cT9k2
	RmJ7i4QREyMyihrUBV0DpqhJYxwIwyW6j4SQj1K7hwIVXn1l6+hbAcbgKBydSAU6QW3awCLGUYmCr
	TVvNv5C1amDUgopV7tSVjjxwDTg3beg174kPgjA2pEBkI+LLKv8/kKkF+izR8rt7O+LKL6dxqsDjN
	36twPr89Nmw4XSte8KmzpvwKmp2OeBvR6eRXGAw90ET1C27gND7fwnj4o6Eo1s3Y9/Mp7IbHw0kjM
	ESW5u/51ovsQU/ZQpEGuPO9uLIxyBlFHkGYKyXX1ybjI47yWOKXwXV9zU1U8yJ8nlUVHbc42OlTrO
	Q3k3sbj6f3RZQzisIYeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9AFc-0005pl-GM; Wed, 27 Mar 2019 15:14:00 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9AFV-0005kB-0S
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 15:13:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id p10so19068583wrq.1
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f3oew5ViwTuk1kp7BHOXkdHpa+6yyRMKho3UTYQdnYI=;
 b=i1jTiAj3AoEO6myDfncnDV1jLZnvl64EVCtJl1etsyCMiWhgofoHdX4YJwiqNH0SoL
 mloR1rI47Q9Q0awzpgdPQuQLyJPM2gOgpAQkdIkj7wUbZP79Ax6pqPVrvZZulSM0vT0U
 Np7PmmvFdc8OKkqaWjthX+OaUOdtX+/ksKoKxUia3MnB/eO7LcN4k3FeihUvZBObfOm6
 0DIMUfOVHfcjSyL/aK05Nf2VijcoPNudsAS+6QyBqSpgUwd0H+GsC9pESCxENGiOth8r
 YGU1LhqMKZLPYuX666T66wucJ+YZ4TZ5bu8T8PlYXpn2S993SwMHwrTv1BR0pSvgW3/G
 d62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f3oew5ViwTuk1kp7BHOXkdHpa+6yyRMKho3UTYQdnYI=;
 b=nmC2oPN0Orhdua1RITasyeCQZXQkomqCYeGCJPu+wIhpwm1aNW+miZgLEf7JdoRfYs
 1+PjIkCMTnyNp2QFU9qddm/QlGCdShAalMldNXzvFkgI42jMQPqkGj7lDrtqcGF0r3lD
 e3gLWHZm1Vma9bgTL460ex2JFtMHXRPdySQH0UBccZPx9Rrq+Rgs7PllAYGPX00qvGjr
 P3qjm3miYqdnSC5P1kp5mrqMQ2zdN9h6lul20gqvvt1yfu6tcR4NNzP6Mk3TdPcCzJlc
 CcgviHrmkfBR6Oj/Wwlj/UQRnQC8EaFWeN5jPHfkWBRyRt2QXkRJZRIhRAQS1qbFnsg8
 EvUA==
X-Gm-Message-State: APjAAAWTtdN5Qx7poVgWnB4k0znduzzdcKXntN1IOatQd2v5cBIj5Xws
 +mmSkvGBbrHcX7/qlG/zY0v3qg==
X-Google-Smtp-Source: APXvYqwaRk8d6lxeTnXqorNA366NMkTZpHeSdyCOnqkam9kOh62Jl92t32Sxurm+tceugrwK3TWVRw==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr25533754wru.140.1553699630784; 
 Wed, 27 Mar 2019 08:13:50 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x84sm406285wmg.13.2019.03.27.08.13.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Mar 2019 08:13:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH] clk: meson: vid-pll-div: remove warning and return 0 on
 invalid config
Date: Wed, 27 Mar 2019 16:13:48 +0100
Message-Id: <20190327151348.27402-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_081353_185339_F2CECFAD 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The vid_pll_div is a programmable fractional divider, but vendor gives a
limited of known configuration value and it's corresponding fraction.

Thus when at reset value (0) or unknown value, we cannot determine the
result rate.

The initial behaviour was to print a warning, but the warning triggers
at each boot and when the clock tree is refreshed.

This patch moves the print to debug and returns 0 instead of the
parent rate.

Fixes: 72dbb8c94d0d ("clk: meson: Add vid_pll divider driver")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/vid-pll-div.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index 08bcc01c0923..daff235bc763 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -82,8 +82,8 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 	div = _get_table_val(meson_parm_read(clk->map, &pll_div->val),
 			     meson_parm_read(clk->map, &pll_div->sel));
 	if (!div || !div->divider) {
-		pr_info("%s: Invalid config value for vid_pll_div\n", __func__);
-		return parent_rate;
+		pr_debug("%s: Invalid config value for vid_pll_div\n", __func__);
+		return 0;
 	}
 
 	return DIV_ROUND_UP_ULL(parent_rate * div->multiplier, div->divider);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
