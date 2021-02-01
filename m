Return-Path: <SRS0=hsLn=HD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E79C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Feb 2021 21:05:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E58064ECE
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Feb 2021 21:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E58064ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AcUjJptL6qEHgP61QngcgMmFQghmULG9I3jM17rLqt4=; b=JOjTYIzaZ2xocSoQMzK8VdDpmi
	LFRuyl1hBmJLnsp98EBPatHD2b95Y9ExaikuCKG+DNxNKhhLNJIecGYuQLijNh4LJqFy6FB8+JNPE
	EwLkHdPbX5G2MxYcCb5+9gE7BlWOUGIzgyh5dvEazyMikPHYyU3m9bC17REbJA7ihhou6nSkLwOVq
	klkb070PUIxWhRiBUUQJc80MWnEaWkQav1RdaxOE62IM/6jYMSQWv3HgGJ/mQ7KIZ9REdEGFYQ0W/
	5lFEy6ieXUu35nyhpwKuQTpp2cd1q0Pou1nFbm/Y/1rY500WYYJSzMqc8hofzTMBHWGb3uHsjM+0i
	9AVJ9esA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6gNq-0001Xg-FJ; Mon, 01 Feb 2021 21:05:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6gNm-0001WW-ID; Mon, 01 Feb 2021 21:05:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id c127so468215wmf.5;
 Mon, 01 Feb 2021 13:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=P8dkQkjqD2gwV3MQiGBWsFTjvZddS+bmBUxb8YDs2tA=;
 b=hao2QtTHy0KUml3yXdS+FKt3bB4FKeUb0iu0dmgI8xWYkLYXSye7IPpjrrAJ8n6WsM
 DV5xyBE/AvLHgwvCLS1tSf6iLDaOzDYNt3e8wwHebCYGYcJ5YVrXJIUQ0z5ShVcd1lkm
 1UIZFmjaOmMinduJJey9b6P9vo07HmZ7z8Cf3Cp3V8Ixuk5So5azU8hkB5LvfvMz4PjL
 3JXChqkqDnIY/WDyR23DWJTsUVl8aUgm8cEBru9ea1XIy8Du9bKwOZJ21Q5tH7zYCpmu
 PCD65r86ipmCfQyZyD2YOoY4crNM/YVE9wUbzdcvnAPTqxrNXzzX+4AEItO3U/I6NKDy
 ZFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P8dkQkjqD2gwV3MQiGBWsFTjvZddS+bmBUxb8YDs2tA=;
 b=ZCYtS3+6482VPSY/PlUnuoUIH1GxAEepcakOtaviQ1g3taopQOHk4Lb0Ma7vd858FT
 9dG13ErXxnz6f0hm3ZevbzfISUJCjIaTMi04vlZjS+xhheZOXdKVUNhQ1c9t6Gw4iyOw
 BJlUksgmm6eTIeOBVoOII1hVmRLMo97qWWFRMqxADaNr+AtCbCo2Y86KMAYD1O++/9Pd
 K7vgcmaONUQXD3SMxE9jcoTEg43A9s0G5SNzOFTLG2rvk+aiU85WR8abP7CKeHX5QWEw
 yjSNHjd1bZWOJvVx6DbTdFh0TMFTFn0aS8f/X1wx4AIMzffApWkcg//Jr2HpLg8oYCa9
 SpoA==
X-Gm-Message-State: AOAM5337YC4Jb0FjLt7YJBrMARC+XDeJTzJhAt/F9PMPKMwuD0yxAWCk
 qwpjEJAs6eTwMvIxMD4WunQ=
X-Google-Smtp-Source: ABdhPJxI5EXxpQ9UEKN4I5pXxUfvewg+JcTERZciIrohkJ/ovxK4Vdhx2DL16F2e46pYcc8D6Tq7Cw==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr606263wmh.131.1612213512518; 
 Mon, 01 Feb 2021 13:05:12 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id 36sm29769846wrj.97.2021.02.01.13.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 13:05:11 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the Minix NEO
 U9-H
Date: Mon,  1 Feb 2021 21:05:07 +0000
Message-Id: <20210201210508.1528-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_160514_650367_74811568 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Minix NEO U9-H is a small form-factor Android STB based on the
Amlogic Q200 reference board with an S912-H chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6bef60ddda64..dccfc048fb1c 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -120,6 +120,7 @@ properties:
               - khadas,vim2
               - kingnovel,r-box-pro
               - libretech,aml-s912-pc
+              - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
               - wetek,core2
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
