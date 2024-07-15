Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E673C3DA59
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40V+rgfAK1/jR5qGr4Tjsgdjo8GbKlSgkO3JXAKmeNQ=; b=Xvqkc2G84ukeMM
	5bgzkcX/8TaKmmz2YXY+HgSxxOH1YxEbodtk7Fs2IcsNk69fUZrQvaWS9IVHcZYg9K6KTYvWhgZWf
	PB6Pw2pMXT7icaDpBUrqjvgFMsUdSqIvDpoUWvX1mDlFKDhR33K4NTpzaZyWaV4C8Z0eoMqNlHRfT
	cyTZFIsXUlWFfJ/YOrdgy86kqLkGfpwNPnZFSqxKUyDANkL7WETDFSz2UbSxpiyq0RsZL0HpY8bHl
	dRMl8OzBqhvDSnmQU5PQDb961MCG29V+yjVN7J5tu/6o2E5ZuW8j4nR19YD4nNyhxU6MXdYbCQHGH
	ELsHENZOeMfSQ/9dCq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYw-00000006Ra5-3DFT;
	Mon, 15 Jul 2024 09:00:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYJ-00000006RGn-0UYv;
	Mon, 15 Jul 2024 08:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4173860CD4;
	Mon, 15 Jul 2024 08:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8327BC4AF1A;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721033961;
	bh=wmZGgge85Q8CYqbZQFHFPVFmynDO5FkI+xVqMHo6QG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C0BxBChq6OdgSVELJx0/VsmZk5XhTBkhcGqw+ch1dN2vWA3sbi3fNk9Cvpa63oIac
	 IFjzexFRH60a52CyibxiuLY1nza5+IQ39ihe3F1LjibQQ2Xb+74pbKJ///j6kjktH3
	 KHfER/vOZLsY5mxkahTV6/BG4EyxZLyjuCj1oq88Ek93JBFhikQIrDTbKyKBdkKiJv
	 D99nFD7q4uZqNrMgJ5qJXHzJXyJ5stRIqFH+5fgF0OAGVXWzY/bImHNyTtp+w6dJAm
	 j/gjTETgRWD5Wjh5Drwevk4Zz485Pj/qrNacpmD/WhkwTqy+bOj7AQOcK/HJJFD4WV
	 Ot/fCWFA6deqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76434C3DA5D;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 15 Jul 2024 16:59:22 +0800
Subject: [PATCH v2 4/6] arm64: dts: amlogic: c3: add ao secure node
MIME-Version: 1.0
Message-Id: <20240715-soc_info-v2-4-3836c8cc27a5@amlogic.com>
References: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
In-Reply-To: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721033959; l=1017;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=pjY4KC1fe2AmkCqstiXeLGWqLV1HNwoDAqmTzk6+a3Q=;
 b=RII61pRiQ3eExWxOca40zgebKBhZyKovGqTyN7yz7Oqslr65rO7JHjZphrFnJvc3S1RUj7Sfy
 s/b2ehfaew6AVBqMQ7oME0iNuGj9yYTyKs3zsFc7b7/s9LSx86kh3ot
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_015923_261248_CD6381E7 
X-CRM114-Status: UNSURE (   7.24  )
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
following information for board with Amlogic C3 SoC:
soc soc0: Amlogic C3 (C308L) Revision 3d:a (1:1) Detected

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index f8fb060c49ae..c913dd409e64 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -129,6 +129,13 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 			};
 
+			sec_ao: ao-secure@10220 {
+				compatible = "amlogic,c3-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
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
