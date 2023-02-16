Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8D0C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 19:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kISYKR+C6CG9+4KSMTypvttQBX06hhMBW8XYrZUdpAk=; b=V1wq3z5SHtTATC
	tzA/tkJTToMzyQXT3vzBIfFdAmaSNGM+/C/aP1BY+qFCrATp+Eru3bfeo7fneTutiaaPgRT/31/9n
	+b+1Kp3Ou41Q4qfLRqyNkJunqRI6yWpOJv8pjJKU4H3QSxssc4AyhYfRR9v/l4cNAR8dZULUbYfHi
	2iSYAtTG2A4K0akxc9E9qC5QLC71IuoSGFgsS2x4S1tXp0ZnoKpUnX4eq7UgoqDF1HQmLJCS2nq61
	pqURorTUbpzt6SsluU5TRNsM1VUeqP1j53MdIXERfx+Ly5Ee4IBHHMAQsdi0K1VhuSc9f0hf6KfAx
	q5h0sWycvLxDINjKijvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSkHA-00Bgl3-UA; Thu, 16 Feb 2023 19:50:40 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSkH0-00Bgi6-4i; Thu, 16 Feb 2023 19:50:31 +0000
Received: by mail-ed1-x52d.google.com with SMTP id u21so7112504edv.3;
        Thu, 16 Feb 2023 11:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WbCjPVVHxVyatJVjIE5iJwBzccUEGGzVCMAq6wVW1E=;
        b=mSWg2oBKFkPul+atB5VeAVNgOr1TfqCf5rNbQI/cRUaUs7SZohENoUOegYtyDBgdjW
         qzbNn6w4RFuvRyuzzg3IWSMvIdci+iSlK2Q6Yk8z00moPhOyPu6U161NhgodpP5qbafP
         8xKOC30NdV+mzkTEPOVY3kNASR/RasCLNFZjSGML/HPDHtRP6Nd16tDvhwoBkpw//LG8
         1cpb+6Q0IXAEPOlvr/2nyrA6ZpNxbdkyctEAcOD6Fiyn0HOCVWzXhKHGb1sU2O4jhCrg
         GBokeBVilUdtDrjdZYJjWkm2rLyaC6gevc78uA84if2S6smLsT38P1KyCe2HbK8t2KXO
         pbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5WbCjPVVHxVyatJVjIE5iJwBzccUEGGzVCMAq6wVW1E=;
        b=FBGum9ax06q46sZYVl7215jyqxhGNmGqOb14gJ/aOgS9q0CtTBNV0aW4mV7uvWTZiS
         rM0vD3aCN2DpD4rLzV2ri3nG1hzXdu4+houLjxoNHtIz8MChUs1JLZiHcyYY8NE55i/s
         IQ/DW2ok7uNrx40+ZkVynSP7QKLqt41XPEpLr2i1SGlPjNKRt1DRo4s4jjJS/PR4WA0k
         2xn87y0tdZ2Lcr6yPLRCOadCDLxWtF6u6yNm5eL7YRw2TkzYwpr+Wo9/An6wumpbkI+F
         O0PdX3u4CWGzZPh/6/N3bYtj5ocZRFo6OuoCN/fuWB9rrlFJSJ1MNAJMPNWuZeERstYk
         t/Tg==
X-Gm-Message-State: AO0yUKVBjmjPRb+WkCxfrtEwLP1Rdcay7NvuIjd+ff0TpHDianAqyffc
	Za+XtSfKk4afRHHvh7RHvDI=
X-Google-Smtp-Source: AK7set/8hJwZaPL25gBs7qCnElf8JUzDRNCJ+vB+zV5BWa3yWWyCY8bo3aUHbv5/JFssem5zK4+evw==
X-Received: by 2002:a17:907:98a4:b0:8b1:32dd:3af with SMTP id ju4-20020a17090798a400b008b132dd03afmr7489651ejc.28.1676577026386;
        Thu, 16 Feb 2023 11:50:26 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4f6:7c00:a039:5cde:fa47:7ceb? (dynamic-2a01-0c23-c4f6-7c00-a039-5cde-fa47-7ceb.c23.pool.telefonica.de. [2a01:c23:c4f6:7c00:a039:5cde:fa47:7ceb])
        by smtp.googlemail.com with ESMTPSA id hf13-20020a1709072c4d00b008868cd4ef98sm1178667ejc.87.2023.02.16.11.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 11:50:25 -0800 (PST)
Message-ID: <c1437eb6-0c01-809f-422b-cb1109489355@gmail.com>
Date: Thu, 16 Feb 2023 20:50:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] dt-bindings: mmc: meson-gx: fix interrupt binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_115030_234408_710DA487 
X-CRM114-Status: UNSURE (   8.74  )
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
v2:
- omit maxItems and use items
---
 .../devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index c8c30300d..bc403ae9e 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -28,7 +28,10 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 2
+    minItems: 1
+    items:
+      - description: mmc controller instance
+      - description: card detect
 
   clocks:
     maxItems: 3
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
