Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A992C61DA0
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=by7I0EdupnMpff9FwBPZn4dFrZKQ6H2xBKVXvN2X7xA=; b=EAwffJzvQlIpTL
	IkWSTAW1n1eyal1Hh7RNWXGBbL2LlYlcTD4Oe+gBrwdmT4tzuEH0Bypc/eSqvEGl+tzCiD3vY/3Nx
	HQnLe+KoLRvMjVsusnB/SRZJP0JOWCO0IMCRY/xKRq828BV7u703c0MNeT76BcqDA6Aq8ZIX53EYn
	uBCsRDus/Ja5SuxbaGQfXtFOKjsKv7M9ZyGoOri122my6f47bpvwpHJZMX6CDUyHxnmOOKM48YWUi
	ycIiQ0f+FNtLzh705pz3Ng685f4AYLa2dZMKnx5LkmogV1cUDm1sziTEQqHsBuY2mHlrt5Q8yAEa5
	HS9CiujHEX8pC0jTYKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKazX-006MuR-Kw; Wed, 25 Jan 2023 08:18:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKazU-006MsO-32
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 08:18:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id m7so2537628wru.8
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WbD+hf3FdzdoYfGCceQ6HYFxbilvveL00wdzz479bAg=;
        b=TU4IljbPlO/Cu5JIUMlCZ3SK14XQ4s6KPMmklhaXSQ42uMuxnqet82/79UIicE2Q+R
         UxK2bCwTgpGlL5WENRCZe0EedKJUh/IIEPFW7xMPyG+YGvIZHt3cCzpn2Eq41wGMX2/x
         POPZH5/y1aiy/YES1lr93Flbo6Hzeq4UZ3W31Xq3Ccb4Gt+9nYcoZZ/9iZIxrJAaq5uG
         cWjk66Q4e67h6YH+celevxLvumcA8mhPWPyczXo+YpRbmkCXQA0dY7iZ8WAx8gGKijMO
         zXQw3nSbnlDJk8+8EYCgAIT+bnj20xhvpRk03R7iGSiES8205uxhWfVIZyoKSJPVupmG
         1jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbD+hf3FdzdoYfGCceQ6HYFxbilvveL00wdzz479bAg=;
        b=w41bGzCRpG0Ih0+4MVlfWoHbdN/5KGZHL5hzSMaYiYk+xjkBUOac84n8p13CaEQASi
         VR876i6veVVAbtTqMGbSanNhH27YmR/zHsDSX2iWuJZ0e8vMF3OzrltEQt1xUnV20xTV
         3fo8T0VgoxSmra9ZHQgz74n1fK2eqX/O8PYAaWfA+aNZT/GlumdERf6DsFSN7ZcRMQgY
         zyUhL3oWw7LVDFIHJ/mpIdjW5f/flyT0ukr0C8x359fY7yTh5nTFv1x6hjxv6ilU64HG
         dWWwj8GGqp3Z/owtor9fc2fOwgZD6InEQ4LJOq8lbd0eP0aXybOEmy4A/Jn2bbLoSyKD
         7ndw==
X-Gm-Message-State: AFqh2kr6rgDa5/ZCfiWPuKKHAlby96tsRKk1MONZAi6DK5MC3TvEPHJq
	DxOn1pPy7bA517VWNF+jkOVL6w==
X-Google-Smtp-Source: AMrXdXtpdzpnwqRRl/ZPBknIAsI3dT0aYCw6sp/T5m0FkClf8NlpnkPD9KBbymR3GBHpDTU+rz7f8w==
X-Received: by 2002:a5d:404c:0:b0:2be:1258:897d with SMTP id w12-20020a5d404c000000b002be1258897dmr26796348wrp.43.1674634722560;
        Wed, 25 Jan 2023 00:18:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p7-20020adff207000000b002bdff778d87sm3770343wro.34.2023.01.25.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:18:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] arm64: meson-g12b: add initial support for
 Odroid-N2L
Date: Wed, 25 Jan 2023 09:18:36 +0100
Message-Id: <20230122-topic-odroid-n2l-upstream-initial-v2-0-8d3fea6d403d@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANzl0GMC/5WOQQ6CMBBFr0K6dkxbMIAr72FYlDLAJLUl00I0h
 LtbuYHL9xb//V1EZMIo7sUuGDeKFHwGfSmEnY2fEGjILLTUpVRaQwoLWQgDBxrAawfrEhOjeQF
 5SmQcNFiNdaXqVlsl8k5vIkLPxts5L/nVuSwXxpHeZ/jZZZ4ppsCf88emfvaf5KZAgrJ4Q9nIs
 h3kw5E3HK6BJ9Edx/EFgykUy+gAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Dongjin Kim <tobetter@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001844_228096_E87BD7B0 
X-CRM114-Status: GOOD (  12.14  )
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

ODROID-N2L is a variant SBC in small form factor and some peripherals
are removed from ODROID-N2PLUS based on S922X SoC.

- On-board ethernet is removed      
- On-board RTC is removed        
- USB 3.0 hub is removed, so one USB 2.0 and one USB 3.0 host ports
are available                                                                               
- Huge heatsink is replaced with 40x40mm heatsink, 5V active heatsink
is recommended or a tall passive sink is optional                  
- 3.5mm earjack is removed                                                                  
- IR remote receiver is removed                                                             
- MIPI DSI port is added

So achieve this the current odroid-n2 dtsi is moved as odroid.dtsi
and only the N2/N2+ changes are kept in the odroid-n2.
With this only a minimal changes are needed to support the Odroid-N2L.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Fixed include and phy0 supply name on patch 3
- Added review tag on patch 1
- Link to v1: https://lore.kernel.org/r/20230122-topic-odroid-n2l-upstream-initial-v1-0-1ce5e08039d0@linaro.org

---
Neil Armstrong (3):
      dt-bindings: arm: amlogic: document Odroid-N2L
      arm64: dts: meson-g12b: move common node into new odroid.dtsi
      arm64: dts: meson-g12b-odroid: Add initial support for Hardkernel ODROID-N2L

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     | 448 +--------------------
 .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     | 125 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi | 445 ++++++++++++++++++++
 5 files changed, 581 insertions(+), 439 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230122-topic-odroid-n2l-upstream-initial-8e4f741792c1

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
