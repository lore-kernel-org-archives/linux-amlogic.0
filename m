Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D02C2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 06:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLMOd06mKYmnIaYJPgfdFFxF0zLlDVekb3NaHKAMW3s=; b=yIRlgphqQddPsu
	LPMFT1pG0eZdphWthV+oT/SS9ZiIqXuZusOgvAH6UAW9fmv8jHYz31uy9VOzmafjnjLyHjFVn0PLl
	+3oJK3ZgxiVRW3h9Mzt/d8wq4RB5K99E9euyaY+XwzqlRW8+vaNXHmRnP7sMZp+czDu8LYx9hFn7k
	9Xq1r3CHv6e8LzwxY+eAhbSjt2nw4qAmUVMk4pPFDdgR9nsAh08uJcuZf6djhncEPp7EOn+Wo2va4
	UZJDH+DUfQ6m7MXgaQ89kXRf2uJwJ9ZDfGRh83bP1++DVuU0/I7j1OhXpnELn7iLqSz1aBRdj2PAU
	fuHXniKuQIrHBfBurKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSACc-0000000Ggta-1a3j;
	Fri, 12 Jul 2024 06:56:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSABB-0000000GgE8-0CEA;
	Fri, 12 Jul 2024 06:54:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A3A7CE199D;
	Fri, 12 Jul 2024 06:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26D2CC4AF09;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720767290;
	bh=m+iNwr8XqQmoN6/h7bndxFBce7494wo4m/jNNEKTkOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T2bMaqZzE+GYrU3mt4h2mIOiMALuUKy11oELyMh+d20A/6rKVkTlhINgpKOGoeeNY
	 nFD3nFkQuDaQSzjOVgHM0XZft/uO8hUY8h1xH+VoPkvmNMSsLzPj/WbPa/YFQOqE3B
	 FP7V+Ozax/WFHxy9m2Oy5aKEqPsROtUND4UfzWQbgNqmVzbcsI1twaIi8jM3rnK79U
	 PUzFlPXZf2M2JtkqqpzON+qH1USPvK2KuZY6EUyR4ddXNSW0+UmOHrVZxKW25Z+m88
	 EZlN2qDGj+QsAnk/lTFaGl0Be/lzIgeof8NqBySHGAV+oDTWFmjwh4dc1sp2cSl6eQ
	 KdAVEI6CcdKpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A9EC3DA45;
	Fri, 12 Jul 2024 06:54:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 12 Jul 2024 14:54:47 +0800
Subject: [PATCH 2/5] arm64: dts: amlogic: s4: add ao secure node
MIME-Version: 1.0
Message-Id: <20240712-soc_info-v1-2-05ba95929d5a@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720767288; l=1031;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=7PP3wpwyeNhRjy2GgIapC6CYSMcoSRh5nUct3QlTnCc=;
 b=Cf3A1+/cFFFp6d+el5Zs82tP9+WFpxClaZdHoC/jfpz6Nwl3TqxqbR8o6Wn6i9+U3q41LkPzo
 GpFCBhv0PSIByJrGkOSndt14QLD2Aq4LtQQhF9+OR7/RWYyhepLgYDQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_235453_350898_F2480D4E 
X-CRM114-Status: UNSURE (   7.37  )
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
following information for board with Amlogic S4 SoC:
soc soc0: Amlogic S4 (S805X2) Revision 37:a (2:1) Detecte

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index c11c947fa18c..316905ec191c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -763,6 +763,12 @@ reset: reset-controller@2000 {
 				#reset-cells = <1>;
 			};
 
+			sec_ao: ao-secure@10220 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
+
 			ir: ir@84040 {
 				compatible = "amlogic,meson-s4-ir";
 				reg = <0x0 0x84040 0x0 0x30>;

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
