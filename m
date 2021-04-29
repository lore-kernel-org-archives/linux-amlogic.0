Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB2FC433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:06:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B21F061441
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B21F061441
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D15tKBM6xw6g1HwGU3uh/y6VDC2L0cQR3KBVJw4MdEI=; b=GKu5oR6bQKcU3/H/WuMomkhH8I
	5EAIW7LhDKEOuqjE0qsGP10TtMsMWYIiIo66Cc1T2F4WEJoysYeCR6QoUYv4mB5dKSUIP0/ZJ5Yr5
	TxkX1GKt7fRNslRQSqVZEWL5nG87ximG7R40lnr3TjIJxwioZZ2VRQF8aJidr4M4nYM8AvQlDwvFD
	qlev8FglBiDzBf57u7rijYHp7V3InOwL6xFDAFXlSAlS/caTVuZkWaNrkGtIxKGnUUqjHUxESLO+g
	3AxnmoKV94as4yedleSSVbiAlaDWggjW5bDx/IVuOmJZJCmXkT2lTrumZ7Ajb9npDxICQ4Wee0yVC
	uC1iUpLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2cj-005PZZ-GD; Thu, 29 Apr 2021 09:06:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2cE-005PXC-HX
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 09:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=/NOJtqVgo4b71x9EB2dWsym5Ul8QWvASKXqefQsrwjQ=; b=o5Ir4kA7Uy5dNrh/wrJMvbuafC
 QoQZ2AXBId9dv7eKsG41enJJQQiQlYxmJ/BgbxQEyD6poqaxcacsfUiLRXMMn/kotvs08cC5UsNNy
 alI1nmRdbXcVEpQLJ5JB0fjd1xdJAX3w8zHAdYurgAOmXjYoy/PIJGgUZYdFiBzrQ3JVr35E6pAKi
 iWwGOCvfv89ur83Bu38Cb3DkcWRtqG3dbNg/W8s3PWjecFHf0NCiTlQoeJsV2tAZsCEnJBynR6BZ1
 lJG/yEXwX7uD3ehihlORDoBAdsfZqD2Clx53z+ZUSwzJFleXvMYaa5RsaaCr1hfxtA7j1yU75uCcd
 WN9+j9/Q==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2cB-000Vk0-CL
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 09:05:45 +0000
Received: by mail-ej1-x62c.google.com with SMTP id w3so98797445ejc.4
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NOJtqVgo4b71x9EB2dWsym5Ul8QWvASKXqefQsrwjQ=;
 b=0sw+adDQFKWk7IB3L7fR9jOdHajHbjtvty+bwUCXBDO/kc7kgPVbgadSBnXtXidmNQ
 VqvDdnOcF2b/OH3AEDdQfgkm7vgE3UxYK/CLL70sOROYqlWwjnnSmec2XI9zcjA+7q65
 5tuwmJj4sMjb4+2UMIM8PXtsRUUYgCLnBPkJlN/LHDu9eJwV+ceWtLxAitnCPv8zOx1l
 u/1b4Wi1IMfykBWgErGBv3rMr6OnxRtpAFuMRnukNob5lLCgp/IAfNV7DAq8Apsg/0yk
 p4wzHXiXfzCyZAINPDDZz0lvcretWqjFzGZ1eAnjs8i5WVMSkQCJ0g6xNv3pjFDdpFDO
 WJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NOJtqVgo4b71x9EB2dWsym5Ul8QWvASKXqefQsrwjQ=;
 b=UW8mrEg8Z0gI4MhkEJxWyq5rEbUyhWdrhV5O1ZhQFDjatiUZJAEYx+zVDD5Gi8BCQ0
 BPWNeOwm7PoHgH259ei0+4ssy3QhSBLQYP+Mm+8626VAVvIwOjICCNQaaRXNp+4jKhIV
 phPsP77sXyEyFLOdUnhEcyaaL1IEmHqTiPBXYPFo0uhGSpI3hAmrHn6bxMsUaYIlsofr
 azjfJwOSuxA2au+8Zb6iQxbuEsR7f6seYcFrBIY8LCjeiH6gEkhE2qawLpb46wLdD0ba
 aIW3XtomEk8h6Neh6de/bK1r/cc6xE+P3phuf7GJuTabxId+Y35xYq6gQxiBkxYwM07w
 FaQA==
X-Gm-Message-State: AOAM533NfAXKyv2R1kP2PG82nbeOs7A6m9De8sCiKQE8DE0ZWz7PUXLb
 n6naQit2g71O5/vEzh26FvKbAg==
X-Google-Smtp-Source: ABdhPJwIW9xVVuC+zSUpQDbIMAhvucM3JanIYTGinWEGxDvs3wp0tCa91qU9N7pyeonGgJd8ZtiGCQ==
X-Received: by 2002:a17:906:c1c5:: with SMTP id
 bw5mr34103287ejb.510.1619687142055; 
 Thu, 29 Apr 2021 02:05:42 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id o8sm1420349ejm.18.2021.04.29.02.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 02:05:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: axg-audio: do not print error on defer
Date: Thu, 29 Apr 2021 11:05:16 +0200
Message-Id: <20210429090516.61085-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_020543_436253_DD631270 
X-CRM114-Status: GOOD (  11.49  )
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

Do not print an error if we are just waiting for the reset controller to
come up.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 7c8d02164443..5e501eff0840 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1811,7 +1811,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret) {
-		dev_err(dev, "failed to reset device\n");
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to reset device\n");
 		return ret;
 	}
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
