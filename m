Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8B4E92FFE
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=viDTCY7tHE7YiWgl98kFHw955yIVe4z46IvZ57EvkI8=; b=P3MBwGYpK5+/we
	IPduahsEkMQPw6MzxC3dV43hl25yOvruyvnefoFY7wDA5evevx9PMKM9CgWS4/09aOe8dvvVfP3Qx
	PpzUwR1uv3yDqJ11zTxPA3/0PT7xylIbrDJoZGNa59hBkqm0eOYxN9wV48NNkzJGk45QK6eKgjUei
	iRt0lm/NjXKrpGhULtunPN7yxGpij+9+CPW3g+N9ecmwrh6v7e/C644+HB40EBZSl9Hmdfs18olIP
	0Z4s9YfYLz9civ4hNTGn/Sjb4rz1holxUc5IB4TbnW3TNj9iIDvxRUYjR/3EMxgGbQ+XPyS0/OKZM
	XqMLSOXMgHX7p8t0qQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoiAp-005ctl-0z;
	Fri, 06 Oct 2023 10:35:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoiAl-005cs8-2G
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 10:35:10 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50573e85ee0so2398173e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Oct 2023 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696588506; x=1697193306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDKNYOcEsBFqMrb3wRrzCP0mxdH1YRbc05OaBLwf4hI=;
        b=MBO00RKxawfZ2p67E/CUubmoym+MkM1iz1y8eW1IZyQTmS7AqdJ0lWt9m5M3NYJus7
         oUkje0hqR4O+6zZgjU/U+JDwMB1XBqK2CMS1IiZd9d/z+mgvsu3ZtjcScw2iLBHQF815
         rqNfiOnFqQN//cRd0KfFL2AKnp0ItcgKig3VwYaNSe3EwIQnkS8oD74gbvYD7dVXMVuZ
         393nKanYKUvnC01z6o52GnnVJUaXWjyqqOn1UbEFnGO9kZH3IBAPXKXOr95y35lEQGrq
         o11x0quJSIZRhixOm7VJF44+WVUSwGo1YOK3iHUj6eroCoXy9BptTX3T5Lm+mFYh4f1S
         bUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696588506; x=1697193306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDKNYOcEsBFqMrb3wRrzCP0mxdH1YRbc05OaBLwf4hI=;
        b=KfaSBMgzxLTv6+37eRMlBQPSqGQLcQV3Z/5R5reFDHlQfvn65NE3EeItEpXa4lO4av
         o3+Ik8+hosIJGSOjOtOo+B+NMv08qF2oH6svtxF3/hgIT7vtwNGTr664zY59xzBcO+d2
         HkF5+rgkZpl2hGTowXEB2zykfxRZELESX+Z/DY2ZcuN6LL/T1o7Klq4veypvodx0srMz
         wfTPMAsjpPaRZXlj9vrOIPsmHG3j9W148RxuZ+Dzv+nE9ZHPLxZlP4SvgJDf3eUYgyct
         6CoKHl47dRd+sEKKtVQtAtlUTSXslxJ+fqVOhSz19Dmq6fgen2/Y9SfsZKRfmgCXHxvI
         4XFA==
X-Gm-Message-State: AOJu0YzUz33etb4z7rsOBzwm0vaSIXn4PhH7Yq5KkTyrl+h05lVXxS0y
	Ew+/02sK3Y2DKvfnep85zDSTwQ==
X-Google-Smtp-Source: AGHT+IEd+1rkwzUT09GxzwWsq6l0mV4x0bcd9Nx7ouA0iriK2HD32CfqtgEjU0x0dQ08/XXlTE5nXw==
X-Received: by 2002:a05:6512:2095:b0:503:5d8:da33 with SMTP id t21-20020a056512209500b0050305d8da33mr6525614lfr.20.1696588505433;
        Fri, 06 Oct 2023 03:35:05 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8f44:72b3:5bcb:6c6b])
        by smtp.googlemail.com with ESMTPSA id l9-20020a1c7909000000b00401b242e2e6sm5664963wme.47.2023.10.06.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 03:35:04 -0700 (PDT)
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
Subject: [PATCH v2 0/2] arm64: dts: amlogic: add libretech cottonwood support
Date: Fri,  6 Oct 2023 12:34:58 +0200
Message-Id: <20231006103500.2015183-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_033507_746699_043E7E38 
X-CRM114-Status: GOOD (  11.84  )
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

This patchset depends on the usb support for the gl3510 [1] and [6]
Without it, there will be dt check warnings and usb may not come up properly.

Early u-boot support may be found here [2]. It will be submitted after
DT is accepted in Linux. As usual with Amlogic, u-boot must be packaged
with closed source binaries ([3] for the a311d, [4] for the s905d3)

Prebuilt bootloaders are available from libretech [5].

The devices are shipped with libretech's u-boot pre-flashed in SPI NOR.
If necessary, the boot source may be changed to MMC using the onboard
switch.

Happy hacking ...

Changes since v1 [7]:
* Remove extra dvfs opps
* Rename Alsa cards
* Reorganize leds for DT schema while keeping meaningful node names
* Change blue LED trigger to heartbeat
* Set panic indicator on the orange LED
* Move hub reset from under the usb phy node to the controller one
* Drop npu node

[1]: https://lore.kernel.org/all/20231002122909.2338049-1-jbrunet@baylibre.com
[2]: https://gitlab.com/jbrunet/u-boot/-/tree/cottonwood
[3]: https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-a311d-cc-20230701.tar.gz
[4]: https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s905d3-cc-20230820.tar.gz
[5]: https://boot.libre.computer/ci/
[6]: https://lore.kernel.org/all/20231006101028.1973730-1-jbrunet@baylibre.com
[7]: https://lore.kernel.org/all/20231002141020.2403652-1-jbrunet@baylibre.com

Jerome Brunet (2):
  dt-bindings: arm: amlogic: add libretech cottonwood support
  arm64: dts: amlogic: add libretech cottonwood support

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../amlogic/meson-g12b-a311d-libretech-cc.dts | 121 ++++
 .../amlogic/meson-libretech-cottonwood.dtsi   | 614 ++++++++++++++++++
 .../amlogic/meson-sm1-s905d3-libretech-cc.dts |  89 +++
 5 files changed, 828 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
