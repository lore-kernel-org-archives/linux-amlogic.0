Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91E3C433E3
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:23:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E222076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:23:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SPsIy0K5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT3ae4B/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E222076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SuC0FkXQAHI9FvImHL0OwYoES5CaMJ/Ox9TKpTpMUMI=; b=SPsIy0K53Jt/BLHyKseKP4FtWo
	lsskRj9Me8BEdEeopgNJUYhYStfMwkWUKYD1VOxJ6NJxGN0fLydeEZbJWsh4/qzTBExeupC4Od1Od
	C2j1x+5oS514FEiT/kYzwwKVeatBX0odVpLb1iJyNmEPCFKKmztd1Lx9hwy2CEFW3MuByyfROWJkN
	gWD5CcSWVOCQUGM7J7qGVDhkEY9XjKIMHtE7NQ57bK2Lhb8mw7jnoktzB7td7F3ziMkPs4xageh3W
	sTbgVgjrojGom4yZNJqxULQPCdp1LeJf4CUJExPE3bd0vjwJgTTBzLEwEZKRtFKN9BMAM67z7WrOB
	ervEfX7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwfJU-0002OV-LR; Sat, 18 Jul 2020 05:23:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwfJP-0002N2-H2; Sat, 18 Jul 2020 05:23:04 +0000
Received: by mail-wr1-x443.google.com with SMTP id b6so13110995wrs.11;
 Fri, 17 Jul 2020 22:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=68XVIKJYC51HwphePdTA9Lwzvvw+s3PKoRyB8S+VPNI=;
 b=cT3ae4B/9OU66h0+rkwDY8k47sIDc5dudndIC/G5UXIUUsAcygze5S3w750uxyVDwS
 +M/5SpQMP9H6WNj0zXtwEb7i8HeRczJfv3WJNjOcVV5zAKV8hj1oPTNY37psbPQ7X86I
 zmlFiDQOg8ICG8V4rM37eB+nIm0nI4IGKKtHlx7hjDntLmYAoo1i+dS6/E+hUMtvLn2u
 gE1SjsK2V1t5bRTptUNZoya0Tb/gdFklNhpYcDAt+ulK1Y51dXitN9jg1f0oaRgG8mm0
 v7BlAiuho/oII5ptg8HDc6MFOadOQoYEWqPu5CwyONYACPTeTCtscIyQawMVpBNxPnbH
 y9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=68XVIKJYC51HwphePdTA9Lwzvvw+s3PKoRyB8S+VPNI=;
 b=GFWD+Wt8gjYU87hzihmQuxdJRAWdYXn0dps8OC7yCBKVupD4jjdG6h51VR7zKfqNjB
 T68PgYDTPzVHP3G0QOHnC000X1EIRsPAoZZgqKcR7vm9Zc61E6HEtzHVDBaJHbJLhQAP
 hs2VWznGyJQpcdz9eeIfhAHgHQ9s6HD8WTMDo1ACr0Hh9g+eAa7ut1GFet8+mVHd6a1h
 F5GLQtLaKDfZgTrYZ/9LhvBI532Zu7o4TSeQdOVSvLiVh9jBwgHlxiXenX7NEoTIaMgV
 Kw/Pbg2wVlMG0KR9V4TFHhI9oQvRU0rWXzp6gdgN+kV6kaMQ1HiHIHYyzIG9co0cT8sj
 3+7A==
X-Gm-Message-State: AOAM532CXN3uHFjQmZpB75MrvGYPBTN+v08l17K1jKe0acttHfBImMkt
 VAMGCYM4+eBNKawyfsctVPta+zC0
X-Google-Smtp-Source: ABdhPJwFA04O0Vo827+TYXELnidVX5qxVKJEDLQCoYfwdm8pKzam0cDcrr0PdyGYzXfqhn/u8xJ3fg==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr13158030wrp.299.1595049782582; 
 Fri, 17 Jul 2020 22:23:02 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id f16sm17536608wmf.17.2020.07.17.22.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 22:23:02 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the Beelink
 GS-King-X
Date: Sat, 18 Jul 2020 05:22:57 +0000
Message-Id: <20200718052258.2890-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_012303_732617_0DF64F30 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference
board with an S922X-H chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 378229fa8310..8711fa57ee25 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -149,6 +149,7 @@ properties:
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:
+              - azw,gsking-x
               - azw,gtking
               - azw,gtking-pro
               - hardkernel,odroid-n2
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
