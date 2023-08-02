Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFAEC001E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 03:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6bPsrLGK5Dd3r5q0Bs3kGe4Zsox2dZsoL+6tGe9soTw=; b=ezGUTQWKqk4Jgq
	4jHy8C/iVwt9N9ooLVrc9zFxmiZdaDI1ybVeI1RtfIhI//ABi2pdIWBzg7egun7kQDKzl4fNUlYvr
	Qq6pu9zRHXi2Goqwt3hrulbi+mkqoXs7Iu4b1ZdQPP+ypj9Q93yU7vDx7msa4LEUzA5DdVS0JfVa8
	hfm5jxVKZ+ki8AT+xpgSHUZpxqNddE7oglu6ygSji8/DAJL2qpbfnMVwpCR23AgyCcGscHEoAgsjY
	Ee7Ly9KySJhETmYWgzcZPFVZLbeFnG6MyfN2aaAwbvak6xPKBz6Q2AfzD80Rr4Baos1IGxlLUdQD6
	QoH7q+hS0zJlzm75sTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR2bZ-003sVn-2e;
	Wed, 02 Aug 2023 03:32:57 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR2bW-003sUl-13;
	Wed, 02 Aug 2023 03:32:55 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 2 Aug 2023
 11:32:27 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 0/4] Add watchdog support for Amlogic-T7 SoCs
Date: Wed, 2 Aug 2023 11:32:18 +0800
Message-ID: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_203254_389263_B91DA12F 
X-CRM114-Status: UNSURE (   6.83  )
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

Based on the original Amlogic-GXBB watchdog driver, support
for Amlogic-T7 watchdog is added.

[PATCH 1/4]: 
  V1 -> V2: Unchanged.

[PATCH 2/4]:
  V1 -> V2: Rename rst_shift to rst and use the BIT() macro
            to build its initial value.

[PATCH 3/4]:
  V1 -> V2: Use the BIT() macro to build rst initial value.

[PATCH 4/4]:
  V1 -> V2: Unchanged.

Huqiang Qin (4):
  dt-bindings: watchdog: Add support for Amlogic-T7 SoCs
  watchdog: Add a new struct for Amlogic-GXBB driver
  watchdog: Add support for Amlogic-T7 SoCs
  arm64: dts: Add watchdog node for Amlogic-T7 SoCs

 .../watchdog/amlogic,meson-gxbb-wdt.yaml      |  1 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  6 ++++++
 drivers/watchdog/meson_gxbb_wdt.c             | 21 ++++++++++++++++---
 3 files changed, 25 insertions(+), 3 deletions(-)


base-commit: 6f048cc7a635b8736b4c7ae0e5230a92e3e648eb
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
