Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFE2C53200
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 17:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfnLjZFlrwko7omI0a2eaannEMNj9ufIj947lQduRWE=; b=fNwfh/JsJqW1A/
	DLy7oXJCwtcfzGyYOIq0fQhUG9ZsM1wYqUyu5n4eF8/c90ICJ78FR6u8VKIYvN6d7Zxlj9UFaCoD8
	U/9Wpg6pEac04ACdCMyXrrXb9gG0hU2BpllGQw2FjNCjpN8Uyv+PoMQVWnFfc+rR5cDWeYeMIYa8J
	1/mambTrlJHfirgQAuLIGijgTabTelujyE1tcQG7EbCJcwteXE8BnOL+h8FLCdJJctPLmqKOj16J6
	s9HiJYooaWlIjR+3k1xkEsxWZv96TYhEVk2chl28QtkdeNyYxObgw9a4zhaFfFCZcrRapcRxQ7H5Y
	89X10Aihzc9pEfpp8UEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RT-00000008kBs-2VXa;
	Wed, 29 Jul 2026 17:51:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RR-00000008k9E-1RxU
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49550ec592cso1039695e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347499; x=1785952299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJj03g3u5exrEL72mDEOoiKQU9cZPZAFciC5CP0Ud5c=;
        b=kxyZdk/IG/4KCWlp3koxlel5NY/PYX/Igub0CDCl3tNxxTG9VAq/oX3Hbugjj9yHfc
         o53SbzZg4TJ4BXuIetrtb8IQO5dnRiVChMc8+i4Fj6AzkyPi/MccqenGtTvrs71XVcJk
         yegGcYqqlD1CygQzHJjIkcz4ctY7RYAUwXqmpHLaTRh4hgLAXvA8QXx5L0Zfe1Yig8qm
         WwqqiV1RE7wRwGrPfE9Hc0XXnczrzUX24GHIhm056dFGy5fMiLSi+E0LBHsibapiRlSh
         371rvuj3nN6NyeoS7ZT/sHED3CcVXPjRLv+0t57vbmMVK3WZZuw6o/G55B9/7bda1sK7
         Z3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347499; x=1785952299;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJj03g3u5exrEL72mDEOoiKQU9cZPZAFciC5CP0Ud5c=;
        b=F7lbmeBuC/eRh1A1vMcz5PLGM1NuEOH4FZlKk4bLq6hZNS4NP70GBRGo7oSez7FTSz
         CbDCleQBIoMbLoSH19q/9fnR7+a04JJzldRPTivm127Pk2lzKUwR4+r9VHXtY8NzOCp7
         XvcMMgnXtH6gSLO89vACGEOb2US9/a3Puh559Qr0m07rBKsiep4hXatnsyLL28ADUDb1
         tPeut1oaocKNOd5RZfkF66OJ9LsoSV0FFHrbIkXIQCz+Z08v64UbWbMbmq1ktO1GIszl
         7DLlMnfXxvDVdWN8qB3gdgqFAGw/rcyba1inrdd6d7IfNRgiuyx51o/xHyUdIg7986cE
         izBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKQu8EMPD0+7EE4SZ2aG1P+VkcBXVFCJw14kijwg00UtQ4rXgnJYt81eBKAe3XfIWzWY4RlUaDxW6QzgfH@lists.infradead.org
X-Gm-Message-State: AOJu0YzQqwphzrD+EwfpYfsNAeIsnqAWaHvDdrZEBcGFP5SUlQAtWzSS
	asyJH7Jaz0u+dKXfuqjv9Enlmpa4RUt6HAaGnju+f70BVAmgoNP8AoVu
X-Gm-Gg: AR+sD13c4JPUPrPPzGZ79rM/qV16cB3Y9XVZSyMcAQdjZKTFp1S7rxXyz5+b+v7GOoT
	24RB0zixqpvVwRqF2v3hPgjdUD8PNjHAKo344bNkSieC4vrAK/y0fjRwtLT6o0YFItWPKb4ipov
	OVjfE+x0lGi4VolG3T3Swgfjy/Y6uL+t1Q4Hrxz8jgKyABArVhKZyHmzhFeMjjQQRmANvm523Jn
	I0QGosZyjvp7EsjZaT70m7R3DkuSsV3paoJ67HWTJytFb8jUnrmwRkOvbGFAZkf5DuFDdDPXjPX
	/neMyxchFbvzrUe2joc2V8XRW8exElzoT/e8sE1JBcbXI2cLvO4rhkLfyIvkqC35vTiY0692XYH
	WhhgQU+1/yuaVN3OjqbHMd8vL6d3RkQ0Vurz1LZb1vLnBQ8r+xflGOOvyY8E7gB+e0Sx4E6G8f5
	JwsSHcubqq5m0UrCHk1j68vsxOpjdonk+tipwKmi66GCyCYoqdXDl+EPz+NPxdaB4UbLH3lfL1E
	fwdXeTr6ZCzktxAxHdwzg==
X-Received: by 2002:a05:600c:1e0a:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-497fd31a32dmr37058265e9.18.1785347499384;
        Wed, 29 Jul 2026 10:51:39 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm75723775e9.15.2026.07.29.10.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:51:38 -0700 (PDT)
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
	Alberto Robazza <robazzalberto@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Wed, 29 Jul 2026 19:51:32 +0200
Message-ID: <20260729175134.92909-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729175134.92909-1-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105141_388889_DC4CF80C 
X-CRM114-Status: UNSURE (   7.00  )
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

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
