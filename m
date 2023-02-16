Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F621C636CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sonhUSt91P9uu2cZsXCmjipnfzVEdnKfeYhxO8ko1t4=; b=JFXoURGSohQh7W
	8F7ZymkG/19vAXARRYkbjtkFNatzy99JWBjjjDT5F8AKybe5xgqnVq9ZDF1EIrhqprPq6IAfkeUAy
	DuPbrul0Ne1B0ji5mYy6/sFjJsbhXqQ9miHH0ylfs92kH4lEiqFzrW8VLb2A29V8VzfffOrcE6azf
	IEnCI8bwGEalGNDn62WWB4s8aKp0VLia5lH8K9ZOJD9lDZlfZk+s//md4Sj5hBXM7Gx77VjT0BjDF
	Lv8M+wx2Gnmt1BSF0h0IyCT7Gow+OXK9rN6QgeTLXT+JgRx1CJHHxcODp4J8mWrtpMTI2o2ldtdSV
	vIhZPUqFq97FjnrLbuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSclW-00A1So-4Y; Thu, 16 Feb 2023 11:49:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSclM-00A1P5-3Z; Thu, 16 Feb 2023 11:49:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id u21so2419408edv.3;
        Thu, 16 Feb 2023 03:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZp8T9fi73Ck6TTiN9PFZMW2/xgQskNbCXDB3+L/Jqk=;
        b=msW4Y+9F7v3GP/Ws3yy3pWZUitF7Rs7w9AYX7TGacdEQJhPbfuFohCZfURFFpz/uuz
         R2/a2GDiDf9qFi3bTs4vvtNW9w4VAYzc6BiondacIDtdwNCqQWSNgMWaN1Kyb+laoxCH
         aJ2nqPcMKa/T3VZFPzr7I5A6jl4nZ3b+0NiLfVpAVzrHP4wiItxifBpMlzawJv7A8TQM
         BEv26XVmcbB+vcmSjOdjA2VsITiXp/hS5oz257vTfnlJART0GU61wFlQWI0ndEIRZc3V
         z2czMP/Oxj2722Ube2LnuvYyvWf4wrwA9yGPVpGg3F3P691V3gmgzmFTHQvWCvqRRpiE
         yIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZp8T9fi73Ck6TTiN9PFZMW2/xgQskNbCXDB3+L/Jqk=;
        b=3giqh5atzCXDOO9ebuK5s/HiGKGkMfCTuMcmzgiPXdph0BYZtozQVKDy1CaPTjdpAy
         q4AeTxLyBle8L4o/d5c4c2mXx8ttUoXN//NY/LbKxhu4r4mFU4xP5R1ISsZ3WnQtHxud
         mM/CJAoBuzhpjsQ54R3wNoszlb/Ux8mW4RW64opx+2HZbYSKlOn7Bm2VI5FlteJcdQHt
         mFE9o1ZtULSV8TNlinXq2dyo6LA2Jt7YAR1TrX8TczPaJJZTNX7ihGqbVXlkEYYV250r
         v3OmvNjGzJsxXzZrOxAp8gDhzHyofXKWvFC0gagvYtsxVwKAwR+eJMFiXsC5RGptXmaa
         kERA==
X-Gm-Message-State: AO0yUKXnCb8KjdMiHO59Q/ozoysln8pqP2ltobAE+1HeyCRbs5NopY/u
	8rNH9ei0P2eRgWRAwFe0mqc=
X-Google-Smtp-Source: AK7set/SXR4B4Vuo6SZP5T42kzznPPMtBk0rXOFZeXHmBv43VoLdr0/PcANMxUJFUzoRT/kngfrw/A==
X-Received: by 2002:aa7:dc13:0:b0:4ad:152b:8f69 with SMTP id b19-20020aa7dc13000000b004ad152b8f69mr3662830edu.17.1676548156056;
        Thu, 16 Feb 2023 03:49:16 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4f6:7c00:7889:e4e8:274c:ee22? (dynamic-2a01-0c23-c4f6-7c00-7889-e4e8-274c-ee22.c23.pool.telefonica.de. [2a01:c23:c4f6:7c00:7889:e4e8:274c:ee22])
        by smtp.googlemail.com with ESMTPSA id y12-20020a50bb0c000000b004ad15d5ef08sm742451ede.58.2023.02.16.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 03:49:15 -0800 (PST)
Message-ID: <d5542f6e-920e-93cf-a453-b0601d03f48d@gmail.com>
Date: Thu, 16 Feb 2023 12:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Language: en-US
Subject: [PATCH] dt-bindings: mmc: meson-gx: fix interrupt binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_034920_191101_B4E0AD8F 
X-CRM114-Status: UNSURE (   6.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Reflect in the binding that the cd interrupt is optional,
and add a description of the interrupts.

Fixes: 09b31a610328 ("dt-bindings: mmc: meson-gx: support specifying cd interrupt")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index c8c30300d..cd3f75821 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -28,7 +28,11 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 1
     maxItems: 2
+    description:
+      mmc controller instance interrupt
+      optional card detect interrupt
 
   clocks:
     maxItems: 3
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
