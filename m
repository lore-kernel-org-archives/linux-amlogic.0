Return-Path: <SRS0=lFz5=EV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2246DC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:52:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA3642225B
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ir78GcqY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MnhFxIgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA3642225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m573HoMG5SrM+iFfpagN0koVqEsQhXrkB+AAJFrmpVE=; b=ir78GcqYL/ver3UKFBr4ISWJ/x
	qlEzIrFhF/4X5Ydr7pErluAwZyFhtvPI4htBsLBrzY9bmXAHfbZX6OAAkKMYZJygh8EKipFvu+ozD
	nIeBx/WDtFZS2jBt+FV0kr1kDAx/T6rJbKn4zATohCJgVn3ZhE7l+zl4Ka2DPwPNyWCLN3OSUXvwG
	xPmITsshUDUevsuvSItEWZRAvkw6mhk1TX06UUw6DClsMeTdUq6FmkW0HtFlPMZ9vbMaB8Hse4xE7
	qBkqcTx/bTPbOoH+SK0gobDwXO1AVDuWS+jCYf20+5bsV1qOzc467KxHWinnWgV9Gvqvx3CiB9alg
	Ywy1GB1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keN8n-000410-LA; Sun, 15 Nov 2020 18:52:45 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keN8l-0003zq-Eq; Sun, 15 Nov 2020 18:52:44 +0000
Received: by mail-ej1-x641.google.com with SMTP id oq3so21316269ejb.7;
 Sun, 15 Nov 2020 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tl2vZixbwhz7yRTmQqo4JrSMqXfMjdNjvwgPYWVQyqE=;
 b=MnhFxIgUqNBTnwT/BhPWQYoUaaz4QQfh5TSB3dWqVk3WDf0+tg0bY0Yo5vWROnqPdd
 o3hztCa4xazcxWRiyJ5OnRwS/8oKe6D12yCPYbEHOrVuOpi1aTaiyxq039TpF/qz3QSg
 Hvyc3J7/kdGl71SVCoEJpqjBJGla82IT4NcVU1qlZpFE9WFEHdT+vATvU2csFOmqdix0
 XPl/Vcn4GAWK593j6S5BAI5it9PRaS+26GJYngoihBp7b+LRq/bqPxW2EPNiFic640wF
 WnxMxE1qPYYnAHghW7fcz+Y9LzDIsZz5QZjuQv7guhyTXtOe1sNfNI7zLN5aYApdrHG+
 SMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tl2vZixbwhz7yRTmQqo4JrSMqXfMjdNjvwgPYWVQyqE=;
 b=VbFVS0dHExJzl64/L2yTE2BKRqvCg40SosbR6aNgbRJEx7S06ZVc4pKj4FWcgZ5OIQ
 b/XUVzVOWJfF2hVgKcuqGuVwfZRLek7iBtTuR15O5YmSGQE/CNqlOoq31LFEZ9kJp0K/
 bjMcYaPZ28za4S1iKsrzG576Exf2SRHV0P9wriYdNivqxSKKTHTtJ+yxmYJRvb+HzFj6
 NzDVP4od1XuvWnaWK87rDQ0wL8k5Z3SFMpjhXgd+8iJala7CkLI/4WU0tVkC/zjvoPfN
 CvFzavMlX/SKukef7axq40UtA2P0TMEUZc3I0vbmfjSD4C7Em445+i4P4yqprU9dx87R
 3Gnw==
X-Gm-Message-State: AOAM533+56bt5A4dXMxdLuT7iZnu8n+egssjYl5hGmJxt0HrpYe93vg6
 hk/HjXVuNnb+MAMHqf22ZPI=
X-Google-Smtp-Source: ABdhPJxm69nswwaPrLAyyaLIH/a5/v+K/iaWB92oG+w66/9+rxLY97qdpvO3RfCleiTZU9LyHHnFKA==
X-Received: by 2002:a17:906:d0cd:: with SMTP id
 bq13mr11057291ejb.372.1605466362047; 
 Sun, 15 Nov 2020 10:52:42 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119])
 by smtp.googlemail.com with ESMTPSA id i13sm9233520ejv.84.2020.11.15.10.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 10:52:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, netdev@vger.kernel.org
Subject: [PATCH RFC v2 0/5] dwmac-meson8b: picosecond precision RX delay
 support
Date: Sun, 15 Nov 2020 19:52:05 +0100
Message-Id: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_135243_561723_7B51EDFE 
X-CRM114-Status: GOOD (  17.62  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com,
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

To use the same settings from vendor u-boot (which in my case has broken
Ethernet) the following commands can be used:
  mw.l 0xff634540 0x1621
  mw.l 0xff634544 0x30000
  phyreg w 0x0 0x1040
  phyreg w 0x1f 0xd08
  phyreg w 0x11 0x9
  phyreg w 0x15 0x11
  phyreg w 0x1f 0x0
  phyreg w 0x0 0x9200

Also I have tested this on a X96 Max board without any .dts changes
to confirm that other boards with the same IP block still work fine
with these changes.


Changes since v1 at [1]:
- updated patch 1 by making it more clear when the RX delay is applied.
  Thanks to Andrew for the suggestion!
- added a fix to enabling the timing-adjustment clock only when really
  needed. Found by Andrew - thanks!
- added testing not about X96 Max
- v1 did not go to the netdev mailing list, v2 fixes this


[0] https://lore.kernel.org/netdev/CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com/
[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=384279

Martin Blumenstingl (5):
  dt-bindings: net: dwmac-meson: use picoseconds for the RGMII RX delay
  net: stmmac: dwmac-meson8b: fix enabling the timing-adjustment clock
  net: stmmac: dwmac-meson8b: use picoseconds for the RGMII RX delay
  net: stmmac: dwmac-meson8b: move RGMII delays into a separate function
  net: stmmac: dwmac-meson8b: add support for the RGMII RX delay on G12A

 .../bindings/net/amlogic,meson-dwmac.yaml     | 61 +++++++++++-
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 92 +++++++++++++++----
 2 files changed, 128 insertions(+), 25 deletions(-)

-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
