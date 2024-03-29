Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E19ACD11DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mnXnPTDRLrDcC9rGW6m91/TToExFT/Yf1BCL4hxZTzU=; b=mEiyY+g+j8T6n/
	OtOJoC831v2rWegTeqQTFonjlWjE5dU21CtrenLD5ZWoynRX2dzMDmvejqRbppsSM7/QfW187XNpb
	76awqb+/sdOZgIQnLAaYyH3c65GT+OB/ulcsTy/SJJ8Y1vGjwirdUejNrjchiYTF238qezviMFtYB
	XihqOfncE/XtTiVZFiGhczoCeXUZU9JkYD1IplsPO7FFLVJzTSirgacriAYIYInF4YT2DbGyaQw5l
	kf7GO3psPcMxTJ63ZhGKiCNa069hk8mYg9LLb6HRhHe72rlxGU6WW45oaOipyiR5e6kbI7e9JdqZL
	dONyuz6YoSGZ+qGvdgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Mm-0000000HRzV-2Kh9;
	Fri, 29 Mar 2024 09:17:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Mi-0000000HRxi-29zy;
	Fri, 29 Mar 2024 09:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EB6F61862;
	Fri, 29 Mar 2024 09:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35670C433F1;
	Fri, 29 Mar 2024 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711703855;
	bh=n/GJizp9nm7qN6fx85RRF4G4vfz5pWZJJrrOuOIEosg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eJ3y7ki+MaVUSZJhPrwMD8Je0tVbXfWz0LDEfN2I3oRJm8zZxmV4F47yFPx37jHwy
	 +xYDGX6BVWwtQ1805osK9E4am/m/B+t86/zo2ejv7JLMRujMucFvk7uQnfksys8sa0
	 w67YcoVt96rWkLbOh2HbN8TPYiXiwgjvgOugw0oqwSUf3yPa/bgaDd06qXW943FbgJ
	 ySyz9g3dfu8ViepGEiwFQRrb6AxiEbmDCK+5BEZIx+0utHuY9SIVTwDa/1ZfVTFaC9
	 ea7DvDCTeYZ250tn/k4kLPdWjD9JBuDMnVbgd5PPLQEunHLFochH0xz9CR7OlTxT/K
	 OrJbRqkHJ5XUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF66CD11DD;
	Fri, 29 Mar 2024 09:17:35 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Add support for Amlogic T7 Reset
Date: Fri, 29 Mar 2024 17:17:12 +0800
Message-Id: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABiHBmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyNL3RJz3aLU4tQS3TQL81QLYxOztMSUJCWg8oKi1LTMCrBR0bG1tQB
 080UQWgAAAA==
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711703853; l=866;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=n/GJizp9nm7qN6fx85RRF4G4vfz5pWZJJrrOuOIEosg=;
 b=2HDdcu8bHK28/Vw6Upe0zpsGUXqXEi9POhJTjRSNSmOBU3TqML/IbpwEUaPrQTa6cUJL5+rk5
 +Z9Y3JC24v2CfMsbzDGndOgSjtVeZCAMsQG6uX4CC8Pxmf6XUIMMBaA
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_021736_631866_5C2E27E8 
X-CRM114-Status: UNSURE (   6.94  )
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

Add a new compatible and device node for Amlogic T7 Reset.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
Zelong Dong (3):
      dt-bindings: reset: Add Amlogic T7 Reset Controller
      reset: reset-meson: add support for Amlogic T7 SoC Reset Controller
      arm64: dts: amlogic: add reset controller for Amlogic T7 SoC

 .../bindings/reset/amlogic,meson-reset.yaml        |   1 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   7 +
 drivers/reset/reset-meson.c                        |   6 +
 include/dt-bindings/reset/amlogic,t7-reset.h       | 197 +++++++++++++++++++++
 4 files changed, 211 insertions(+)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240329-t7-reset-f87e8346fadb

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
