Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4233EC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Apr 2022 20:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bUJ+dkx/EqYMRogS5eWZo6r0nkYaV2juHweQO/JNbsY=; b=eem7URinkwDK6c
	v0she+Bebv+RGbuBY5t7tL1YD0nWuYHswyJl2riEO54PqtFfkNo7C1QigRlLn2q1o+0AgxjBGHqQw
	yYxehIy/KGCLBtDoRtvGNF/uUH9QWF9Y6rPXIXGJAHo8pEnSgq63+xyLAQEZzlCry/nKHjBkddgrc
	7HJPrjSUL97hTb/HwXjlQo3APKvFa5FTOPZ6Pl6mC3utELov3Qzs7nDcwBEdjtg7ePGYJBzFQ6BDY
	njZuscbwAcSDEYkKmJMDVCyMpWChVPu06Dwcm68KfHeRVy2mFSCjUAFNiqJMIrS2m16ILug1Br2Z8
	HoGUFHeFhiN+83NbXWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndec8-005Upd-23; Sun, 10 Apr 2022 20:56:52 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndebw-005Umc-I3
 for linux-amlogic@lists.infradead.org; Sun, 10 Apr 2022 20:56:43 +0000
Received: by mail-qv1-xf32.google.com with SMTP id e22so11793224qvf.9
 for <linux-amlogic@lists.infradead.org>; Sun, 10 Apr 2022 13:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prism19-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4Dm0zZiVNz+3KjhnBsylTDpY1b0Arid63IH2fuAnik=;
 b=XrE9JJrRaF5iLY2JPFzzhhBr+NmyNaXlURO7Am8sXuwB5LTKcNq7cbc57ZCESWKJVA
 ViMCAynxoDmUwjI3l1MH/DclLSskI/r/ezCnkW2hNwIg9LL6WvqwNgFjxvNYO2gs7TZO
 v9I9kihxoJBmmWlji9Jg6CjthaNKMaL3SaeKWU4Cc4/bk6sdhCfBHfx8kQxq/CyEcKOM
 SQYmaRjaJw25yY2fjA4rh+L8UAr/TBEJ5onCKlHA7+Is6ftwEPo7OapWRPU5ElVav7jQ
 JGUDps5Y6qtMvtJaDEJUAEBadoEeIy4Xiok33I4BWXH+WkEkTffro2AgOmLm1NcX1elX
 fr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4Dm0zZiVNz+3KjhnBsylTDpY1b0Arid63IH2fuAnik=;
 b=uBxfQV7L7W5pVxdyUPJxuYTsfG+EIg4VeNXr+tTYsLj99XdLgPrRUuh4a6r94ILIoS
 RfX4rfaHl6l2RlYXLPymB40QqjSWzMtc8kTCXi9UwmO0X+803ASt+INVcITAotU8jjPq
 W+dK6sbsl612pUc093o6JwUerZwu3fh0IVlKTLgiDWIDVvnKoEQ6mRKuORefTAgmHFHz
 ekuJ4XmrovRsU0xV99TfPhrqYMUxIvJzs875Rh1wm8QhNyoC8wLDi00yaJM2KFdq1hqk
 ZjXhuT6D3j7AnqFhG8VVSBG47MElbrsqSKjj5IvN5JhLuF5EyIEuDoA5Rf1b4x+ywLme
 v1MA==
X-Gm-Message-State: AOAM5300r+H1+REqNyWkA0ulBPhie0GIOYVXsjimGCrRq2EZqiV/w0q2
 9MplIw3xCR9SZh7t3iG/efTcVQ==
X-Google-Smtp-Source: ABdhPJzKr+05g1w/9S4kzn27/Px/j9DsPrGWiXdcX3y2gI1UMnWoBRqzRfgcxanrSdHR+07WQSThEA==
X-Received: by 2002:a05:6214:1d2b:b0:441:6a41:f726 with SMTP id
 f11-20020a0562141d2b00b004416a41f726mr24547900qvd.102.1649624198180; 
 Sun, 10 Apr 2022 13:56:38 -0700 (PDT)
Received: from RADIUM.localdomain
 (bras-base-mtrlpq2718w-grc-02-76-67-205-66.dsl.bell.ca. [76.67.205.66])
 by smtp.googlemail.com with ESMTPSA id
 bl22-20020a05620a1a9600b00680da570a5dsm19073102qkb.61.2022.04.10.13.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 13:56:37 -0700 (PDT)
From: Guillaume Giraudon <ggiraudon@prism19.com>
To: kernel-dev@prism19.com
Cc: ggiraudon@prism19.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin
 labeling for CON1
Date: Sun, 10 Apr 2022 16:56:24 -0400
Message-Id: <20220410205624.14295-1-ggiraudon@prism19.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_135640_914552_03434C2E 
X-CRM114-Status: GOOD (  10.55  )
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

The labels for lines 61 through 84 on the periphs-banks were offset by 2.
Realigned them to match the Banana Pi M5 schematics.

Signed-off-by: Guillaume Giraudon <ggiraudon@prism19.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 5751c48620ed..754c3d43ef0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -448,7 +448,7 @@
 		"",
 		/* GPIOA */
 		"", "", "", "", "", "", "", "",
-		"", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
 		"CON1-P27", /* GPIOA_14 */
 		"CON1-P28", /* GPIOA_15 */
 		/* GPIOX */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
