Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A54DFC6197
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2024 05:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BXCh0MOSPVFTS8iQeQQeFV0l1yFTkoOSLmWTsKdtYTs=; b=Z/uj1HLK4KDyeq
	Wm6b9Ga5ue6bmF5ArxO0qidkDPUx3KVy3D9vmHLnFYYHnnzjahcjW74VZv0XX0NN3+BHlkTDDBB6Z
	6WR2VL76/P5DKBHfFCP2STmdu7cPeGDKcTuZq6XvUcwPCpUL1PAwIPJkAbSyGBfDu9gzrxb1dQxlj
	y6t2Yy1Dvt3Xw2jNnNXpPSY4y8ibttKiEQaOtbCvDy9+I2g19OP3RGNuIK8XOU0qYCibeQ8m+f28y
	SE3wdkyCgH7xuQLhiibjBX6H/SS9qxkWBirkVFL9dCYx5Er/MPEflnKrP5VOBMrCGLJ2jFxX2AZh/
	+nn0IpyDIAI17VFA4Skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spLmU-00000000AN6-0Yh7;
	Sat, 14 Sep 2024 05:57:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spLfv-000000009Wg-1LxN;
	Sat, 14 Sep 2024 05:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A2545C49B6;
	Sat, 14 Sep 2024 05:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C839C4CEC0;
	Sat, 14 Sep 2024 05:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726293025;
	bh=BKPsh9AbBCeenJYCPX7oX8WfRJvUle8s6ls3hVpCebU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Aqwl45c/QrKHaEL8gKhX5A139atg/1UMUnjb+SupwuMCQ/mh+U27rXkZtc4IQs2Tr
	 frI0MPDOttcAMemi7X3Afi2DDujUcswFxlZt4p1f2TocPMicHWiSg9c3F8TBGOwkGb
	 oArwIML7kAh1chrho+CgwHGXnENJ8LkQ1jT1eCap2f/vgAkOSHO+tVs2bqUrwd67s0
	 8TComHpgcUuXw1wHH2bXP7dlH8A1ZBYCdvYMqDz889yfA7ZInOUnCm/K96jv/WK4vn
	 9YIxwbi/3MXHQ18hcSFJzKOwN0Qu33HMZYYiuD94yqs8YBUAUTPLrifZlYRu8k2J4E
	 HW8FuhrkOSPHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4495FFC6198;
	Sat, 14 Sep 2024 05:50:25 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] Add support for Amlogic C3 PWM
Date: Sat, 14 Sep 2024 13:48:57 +0800
Message-Id: <20240914-c3-pwm-v2-0-ac1f34c68ac2@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMkj5WYC/2XMyw6CMBCF4Vchs3ZMOyJVVr6HYdH0ApMIJa2pG
 tJ3t7J1+Z+cfBskF9kl6JsNosucOCw16NCAmfQyOmRbG0hQK66iQ3PC9TWjlUooOkt1oQ7qeY3
 O83uH7kPtidMzxM/uZvlb/4gsUaA22kvltaVW3fT8CCObowkzDKWUL1JwccueAAAA
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Kelvin Zhang <kelvin.zhang@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726293023; l=766;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=BKPsh9AbBCeenJYCPX7oX8WfRJvUle8s6ls3hVpCebU=;
 b=M7zDFQVH4PyRCBGJGwTRhqlW4fQuecrW1wLK8H6y9BcOuYuUtVd5HGbe86zO79gE02SLJlND8
 yNIw6/EESi2DZR9eTrgIF3YzxPLUsPArExC6VknPhKT7ly8i/8w49z9
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_225027_468334_5F233A39 
X-CRM114-Status: UNSURE (   7.43  )
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
Changes in v2:
- Rebase this patchset due to recent upstream changes.
- Link to v1: https://lore.kernel.org/r/20240906-c3-pwm-v1-0-acaf17fad247@amlogic.com

---
Kelvin Zhang (2):
      dt-bindings: pwm: amlogic: Document C3 PWM
      arm64: dts: amlogic: Add Amlogic C3 PWM

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       |   1 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 364 +++++++++++++++++++++
 2 files changed, 365 insertions(+)
---
base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
change-id: 20240906-c3-pwm-d17072517826

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
