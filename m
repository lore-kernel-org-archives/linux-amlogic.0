Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6B6C5479D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pzhd77y7E+nu1u4nNxvUBf+Uc+QvZdbLtQrlqjqP6Vs=; b=Yup/t6K/K5prx4
	hGYbU5sQVzd0tj0MvpwfnwR0+zHxKfs7wSrwsL11TRxrWdlQ/+l3jbtyTXuDwKORisBRpnbyGTJml
	DDErc2W3vt55xrprKStA7HPvJEX7l2euuWdqLQLd6nkxAVg2QOwdc/GUzPRmnVECfATypSUvsEn3j
	PfEFuLGWvlg4mSqxZ4AVa9DC317tPOVOPv+JWlbQt+sDC/NTQlnFKQ6ivZO46KD6vv6rGOphDzaNF
	qBTljQ1M53JmhbTGGk9fvvvzW2JAX70SdZuQMrX9QdhcDMjOspgFQ6xPyCEXBS1Dm2/QUR/4QGiqj
	XJjyhuhWcHv5CW+pKH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQL-00Cvsw-RD; Wed, 11 Jan 2023 21:14:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQI-00Cvqb-Tv; Wed, 11 Jan 2023 21:14:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id v10so23003605edi.8;
        Wed, 11 Jan 2023 13:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhmFViFxYeXhPBfMdH2JMXAQJizOCgQmv4Ir0VlAq7k=;
        b=HyZ869rcIlQC9PV2d6dlnTequSI6pDi7seqna8LRb3bYGHrQezFLCor2NUvqXrJUZQ
         2BVT0sPQ7LZrPMDCy8t3xIh0NsqdqBM0tFSxR+tGUpguo8Sf+qIEnygLHIERZTZ18mhr
         eFWZwHML3h1kcbK7E2JnYvc1iv9pYzCIwAs5kN+n4anX82hzxboTCcwlRwhVLakq65H1
         qD8PUngCAVr82wIcThbnz8RUKvbF+A/EpeeOhQdP4nhoCsfdsUk/nWUJMI5IXiFGBHYX
         yKiML8Zu6rGagpiOSb/oo0aXPlVKTPGFy3ZyEroZkzLnNz7WDEi0+vn36YcaPPUNtO+m
         eYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhmFViFxYeXhPBfMdH2JMXAQJizOCgQmv4Ir0VlAq7k=;
        b=ajkKQvLxIykKzL9DSxVk+VPH4F3T3knsoAURXpYUEaghGM62JEFV5SbLK2oFvOHQrG
         3YsFXvuH5PN+LWN9Xyucn91mtUn5lx+sxmOHkxRxUBpK6tOC9UJvLGZKkKXBcdB00rqC
         XYTGt1UjnQvuwimgPa1Zw+SJ9EDzoLo+SFU4fANeJyqI3OQnHgsz/liW4b1NEipru5rE
         Nld9DNpo85/zgmW/b3LyQ48k/QlmA2EqeY7AMrfWMcXLWgZdKWL2Xtm5hpsYz8gjkOW6
         Q19u5BBQnJ9R9GYu+Pdp/6x5NDIaR9k07I9HAzGgjc/HnJ7feDrVLQ02XdRHem8Z9QUx
         A4Ng==
X-Gm-Message-State: AFqh2kqPi5DwybQIPI1pLLen4wdUQl3IcNrioMQEgZw4TWYLdnCNJ6KW
	0cJE9bBhkCgQlseFPjNNSkBU6ebbEu4=
X-Google-Smtp-Source: AMrXdXuscaZmFnnTyBmB93xjcQuSnIeoJuHRy82sUhdhqEsMXDlcXIaeoOQrADX1xMXThD9aJrj61g==
X-Received: by 2002:a05:6402:390b:b0:465:f6a9:cb7b with SMTP id fe11-20020a056402390b00b00465f6a9cb7bmr64883391edb.12.1673471647478;
        Wed, 11 Jan 2023 13:14:07 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7325-0300-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7325:300::e63])
        by smtp.googlemail.com with ESMTPSA id l4-20020a056402344400b004822681a671sm6485079edc.37.2023.01.11.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 13:14:06 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/6] arm64: dts: small .dts fixes
Date: Wed, 11 Jan 2023 22:13:44 +0100
Message-Id: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_131415_007644_0B1B1A75 
X-CRM114-Status: GOOD (  10.57  )
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

This series contains a few .dts fixes which were found during review of
[0] (which is now the first patch in this series).



[0] https://lore.kernel.org/linux-amlogic/20230110215926.1296650-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (6):
  arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC address node
  arm64: dts: meson-gxl: jethub-j80: Fix Bluetooth MAC node name
  arm64: dts: meson-axg: jethub-j1xx: Fix MAC address node names
  arm64: dts: meson-gx: Fix Ethernet MAC address unit name
  arm64: dts: meson-g12a: Fix internal Ethernet PHY unit name
  arm64: dts: meson-gx: Fix the SCPI DVFS node name and unit address

 .../boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi     | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                   | 4 ++--
 .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
