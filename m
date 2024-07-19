Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240BFC3DA7E
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhLPhBfdmXSZoEgze9c3Y5k2qtd5lpYYq/ucur0Bd5g=; b=DwV1Oi92HrQzse
	g89sCA2as3jW2Kk+eXqhKNeh/hElZ9zDUoucbRUwmVp9ku7cnolc52BV/TTnQ9K3Cv+JDLjEGLhv9
	mK9UDyfLX3NGG+VVRxAmHMN35huxmXIEYK5hFlMtCy94F+5oZVw652LTWwJMqILVsnzPjEBoQ6elg
	9R+mUluljWQcUEWhDwSVOZ8aQPRgURdVz6I1QG3jPjKEhz23Ojq89y1IHgONBEwOrwuw4sBMjA4Lu
	qMuL8tRjtwVnLkUWjZiW5MPxO3YsdD3Gxd+9b3LnwGEeRLmpoJZn2S9PEmfjHCuHQHShCdQBajMxC
	ZVsAsiOLq5fPmaz2tT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUifm-000000020XR-2sSD;
	Fri, 19 Jul 2024 08:09:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUif0-0000000209Z-19c7;
	Fri, 19 Jul 2024 08:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5907D61C3A;
	Fri, 19 Jul 2024 08:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52ED2C4AF16;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721376492;
	bh=4MDbIzbgcDxHoNJ3qQdw4vdK4aOodPlMv8exrJKFJK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MO8yXfipLHFrNtLYjbaf9lQWunBqXUtGNJ75Voo67WlxuhKiHTcASgtN5JrHC5t50
	 na943o1s4dHa0TP3lEaEJZn5oorpq8yvv6JNM2g9NItxhcRCicNaVkm45aUc5l+Xth
	 o0eA6hVQYUnQrJgzDiPCGiV2tED8+n4zoPTPURzRmMN1uPzQXmVQxRo0ut0WZDFlSB
	 Y7Syz2qdl0HiMlNngF40GhxBsDfPyBckOtGkVOHdvD7bxXX2ckFUbu0oYvWJ+fiQlY
	 O20wDwWEk1XyUaF5EvpPqQJL2YsxvARbZin1EbqZl8yh05im9TLwktFu+zFqdSJg9H
	 ptxbohn3Fe/Cw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E89C3DA7E;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 19 Jul 2024 16:08:13 +0800
Subject: [PATCH v3 5/6] arm64: dts: amlogic: t7: add ao secure node
MIME-Version: 1.0
Message-Id: <20240719-soc_info-v3-5-020a3b687c0c@amlogic.com>
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
In-Reply-To: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721376490; l=1056;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=X8apXJPtSL4pC+EPOExwu5CekUwHZ9o11FW6DgwjmrM=;
 b=3JFRpb+37yakNpqi576ecStgHlK3dSYpZKqSqVkN/MTunWTuIFGZ/JRJsibj7DnJ+vegL9RAb
 bJvhzMen/p8Dx/7ldGQpzIiEYGnVB3quKLVAHf0RXOlviF+abDl4GvI
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_010814_405330_43347E32 
X-CRM114-Status: UNSURE (   7.83  )
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
following information for board with Amlogic T7 SoC:
soc soc0: Amlogic T7 (A311D2) Revision 36:c (1:1) Detected.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c23efc6c7ac0..ec743cad57db 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -194,6 +194,14 @@ uart_a: serial@78000 {
 				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
+
+			sec_ao: ao-secure@10220 {
+				compatible = "amlogic,t7-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 
 	};

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
