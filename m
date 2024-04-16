Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD34C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2024 01:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mCFK5mq/QHDcGhOmWAE2KsrBWzCNB+shspUHnF8Haw=; b=damYOHf43VXa//
	MK1RosHGSlw8rHA23T0NpV5ahaVh/XfROxCoJl8LpivB9Drrjei1sYsz3hSrteGrSG0J8+jMgUzqN
	I8GII6gM7qC07wWSUYnd33rKdJTPN10K1a+StGKctB5uKXO5kW+am8VrGbOdRv2LinxPZW5wDQVb3
	aVRcUoKUCMCHnzVUqC4FzC4Yf76wIGXyi135aOiq4xbIzrNp33NjKa2XV2cjR+cUzW2HChn0DLTPH
	P+71BabuK0kjMWGlijN1r6fL6l842nXyVUlRZ/pMn0mwUzWePoxBAff42NRMWyAh5sGmZScQVbiBf
	RVs4i/udDxBbEsUdkBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwXUu-0000000AQRb-1wxN;
	Tue, 16 Apr 2024 01:20:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwXUo-0000000AQQY-0ezP;
	Tue, 16 Apr 2024 01:20:29 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ed054f282aso2770660b3a.0;
        Mon, 15 Apr 2024 18:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713230424; x=1713835224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xcz+73pSqE9SfopeTAgajRWWiV1WsHA33Nl/GYOpK3o=;
        b=dlWS8I8070J8jXhyHRB6wHgb8kCZIkzqNUVMZFLTte3CRltIVyNpM//LAvKrs/gKqv
         J0VrQgvlRdZAR76HJErQTdMbhvZqFWxBhx3MqIzgiwYn/hKOeB9kvshXC0ssQFs7jJrC
         SIy+Q8qZbJlJvBQdb1brOH8GNOREa7ljmzye5dbboi6vbDIMuYeA+8zFaWVqLfjjWVNp
         bLeo3nnfP3bG9q4Eu3bCFtDHVACex7LNqMWoJCFwsQfaBeXrgm6VS6GPkSViI+EjO2n4
         YuRKDIl+6N4QsodO3HPwegr8WhqeoowQmFJy9Ivc12cc4KboU/r+RFGo/ntbaEirp4P+
         e3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713230424; x=1713835224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcz+73pSqE9SfopeTAgajRWWiV1WsHA33Nl/GYOpK3o=;
        b=ToCh14nwOKSVEfXXClLGZpb9GkYlU1eG2A5su9cH2LqgP3po8k5lEVDCX7VHuVEuFl
         zRqYeNvZ1e5EXwq73WSJF/aj5I4iKcdqlOY4MTKHlklSbJiM/nnAJQbJxbeQWDtGgbGy
         VdALAscxKBCxSim/rkLlGB/8OvEsCsaHCzuxrca0lFbNgkEdMOHK6R0IRlDeqvWfOUIN
         ThMY+JcPv4sS5LHDlFUj/EJCXtQRNQGhW4m8ApuspsyCWbVAJXSqKXbaFdGGvpTydPfr
         oLRAtAGI5KfK+QBSk5TAPlBahOYch9oyBT7G4Ahbzqg8TcaRCZTU3rjU5CUi5qAp1obr
         PhEw==
X-Forwarded-Encrypted: i=1; AJvYcCWKqm8IdDH2YGiissDgfJKwMk9am/2HMRMSfT9RfjuCGRVRWerhcfqS0Frqo8WQduqztEP2oh+XccyuLWXCZ6zzsZj3qGBeHfyxHbn1Y+R0+SbVt8jJC4uHkILgM40jV09q7pNXrEsN/uvWcK1adyQ/DQhnIl3YOQ==
X-Gm-Message-State: AOJu0YyrlmJIwsC6M1EKb+klvlh/sPj9kH5xNZMypiqv8zsF/rNhTVSO
	pQzZR/STEKcFCBhRqVRalKXOFmcN/oq9uCWn3/ZO+p/zA2ot1ajYo33J7mU0
X-Google-Smtp-Source: AGHT+IGKSm5nin6p9UNwnL1BsNEX4TIhlHRZpogTl4rQv960sLOS5qdNTVHqAH3CSeYwafOn5VBL6g==
X-Received: by 2002:a05:6a00:b96:b0:6ec:ea4b:f07a with SMTP id g22-20020a056a000b9600b006ecea4bf07amr11785479pfj.34.1713230423713;
        Mon, 15 Apr 2024 18:20:23 -0700 (PDT)
Received: from mari.. ([2804:431:cfd3:2714:2d55:751b:9f5f:563e])
        by smtp.gmail.com with ESMTPSA id y30-20020a056a00181e00b006e6854d45afsm8061866pfa.97.2024.04.15.18.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 18:20:23 -0700 (PDT)
From: MarileneGarcia <marilene.agarcia@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: MarileneGarcia <marilene.agarcia@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmem: meson-efuse: Replacing the use of of_node_put to __free
Date: Mon, 15 Apr 2024 22:17:51 -0300
Message-Id: <20240416011751.93016-1-marilene.agarcia@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_182026_215877_610A07E0 
X-CRM114-Status: GOOD (  11.66  )
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

Use __free for device_node values, and thus drop calls to
of_node_put.

The goal is to reduce memory management issues by using this
scope-based of_node_put() cleanup to simplify function exit
handling. When using __free a resource is allocated within a
block, it is automatically freed at the end of the block.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
---
 drivers/nvmem/meson-efuse.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 33678d0af2c2..400a9a075e53 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -42,20 +42,19 @@ static int meson_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_sm_firmware *fw;
-	struct device_node *sm_np;
 	struct nvmem_device *nvmem;
 	struct nvmem_config *econfig;
 	struct clk *clk;
 	unsigned int size;
+	struct device_node *sm_np __free(device_node) =
+		of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
 
-	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
 	if (!sm_np) {
 		dev_err(&pdev->dev, "no secure-monitor node\n");
 		return -ENODEV;
 	}
 
 	fw = meson_sm_get(sm_np);
-	of_node_put(sm_np);
 	if (!fw)
 		return -EPROBE_DEFER;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
