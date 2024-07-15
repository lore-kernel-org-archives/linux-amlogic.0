Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E99C3DA5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KLzY63wsptGeOD7yI1dw1qmyFWtxaBlqKh3HyGtpFeM=; b=1Rmfrc1lD7A3dj
	IQZdD/f0At9djOajFjstdnSl+btz+IGFTnoQMU7ms846yxUYGNBNnfJ19KHehGt/A21S/9aNulrUg
	mDlJq8knGhYqcrHhry7L+VLl5WvpW4TTHGVKvVxuHNWm1QZkmFwRCi085rfQWJnokbj8PBGHWPh6x
	emr4eXlNlS1UzvaA3xoclGPnt68kJ4Lh9bbueDRlV33YSC6pS8MNCQRDIZaPtcWcuMa1deBh2VDQY
	mmL/bvmqnY6ZlWLv8/OijJXkCeDyzzoYGrtNt4ZS2qIM9J53/4omOx7o6AFbMYWsXSE3cYlD4xiKg
	8TlfiasSVT02r/W9xFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYd-00000006ROu-39kw;
	Mon, 15 Jul 2024 08:59:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYJ-00000006RGk-09eT;
	Mon, 15 Jul 2024 08:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E55160DFD;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5037EC4AF0E;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721033961;
	bh=1X1lMeZGpdzV9mt09bNsIQMlalbtKkMui88g6bFSQE0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AYMRuFebTcAyJvTuZVQrD/ZPNQrxp2m05upe0mkLoXPpymA4H2TtHq0zGEjbnpwS+
	 wLZnVDePiWh8BtmkItksSbj5poy2Ti69PXtRO9nqh1v5nqGiosZnquztDiIYzjE0bW
	 M72d6JWMuYpUGg7+yKT2aZKexDjyZsWiUyUYb3fSXZ0X0gp5AUmCLeiyp9bHiiR8Jp
	 K68E5nVmUQEjvRzqy//16d+BQdf0fXk9xs5RbN8TH9JvzeyKC90lYkZwXL6LrkYkNg
	 GKBNL+Sfc4x9WxvrywNXsLuPBDLggfuKDglXzuBPZonpD+FrjjXjcsVwXs/a+LMrA9
	 InV75tv/VOjng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA8EC3DA5D;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/6] Add new Amlogic SoCs info defines.
Date: Mon, 15 Jul 2024 16:59:18 +0800
Message-Id: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAObklGYC/0XMQQrCMBCF4auUWRtJolHjyntIkTSZtgM2I4kUp
 eTuxoK4/B+Pb4GMiTDDuVkg4UyZONbQmwb86OKAgkJt0FLv5VEpkdnfKPYsglT2dOh2AaWFen8
 k7Om1Ute29kj5yem9yrP6rj9E/5FZCSmk6Zw1Vttg3MVNdx7Ibz1P0JZSPuPSe8KiAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721033959; l=1350;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=1X1lMeZGpdzV9mt09bNsIQMlalbtKkMui88g6bFSQE0=;
 b=LFT8ReBhEBQbxL20C4GgGLQv5fFEqrxtwgHaVVGjck5SfooLGn+EnlxWoF2LqJjZBeY7w7PB8
 zCkN97YAq1XAmfJKLwQlgbGGi4ymn/3cEaN4DceJdUmDLLQeZpS4Pbj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_015923_163001_9DBAF05E 
X-CRM114-Status: UNSURE (   6.06  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add more Amlogic SoCs info defines, include S4, C3
T7, A4, A5.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Add S4,C3,T7,A4 ao-secure bindings.
- Modify ao_secure node using fallback to meson-gx.
- Link to v1: https://lore.kernel.org/r/20240712-soc_info-v1-0-05ba95929d5a@amlogic.com

---
Xianwei Zhao (6):
      dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs.
      soc: amlogic: meson-gx-socinfo: add new SoCs id
      arm64: dts: amlogic: s4: add ao secure node
      arm64: dts: amlogic: c3: add ao secure node
      arm64: dts: amlogic: t7: add ao secure node
      arm64: dts: amlogic: a4: add ao secure node

 .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml | 16 ++++++++++++----
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi       |  8 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi              |  7 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi              |  8 ++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi                |  8 ++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c                   | 10 ++++++++++
 6 files changed, 53 insertions(+), 4 deletions(-)
---
base-commit: db067bd17c0124228c31c5fdfa29ec65239e692a
change-id: 20240711-soc_info-d01986b3de09

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
