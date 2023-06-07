Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E03EC87FDC
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 20:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9LXFGm8q52GUWsqhW9wFQ+HzpFUlVsurRaFIE/lp8xU=; b=ls7MMaoKmd/QX9
	hFd/mvyq+jSwkFpVhzNdMv25DQENMnyV6dQpSm//mjbL6m+Hu4WU9k73RrNMvgsvdn/MD4AetIVFQ
	tYh/k3KpxuPGLAIS8ZoVeLlV0GLbZ0zrrzS/O0dMVr4rcw177gtuEf6N/OrWt/MnLmfumrF9yuY68
	r5UXlKffoE+q90sEhDZqDdqCwh9YSbErRNhHNvO0k16H663RLhjld7a/jxdcWc/siZPjZlnM/ZLmQ
	52ReUB4Dagpmy2rRSUTNjOZrytDieEVGdC5lOqxe+5aanJ7OOjnKOkoqhJiW5e2Y2Yskf5CtmL8rt
	t/6038LvlAM9dEEm1a8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zac-0074zg-0d;
	Wed, 07 Jun 2023 20:17:06 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zaW-0074vC-32;
	Wed, 07 Jun 2023 20:17:04 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 6A6CD5FD05;
	Wed,  7 Jun 2023 23:16:50 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686169010;
	bh=M/we8RgDjwgR++pTBbcueO2YO/PO3K31bJrDaIQUUdE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=C+kUCvyF7gc57sZzG2y48Vr72/2ceS66RatT0BvhZU4hmzAD35j+MeraX6XBUD0Gf
	 FNhuU2RDsciP98n0kMvXG8BNzq+ZcrlZnGvWtvoK1xf2nYdGWGTcQQJJNNgu98NDOU
	 9k5yP3AEg0+vB0BSMk6gkKZb7peorcZ/g+yFfljCcSve5s1wmLlK0RIEBKueW9JAPj
	 7udk1RP0ceU0FUZGWouH2I4TGbss8cqFQSA3nOnqCW4vhBJZ1L0ZCqBE2IfocvBjeZ
	 wly0shj1NQH1yjQXO/OxZ4yX6G8XYEwCjh8YEojqac1/aE923pUePjq15iopLt0NEK
	 i4XPXXtViiiHQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 23:16:50 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v1 0/6] arm64: dts: meson: a1: introduce several peripheral IPs
Date: Wed, 7 Jun 2023 23:16:35 +0300
Message-ID: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 16:55:00 #21454472
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_131701_172358_335865BB 
X-CRM114-Status: UNSURE (   8.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series introduces device tree declarations for various
peripheral IPs of the A1 SoC family, including clock controllers, EFUSE,
USB, SPI Flash Controller, SDIO, and UART_AO:
    - CLK: A1 SoC has four types on the board, namely PLL, Peripherals,
      CPU, and Audio, but only Amlogic A1 PLL and Peripherals clock
      controllers are currently supported.
    - EFUSE: consists of a 4k bit One Time Programmable (OTP) memory
      divided into 32 128-bit blocks, and data is accessed using the APB
      bus through software or the Key-ladder integrated with the EFUSE
      block.
    - USB: only one USB 2.0 high-speed port is available in the A1 SoC,
      supporting both HOST and DEVICE modes for OTG.
    - SPI Flash Controller: 4-bit QPI/SPI NOR Flash or NAND FLASH
      controller.
    - SDIO: for WiFi/IEEE802.11 connection.
    - UART_AO: for Bluetooth connection.

Alexey Romanov (1):
  arm64: dts: meson: a1: enable efuse controller and setup its clk

Dmitry Rokosov (2):
  arm64: dts: meson: a1: introduce PLL and Peripherals clk controllers
  arm64: dts: meson: a1: support USB controller in OTG mode

Jan Dakinevich (1):
  arm64: dts: meson: a1: add eMMC controller and its pins

Martin Kurbanov (1):
  arm64: dts: meson: a1: introduce SPI Flash Controller

Oleg Lyovin (1):
  arm64: dts: meson: a1: introduce UART_AO mux definitions

 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 164 ++++++++++++++++++++++
 1 file changed, 164 insertions(+)

-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
