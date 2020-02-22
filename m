Return-Path: <SRS0=iFsO=4K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC6EC35671
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 22:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1999720702
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 22:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FVO8mA/q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vaQRLUiX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1999720702
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0nFfv2qR4MebBCnX7LgQM0Cdfw0O5dGInm8P7CurAo=; b=FVO8mA/qjqQS8T
	pOv4+k+ck+gQjGC+8rDoCOLn5bQud8OUFLJwroZB8FWZPE/gj2n/qqMGTm4RKGkAZlPA+Qj4aUJJJ
	9I4mmP5ABTeXQfKcT0UaP8Qwb7rQunafuxkHs6Vxf5o1E1ikQ+IIAeb06Jxr9ksl1mf7D4wwjPaqg
	vJusxk28PnphrJY24ZQkufMVgMT8gATUjTKFXdakXIIMc2ZaNleYyHoNxzLIAi9G8KgfTycvwYpgR
	h2ScUqDRQ3nhzL/S9y+D+yFEivalcYZQrn62qv4T148a34UkrPMZvYTzh5e6ZDSPG9hIXXlQ2fA70
	4stcGRb3vTncZ9GwjHIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5ctJ-0006RD-Bb; Sat, 22 Feb 2020 22:04:53 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5ctD-0006LF-Vp; Sat, 22 Feb 2020 22:04:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id s144so7814093wme.1;
 Sat, 22 Feb 2020 14:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WecMb7XC+F71BDVsaL32uLe6ZzntKQ/HmvHZGIxKOJo=;
 b=vaQRLUiXMysRiqAX5vXIJmFxStAF6yVfmi7kTKH6PDgx7XQtA6hIFgpYkLBjVc7dkk
 b246OiYA+c5qNP4lkL0WZFN9Q3/rs5qeIfuyhJnqmAHPTvSb89mC0nK+f0+2yzCdwHEY
 XCRmEOYlLF0u19r0cdKa4w8fShbIQ3J6Gy+/i6lVbPtl/5PMWz16MoSF/AI3cFTRfQBg
 NQ+sWNAucuPhBBexOVEvTIrQ9lbL4O+/5NXAoj0RF3jro7onhpxUgjl/JumoRTDPtKkd
 b+W8cKKUM7/pbC9US5LV/dEoD++R3xcnCGlFxezyIV+P4ZmidMBfqIxtBiSh+6LEP81d
 AOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WecMb7XC+F71BDVsaL32uLe6ZzntKQ/HmvHZGIxKOJo=;
 b=UfYu+Amt/6T08ZMhi/x0WlF+sG92nV7XIy8Qb1NSxmAXUQ1qEejaDV9FOY4CXk5TQT
 jLPXffHHJeYx8KJ+8DSzuLRQBEbjOT0VEKcDtmE8GTv7leG4jFlg5UR72pblUnJQ7VlU
 arf6NB0ti4BfK/edoJZpGJucU9adfRQEvRSQYn9uoQms6Sqb3ABT1UYEBebc8g0BeB7r
 ITThU7SFMalXQPaU4kfxOw5UMbhlkEvLE4KorcjqLgINt+YZfVYuJRI5G69YRC1puRDH
 ngw4WSNacqHVEPY2jvzPrKsoqeAJqWA12bThPJkn+Yay7QLT/bZG+tUnyrTOvfhhw5iT
 KgJA==
X-Gm-Message-State: APjAAAXI3NsPCdJTxXOTJMuM6N/I1cbZ5OlBvHtUiAsfxiAhfyuhBGSS
 vgXCFCndFd7oevh+m0znEbgXWhz3
X-Google-Smtp-Source: APXvYqzs7BVHkeHnT7UYxo1FTYom5hTfpobIJ3SJTo2JpyOe1y1s1pwDWzNEu/vAeDHrx55v44VS4w==
X-Received: by 2002:a1c:7d92:: with SMTP id
 y140mr11567948wmc.145.1582409086211; 
 Sat, 22 Feb 2020 14:04:46 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 q130sm11151738wme.19.2020.02.22.14.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 14:04:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RFC v3 1/2] dt-bindings: gpu: mali-utgard: Add the
 #cooling-cells property
Date: Sat, 22 Feb 2020 23:04:31 +0100
Message-Id: <20200222220432.448115-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200222220432.448115-1-martin.blumenstingl@googlemail.com>
References: <20200222220432.448115-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_140448_046013_E25FD2BC 
X-CRM114-Status: UNSURE (   8.54  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, linux-pm@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GPU can be one of the big heat sources on a SoC. Allow the
"#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
overheating.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index afde81be3c29..33548ca2a759 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -107,6 +107,9 @@ properties:
 
   operating-points-v2: true
 
+  "#cooling-cells":
+    const: 2
+
 required:
   - compatible
   - reg
@@ -162,6 +165,7 @@ examples:
       clocks = <&ccu 1>, <&ccu 2>;
       clock-names = "bus", "core";
       resets = <&ccu 1>;
+      #cooling-cells = <2>;
     };
 
 ...
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
