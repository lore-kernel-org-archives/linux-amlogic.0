Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B22AE8181D
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Sep 2023 05:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mWw5u2Oaj+nTkMi3rQSDNog6o5kSRBukkMZZ7L2sS1k=; b=xBa09V5wKP9ozp
	q7ASixOiGBLRY/MBfbVR4gJXy03UuzcSpicGiACFHe4/B8Gnj6/7KKg7szPlBWYi6RmmoAOz5SbvK
	4SeW7HCz90g/lo4XkWTR9fxqjFN56hePc8vyF2S9UTMmy0t0p/8EPh8P6hHSHODoY7uieegELiFDc
	NzEaRFL0TjBmNiTzfrOwM4A2fk7J1axoX50Aq1HTJfEScqbckD2CQqrwJ/8/eKMTQcQF5x5TncKgD
	xTLA8pbasPJou5kfv9vqxBl3WEM0zHhAsiK715h6zgYd82qlxTYANjcBLGlnObGroFWZn1MMAFlKW
	dbcwbHKIqHpLc31efqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql12z-00Few5-1t;
	Tue, 26 Sep 2023 05:55:49 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql12v-00FetC-34;
	Tue, 26 Sep 2023 05:55:47 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 26 Sep 2023
 13:55:32 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 0/2] Add watchdog support for Amlogic C3 SoCs
Date: Tue, 26 Sep 2023 13:55:10 +0800
Message-ID: <20230926055512.2355390-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_225545_985783_137879F3 
X-CRM114-Status: UNSURE (   4.64  )
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

Amlogic C3 has the same watchdog controller as Amlogic T7.

[PATCH 1/2]: 
  V1 -> V2: Added compatibles.

[PATCH 2/2]:
  V1 -> V2: Increase compatibles of C3 watchdog.

Huqiang Qin (2):
  dt-bindings: watchdog: Add support for Amlogic C3 SoCs
  arm64: dts: Add watchdog node for Amlogic C3 SoCs

 .../bindings/watchdog/amlogic,meson-gxbb-wdt.yaml           | 1 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi                 | 6 ++++++
 2 files changed, 7 insertions(+)


base-commit: 8fff9184d1b5810dca5dd1a02726d4f844af88fc
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
