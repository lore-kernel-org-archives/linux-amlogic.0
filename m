Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC104C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 14:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA27B206C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 14:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JtMs8nKg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="g/Sm8U2S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA27B206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=srqihfpDccxDaorYd8njMtN8qmq1F0nhBkuFdVfV/k8=; b=JtMs8nKgU3HsF8
	IedyYB8R2CYSX3S5dICW034f7BlU71x6zEslmBnbSAZ66ylSnCXuYoLxFp5xL6QT+nf20rup/H43X
	WYqE7kk3dFUlQ679sB6d0QW5AzQLVaX3TidljHRaRPoqBPO3W0OGDQxTLRml6kTQYH72LTZiNb4a1
	raelLAGzNxgHv+CgVdBwK4CcJLB+k5Lef0KNT+jKfBV7KPWLhiAFUtuYmbAafuiP1NznIyRiOh9az
	p+s/7xeHSutPbIJe+qnegLy6Q6uV1JTdc+uTG0XmD9Sx8CQEXFAWMryCtAbOuaMmjt1vH8MjujUUY
	nVeF81YwBVcy+I4SndTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9sI0-0007vJ-Lj; Fri, 29 Mar 2019 14:15:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9sHx-0007uh-0c
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 14:15:22 +0000
Received: by mail-wr1-x444.google.com with SMTP id r4so2794610wrq.8
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bExmUihlojOJWJX0CUX8FKYpFpDddupLfDG529pJpzQ=;
 b=g/Sm8U2S9xlkqAbA1k9ap39rlQXWapDtM+NsjWba0s2K/qaa4rvrkeqGsD7TQqkXV/
 KPVRT5AjP72EXtkQkHWLhQ/yWGBoJz8AS9rNlQZL3htDoPIowtVrmIsDmO3vk1/rtvGz
 izBlUfl2Jpegp8YukK7dFSF+7MSgj6mVts8kPEQddqBQ6OE5ycEFZLY5I0c4lJaVq+Gn
 R5rBQ8P/d/XZYCeJdqgsY+RMKiT/zsnhva59juQAN6HdSxp86alO126LN94IeA/yH5BQ
 +dMUMzSxH+mTLzaxKo6Ajx418gqq6fZTccspYuDoRn3Y5IIix/5a187VEb9cR3SLZOLI
 Q42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bExmUihlojOJWJX0CUX8FKYpFpDddupLfDG529pJpzQ=;
 b=V3u+DktehqZbeTEEGfuk6bOvPxYM77vuQzgYcqkSazO3kQULTxVRT/pmbxOCyzGfn/
 y7Ke06B3TKK5EQn0aemNTOsftwVJxYEYmi10ZOzfbjXReVx0sFnmVQcHlVeSC57EpAju
 NnESQeqv5DlkWL2qE9hTWnWTxyvosof2dwwvRlAfya9him9fomPJQIsG8c21/h05+jXO
 yBDdq5/VI5hjJ1TMAN/RJPY7waoRSNIPjNGrf61i6j8XdgUvKXq/Ufc9/hDn8Vl2D6X7
 5StqKUTOBwh9Z2Yf49Ic4n05Bd3IbbssQkg4EXxfuW6RsPgx1nrQ0nmzdKbbD6wcJ7YV
 GqgA==
X-Gm-Message-State: APjAAAVW76OVCi+A7T6Zi/t6q9C1R1C4IPDyexP3b+fKI+xL3SWZsvYc
 /4ib0MHII+OfLGiXJBy4t75yFQ==
X-Google-Smtp-Source: APXvYqxgaOW6G4ZVwbyC2eivSdpIAv2a2MY70WF0EGGyQajxt1WUL27rRuCeJBZjm/vsm9f0bdj8wQ==
X-Received: by 2002:adf:dd49:: with SMTP id u9mr29632628wrm.316.1553868919236; 
 Fri, 29 Mar 2019 07:15:19 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 67sm2464333wmz.41.2019.03.29.07.15.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 07:15:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next v2 0/3] net: phy: add Amlogic g12a support
Date: Fri, 29 Mar 2019 15:15:09 +0100
Message-Id: <20190329141512.29867-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_071521_197995_86CF3E41 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds the necessary bits to support network on the Amlogic
g12a SoC family.

Only the internal PHY and related MDIO mux needed to be addressed.
The GMAC remains compatible with axg SoC family

This series has been tested on the u200 (S905D2) with both the internal
and external (Realtek) PHYs.

Change since v1 [0]:
* drop '_' from function name unrelated to locking
* fix peripheral clock disable on error
* fix variable declaration reverse Xmas trees
* fix Kconfig dependency on CCF
  (Actually needed for 'struct clk_hw', Thx Andrew !)
* Minor fix in the DT exemple as reported by Rob

[0] https://lkml.kernel.org/r/20190314140135.19184-1-jbrunet@baylibre.com

Jerome Brunet (3):
  dt-bindings: net: phy: add g12a mdio mux documentation
  net: phy: add amlogic g12a mdio mux support
  net: phy: meson-gxl: add g12a support

 .../bindings/net/mdio-mux-meson-g12a.txt      |  48 +++
 drivers/net/phy/Kconfig                       |  10 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-mux-meson-g12a.c         | 379 ++++++++++++++++++
 drivers/net/phy/meson-gxl.c                   |  14 +
 5 files changed, 452 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
 create mode 100644 drivers/net/phy/mdio-mux-meson-g12a.c

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
