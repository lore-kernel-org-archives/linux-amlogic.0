Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A23C61DD8
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:02:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9266E2231B
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:02:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3EH8CUXs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mZ208ne/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9266E2231B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bm2dpraeYh1E2IYJTaYt+YNvk0B1Au6c3MI1xmFjxtA=; b=3EH8CUXsOUw/YEMAqU4BJpGlTW
	cZelmTRVQqriwtbjsA59xs3Plcq7gHdzlLMB6LAiVXue+2Y7jH9kh2e6yNoKxuk7O3JkeFMfPxn7E
	E6md2fFpOb5Qre3hDxQdETtXTByq/dGuHbNqHOIj1TOCyaH53OmfYb49dp0oqgfHGcBHgJQA3RdSS
	5xP4k0JdwWskS0NWE1UTAQpS9tHCGcwvYq2HqCugPYmgosnoVv5arD3EGOf/7dJf6WBcGdyit6ovQ
	ClLaFr/GuJiwplXiNPa1/XA8rBd19qe2ArR0E9nfrsxa0LfvoIEonn08egrZEznfoW0L8CKy32AwR
	kl3zVmHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke1k8-000484-5g; Sat, 14 Nov 2020 20:01:52 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke1k4-00046z-U3; Sat, 14 Nov 2020 20:01:50 +0000
Received: by mail-wr1-x444.google.com with SMTP id 33so14087469wrl.7;
 Sat, 14 Nov 2020 12:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CO7SJxq4xCCXF7MiAurxIxONv6JAjuDmnI0VaDmeaSY=;
 b=mZ208ne/cgkgeirQzC1ZM3yDSeRFywmIefOYEVimaDcj0icBErG9hI84KCC40tIT4Z
 F0iKXDOcEuONGchiq6+JUaunec2BlPzJgSfgojQhxoS8yv4vt7pRUli+iJjlAufEh1e6
 di/XUU+8/Fj3tVQbh15CSsyHNYlxS/l+mqiEGOXHxigWFqz37nYF2n2YvbRTQHJStQhx
 pflIJzyuDY8t9mlCT6AOW8mXoXECdihNcqoeY0LJ0Jioc82een+jt0BNnnBlygtQ6gSl
 Lt0DFG9e7FZSA+VzPkaI2XWRLl70aCwNLAnyaaccfeL++iq5dX6C0y+nWb38i+U3U6LB
 wlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CO7SJxq4xCCXF7MiAurxIxONv6JAjuDmnI0VaDmeaSY=;
 b=is0zTl1URpEpH2kJ5BkWWqU4ZkO5h+r87R6RgXKxQRB1Zq9m5B2RiBoXl8n2dSrQJy
 rTellusv2E2yGXNo44CwQq65J+wpcNqcmmoZf8o7hBldFe7sn1FTbQTafVUk6/QrD+7+
 BbpP8dS4fsB+e/y5BlDTakNkbKtpePTL3h2lhu3eiAC8/NlN0xH0f3IhL4ribgn3fiuG
 g8E5cv25+AHaGRxtbcSOkWnup80RHtqGKmJMSaNVv5i08NVJdfJI8cncNBgaXl9trfri
 OUgUawzYIQ/bICIs4T3gFX9S1DxXuf0nJaw66To0F+AMCPEFeF9pQtQITOWwwLlX+zOd
 J9ug==
X-Gm-Message-State: AOAM5323uyOE2pUck6lztFThnUCH2Hm8rnMAd8ovTxGWqrVt96DWIR0u
 pcN/+iXJolih7B+Xb6mbFcM=
X-Google-Smtp-Source: ABdhPJxdQdqpaxnvhf4cnXaJblB5+GkW0sO35dANXa7fHfdT2yqmvR9/oyK2vuJwQl9DiCNrKdhv3Q==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr10458016wrw.327.1605384107969; 
 Sat, 14 Nov 2020 12:01:47 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119]) by smtp.googlemail.com with ESMTPSA id
 g138sm14342953wme.39.2020.11.14.12.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 12:01:47 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH RFC v1 0/4] dwmac-meson8b: picosecond precision RX delay
 support
Date: Sat, 14 Nov 2020 21:01:00 +0100
Message-Id: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_150149_048548_4C96FCF7 
X-CRM114-Status: GOOD (  13.02  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, jianxin.pan@amlogic.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

with the help of Jianxin Pan (many thanks!) the meaning of the "new"
PRG_ETH1[19:16] register bits on Amlogic Meson G12A, G12B and SM1 SoCs
are finally known. These SoCs allow fine-tuning the RGMII RX delay in
200ps steps (contrary to what I have thought in the past [0] these are
not some "calibration" values).

The vendor u-boot has code to automatically detect the best RX/TX delay
settings. For now we keep it simple and add a device-tree property with
200ps precision to select the "right" RX delay for each board.

While here, deprecate the "amlogic,rx-delay-ns" property as it's not
used on any upstream .dts (yet). The driver is backwards compatible.

I have tested this on an X96 Air 4GB board (not upstream yet). Testing
with iperf3 gives 938 Mbits/sec in both directions (RX and TX). The
following network settings were used in the .dts (2ns TX delay
generated by the PHY, 800ps RX delay generated by the MAC as the PHY
only supports 0ns or 2ns RX delays):
	&ext_mdio {
		external_phy: ethernet-phy@0 {
			/* Realtek RTL8211F (0x001cc916) */
			reg = <0>;
			eee-broken-1000t;

			reset-assert-us = <10000>;
			reset-deassert-us = <30000>;
			reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW |
						GPIO_OPEN_DRAIN)>;

			interrupt-parent = <&gpio_intc>;
			/* MAC_INTR on GPIOZ_14 */
			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
		};
	};

	&ethmac {
		status = "okay";

		pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
		pinctrl-names = "default";

		phy-mode = "rgmii-txid";
		phy-handle = <&external_phy>;

		amlogic,rgmii-rx-delay-ps = <800>;
	};


[0] https://lore.kernel.org/netdev/CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com/



Martin Blumenstingl (4):
  dt-bindings: net: dwmac-meson: use picoseconds for the RGMII RX delay
  net: stmmac: dwmac-meson8b: use picoseconds for the RGMII RX delay
  net: stmmac: dwmac-meson8b: move RGMII delays into a separate function
  net: stmmac: dwmac-meson8b: add support for the RGMII RX delay on G12A

 .../bindings/net/amlogic,meson-dwmac.yaml     | 52 ++++++++++-
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 92 +++++++++++++++----
 2 files changed, 123 insertions(+), 21 deletions(-)

-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
