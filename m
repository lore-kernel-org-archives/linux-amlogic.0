Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B55C47DDF
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jan 2024 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2VWPYsJSyiFfqeCI7oaVcSTo+G5uda9f9GGj4GDrT54=; b=NVO9eUFgGjfY2Q
	+fJDgG/vGnczdPo2lDFXa42Cl1hBEZKdMzOCpmzu1akyrqbshakncXFxWzsEYOEprPn4fDNgwBM7O
	KslfBZbBZBF9adCE4TiCCp4nY8R0NkOwfy3zoAwMWJTtQXKw4VdFoucJmOMsZUwKzNYQ+rnLIF395
	VEg5X1GIVYnkDSKOyllh8QS1F90S1SjYlHgwuhgMM5GcVk/6x9MhqT8EXZq/G08bK7Zh6CCOAF3SF
	l5HKr/rFDht1gahwBzbJ7LjTZXfMZFDV33TmFzp9wVqivIyQ8Txan2EMlgHw/cQnoKWzjTNMP4xqF
	AxP757UdszPgZ5+JTPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSK6w-00HNd1-34;
	Tue, 23 Jan 2024 16:58:54 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSK6s-00HNaF-0Z;
	Tue, 23 Jan 2024 16:58:53 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E52DB12000C;
	Tue, 23 Jan 2024 19:58:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E52DB12000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1706029120;
	bh=X6dDhX7s4UWSn6jo6T+Mv0rP4UhHPB3J5T7leAbh0jE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=gplF/fd+jZDMpCENjMNbi19L6oCuvWZ6IfkfAuIm/AfZeE4+1CoWdfpS58Er7XaIi
	 ADyaU7LXC/8fYknIAsitNsTT6CYrwCPCMYAiwjOIfrYu8IoLzshHC2edFCB3OlnHSA
	 Ry+iIxOWjDAoZR+0Rp7SlbbTRNEQlc2KGIHHZZ0ZW///DUmUzOMcyN40eCCYUlg0ob
	 HmSiSLXNezQI4LinwVrO/upIcMI6sCVpCqIpAWdJipNTJH5CioPwEU36431tg3j1no
	 xm74ks2Xp3p0tsxiRbik+ZsB8I8yqK95xjr+sivhYwt6WLx1gGktG4GWoB60Z6crBA
	 IXSGMS6BLuj7Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 23 Jan 2024 19:58:40 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Jan 2024 19:58:40 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v2 00/20] Support more Amlogic SoC families in crypto driver
Date: Tue, 23 Jan 2024 19:58:11 +0300
Message-ID: <20240123165831.970023-1-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182874 [Jan 23 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/01/23 15:06:00
X-KSMG-LinksScanning: Clean, bases: 2024/01/23 10:08:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/01/23 13:53:00 #23383939
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_085850_941122_2F1C9026 
X-CRM114-Status: GOOD (  10.23  )
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

Hello!

This patchset expand the funcionality of the Amlogic
crypto driver by adding support for more SoC families:
AXG, G12A, G12B, SM1, A1, S4.

Also specify and enable crypto node in device tree
for reference Amlogic devices.

Tested on AXG, G12A/B, SM1, A1 and S4 devices via
custom tests and trcypt module.

---

Changes V1 -> V2:

- Rebased over linux-next.
- Adjusted device tree bindings description.
- A1 and S4 dts use their own compatible, which is a G12 fallback.

V1: https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/

Alexey Romanov (20):
  drivers: crypto: meson: don't hardcode IRQ count
  drivers: crypto: meson: make CLK controller optional
  drviers: crypto: meson: add platform data
  drivers: crypto: meson: add MMIO helpers
  drivers: crypto: meson: move get_engine_number()
  drivers: crypto: meson: drop status field from meson_flow
  drivers: crypto: meson: move algs definition and cipher API to
    cipher.c
  drivers: crypto: meson: cleanup defines
  drivers: crypto: meson: process more than MAXDESCS descriptors
  drivers: crypto: meson: avoid kzalloc in engine thread
  drivers: crypto: meson: introduce hasher
  drivers: crypto: meson: add support for AES-CTR
  drivers: crypto: meson: use fallback for 192-bit keys
  drivers: crypto: meson: add support for G12-series
  drivers: crypto: meson: add support for AXG-series
  dt-bindings: crypto: meson: add new compatibles
  arch: arm64: dts: meson: a1: add crypto node
  arch: arm64: dts: meson: s4: add crypto node
  arch: arm64: dts: meson: g12: add crypto node
  arch: arm64: dts: meson: axg: add crypto node

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |  31 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   7 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   6 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   6 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   6 +
 drivers/crypto/amlogic/Makefile               |   2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 602 ++++++++++++------
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 281 ++++----
 drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 452 +++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 115 +++-
 10 files changed, 1165 insertions(+), 343 deletions(-)
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
