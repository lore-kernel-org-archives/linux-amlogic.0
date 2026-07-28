Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42475C54F4D
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2026 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrpyiXGXvRYMImtAUV0g2nqEf7xs6VYprMp8sfl82F4=; b=TqiIgh7OBzz9zN
	521XmLxXki+be5szKAl5Vc50/vWYXK8MNukWUwMPlDBZr0z/0piwgjuJ5xbUEoZ2ZTpLbQ+eE6OMZ
	1RP3jWW1e87SeLxcjOE2mbDiibu3hh24jmIdA5gu7XOXgX/AUOr9mBdQM7PvZ3KJ3GPL/3VE0PS/c
	GQn0GM1IwltBFxJM4jCDuEtjq/1IEy2JBDCXGh1c1aBWc0Ju3dH+xB2nsVBhLyBsCJD+nSk0u3c0H
	69FnW3E/K2yudLBbbmgdU2lsa+gQBjkDIel+YTh3njIfMtTg6rZzauUlmakF+TYBS6tjA5eihblZX
	dO3GnjmwCL9YhNnGjZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojY0-00000005c7t-2i5m;
	Tue, 28 Jul 2026 15:16:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXx-00000005c4m-2R1g
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jul 2026 15:16:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so29665515e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2026 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251803; x=1785856603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=LOuJTKWgyJl7MH87a518I+rA8z1otp1SH5u5+6L0ZhWTncylyo42ys7wEneyK1GzZR
         wTcs3G+rb0pIVmYjNstbmQZMYf9guQdtTtX7w9kY2fsG+mdHyxbGhqBvJ2AptrcU6U/5
         NKJYDObEiFA5BZCmyYvCXeMdOG0pvwCxQA/hEHK1sWtbzZEe1+sYkidyWrO4GHTIWFnM
         digvxWmfwuGunamA9Vl5/1ypqYsqnZwxqZJTiAQ2VDW6JbXynbEV9eXCtQaaW1GsZ2Ap
         0rCYTrPSl9Oh9I7hnB2Lk1GDX6AcAu/xlE86dlIXMDc3h/ss0K4H3YX7Bf5oOeKnNC9K
         bqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251803; x=1785856603;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=YvIQsPB6K75+ZH1QdsxukH7ngh308lvXosrz7qN6sYMN/bOyQ4+Hs99ipXVlQOg27t
         59QsiZJRNtTwAxjZ7+wVTIM7kmZHl3oXoxJKHz6X5GJi7L3V4TLwJFXQywTXaQMf/Vzt
         jnH8IoTjHGGpscE5uwmSDhaU+AyScWhtm4E3p0xU4AVDPJYC6pmQPqH85osGEEjB1pSn
         hdoPMzMzAiVV3nThXHTbKbCjCjn1gzDpRAltjhADVwaywfx1Q7qgEiR8/mAehrLqCp2x
         riy3LNM8yE7BBsdq7gB6ffw7GOfe+FIR6FrlEIsQyYo1LUMutrhi+zyDgYgY/xkQn9/e
         ZSWA==
X-Forwarded-Encrypted: i=1; AHgh+RroeegwhZC2+UqH6Cbd/qv3EUaB5da81kaz7++5D123LkHMx+FIr1WPXe6JHHwmc8+T188/OYsLNpB/83pd@lists.infradead.org
X-Gm-Message-State: AOJu0YxAmDra33XhshmXzPiCkKaehYqm9ihDGqFa0qUJuqyInnNnTlz9
	bEV9zXyrPf1TI6FGqGHaisZ08rREJTR6Ls9WpqcwXROFD5GfjQcJs5ZZ
X-Gm-Gg: AR+sD122M5hAmadK03b8OCO49KDJzVkrQ8ERS8h6Sqp4I2iHvyzYn+jHb32XQQ7NFvt
	vc+CVBV2Ics2+ylgxEBmV2DQ/FXYlnfeKkFCjUja2aJzAz42GzU1b1yxWuK1gPQZx61acJpyVm9
	0YXfsZRimu9j4Jx82j1+FCrVzVq59+Fd6xHx2hIScktAqz7k2PYqtWohkAiug1eFFoZkxjbWEUK
	/38VltO1YF/MTGTRXurojJkjIR/O5VAXuclY0qrFCwP+01TZ2z3L5/6/8C/KfG6hd6gy8jZIs+f
	Z64vWLv4V0gmHoIRzexoZq86A36nPRZLiRRHWj+VeaTJXXWVjqon+nYin0xHAPkQCfHNVvFYRfj
	PefEettTqSlQWrgt2EReSC/+OikGEwhRA3hkaswe0LxDM2OTEu8CGk77kG1znT2HXxH3Tu21KLF
	oHFoyrCMxnqY8eYUkN9pUwICLuC0gMV3swQLksO+biQVMqTA==
X-Received: by 2002:a05:600c:4e14:b0:496:bba5:33a8 with SMTP id 5b1f17b1804b1-496c658ef36mr29194675e9.33.1785251803412;
        Tue, 28 Jul 2026 08:16:43 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:42 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Tue, 28 Jul 2026 17:16:35 +0200
Message-ID: <20260728151636.236393-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_081645_647829_29B7525A 
X-CRM114-Status: UNSURE (   9.18  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
