Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8188EC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RCMnDRwiQxKRDQhqgMG9B2tP+Pq8aVpjIOT+gjIj2Pw=; b=qNa4G+CYjv5Qxf
	ZVsiqLxbu3Opdu25ghN25jXt1DEwwJW79aWoO55+7xlo0TOBjpMbI1VqJVJSPLQ1jDQ/HcFLmrh/2
	vTNRVHg7wSdytUJh3R8wlOwHj5Ok94PekRFi7+mOEdlTBxvE0xDZQj/KDP+cxag6qUppg72tXyzNG
	//0DmShy15xFlpT103bROYHtmft3HuXI9vr5sNVOQxXnFDeF2SLnKso734Dj2cjdR94S2iSpStu4C
	nuVTGg7E2uusIUQIeAZyMwbQHwP5bnzMXm1tAWPVymB0ChbY+TT3U+X3X0Y1mc3wSMdQ8DCnywS/l
	u/ShpnAlQvghNHUjzZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPcq-00FG0z-QO; Fri, 27 Jan 2023 14:22:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPcc-00FFuS-QC; Fri, 27 Jan 2023 14:22:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id y1so5135108wru.2;
        Fri, 27 Jan 2023 06:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsNJy+GU45M4gqqGe7j546WHUfWrvkBMHdyS3JEiglU=;
        b=crilyzytrBUZbv6+nVwitkdCjIA12LZW/POFk8tvMhZkQP94rYK2CDq72Zxj74np+E
         v7HIiMVIeTZV09kordZ+NA331vuZPgQaLxbssd6o+8k0d6HSM0Q00fz7DQpc4Zo6e4Ha
         Hl7eDhWE2ldOcYaAzvZWigII4zhfMSJTvo2IRthet0VhYjm/RHY9AXS6h12rlG6uKKij
         43tjB3WNlrQQzN6JsfxyNQLHzptn3DlHlau62mzG2kme8U70ryFfrx2qzKe8jgCT9lk7
         6462EeU5LL8mTiRVNs85BzvNTs68Nw/PuniUA7lRrgCpHXumyZDsnxy0qH97BV4nkkvP
         fHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsNJy+GU45M4gqqGe7j546WHUfWrvkBMHdyS3JEiglU=;
        b=FQgrqEfR+3dOy8uU/zJDB0spEFHm0FRoKJ5YAgZwQoxuDp+0oJv5uaCXyybE5vDNgy
         +avGTsizPnNZnA0Lx73MRm4vtAsimk7FHELUmHxm/tI367WwHlYjHNEx/7TANpu5LZzD
         jHfGKiiQ9QYZPoAXPKvQ5d0cBeOMRnVxIsC08PKCQTaXXudyH/p8augym1+8BK2hGl96
         B2Mx5sPFBwRODAASYpg3aaCWb/YGW5UspTRf7Z7l/vTrVmP3LDRiKN+k42aN6+tcu6pF
         /3BDuj756OZ0Gzd4R9p1CgvtcbxidzDZxP7ykxZbcEvpfkGTtf1so3jkhniWoXN9zR/6
         VrDQ==
X-Gm-Message-State: AO0yUKVkpBgAOqnpFjYc6kPY0LR1yFPV35FFNEMiQJKztqnzmls6J6px
	GrLC4xuy66K1SwQJ99IzYVk=
X-Google-Smtp-Source: AK7set8dCLtWin3Sq5pR4hSdcD9vBqCvZZyIgFgubS0gGdbSFOtl78QOeKviHTo1yZoG3TKibdAuww==
X-Received: by 2002:a05:6000:1204:b0:2bf:b33b:fb7d with SMTP id e4-20020a056000120400b002bfb33bfb7dmr11490015wrx.61.1674829346355;
        Fri, 27 Jan 2023 06:22:26 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id c11-20020adfa30b000000b002bfb5ebf8cfsm4301039wrb.21.2023.01.27.06.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 06:22:25 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: meson: fix BPI-M5 and add BPI-M2-PRO
Date: Fri, 27 Jan 2023 14:22:16 +0000
Message-Id: <20230127142221.3718184-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_062230_866147_D2CE0778 
X-CRM114-Status: GOOD (  10.41  )
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

The first patch in this series fixes an SD card (re)boot issue on the
BPI-M5. The second removes a redundant status from the sound node so
we don't carry it forward when subsequent patches convert the (fixed)
dts into a common dtsi, then add support for BPI-M2-PRO which is based
on the BPI-M5 board design.

Changes from v1:

- Added patch to remove sound node status in meson-sm1-bananapi-m5.dts 
- Added Krzysztof's ack to bindings patch
- Revised meson-sm1-bananapi-m2-pro.dts to remove sound node status
- Minor wording changes

Christian Hewitt (5):
  arm64: dts: meson: bananapi-m5: switch VDDIO_C pin to OPEN_DRAIN
  arm64: dts: meson: bananapi-m5: remove redundant status from sound
    node
  arm64: dts: meson: bananapi-m5: convert dts to dtsi
  dt-bindings: arm: amlogic: add support for BananaPi M2-Pro
  arm64: dts: meson: add support for BananaPi M2-Pro

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-sm1-bananapi-m2-pro.dts |  97 ++++
 .../dts/amlogic/meson-sm1-bananapi-m5.dts     | 428 +----------------
 .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  | 435 ++++++++++++++++++
 5 files changed, 535 insertions(+), 427 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
