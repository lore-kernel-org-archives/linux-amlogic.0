Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561A9CE7AA3
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cZkv1F51EUJZOpg2NmgWRZSkIN/RxgD3rvyrCB5qmP8=; b=XSPNoV7mcY3YRi
	SDbM08oAs8M5VzfriYO8gn4DuZmIK1AtGsVXbCyR7D8DFtfrJ72QkNuWFySzCdDKR4ra7np/opUnh
	HkOGhEn7VIsqdJjDUzAnz8rDs7TzwPzgFcqsSf88JXU00VUeKSAhwEnFLi+CElYVT/2qcS+i30h/G
	sV6idrVxpPWzFSsAw8T4SHRAsFvGnyQZa3j0lHf7BMrAkxD/ZZKfCAO+Yz9pHwDbtGkMU40sOqMXG
	1QYIG/mL5gJ0ZyH+o1UjxIckfhDrvFbxI6MqAL9bGEI66H3C0HR6reAdOHWYTlJ/YrX30OLURcgGq
	uK+nvjvDAD0urH8rjejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYME-0000000CDBN-1eH1;
	Fri, 06 Sep 2024 12:46:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYM9-0000000CD5W-1Lw8;
	Fri, 06 Sep 2024 12:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7B27A44F7C;
	Fri,  6 Sep 2024 12:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B36D4C4CEC5;
	Fri,  6 Sep 2024 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725626787;
	bh=Af4hVO2lEqJLghX243SGdJHNChv8mD1EBsYO0E+v2XY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EduTf8XsLV8NI4SzzhCH56sp1alDH9umiR+j/e52eBLfrH0A8CyTcEpXmWO3Xzet+
	 kmXIiOe+7e6cOXkxt6FdSTfRDt6oZwO8JFfynk+ydUFpuXA3S09DCMDeOMntqXnxVc
	 grLBdk8Sp8xtNorSb0lU0LD7mqerI6g3MR9/nJkwYkSZBV9GMeb4YEkKpN6Oh9DF1T
	 9L0q8rvdPTLMJUnZTBdJun63RiR4vxRQ7tiNsC9tIBwYnn564eQA88TS9i1/rXDK1B
	 6SfZTrmmjSYdQmlbjK57xE2Tj0sQOkxpeXlxax7JoXZ3WxMC2HrtML8AQLDHRq6/gu
	 hfOryp4WVuXjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D3DCE7B03;
	Fri,  6 Sep 2024 12:46:27 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH 0/2] Add support for Amlogic C3 PWM
Date: Fri, 06 Sep 2024 20:46:11 +0800
Message-Id: <20240906-c3-pwm-v1-0-acaf17fad247@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJP52mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwMz3WRj3YLyXN0UQ3MDcyNTQ3MLIzMloOKCotS0zAqwQdGxtbUAHXP
 JPFgAAAA=
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725626786; l=600;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=Af4hVO2lEqJLghX243SGdJHNChv8mD1EBsYO0E+v2XY=;
 b=8dq3owc63Flh3oSrwiJ6ZbPd7n2PLeqykBE4++TGv2VCDPWshqQnmin/SpZG7z2QVX5yEfHtP
 IzzrWBjOQ0uARrFv2gIh3PY+imduyZF5JwpKVMDj22KLSq1Sx4uls6O
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_054629_487224_94AC58E5 
X-CRM114-Status: UNSURE (   6.58  )
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
Reply-To: kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for Amlogic C3 PWM, including the DT binding document and DTS.

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
Kelvin Zhang (2):
      dt-bindings: pwm: amlogic: Document C3 PWM
      arm64: dts: amlogic: Add Amlogic C3 PWM

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       |   4 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 364 +++++++++++++++++++++
 2 files changed, 368 insertions(+)
---
base-commit: ad40aff1edffeccc412cde93894196dca7bc739e
change-id: 20240906-c3-pwm-d17072517826

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
