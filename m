Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8437D31A11
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 06:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7YcGzU1KQEsV9K6SF4sbMGJIDhEo6scFC8hmF/nToTo=; b=Es1I/VuihOl3LkZEclPWp8Ezp8
	1RxGn6NvLmnXLhSX9xemq3hLUKwbsWAbxUj+AkR2VhMjMeeIWExXr6m/YWSJwIRtr0XYlm1sN2VKq
	BDoxlZHx8SdvhPH3hpmu3WvGDSRJ8b63QUDyCvBHsh1DTF02zTGClj8t2qVL8QTUor/218n8dQLOz
	+NbFVIq6jBGQIP9dJYFStd+jMJNCdHFyu1CKCorDWhQ4Td7hQ1dMsokfejLt81MU1beKpAmku+lLy
	JtPBJDGxcV4Qd+aEYBPd4yOaw++s3Qmu43OS/wA3MmISsJ0fHsKmkdtpu0lv5xepor1RsWaKqjAex
	K4sZ8Xvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKe-000000087Oi-0bct;
	Wed, 14 Jan 2026 06:26:16 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKZ-000000087MY-0eSv
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 06:26:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34c363eb612so4885543a91.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 22:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768371970; x=1768976770; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=;
        b=XSS0q/GCFR53F5hLdXJg5hZ+G6/W9FYbH22BnbJjcuSQ+NggnrExaC71KieS7+PczA
         pMZ5+d9E5eV2gGjd2ZB0ul7euncOwaPvBBhRApchC/SD+YmMp813oo/x/8QxFa9Jl1fi
         mJGNmMrgKircBdc5lc8JuQlUBEV/6B/WdZOphIrRsOZg9VPUeQdmTtHQZnzvqdikHMTT
         rMpXO2PysBfGSCj1eBGWKUz6C1jeyCBAhgcDPlD8ftiZeDpWnZTfP7Eq/ialhrawSPXI
         fSGllEMzF1YxwiuKBi4rGah7Gr6trUwKiAkxPdk6SJnqFoiwYozPcCT3iCGYzwxq5xQ6
         l8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768371970; x=1768976770;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=;
        b=Hv/8ygSB8l6DK2DgzwvcIxkIfXRnMTW1fw3zat5bRQ8eQelpWxVRKAOgq4Io1Tc330
         pOjSJ47Q3rhFbLEueWVmJTQtdgH9+rNTFghcPOTw13x/vURlTlzjCpRPyq+Nz9FlY3Mo
         jz/0AsWiJTrw7yg5PFJp10FZnZ+vlHfTuhOY2aafzv/ibuwRS8HAaBVqj9hhleJZAvDQ
         IE7DGAzM8YMZgf+vEBxg0AJKxjQAs8E6eM0UiJgDf66bALsyMJH7uT54jf37CJok44TR
         uGThEfequFTikMdnJhXwWFjnxCxvr9x1WA4z7B9bsf4yqhXMZ7+QS4mnZ0ALWj4G6fTL
         kSow==
X-Forwarded-Encrypted: i=1; AJvYcCX4M7aBwv/7JMqD1beefiG48P+2fp9gGw/p2afWlwIiLUqtoyeBqlvP6+SYTnT+PUP+QfHgSLtYR3DNY4Zf@lists.infradead.org
X-Gm-Message-State: AOJu0YwbqHzt2yDPYOlcWbdMFqgW4I5BBaW7YxhLxKumXf+Oib6GKDsJ
	6+UhTPTFZqLfg6o60608d+3yntS4SSUKJmFjgSR7zkJJ9OZN6x9j0lJ9
X-Gm-Gg: AY/fxX6XZkQ+H2TKeP2czMm3ummtpiuIuv61/jfCplOAfhNowett2+oF8uubIJcJ92k
	kZrR6DXjfddxDhKt1YG9Wn2kTvqmndqTNhArZpWnl2KO0tFb57osFLORnwAvAHB1JkUp4pCjbh6
	ngYFGavs0ZtkyZ6XzNQH+xlLaOIv68jXZ6GGRYgwSJj6D56hm1b1y2G6ra9EvyzT3X/SAXIVsE3
	9W7j/8vH6f0mDtDzYpJm4IwOzJmav53nLnx7pyubd1i3qV1EW/j1PH+7mxDJwItmgx36afaN923
	AOl61Ui467i3/xV9n28jW8uqDEIlT5IM2kWzWfydrbv+jE/IGVE8F7qtPAs0s+hVI0c+rzyJXcT
	/9GKn2Byw/Oq2HHs2jgwEWrtTr240q5PNo5akj6Zx751zoxEwmWuAeqFNEP5JEy20DzYThV/Ean
	WOf9o23Do=
X-Received: by 2002:a17:90b:2782:b0:340:9d52:44c1 with SMTP id 98e67ed59e1d1-3510916b54fmr1625255a91.35.1768371970530;
        Tue, 13 Jan 2026 22:26:10 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109d88f0esm891791a91.5.2026.01.13.22.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:26:10 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S binding
Date: Wed, 14 Jan 2026 14:25:48 +0800
Message-Id: <20260114062549.68954-2-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260114062549.68954-1-nick@khadas.com>
References: <20260114062549.68954-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_222611_187352_6579ED19 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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
Cc: robh@kernel.org, conor+dt@kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, krzk+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add devicetree binding for Khadas VIM1S board based on
Amlogic S4 S905Y4 SoC.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d9963fe9259..55663e0f7f915 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -247,6 +247,12 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
+        items:
+          - enum:
+              - khadas,vim1s
+          - const: amlogic,s4
+
       - description: Boards with the Amlogic S6 S905X5 SoC
         items:
           - enum:
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
