Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A07BCD1288
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rO2HjdL5YAL/DL0ac4J5xcq+tRCod5N/JxyT94c7vpI=; b=LNlfD/Su+LdQC/
	s3JdC+jAewjGvwGgV9NgbdnCe8IbPYWBj3JshK52VNtgchgRFvqEAS/I4RMnrl1TmRTYKQoI1RH2J
	g4qHWAeVSxLGYozT01R5S935+nVxsHQTXnzL2OAiwrJ/Agnz7LZILUmaiBfrMPrrAmQEel70B9L9/
	7EuklJuWOU+eHlPkhOME0XsU7TyGpcaJV2OthzB7jivBfQVTOzUloExnKqZcLFeDsVUBDV9UUnr0f
	Brg28vNf3osIKMnoFyhgp8qOyUFxzRfDCAMh3KgaCUUojq/rZT1WzszHbBjbVK5c3T5xbHv7B4WMD
	2HL/JF7Kxln2zCVAu/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Mp-0000000HS0F-070u;
	Fri, 29 Mar 2024 09:17:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Mj-0000000HRxn-01GL;
	Fri, 29 Mar 2024 09:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E283F618F9;
	Fri, 29 Mar 2024 09:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5440AC433C7;
	Fri, 29 Mar 2024 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711703855;
	bh=KeiWUyViSXp2aUJQ+sKFwu4ZETyUyWnX0kr42ZeyL38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TnZtbnqA09sCiBcIJUyw/8K3gwEa6Wfmr1sSoc+/8PUp+t12OZ8cr4b/mHazgCEzp
	 b9WpfgWpr/yQ7bd6XOLt7U+gorybZlcJtD7HwnX59DApQRBG6U8dwlapu9WFJLmuNS
	 KlgNnQu1qossT5+UqUnuVHjtDhxKaBn3LHo3tAaSNhZSV3brkDasjRYINautAfFPVw
	 r2hqZm+zkLoMoRRM1z54DwapuzDolkoUulyiiUsduJIicY018F7zsA6msUIT7m/xtc
	 6ajRbemg7XeJXZ0DcRedOM+45wjUSEX9eRV6b66D+fwa7sWq8IDbnR5ddSi5hAJus2
	 9QqcTZI3/ngcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42779C6FD1F;
	Fri, 29 Mar 2024 09:17:35 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 29 Mar 2024 17:17:14 +0800
Subject: [PATCH 2/3] reset: reset-meson: add support for Amlogic T7 SoC
 Reset Controller
MIME-Version: 1.0
Message-Id: <20240329-t7-reset-v1-2-4c6e2e68359e@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
In-Reply-To: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711703853; l=1485;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=4b5hJs6BojBwxeqHYbAP2s8Gj7Cc9H0Mgr5d5A9mC30=;
 b=gqs56u0cQ7PfE8Ihc4OxU0xkuogLNMu6dXnKoh4cnJadFPaUm10p+kwp+RuMafudpRJ4EbMKV
 2LSb7zLlIKLCu3X5UMYNahpJ8jZZw0xMPlyVmw94qAc2JiT4+XBlc6H
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_021737_289873_E3C31F75 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

There are 7 sets of Reset Source in Amlogic T7 SoC Reset Controller,
and the offset between base and level registers is 0x40.
Add a new compatible string and struct meson_reset_param to support
the reset controller on T7 SoC.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 drivers/reset/reset-meson.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index f78be97898bc..1e9fca3e30e8 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -102,6 +102,11 @@ static const struct meson_reset_param meson_s4_param = {
 	.level_offset	= 0x40,
 };
 
+static const struct meson_reset_param t7_param = {
+	.reg_count      = 7,
+	.level_offset   = 0x40,
+};
+
 static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
@@ -109,6 +114,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
 	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
+	 { .compatible = "amlogic,t7-reset",   .data = &t7_param},
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
