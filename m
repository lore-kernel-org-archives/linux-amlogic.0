Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270DAC678DB
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O3ehWHxQu9lrPbHrMUaSt7jRMlakiNIP2TNEO/77cYQ=; b=Huj96+f2/rkNfF
	rCB2QZrjaanHY02AvF5hInnWK2tqwlh+FX+cIbLchvaoMtKgyRlf+f+p27zRQL0+Cc9O1utEVn9s/
	1yEePJPScXnxj3wRPx25fTC6dtOXwx8biHsxQCtJ3xv2TBurHam0IBwzinWbNUxeBTzpWgEgdFUAp
	mJwvoQ0KRcACDRm9Ju7mpkK0S0IJLBL9AFuUrLTpAUGKgPMTOQQSzuSSpFj9PjYS1qAAwhOHyaxsy
	cTcVqoaD4S/OueHrqnZy9hctPq6tK4QETrkua6026mIGOwjwNpwMenl+z4GOz8tZGGrttvK2rnwy+
	2FLLw21NiOxbph/wVuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYog8-00AHUt-Mc; Sun, 05 Mar 2023 13:45:32 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYofx-00AHSO-Tr; Sun, 05 Mar 2023 13:45:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id bw19so6317248wrb.13;
        Sun, 05 Mar 2023 05:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3lfSrbd4QG8pApbR/SCATb+t3wLQomrPBsssXD+brM=;
        b=lRu8tiCiBCSJ0FkKW4I2QJ0maefa4Rsck5BBpAD7C8nyPs5GyUvxGH2+zVgybJuJvj
         yznYU6tyGj14agJHJ5mJ1b5gO2wPleUobpq8KaJjGnAkzybLvHMwJmcEJnkSQ3czWoQr
         GC8vLJ9AHr8iGYUxqMl/WekrZQpH+lEsCgXa9Sf2B0/GkiOBAm80dwlulo524+kfM+cL
         BxAEuyFlezic4W+0EbA+CS8c2LXRFAItT5GWcaGIG5L+phwh/bzuoUsSoFL09iAc61aQ
         sYloYT4NW+1dX4RQvrUTQzdRO9AM2BqWehyNGWVohdWDlDUUKzRu/W5jn9MR63TCedS0
         Hdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3lfSrbd4QG8pApbR/SCATb+t3wLQomrPBsssXD+brM=;
        b=ThKFoDYXidVVD6aZ9H1aBOIqMvgvO2JeU6fRciOw9oNixBmuCLCIb4vK9tjrpCzqmi
         wHnkf6RD2NJJJlFVtJh7OTR+Z30rYIPVlvszJLwER78+0ScSjgdjeSHW4S09T8VkIPxk
         8Rv4doyYUMJGNqOUBHyv+WF5VrRQshY0bwnF+2ZAXKi1Yv/JAXgPC+yL3WxHtbLQfkPi
         5UlrDM9E1IenMC15eAYYzi6P4xdeW70aCwpwlHDZ3R2HYg//CNjdNJUAA/sLebY5U2RS
         zxDtVMWoeAlWWsK1ucXjr0JSq5kDt6GDdgKAphGWUoKpMCwrwmHCB8EY6R0h5B/YDEHL
         MqkA==
X-Gm-Message-State: AO0yUKWbnG/hpXAHp/xgaobu9qJMIViMPoFnQEW/c3uaUdRg4nQRMwSY
	MUPhHVDql9dRph//mXhIEoU36enVNeJ5Iw==
X-Google-Smtp-Source: AK7set/J1KAoZpvFBzDy6E/mVM5T+GeQDY3QdIQXn8Cr88+Bb4rbmJg2AHQphHxF5zWBNJtBO2H/5Q==
X-Received: by 2002:adf:ec47:0:b0:2c7:e48:8ca3 with SMTP id w7-20020adfec47000000b002c70e488ca3mr5119278wrn.0.1678023916627;
        Sun, 05 Mar 2023 05:45:16 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c54e26bca5sm7421507wru.49.2023.03.05.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 05:45:16 -0800 (PST)
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
Subject: [PATCH v2 0/2] arm64: amlogic: Add initial support for BPI-M2S variants
Date: Sun,  5 Mar 2023 13:45:10 +0000
Message-Id: <20230305134512.1596572-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_054521_987745_94E47122 
X-CRM114-Status: GOOD (  11.08  )
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

Add support for the BananaPi M2S which ships in two board variants with
the Amlogic S922X or A311D chipset. Schematics for the board are not
currently available from Sinovoip so the device-tree is largely derived
from the Khadas VIM3 (also S922X/A311D) and other recent BPI boards that
have public documentation. The device-tree also supports the RTL8822CS
WiFi/BT module. This is optional so the nodes must be enabled though an
overlay or fdtput.

Patches are based on current (v6.3) for-next branch.

Changes from v1:
- Fix LED node names to follow schema
- Add Krzysztof's ack to bindings patch

Christian Hewitt (2):
  dt-bindings: arm: amlogic: add support for BananaPi M2S variants
  arm64: dts: meson: add support for BananaPi M2S variants

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../amlogic/meson-g12b-a311d-bananapi-m2s.dts |  37 ++
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi | 521 ++++++++++++++++++
 .../amlogic/meson-g12b-s922x-bananapi-m2s.dts |  14 +
 5 files changed, 576 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dts

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
