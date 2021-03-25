Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC8CC433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:38:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F95F61A1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F95F61A1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J5vjJyeeogX0XBZTjzXgVPxHm6VUhoR5uPEpLHs3FZc=; b=AOxG+KwCd1OkKlM67dddWDRchO
	j5lcDdUTugY4YAdgQmOREordvRtPdtOqi4YjiI/YrtYYxXO/zC74O5TKqK0MTe2azt18lonk//RYc
	GAaUnXvbtWCjcscdcvh22/BI2VD3ptCMMYNKfPFi9L0In3ntyhtAr9AYonn7r1HYOvWA3/wVdajy9
	GKW6h7HdrJczRqDdLrqToy2UcBEJn7YgupFz8yzsfmIIJNRtQ851Keastd2XCu/l5uN195hw3/pY/
	77TI7YzvevkgzoduTTaS0WsPzZviLi24wu35AiKqpCveSy7S9syql2+EP0c4lZT45l/LVsLY6XbGE
	TTGPCUdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPG4-001P8s-Dn; Thu, 25 Mar 2021 12:38:40 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPFk-001P6H-6p; Thu, 25 Mar 2021 12:38:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso862297pjb.4; 
 Thu, 25 Mar 2021 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4nI1KUl9G1G9ZlgtJo82RLpSdsCwNuG0Shl5fKFntc=;
 b=WKQPqIKg4agimS56D6cDGaNG5KHvmw5XghT0krcHJhqubvq9+oda4+76HQrxpwy92M
 4tw99ydS11PAR78gmKTuQ204REhc14lAFG83mTUR3HPe5GOOhtwGrSdQfhw9luyvdJQc
 XSUz3wA5MN+mI9YuxRnx7dGZhIRfXyZXutyeK51aqtw/CoJ5fkZl7zzGNtQB7cjR/DTM
 t9QoEzlNUZZZxXRxZGklmXB1lwvT9rMi8zXXPIgn6EhQqKOC2vHPqN5//1B2C8rrG7ND
 SR3MNn4Z3ClVMy8wtgcVXRVKfXa3BUIU4G8YpY36VqCJkOjgJ0Jp+jlPopJM15AzcOax
 6zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4nI1KUl9G1G9ZlgtJo82RLpSdsCwNuG0Shl5fKFntc=;
 b=mS2+oZFZP6pYUQRLfBOZ1t4mfPUgqQ4DtX78DeG13yu3+YvJ8PcwdmWmdIge603Zb0
 wU0zXoDX4XWlurabPtbjkPuIvtGvKvBHZyqEhF69eI83lPoBVKXk9ERYiIUV6HDpcnN2
 t6F4+o/FUSHWXU2uHAS0+6cMAhelFNXKqsEBys47SfYDTY59pq5/wPxvd2KrXd46FsEf
 4sTR+p/XjWIJfTTEDu7NVJt2LyXwTB4qXtbfsTHB/LfIcBXWYyJz8QKhsjciat7oRx9k
 gi1+rsUHvgccjFwAylhvnAEaOuSQqBco5mW8LPT1CAY1wOjVn2mMzfFYgys4TmgTiRrM
 z8Fw==
X-Gm-Message-State: AOAM531h/rYSxi494Pwz/v3Q1djMbkJCAQRt1httql2FtDQHyUHg8Yld
 OiD4N0P/bfFs5LfhYKNxsB4=
X-Google-Smtp-Source: ABdhPJx6X3I/APZn6CqX4+bF0tvSe0zFJoqtbc9gKN/Ctlx3O3qlT58i3FaLe2PpV/tBAxbaMCsOew==
X-Received: by 2002:a17:90a:ab09:: with SMTP id
 m9mr9153049pjq.122.1616675898283; 
 Thu, 25 Mar 2021 05:38:18 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.9])
 by smtp.gmail.com with ESMTPSA id g18sm5831864pfb.178.2021.03.25.05.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:38:17 -0700 (PDT)
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
Date: Thu, 25 Mar 2021 12:38:04 +0000
Message-Id: <20210325123810.2624-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_123820_573570_171FEE72 
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
