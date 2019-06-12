Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F876C31E48
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:56:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EE3208C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WIWHU/w2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mg3vmtbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48EE3208C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bv5sb78aFAbwP4CUDQk6FOGzlJCGLL9OUa3T9WNUTAk=; b=WIWHU/w2I2h1W4
	rRk+AziYubfPRWK92ewGt8YKi9gKXGzMafIZTTuCduvwcAZIsMlHv4UQmCgNoX5Nr7xN3Xf7WkzmJ
	Q/4lPqe7v4kdgcg3TljBONjNAs4R0FNUmwPip/PQK/MdT4YQui5BHe/oUYBwAiWNV8pWx/sGF2gIE
	eBgrqnC59SjtKZXJs76CHDDozfzYXRjVcnyV6uSCYlD7zgcRs/u82Q9j9bdaLzy/LYzTrpEJxrvll
	TZFk+duovVoxGcOPNDVsy25WFhghAOQVcIevIWiD+9peVfanScCQxoHF5uI8RYvGJifqGkspgfMzw
	AXWDoOf/X9cyjiko+1jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbAHe-0005PH-DW; Wed, 12 Jun 2019 20:55:50 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbAHb-0005O2-CA; Wed, 12 Jun 2019 20:55:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id f9so18336312wre.12;
 Wed, 12 Jun 2019 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZ7Q02f4JEf34T5luLcOREHyEm4npQ5trSJ/nqzq8KI=;
 b=mg3vmtbO7GQE8XVffQtxwJcZF/oIwU11kK+Acbjymrr2vinDGw7IyBsL9IgNyBZY9n
 JLZ1XMsuYOhdNuxjBwTsptARffVdoBVduDOSs2kjL+wL4qr0Cn69+PcfWtsYo2lPTdKD
 qdZDu8w4Ept3hxTEEOvo7hmqhqvgbFNm1rGKbUXi0HrzXU9wTGDdix1/vZmZhsbf52/U
 WshRL/dw4YLGTk2yPYQTPDe32v753sbqy3j1Oc+Qh1oLxit5GuF6kl1u2b41+PmFmsWU
 jvFVIRWqhMTU+LglW3YXP38+DkPHcVWHoKnl4DyBQXl/Ftbq9KZ110zaZjuQBKV5+kLJ
 Ld2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZ7Q02f4JEf34T5luLcOREHyEm4npQ5trSJ/nqzq8KI=;
 b=NppQp5c0hjCekxr+PvIhf3CNVfxp4bum98tHBJGOUMtOt/cbJZxCaX4b6vvPdEOL+5
 UeiUoK09NheaHq4Y7KonlFmWZusg4E65MpkClznuhAQp0PFREZlkbNGVR4gsEbPnq8KY
 /rjeA1vk88BdpebLEH16HCI4CnIY5qg0/Jfo7XhmtmDmiSM7KCX3KMxBXBlaXQXvDsPQ
 3EVez/OF4ToVYt6DjqOEG1CTWE/6GRgrMk9xXvkIn3LUOOPcIU4kmJrfAXUaikIbRxBK
 ihvRQRvW6M8109EoWDjkHDKLOnI5HrPbioAW+yGA32P2JHAymWLnKfMGXX/ZRMjvUvMN
 nmRA==
X-Gm-Message-State: APjAAAXQ5lA/VhEcUpyZKlX+fe028xH+q82vQDOpk27NIBnL1cq522LS
 uQ7MVhHsQJnWk51/T4Xu+6iMSKQk
X-Google-Smtp-Source: APXvYqzPwLw3bVyQPoGki1H86cxQv/CaJAP/waZtaKCPgu6NSjHMKfqFNAFW/GHXnLzN8dcf/35BJQ==
X-Received: by 2002:a5d:6212:: with SMTP id y18mr8369049wru.178.1560372945219; 
 Wed, 12 Jun 2019 13:55:45 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id s7sm3445793wmc.2.2019.06.12.13.55.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 13:55:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 0/4] Ethernet PHY reset GPIO updates for Amlogic SoCs
Date: Wed, 12 Jun 2019 22:55:25 +0200
Message-Id: <20190612205529.19834-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_135547_443434_BE23C6F5 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: andrew@lunn.ch, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While trying to add the Ethernet PHY interrupt on the X96 Max I found
that the current reset line definition is incorrect. Patch #1 fixes
this.

Since the fix requires moving from the deprecated "snps,reset-gpio"
property to the generic Ethernet PHY reset bindings I decided to move
all Amlogic boards over to the non-deprecated bindings. That's what
patches #2 and #3 do.

Finally I found that Odroid-N2 doesn't define the Ethernet PHY's reset
GPIO yet. I don't have that board so I can't test whether it really
works but based on the schematics it should. 

This series is a partial successor to "stmmac: honor the GPIO flags
for the PHY reset GPIO" from [0]. I decided not to take Linus W.'s
Reviewed-by from patch #4 of that series because I had to change the
wording and I want to be sure that he's happy with that now.

One quick note regarding patches #1 and #4: I decided to violate the
"max 80 characters per line" (by 4 characters) limit because I find
that the result is easier to read then it would be if I split the
line.


Changes since v1 at [1]:
- fixed the reset deassert delay for RTL8211F PHYs - spotted by Robin
  Murphy (thank you). according to the public RTL8211E datasheet the
  correct values seem to be: 10ms assert, 30ms deassert
- fixed the reset assert and deassert delays for IP101GR PHYs. There
  are two values given in the public datasheet, use the higher one
  (10ms instead of 2.5)
- update the patch descriptions to quote the datasheets (the RTL8211F
  quotes are taken from the public RTL8211E datasheet because as far
  as I can tell the reset sequence is identical on both PHYs)


[0] https://patchwork.kernel.org/cover/10983801/
[1] https://patchwork.kernel.org/cover/10985155/


Martin Blumenstingl (4):
  arm64: dts: meson: g12a: x96-max: fix the Ethernet PHY reset line
  ARM: dts: meson: switch to the generic Ethernet PHY reset bindings
  arm64: dts: meson: use the generic Ethernet PHY reset GPIO bindings
  arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY reset line

 arch/arm/boot/dts/meson8b-ec100.dts                   |  9 +++++----
 arch/arm/boot/dts/meson8b-mxq.dts                     |  9 +++++----
 arch/arm/boot/dts/meson8b-odroidc1.dts                |  9 +++++----
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts             |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts    |  7 ++++---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts  |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts  |  9 +++++----
 .../arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts   |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts       |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi  |  9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi     |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts  | 11 ++++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts   |  8 ++++----
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts        | 11 ++++++-----
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts    |  8 ++++----
 17 files changed, 80 insertions(+), 66 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
