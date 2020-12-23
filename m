Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C27CC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EECD3224B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EECD3224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zmr1/dK/ktZ+mLGShzyqNMZ2BAgbxP7LkwWsr1QjLjg=; b=BP8djC2uwzh6Jgr/TjttO9B2aP
	Bsfss4CUg7/EgKEUizAsNJLUiCTyFVhQ6n2/zwq0lnO8FPJOy1+mcKVrimfVs5HM2AT6wOEAwDC4p
	tji+7lxLRinhx7WdYNvpq4zE+m/TkaU4Yen3YyfaeGTEyVmyySerAU8dYtKRdVwCGRGha733zkBN2
	BRGsRNWzT2IvCMdzjxA4xQu+zqXif/2nQX3y2xfLwlwLAGhk4F6MpZ3lEVxEpisY+D1p2bwBz2IUt
	M+T3Sr5ONSRlfqvgW+cb/slxZ9/7lvyll120pe6l+Z2yBYEazjwcedIrQCilO+0MWaunk1ynuetwp
	g9XUwDBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksDaj-0002iD-5p; Wed, 23 Dec 2020 23:30:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksDac-0002fS-Mv; Wed, 23 Dec 2020 23:30:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d13so651731wrc.13;
 Wed, 23 Dec 2020 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d0QCnb34c04FUIUph7Atv00YFsD83+fw9aPx7/l0+OY=;
 b=lJAsDsYmIDdsffMxA2rZbm43WXPHBC7WLpNYUeTylT8vMumehFIWy9smiJziGDx5Ii
 uBOEiUx1pMsDuEIT0yi3c1X4fQ559oMLwQx+UU2FgfA7nzwgUApyvn5th111FZkuGnM5
 WU4O0bP0blUA/dkHymZDLXRDIrPAbXxLo7O6R30qnAQi+zksuGu8g9Ss9Owv7yoFe+TA
 rNa94y2mqMFAXLh1mT1T9fJSsL8VyL4dDgBbu1kdzPhxScmEPxU6AIxXaoobKj7qzHsY
 T1yRW6q013b84ySt2ccFs+w9Hs3iTNNQkMnhs8SItUmkIjGrGgYWyqEfgYK7FcTmeEsb
 ypCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d0QCnb34c04FUIUph7Atv00YFsD83+fw9aPx7/l0+OY=;
 b=Y+jRT5J000s6tZa6D4vbM/KS6EDoczFyU9xeu4tRCQlGblvgnn/BXv7keHF4YcCv6B
 lm0lmnVu7md8qo2XS2dCmRwGs+4WKx3M43ib4LdbmEKL35BX+08KPptxllNHa9LfBw8w
 ibgOpz8nHpU1KaZoYdJ7I8vqVMRBUk+KuCLZGrjMgvFUFqQu3WzzJwn2amJH2SpWr7Or
 xd27T8IT6qmbCvfhOlEHDEfcRzqudzY++Zp35nvmO9ecz2bodiyzxWT460OXY5/Pea9z
 21EuPrEwSrROjxllUA5RKofQuGA8k+FzABuYTN+VpcsKtbYVuQzjPp9NvzLy0C3gKF4h
 SKXQ==
X-Gm-Message-State: AOAM533Is7SIx5wDYNZ4zPLjbfwNQCpXx8RJwTeWlJiKXRZkxlkbJ+nQ
 EX5UThTZra+SGvpShcY+5PfKal510hI=
X-Google-Smtp-Source: ABdhPJxq+f5gRLUxPkgo6Y1oMCTTfqeQdiK+rbwX9uaakYBSBIg/QlWSR0j/XXXO9fsiKTUxQ5cfEg==
X-Received: by 2002:adf:a29d:: with SMTP id s29mr31181017wra.272.1608766237686; 
 Wed, 23 Dec 2020 15:30:37 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1371a0900428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l16sm37926657wrx.5.2020.12.23.15.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 15:30:36 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v3 0/5] dwmac-meson8b: picosecond precision RX delay support
Date: Thu, 24 Dec 2020 00:29:00 +0100
Message-Id: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_183042_831631_9199A547 
X-CRM114-Status: GOOD (  17.89  )
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
[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=384279
[2] https://patchwork.kernel.org/project/linux-amlogic/list/?series=384491&state=%2A&archive=both


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
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
