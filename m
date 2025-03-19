Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52C5C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A8uxkziSc78lsoHr/vtPjuHwBYSKyIcXJX+LofkQKCM=; b=RygYo0eyXD28fT
	IjvfUmnAjg5VLQtP5RIOPrVB8QkG2/u0r0lnT+3p1EoPK2g6dmF20/jtQLSL1du4kZ3727nprCS8D
	WncAHMk+yJLbqARk5RYhBP68gU2rVHSqtGz3+Y/qQRNJhzBcSkfjHKkwnojEf4Be9l63s6PKlgjwC
	Mv2X3IXVE14/+hhbDBs1eH1eqamkEdCXTmyNNUIPag6pHejyznPzCAtDsL74nRgu3qDrRPy/4IaU4
	pJ2HF+xq+hz/B5ari5GvohoU9Ad4cvkuTEDDfLbK+sXuX/OiaZdu8V+Az6VZVBJyw/Sf/Ce6qkzZR
	wU15Nxq0i+8Bo8Dm/R8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunaj-00000008CCK-3vr0;
	Wed, 19 Mar 2025 07:11:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tunVi-00000008BFR-2HZP;
	Wed, 19 Mar 2025 07:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70F835C5A21;
	Wed, 19 Mar 2025 07:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0EFCC4CEED;
	Wed, 19 Mar 2025 07:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742368000;
	bh=QDLS/Wim5Nao/KA6VbLQAFMVgRl1G3PVTVVLioUmM98=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qZaWWGrrBtGLCdxA1YIhbIe2l8q2NWvr9HLjddWCqiFOkP/VNPcNc4ljgERhvPqEB
	 4hMOoTBGezDTMBhAyzfzZcOK12R2TgFAv03j65THBqIqXmUjyXTYcAj8s8pqnnTZwL
	 CgaG42Z9/VgjeVpY+I4TrVSL77c7praqLZggJpsAHNnvd4+yrSn93YImB0EOmHxQG2
	 dK5vd0FWrK4+Dv8ju3anBqw0bxJ69vZSULByKAFnsC3T4/DMOWRUjmxPHe8n/JTSFJ
	 L8Uis7Xezy6gw+1VNJ84DaGH7kUTjOi8b0F+Ka/B3tZlPOnVbRRc7QP6Q22n3a//Xi
	 JAekFUA9VM3qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB78C35FFA;
	Wed, 19 Mar 2025 07:06:39 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH v4 0/6] Add support for S4 audio
Date: Wed, 19 Mar 2025 15:04:43 +0800
Message-Id: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIts2mcC/2XM0QrCIBTG8VcZXmccPQ5dV71HRJi67UBluJIi9
 u5ZELV1+X3w+z/YEBKFga2qB0sh00DxVIZaVMz19tQFTr5sJkHWIARwe/UUdz5lComDtjUa4VS
 j9qyQcwot3d65zbbsnoZLTPd3PYvX+wnhNJQFB26cUFpDi8bC2h4PsSO3dPHIXqksv1wKNeOyc
 NTGiNaidk345/jDpZlxLNzvW49Qgw7KTfk4jk+GwYWoKAEAAA==
X-Change-ID: 20250110-audio_drvier-07a5381c494b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742367997; l=1964;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=QDLS/Wim5Nao/KA6VbLQAFMVgRl1G3PVTVVLioUmM98=;
 b=arsiiQLog8tmh5gP4+Yx+BHf5KYBZ49xJ9Tq5lvwFBgSHMPE+mjSNadrBWP9eyjwZ+PL60eM/
 aR9NMYmt7EwAivyQQ5h11yaZcHAcGNBvDDoQzX1NJqNQskDFcKF/ih9
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_000642_682929_10F7C3D0 
X-CRM114-Status: GOOD (  10.53  )
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
Reply-To: jiebing.chen@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add s4 audio base driver. 

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
Changes in v4:
- fix dtb check warning 
- add maxItems of power domain for dt-bindings
- fixed audio clock pads regmap base and reg offset 
- use dapm widget to control tocodec bclk and mclk enable
- Link to v3: https://lore.kernel.org/r/20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com

Changes in v3:
- remove g12a tocodec switch event
- Modify the incorrect title for dt-bindings
- Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com

Changes in v2:
- remove tdm pad control and change tocodec base on g12a
- change hifipll rate to support 24bit
- add s4 audio clock
- Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com

---
jiebing chen (6):
      dt-bindings: clock: meson: Add audio power domain for s4 soc
      dt-bindings: clock: axg-audio: Add mclk and sclk pad clock ids
      dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
      ASoC: meson: g12a-toacodec: Add s4 tocodec driver
      clk: meson: axg-audio: Add the mclk pad div for s4 chip
      arm64: dts: amlogic: Add Amlogic S4 Audio

 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  20 +-
 .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 ++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 372 ++++++++++++++++-
 drivers/clk/meson/axg-audio.c                      | 441 ++++++++++++++++++++-
 drivers/clk/meson/axg-audio.h                      |   6 +
 include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
 sound/soc/meson/g12a-toacodec.c                    |  46 +++
 8 files changed, 1111 insertions(+), 5 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250110-audio_drvier-07a5381c494b

Best regards,
-- 
jiebing chen <jiebing.chen@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
