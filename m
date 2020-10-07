Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C90EC47420
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 08:08:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6859D20870
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 08:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eKpWxXO6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ox4PxNK9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6859D20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WdH7X8lstRTwPsZj8rAt9jW2/INDjGJCT/wZw4PUK+g=; b=eKpWxXO6khPmp7G1YGu+S8QkD
	3v4pHJfXwQjnikyAAF5SwCkhmUzO998Ot6t4bX31V6LZUuQL6FWO4m0bi83tL+WSvqSfnFTdLQ8Bf
	4PlWDk1nqlvtzYAk+hl8QAH/uGo8aqTQpCaLT2y2WcWeHTW3IpY8oA7VPw2zkQFZJTK0jTvXTEMQ+
	5sjz0QbRUXZeNeYfnF1cFSCbYzv0U72wgOQ43Mt7Fp7+SpC3BpslPCStRrkGRsWMDC1EhNYRLcW7N
	bLrpDCWOc+21dM09Rlrdc8JvGiS2gZ83xX2Xf125GGHklYOdTqiOf05bHWqyWWwTx4hHI67viTjpY
	dVW+7NWkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ4Ul-0000K3-Os; Wed, 07 Oct 2020 08:08:19 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ4Ue-0000Fz-9Q
 for linux-amlogic@lists.infradead.org; Wed, 07 Oct 2020 08:08:14 +0000
Received: by mail-ej1-x641.google.com with SMTP id c22so1691294ejx.0
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCF8SynXrWVRYxNQ22uW6uSFDL0I44L0Irm6uzCuBCc=;
 b=ox4PxNK9iCxu2B18rdmRCaoEGcbD4CgFLBa5LFXCSNsT2y/kBWF/XUpeD8yZyzwaRS
 LC4z+VOvuwPT6de7nY0uKs9PYwbpdH+Ec1qyaAeIpTLPi5s9dJ6iKJI/goNuO00wF6z6
 ISDrcgjCSz6JlM7b4Hg2Tqpoxg0G5d7tDWBckRvdA1vsYDQFtPuJM85BVxJtocTScbLU
 Tp579wt2OvniUuqGoPCDps3DiKK8u6lR7oNZrM4vJWpY5JD5h5SomMZZgtap+99G/2Oz
 vA7al3NHRSZRLTtfd+c5v7F9SnxbLYlGhrmLOJjuqr/DHXEGOveOvtVY5+FNMeb4YAwK
 s/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCF8SynXrWVRYxNQ22uW6uSFDL0I44L0Irm6uzCuBCc=;
 b=Uvm8eGr5gZrsukPP6bdSSujpHzp2JlMCQqfXxblF5EULiAniJxF/3NsGcdLyyFRYV8
 r6ObOA2CG9mhESDbyCBI0FDfutamXR0LFf4Mm9Gn6wtIojFflY13kSm52HoyW3IB1Xxb
 1pHL/nDe2QPSOJYA89eYcfuoXpOfppa37WfCqBtPFvKUdEt0OVzBXkVQjemALEfSZtuQ
 W1MrSxExRLZib9jvapF/9JXqEjCZTm+9uFUO0tlh+wGKcvkpPr/Eh99+LLF/7usxif6n
 ZPbZLH079WhliM4F2Norh9pnWZkEOgNAkeq86aPoWfMWuDTl4+ARBRXgofu8/dEDXK6r
 EOOQ==
X-Gm-Message-State: AOAM530HPujNJeY4KlWOriN98UzY/YZOXXEor+LPivjSDemjuArz5cA9
 E4UrFGbTFJ7k5z0uhn+AvXyAOw==
X-Google-Smtp-Source: ABdhPJybptPbF4/1Q7e1paiatpmUVApwJAseaJOEaCM+dgpba+3RlGvV8tZ4QucnKe3c0/wuHvfsdw==
X-Received: by 2002:a17:906:564d:: with SMTP id
 v13mr2231056ejr.217.1602058090835; 
 Wed, 07 Oct 2020 01:08:10 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id p11sm888645edu.93.2020.10.07.01.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 01:08:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Wolfram Sang <wsa@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/3] i2c: meson: keep peripheral clock enabled
Date: Wed,  7 Oct 2020 10:07:50 +0200
Message-Id: <20201007080751.1259442-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007080751.1259442-1-jbrunet@baylibre.com>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_040812_386725_DCBDBC9D 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SCL rate appears to be different than what is expected. For example,
We get 164kHz on i2c3 of the vim3 when 400kHz is expected. This is
partially due to the peripheral clock being disabled when the clock is
set.

Let's keep the peripheral clock on after probe to fix the problem. This
does not affect the SCL output which is still gated when i2c is idle.

Fixes: 09af1c2fa490 ("i2c: meson: set clock divider in probe instead of setting it for each transfer")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/i2c/busses/i2c-meson.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index dac0d2a00cec..e7ec2ab2a220 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -370,16 +370,12 @@ static int meson_i2c_xfer_messages(struct i2c_adapter *adap,
 	struct meson_i2c *i2c = adap->algo_data;
 	int i, ret = 0;
 
-	clk_enable(i2c->clk);
-
 	for (i = 0; i < num; i++) {
 		ret = meson_i2c_xfer_msg(i2c, msgs + i, i == num - 1, atomic);
 		if (ret)
 			break;
 	}
 
-	clk_disable(i2c->clk);
-
 	return ret ?: i;
 }
 
@@ -448,7 +444,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = clk_prepare(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "can't prepare clock\n");
 		return ret;
@@ -470,7 +466,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0) {
-		clk_unprepare(i2c->clk);
+		clk_disable_unprepare(i2c->clk);
 		return ret;
 	}
 
@@ -488,7 +484,7 @@ static int meson_i2c_remove(struct platform_device *pdev)
 	struct meson_i2c *i2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c->adap);
-	clk_unprepare(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 
 	return 0;
 }
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
