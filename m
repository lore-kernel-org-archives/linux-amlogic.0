Return-Path: <SRS0=XvYc=TJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEC2C04AB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ECB72173C
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2019 16:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZnWqNYkR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ImAZTHHu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ECB72173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=o3/I4fl21O4APoRJoLwN+ILyB/jjZMNY5WECFHAVWkA=; b=ZnW
	qNYkRwTD76jf2HpLIz7AsWDAZ/fB/txe5XCLoO8YTzpYUnedWwK2LozL3SwASHJqRK/BL+DB/r65I
	haP/Q28X7+7P/4NH5lFX3nsi1wGdvUauM0TpRwUj9KANIW1/H5azhByK0Zuvm8cw0wQWxUOBFOXur
	7RgTSEgR2kf25KPQ5rYBK7rUgsgfkHeK38OxpsqNmldw/+AtGuRJ251KKcY6NKAhd6+JK3PJ290xM
	ccoA/L/VQeeTFOaB6hBX1TU7QxoANlEM5t2s6Lt/xA6MZ7PgFxp5df6Gv+gpncp9cT49fEKChqg+E
	EmYVhF2dCJAAVhqni3Yn7BqpJ3vW+Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOlut-0005nX-QP; Thu, 09 May 2019 16:29:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOluo-0005k7-UM
 for linux-amlogic@lists.infradead.org; Thu, 09 May 2019 16:29:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id a12so3940571wrn.4
 for <linux-amlogic@lists.infradead.org>; Thu, 09 May 2019 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=xnUcq849ljF3W1PVVaGBumjDSyHUcTVt7HVj2vrbpqs=;
 b=ImAZTHHuJkcRseb3Xm8ZXczl83t2j4YUlF5xajtB6swwmxCVE+rFqGrqeSLPxSt6Nh
 5DR4zpcHG/qA3XBzGzcVQG8xCpjO4PTSA4NWFKu2BPfbTnkQXLnX4Y4wS2j/AAa6reee
 s8AKXQiSpZE31rUUZMH+Mfdm0vr+7rSmGGz6wEKeOu0/YjPUo1aAoRp3g9PNi7js2ZC1
 zcoD5rAHg2oU6rBrot11qF8DFCKp7Uc35edkIY6cMBaXJaZhvvCDtI1dSz3OP6K73bkI
 J4jdszWKQGJjWeW2k/pVLd5l5N8h7zo3F1VAiuDpxupiHlUHq+1D+Y4H91t27ZkVa6O1
 dmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xnUcq849ljF3W1PVVaGBumjDSyHUcTVt7HVj2vrbpqs=;
 b=ZjcBsJ+0deFr+UwnpUtNWDYNlZlZZz1uVvWFGAzFwY+TAAeO4Dz7ZCHMgn+nHcgfDl
 AhkFZolBMCn2NQ2DaJKrAPYfy7x3m49gLx9pHqCAAsVdTn9Hnj6eScQu40aZNwWH1Uzd
 1sXp79Ex9ucJTvZfZUZUVltHhyFNSB2yS9VTzMAw2Q8RsBZIWBBbam3Qbz+yBXbOQb1m
 xU1/7b04dOsl87eFTaYyqmTBdIJyzrx9YtPTDg1Osi6rEyn9KZSQVwdoG+14ZBDH1M1K
 ioxDJrkset3Y/xTlrEsxjvmBMPArFQcVFlAl0rUL3TqXPP1Y0dYpAzemXFCWyjtYnq8X
 YSgg==
X-Gm-Message-State: APjAAAXLe7XjnSyX4rJell8uRBh3F+ilXCBmLm0NxzOi2TSzGCqSdCmt
 iBZfg23C6XzGroIf9oP/WZ5ygQ==
X-Google-Smtp-Source: APXvYqz6tghhvw5ngKFutUOgPjB5QMLbIMJhbXOpnWUau29mKVkEg/a0IPmLzTZ8+PO6XTPmB4S4gw==
X-Received: by 2002:adf:b3d4:: with SMTP id x20mr4226008wrd.284.1557419341336; 
 Thu, 09 May 2019 09:29:01 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id z7sm3649796wme.26.2019.05.09.09.29.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 09:29:00 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v4 0/6] Add drive-strength in Meson pinctrl driver
Date: Thu,  9 May 2019 18:28:53 +0200
Message-Id: <20190509162859.7001-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_092903_035209_B0A5874C 
X-CRM114-Status: GOOD (  10.84  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The purpose of this patchset is to add drive-strength support in meson pinconf
driver. This is a new feature that was added on the g12a. It is critical for us
to support this since many functions are failing with default pad drive-strength.

The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
'drive-strength' is expressed in mA.
So this patch add another generic property "drive-strength-uA". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v3:
- remove dev_err in meson_get_drive_strength
- cleanup code

Changes since v2:
- update driver-strength-uA property to be compliant with DT documentation
- rework patch series for better understanding
- rework set_bias function

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com

Guillaume La Roque (6):
  dt-bindings: pinctrl: add a 'drive-strength-microamp' property
  pinctrl: generic: add new 'drive-strength-microamp' property support
  dt-bindings: pinctrl: meson: Add drive-strength-microamp property
  pinctrl: meson: Rework enable/disable bias part
  pinctrl: meson: add support of drive-strength-microamp
  pinctrl: meson: g12a: add DS bank value

 .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
 .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 180 ++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 193 insertions(+), 53 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
