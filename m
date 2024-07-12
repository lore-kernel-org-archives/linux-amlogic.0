Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F8FC3DA45
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 06:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhiqTUsjAIjD3WunjjCNY13fV7zoAcmJoWDUoGVZNfk=; b=P3TKUunq1AnVjI
	uWlm50qOlTMLOA/2rDHHaFtGEnzTyFbF5Dbx6XmBh3588F+AWxdF5rJKfWcIypWMGAItdVp9lvCjC
	biIY3RxcSKOcTkxS6OszZ4CYpdeW4J8eLE3sbh4tWOg4K4lQ4KZKJPj5HKiHqQmbDlpCoya1JjUPk
	wXXVNDjIizBMGuG2LkjdZN5WP47+wtVd+izqh7PVUpqLMBaE9FSgU4QSkvTzlBkMDYyVMnCvRX99N
	72osYIDzqZAxuaPDH9UqQgG14DV/9RLOs85vZGYeIovGIiP9l7MZ2PtyjdMG3xnYnz0An45KiiZGu
	wf7Llb3AEpMZJ874tG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSAC5-0000000Ggf0-1Yvv;
	Fri, 12 Jul 2024 06:55:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSABA-0000000GgEA-1MQO;
	Fri, 12 Jul 2024 06:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A2E661E5B;
	Fri, 12 Jul 2024 06:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48DDFC4AF16;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720767290;
	bh=ahmwNoaojs04Fx7mXoQxYzUbWsL7zJCUJ5NMNIOghP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U1fKW0F5DBcG3b5WF84lL3lTHiqFQpVEXInO2OJ66bw0rTDSpMTYreJ8+C7Qns8/o
	 vP7XjvUKWWwOlfxMrFrCcYPx1ElWW+EI74OOyHnq/MVLWmFB5GbFvnc9J/aWfsvCku
	 hlTicC789QkgHVASotyGNsJynCP6kcIBloqPcZH/lCqgA2ErCJtDvtpRYYaKlj1Onh
	 Yb+hfKImsKMYjw4fx2TlAwyAXu8dgkgdmWAkpZs+7JBOhL+qY6IoZztJCPr485P9Z7
	 KmkctAa4Lu1lV+FjwhRJ8tjWLGh/nWUfz6dXU1NL10fR02yiUv+NoVbk4m3BEOflem
	 DgqilNMW+qNgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F95CC3DA4D;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 12 Jul 2024 14:54:50 +0800
Subject: [PATCH 5/5] arm64: dts: amlogic: a4: add ao secure node
MIME-Version: 1.0
Message-Id: <20240712-soc_info-v1-5-05ba95929d5a@amlogic.com>
References: <20240712-soc_info-v1-0-05ba95929d5a@amlogic.com>
In-Reply-To: <20240712-soc_info-v1-0-05ba95929d5a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720767288; l=1030;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=G1LdCWQoDojr4AHtdIqIbyagH63JW7WzRMIuNP5lA+U=;
 b=DNHVyQ25UOpRo1hZdF91lS3hKRMODgmx0y0Pb+JM2DzwvsL2pHvqwtDWu4UG5JUlXyiieHzld
 9fjVWSrmSpkCHyiWehwBCrsEaqvudAjGUkmon5EJCEVNa29ytJ0i0vQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_235452_474993_BBE3587E 
X-CRM114-Status: UNSURE (   7.58  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add node for board info registers, which allows getting SoC family and
board revision.

For example, with MESON_GX_SOCINFO config enabled we can get the
following information for board with Amlogic A4 SoC:
soc soc0: Amlogic A4 (A113L2) Revision 40:b (1:1) Detected.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
index 496c3a2bcf25..901103a288e4 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
@@ -67,6 +67,12 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			sec_ao: ao-secure@10220 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 	};
 };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
