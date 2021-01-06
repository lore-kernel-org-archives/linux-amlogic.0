Return-Path: <SRS0=HsQz=GJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B78C433E6
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7FA2311A
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jan 2021 13:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E7FA2311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hxla6yeyI2o9lpyiS1i/wHp7X+Hp8ER+7rK7pS6JB+s=; b=pL7fb62RG8q2XIvVpgdBQH3qbJ
	Xb3/p5bmaEbLXSC/Y/eeUJe1TI3VzfXu58CKVmL8cD9WeR5XhsYLtN44nMay9RKFYhBTqQXRf16Iy
	lUvFbFspmMKyg4pTCE3WEAPvQdvFoyyRA9gEwHefhKg5tKSRWYlNImo0xHbevELTkleGioNdxQAlr
	21uhC3UKZwjBUhnS/GXXVYXVVOBXbgu38PULGI9hQ76858dvdMAtq1vdTct22Og63tu/+Xn/xLxvP
	LLzWKn3cD24es6WWMRRuiPVJPUcoDWZT5Wi8gMuSVdBW7CMvWHeWGrYF43cTRzFxEZQ5i2+u+0Fmt
	5f6BFUpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx96k-0008Bh-SM; Wed, 06 Jan 2021 13:44:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx96h-0008AT-TG; Wed, 06 Jan 2021 13:44:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id g25so3167234wmh.1;
 Wed, 06 Jan 2021 05:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ha0RqpxHzOQ0pvIyiJg1GgWJJZaQkrZa3GihzND5+Tc=;
 b=gXZO9E3+Bo8/wtmOuO5hX7P/oAkL2d7vhmffJTfjNC11HxoNJlV8TmmBUhvQ+n5esf
 +0dzxryyVtfs3AOIdWDXmT0PO+Znxl0SFd4N+uUwQOeaDzyN0AQEgPq1JXEnlGiNd4+R
 F7fjylQG9RO67MOilxfUzfefSDvr8LaXSTODazo/IGhC0yxINqMTYc5Uv2JVD22q/ISo
 xBfjJQBZxixiL2+ihLsJAoUz/OmU3UkUm1PsrLiQoSWRlWW8hEq/Yufs5m0R/0VL5RK/
 hEmbdqUw/efYc3l+e/Ru4NQdPXq9WL+Fr3lmGR7rg5vh7U3h7Ppblt5o2/DZdlBkHmYU
 WZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ha0RqpxHzOQ0pvIyiJg1GgWJJZaQkrZa3GihzND5+Tc=;
 b=Rj4zBuoGk0DNzE2fvmWRcdci8etzVNJUNNkM+8WLTRRUtRfTCZlteORGGvyiKyI7HX
 QH13Mke4JXCiHBfvROnuJv6ggWDbUfQq6TSJsbGMFPdX4dezi/qIPX9Qa3QBAofwE1RW
 4++4wGtom/DpAwuJbOTFqGehRr4csoiroF4kyv5UCq0E+ndBGcvvUj4PSSAyvn7y+1fr
 aPhG5+sqDFEbAx8I0oSUFsMklaMjk9vwpr6yq8zsACsRyR5Jec9ar9yQpShnhWgaRTTq
 L2T+vN+ou5ZOEd+j4Q88ZV1VzieEwfIPDbLBnm3TZrmzRq/1ychU2b3AWB0cw2RgcAa9
 MFeA==
X-Gm-Message-State: AOAM532TzMISVzZn1OwzMgiuuf+VuGWevgIBXouT2osAxQsSwXr8V52e
 UGjXZ5m7JY463HZmeAxusvm6/fVAXYE=
X-Google-Smtp-Source: ABdhPJwxWUeDofAW2lIQtZGRWb6JL7E6MBExqSgbYhCt8WxoZJQvSo9h4veqeoHyk/FVnuUv8npbKw==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr3791629wmk.92.1609940649823; 
 Wed, 06 Jan 2021 05:44:09 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13711ec00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3711:ec00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f14sm3085351wme.14.2021.01.06.05.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 05:44:09 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v4 0/5] dwmac-meson8b: picosecond precision RX delay support
Date: Wed,  6 Jan 2021 14:42:46 +0100
Message-Id: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_084412_010460_A6D40716 
X-CRM114-Status: GOOD (  17.98  )
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
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


Changes since v3 at [3].
- added Florian's Reviewed-by to patch 1 (thank you!)
- rebased on top of net-next

Changes since v2 at [2]:
- use the generic property name "rx-internal-delay-ps" as suggested by
  Rob (thanks!). This affects patches #1 and #3. The biggest change is
  is in patch #1 which is why I didn't add Florian's and Andrew's
  Reviewed-by
- added Andrew's and Florian's Reviewed-by to patches 2, 3, 4, 5 (many
  thanks to both!). I decided to do this despite renaming the property
  to the generic name "rx-internal-delay-ps" as it only affects the
  patch description and one line of code
- updated patch description of patch #3 to explain why there's not a
  lot of validation when parsing the old device-tree property (in
  nanosecond precision)
- dropped RFC status

Changes since v1 at [1]:
- updated patch 1 by making it more clear when the RX delay is applied.
  Thanks to Andrew for the suggestion!
- added a fix to enabling the timing-adjustment clock only when really
  needed. Found by Andrew - thanks!
- added testing not about X96 Max
- v1 did not go to the netdev mailing list, v2 fixes this


[0] https://lore.kernel.org/netdev/CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com/
[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=384279&state=%2A&archive=both
[2] https://patchwork.kernel.org/project/linux-amlogic/list/?series=384491&state=%2A&archive=both
[3] https://patchwork.kernel.org/project/linux-amlogic/list/?series=406005&state=%2A&archive=both

Martin Blumenstingl (5):
  dt-bindings: net: dwmac-meson: use picoseconds for the RGMII RX delay
  net: stmmac: dwmac-meson8b: fix enabling the timing-adjustment clock
  net: stmmac: dwmac-meson8b: use picoseconds for the RGMII RX delay
  net: stmmac: dwmac-meson8b: move RGMII delays into a separate function
  net: stmmac: dwmac-meson8b: add support for the RGMII RX delay on G12A

 .../bindings/net/amlogic,meson-dwmac.yaml     | 55 +++++++++--
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 91 +++++++++++++++----
 2 files changed, 120 insertions(+), 26 deletions(-)

-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
