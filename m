Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CA2C433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:42:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1411C61A1B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1411C61A1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J5vjJyeeogX0XBZTjzXgVPxHm6VUhoR5uPEpLHs3FZc=; b=RffqjSfg+crTdKZpkYD/4tGuLI
	ql6Zn5k0KiLXbwpKDGeZ41N1aG3i0FvARsz/GWiwEWA7BsybDZileyAOsZAAGM6qVzqT12qJlpIAK
	6MrLNhghWwYf0eUUKhET69pIAFxQDNweCF1C/pxXPAZ9zj8316obty5oDii/tVjiGW2LzSGnlG/hf
	8cpgrzM+9oUseSb6/R7HYz83fLPUD+6vTFHQcyxfkf6AogIpMs2pW/B8ZYzyi71E1LXQtxmIYhPFL
	0EKcvd76+22I/q5rvpXkVIkZHdQx4pdUYLKpg3e/4SWUAbFUud/Z4W2hvfkR5usaFNk+ZNS9LnVRs
	yGqa4K1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPK4-001Pew-JZ; Thu, 25 Mar 2021 12:42:48 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPJq-001Pd2-Ka; Thu, 25 Mar 2021 12:42:37 +0000
Received: by mail-pg1-x536.google.com with SMTP id l1so1664358pgb.5;
 Thu, 25 Mar 2021 05:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4nI1KUl9G1G9ZlgtJo82RLpSdsCwNuG0Shl5fKFntc=;
 b=f8WRyre9YmwoNrvQkJg0F7VluVW7CcXOXHpNuoeoWdw7bVKZTRzfY8UU5aIZq6mFhb
 oglkr07dW0ahasGEWwPCeyIrLCIrPlnllLV1GkGig3VckQ8teJVcnfqYu/OrVgIvGdsZ
 zhmWPmywNCX2hKxmfnIHyQKx3YCfp+1W9Ta+34gdFXGdMHMs5l/bzzZb8Uysz8Eg/qci
 3xfR8gwJgpS4W2daTOEOI2SNYgOY6BbmSJJHmdtOy3+BS3vqU3YQavNVL5FvOhbp4zW2
 LQN3dWIZkzV45+Gf/C0oC0DN2Z08wTcRzVGcxwuLXivC8/puO95avE5aBMs1c82ezGmW
 KAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4nI1KUl9G1G9ZlgtJo82RLpSdsCwNuG0Shl5fKFntc=;
 b=fxsOskyx2iIj8jDM5SrANjyJcf0dTZtIVrB4Q2Ea8Qg4/4SV62iwt/3PsDNJPeFAs8
 lquHZs4NTL9VC2rYCmHBwCBVqH0I2o8W8LFVWrOoBoZCWA9G88x44/QlUSoLG+v3ZsJa
 bTPbHoamQ7VzGYQ1IuYQLKVbOR05MS8MV/sNghz6wnbpESCSYTPJURezD+nuJVUOy/2H
 sRr3kJa1mDSEPkLe24z5uP5hi7RSafJbJC5zznhE6+bMhaNUJGqKFRzCLH6RIGXy8Kwk
 QrBya/KdCbXBj/0jH6rGq8yXKnZbvLjNqhQghGtQz5a1WAnar5FUFvPKegGTyrfG1Vsb
 VKlA==
X-Gm-Message-State: AOAM5308uTqBY0TwEuSTPJVW8pFW3cdIysk6O2Vm0YDVkwSQnCA4Okor
 Vdz564d9HihakSgFtFXrSuQ=
X-Google-Smtp-Source: ABdhPJys3UTK7w3g7KmDs+EYdtyXHqpK1lJXIYfn1mX99LDU3uLj/z/qMmlAI144Vlv6vi9TiMJFqQ==
X-Received: by 2002:a17:902:7887:b029:e6:d880:de91 with SMTP id
 q7-20020a1709027887b02900e6d880de91mr9741816pll.34.1616676153125; 
 Thu, 25 Mar 2021 05:42:33 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.9])
 by smtp.gmail.com with ESMTPSA id t17sm6125917pgk.25.2021.03.25.05.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:42:32 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>,
 linux-amlogic@lists.infradead.org
Subject: [PATCHv1 0/6] Amlogic Soc - Add missing ethernet mdio compatible
 string
Date: Thu, 25 Mar 2021 12:42:19 +0000
Message-Id: <20210325124225.2760-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_124235_599125_E82C4459 
X-CRM114-Status: GOOD (  14.68  )
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

On most of the Amlogic SoC I observed that Ethernet would not get
initialize when try to deploy the mainline kernel, earlier I tried to
fix this issue with by setting ethernet reset but it did not resolve
the issue see below.
	resets = <&reset RESET_ETHERNET>;
	reset-names = "stmmaceth";

After checking what was the missing with Rockchip SoC dts
I tried to add this missing compatible string and then it
started to working on my setup.

Also I tried to fix the device tree binding to validate the changes.

Tested this on my Odroid-N2 and Odroid-C2 (64 bit) setup.
I do not have ready Odroid C1 (32 bit) setup so please somebody test.

Best Regards
-Anand

Anand Moon (6):
  dt-bindings: net: ethernet-phy: Fix the parsing of ethernet-phy
    compatible string
  arm: dts: meson: Add missing ethernet phy mdio compatible string
  arm64: dts: meson-gxbb: Add missing ethernet phy mimo compatible
    string
  arm64: dts: meson-gxl: Add missing ethernet phy mdio compatible string
  arm64: dts: meson-g12: Add missing ethernet phy mdio compatible string
  arm64: dts: meson-glx: Fix the ethernet phy mdio compatible string

 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 +++---
 arch/arm/boot/dts/meson8b-ec100.dts                     | 1 +
 arch/arm/boot/dts/meson8b-mxq.dts                       | 1 +
 arch/arm/boot/dts/meson8b-odroidc1.dts                  | 1 +
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts               | 1 +
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts          | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts      | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi   | 3 ++-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi        | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi  | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts      | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts  | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts     | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts         | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi    | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi       | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi              | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts   | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts     | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts          | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts      | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts      | 1 +
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi      | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi       | 1 +
 26 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.31.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
