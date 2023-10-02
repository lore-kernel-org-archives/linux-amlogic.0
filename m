Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16212E7849A
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Oct 2023 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8JpqTlqRbpwRizZnW+MRe7XwtRu1qVC+vnLIbGM4wrg=; b=hH+QwHgBMDOV5V
	ZFj1eqs2l3aYuaR2quIICM8x2HPju00yXRv2rtNykQrn8QIymmDZn0v6W7fROKD5F7WsBHYhYAh5G
	P1/No0lrhco6FULL5qAwUfTKdgGp2u8giZPHXq5pqQ71QKD4p0laPReK+vtne6G8Wq6XZY9azyne2
	qNT5H51+qI85Mdi8V3d50TCCCg0khDWe3+0LDYp3oEt4AgxEw+9ExMooZBzj6yWKFAgGhoEkA8v25
	dCOwt5ibpkLVpCfl8CEbSzo6ItpOdmpi19XnYDf6PMGAToUt5TmzyJ1n0jwIcShdLBOdaapUqBrzg
	zU+gEVt93wgXovZjfN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJdG-00CquB-1d;
	Mon, 02 Oct 2023 14:10:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJdB-00Cqrl-1J
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Oct 2023 14:10:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4066241289bso25773865e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Oct 2023 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696255836; x=1696860636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wbehdpfeTskgBGeNboTr1Vt3I7y4UPyUbI3qTqn6yY=;
        b=jdjL0MrXmEwUzf1NKA1jhMpHuexbiLDAairBMLMNkyqaHT6Fdqd96YzCHCsNQe6AZJ
         r8yRfBakYb9SNlmvBHN5ZFOLpU+frfpmraMScGGNS9PIj+RjCIz8eGYntFwkr1W727bH
         1y30A/iu35LgR+SddrgNvLCP0xSB4K9+dqfunC8ECRZSKchV4TjZVDConUQoBATIjs+E
         MGf0UkpEgmCBmc0hnl6i5rCLbJvrDLbN/SMrJXJcYfjJr1/xnECSiT6+PShbOz3kUwAr
         eb+l5ukNF1WDQraE83y5+Oa3CO68EWMEmotfe+W/umNE0CLYKVF0u83NuW4uRzEXyPpZ
         MRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255836; x=1696860636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wbehdpfeTskgBGeNboTr1Vt3I7y4UPyUbI3qTqn6yY=;
        b=JaQAbzXXW+2r165ZKfMMP6MDP8uBEaVXT0zFh8Cu6PeDVVy+hjf8IaaTaoKzDfFNtd
         FYzBcMf/8Uzb1Y73macpbjnVoOmsWn0nvpZ76ZmsBOZ2zkxR3qiPpJI4f6JoemXwFy+1
         hmMmPdi6+xKYuax0j/6MtMWw0W5JavH1h/Pvk5/w5rEcCmK5XLrb8oK26nLeEg/Ch88V
         5BzVnghfglvdH25xvYb4ILOkvT4wSkfUdlye5BgEAwmbN4+ZWwlN1fit8cNb17TafPcl
         3YR/tNiuqsdEbpusGjng66t7BqfF51M6N1zD2oiA5FGP1Ie3hnzR4lMXckGk5W5/bOZw
         yl0A==
X-Gm-Message-State: AOJu0YxHFAph5YZbbQtoDxLh8oxCp3hgBNsOha2p+3U/MufMNUhVaHW/
	XGIMr06RXglXoCg0dVikSX+55Q==
X-Google-Smtp-Source: AGHT+IHak2pzWxI31EARsFs3PYfLjm4QWGcS1E6hRazzJjbQPUoLCM7VWxR3/LzQtmwlQLZKnGLI1A==
X-Received: by 2002:a05:600c:2214:b0:3f7:cb42:fa28 with SMTP id z20-20020a05600c221400b003f7cb42fa28mr9119350wml.28.1696255835696;
        Mon, 02 Oct 2023 07:10:35 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fcf2:65f1:853c:13be])
        by smtp.googlemail.com with ESMTPSA id k3-20020a05600c0b4300b003fe1fe56202sm7361911wmr.33.2023.10.02.07.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:10:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Da Xue <da.xue@libretech.co>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] arm64: dts: amlogic: add libretech cottonwood support
Date: Mon,  2 Oct 2023 16:10:18 +0200
Message-Id: <20231002141020.2403652-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_071041_443257_38ECA131 
X-CRM114-Status: GOOD (  10.97  )
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

This patchset adds support for the Libretech cottonwood board family.
The 2 boards are based on the same PCB, with an RPi B form factor.

The "Alta" board uses an a311d while the "Solitude" variant uses an s905d3.

This patchset depends on the usb support for the gl3510 [0]
Without it, there will be dt check warnings and usb may not come up properly.

Early u-boot support may be found here [1]. It will be submitted after
DT is accepted in Linux. As usual with Amlogic, u-boot must be packaged
with closed source binaries ([2] for the a311d, [3] for the s905d3)

Prebuilt bootloaders are available from libretech [4].

The devices are shipped with libretech's u-boot pre-flashed in SPI NOR.
If necessary, the boot source may be changed to MMC using the onboard
switch.

Happy hacking ...

[0]: https://lore.kernel.org/all/20231002122909.2338049-1-jbrunet@baylibre.com
[1]: https://gitlab.com/jbrunet/u-boot/-/tree/cottonwood
[2]: https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-a311d-cc-20230701.tar.gz
[3]: https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s905d3-cc-20230820.tar.gz
[4]: https://boot.libre.computer/ci/

Jerome Brunet (2):
  dt-bindings: arm: amlogic: add libretech cottonwood support
  arm64: dts: amlogic: add libretech cottonwood support

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../amlogic/meson-g12b-a311d-libretech-cc.dts | 133 ++++
 .../amlogic/meson-libretech-cottonwood.dtsi   | 610 ++++++++++++++++++
 .../amlogic/meson-sm1-s905d3-libretech-cc.dts |  89 +++
 5 files changed, 836 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
