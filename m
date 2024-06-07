Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74030C27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLJk7ygSTskcuOhOH9lQsy5tX7NCJFBAfbeiu2hWDR4=; b=I0UKwtpHHR/JVj
	VUXAEakoc72lbcfMrzbC6gx1exVbUTRT1BaWKgzci1HXDwTb+hCeV/KGRbdhYX766u0SaEINW6e42
	iuw6Skd0ZR5Ar+2oz73lBm1bDvIONDaGxn37kWn1TQwDcxcIdVPfMIXKj+3ec0d6evzN7Pbh0eU1A
	tRCL1biaHeupyEv2Ra4AdLFI2cwTj9rFCva8CBQV6ZG54BzH02nhqmqdZiYQmfsdLLePnwIjVlKGi
	Ay6ld5RvAVwzHcj3YBdXwErypgf1a61yvkXQZdbQ3yJyvvI2occKVSHkXVkbh9UYtGQEmNiJGn9+W
	G7s0a3VCjchtO2xK3miQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaMm-0000000EK3m-0Esk;
	Fri, 07 Jun 2024 14:14:52 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaLA-0000000EIk7-3N2n;
	Fri, 07 Jun 2024 14:13:16 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 31474120002;
	Fri,  7 Jun 2024 17:13:09 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 31474120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1717769589;
	bh=Y4YVvdt1XvNVcPjTvRD6UrHLms/aMw7z+wLHlY3a0Xs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=eNEFiQg8jYrvzegfqu4o43+g3v8IkubSTerRpl2hOCpkswLyM7SnOqyX89qv0lJMo
	 Bkvtau6yJ7O4wxbwyZus1jb+ooRVWa1HciHhC6UlhNB9BRMdunh/z+8u6CKYUwG+mQ
	 IKox+U/pRvze+bXQ3luprH3i/VVM1VRvrACRFpzUQFMqu346qu9THQSAcG2N/LGmmg
	 ZhfHW5Znpmzouej3Xw63tBsA3nVFGJY7yrKSDk6oThOWMBdeHvpgFtHUUejgXsBpuZ
	 8dVxqeQOZKQ8tUV0MI4eVHvVcUfLG6o95JZRlQQDKDY0I9KMrz60PPMo/djq+/8zUh
	 8FUPJ1PXI4Zmg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  7 Jun 2024 17:13:09 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 7 Jun 2024 17:13:08 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v8 18/23] arch: arm64: dts: meson: gxl: correct crypto node definition
Date: Fri, 7 Jun 2024 17:12:37 +0300
Message-ID: <20240607141242.2616580-19-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607141242.2616580-1-avromanov@salutedevices.com>
References: <20240607141242.2616580-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185803 [Jun 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/07 12:12:00 #25491508
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_071313_400050_BE32095B 
X-CRM114-Status: GOOD (  10.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard weired to clk81 (CLKID_CLK81).

Also, GXL crypto IP isn't to seconnd interrput line. So we must
remove it from dt-bindings.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 17bcfa4702e1..66d1433765bc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -68,10 +68,9 @@ acodec: audio-controller@c8832000 {
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkc CLKID_BLKMV>;
-			clock-names = "blkmv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
+			clock-names = "clk81";
 			status = "okay";
 		};
 	};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
