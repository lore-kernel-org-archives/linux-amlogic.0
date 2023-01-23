Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01080C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YPvDdebEnlrI7luFWMyWrQur+vjTD2xiQlM88kCU+Y4=; b=ekPsgYNpILDP0P
	GfF+VHUjcWjHCLfysbvBsX9SIUFbSulG0N3az/0hiHZO98/WsUASAmjWc1OEb3XxVFy31KSm/RUj5
	fW/nVNDciWJnKtGSCe2fu/CSp+XuIBZVUYOueopccHfslzQnKnLYBY1SGjqUycNfRUYBfDSIznMoE
	SAcn2433eR7SCA76MKmbAIkvRtze3w41m5/2CrOknY7rRvsTwv6t9OFoVZ+gXkzSZeSVZ1v3fkIiF
	2BUgYy/yAaXBaXppbQH5jIdm/sUiEBmURZsymX6VAg4TJNpR2U91cUWErLp3sPR2011gXPSLsf2Zj
	kBUidDdUsTeiZwTgef+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtvJ-00GlJf-M7; Mon, 23 Jan 2023 10:19:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtm6-00GhO3-NS
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 10:10:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id m15so8552346wms.4
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEW/8zJog5ASK2qRbXljjSIfTx60QJ93vwtD14+LGbY=;
        b=Xi9NoL7ue+FLAFSSGnI/2XAjpQ+UTVRx5qe4KqcY34Z1YHDu82IcObWaJKWB8hLoU1
         CbkbOAozjA4dyfKE3PtQiBsJUsoxmASJdVGDkJhqajjCrBOk8L4VG974dtfoMtgXTWm8
         zzd+YAd8BBpcnr/qhqWr9ZVYkgJcT/TAKRuGqrXJFsvGrUIh3kTu/8O9gh25pMVy8QpD
         yYQ9x7PJAkayDMFdSJugqjSvv0yEZB1od1P+cFP5AA5UxYnN6opD+NNbpIMPCtMRljry
         T5kcX+TKSkpLdjGwLtapshYOVrknkUPVJsy1RF02C2ABfPDUmuqzb/lQboOi227gc7F7
         Up6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEW/8zJog5ASK2qRbXljjSIfTx60QJ93vwtD14+LGbY=;
        b=DK214qN5klGlyQo8js2VcEwdAK3lAW/Rx/a8axZrFyZxm9BdiuVV59EaSlqGnfRc7W
         qAJEn/0b72xRWKy6D+ayDk0JTpen0g85K1XheIg0QFGAjOI5M105PNEI0e1bp0sRZlu8
         FC/H4e6rGl45KxszSufCNBZGYde5VYbfx58rQhwphuU09rv0ryKEQXTI1choWxViOuji
         4P2bzc+ZR7VgedUUvtMzN4Brju7To0jW76dDlHynHUYF4LpYdbDLOF//WtlWTAVnYEYS
         URNpbOMECRrkxonypvb4FqPkY+49bCvxkUbCWpNOG/IpJpyaSVo16khByNfDeYozxSiq
         hHiw==
X-Gm-Message-State: AFqh2krSsj/BzTHFr0LI9Cwk0SrrsF2ayd7u1Uz0FWebjL+4aZxWwG0a
	mR/KibkwNxn/zXA6TBjqX2QfsA==
X-Google-Smtp-Source: AMrXdXvOLzdEZ+5tsjlSq6NFgEVoE9bw28HxzSxeJSvTcruIKayc/Hq3oGuybhxXiJbtg0VDk9DhNQ==
X-Received: by 2002:a05:600c:1e21:b0:3d0:7fee:8a70 with SMTP id ay33-20020a05600c1e2100b003d07fee8a70mr23729461wmb.19.1674468600579;
        Mon, 23 Jan 2023 02:10:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m9-20020a056000024900b002bdec340a1csm22670403wrz.110.2023.01.23.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:10:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/7] dt-bindings: first batch of dt-schema conversions
 for Amlogic Meson bindings
Date: Mon, 23 Jan 2023 11:09:57 +0100
Message-Id: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPVczmMC/5XNTQ7CIBQE4KsY1j4DtNDWlfcwLvgrfQlCApXEN
 L276M6driYzi282UlxGV8j5sJHsKhZMsZXueCBmUdE7QNs64ZRzxtgAugd1D8mjAY3RYvQFTIr
 V5RVGNzM7CNtzaUkTtCoOdFbRLM2IjxDauGBZU35+Hitrcf0NrwwodDPlQkyTnuR4CRhVTqeUP
 bk1uPI/MP7GpLJUUK0lF1/Yvu8vs7aotRkBAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_021002_838164_80F109DC 
X-CRM114-Status: GOOD (  10.63  )
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

Batch conversion of the following bindings:
- amlogic-efuse.txt
- amlogic-meson-mx-efuse.txt
- meson-wdt.txt
- meson-ir.txt
- rtc-meson.txt
- amlogic,meson6-timer.txt
- amlogic,meson-gx.txt
- amlogic,meson-pcie.txt

Martin Blumenstingl was also added as bindings maintainer for Meson6/8/8b
related bindings.

Remaining conversions:
- meson,pinctrl.txt
- pwm-meson.txt
- amlogic,meson-gpio-intc.txt
- amlogic,meson-mx-sdio.txt
- rtc-meson-vrtc.txt
- amlogic,axg-sound-card.txt
- amlogic,axg-fifo.txt
- amlogic,axg-pdm.txt
- amlogic,axg-spdifout.txt
- amlogic,axg-tdm-formatters.txt
- amlogic,axg-spdifin.txt
- amlogic,axg-tdm-iface.txt
- amlogic,g12a-tohdmitx.txt
- amlogic,axg-audio-clkc.txt
- amlogic,gxbb-clkc.txt
- amlogic,gxbb-aoclkc.txt
- amlogic,meson8b-clkc.txt

---
Changes in v3:
- Dropped applied patches
- Added acked/reviewed-by tags
- patch 3: removed invalid secure-monitor property
- patch 4: added a note on the commit message about the meson8 compatible
- patch 9: fixed mmc compatible bindings
- patch 1-: unified PCIe instead on PCIE + PCIe
- Link to v2: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org

Changes in v2:
- rebased on v6.2-rc1
- patch 1: fixed power-controller, added const: amlogic,meson-gx-sm
- patch 2: added const: amlogic,meson-gx-efuse, fixed secure-monitor type
- patch 3: updated example subnodes to match reality
- patch 4: added reviewed-by, added interrupts, added const: amlogic,meson8m2-wdt
- patch 5: added reviewed-by, added const: amlogic,meson-gx-ir
- patch 6: dropped applied
- patch 7: dropped patch, replaced with deprecated in the title of the TXt bindings
- patch 8: fixed title, added reviewed-by, added interrupt description
- patch 9: fixed example indent, added reviewed-by
- patch 10: fixed const: amlogic,meson-gx-mmc case, fixed indentation
- patch 11: added reviewed-by, fixed title, fixed bindings after rebase, added clocks/clock-names as required
- patch 12: added reviewed-by
- Link to v1: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org

---
Neil Armstrong (7):
      dt-bindings: nvmem: convert amlogic-efuse.txt to dt-schema
      dt-bindings: nvmem: convert amlogic-meson-mx-efuse.txt to dt-schema
      dt-bindings: watchdog: convert meson-wdt.txt to dt-schema
      dt-bindings: media: convert meson-ir.txt to dt-schema
      dt-bindings: timer: convert timer/amlogic,meson6-timer.txt to dt-schema
      dt-bindings: mmc: convert amlogic,meson-gx.txt to dt-schema
      dt-bindings: PCI: convert amlogic,meson-pcie.txt to dt-schema

 .../bindings/media/amlogic,meson6-ir.yaml          |  47 ++++++++
 .../devicetree/bindings/media/meson-ir.txt         |  20 ---
 .../bindings/mmc/amlogic,meson-gx-mmc.yaml         |  73 +++++++++++
 .../devicetree/bindings/mmc/amlogic,meson-gx.txt   |  39 ------
 .../bindings/nvmem/amlogic,meson-gxbb-efuse.yaml   |  57 +++++++++
 .../bindings/nvmem/amlogic,meson6-efuse.yaml       |  57 +++++++++
 .../devicetree/bindings/nvmem/amlogic-efuse.txt    |  48 --------
 .../bindings/nvmem/amlogic-meson-mx-efuse.txt      |  22 ----
 .../devicetree/bindings/pci/amlogic,axg-pcie.yaml  | 134 +++++++++++++++++++++
 .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 -----------
 .../bindings/timer/amlogic,meson6-timer.txt        |  22 ----
 .../bindings/timer/amlogic,meson6-timer.yaml       |  54 +++++++++
 .../bindings/watchdog/amlogic,meson6-wdt.yaml      |  50 ++++++++
 .../devicetree/bindings/watchdog/meson-wdt.txt     |  21 ----
 14 files changed, 472 insertions(+), 242 deletions(-)
---
base-commit: afb812b3dddfcc711bf2d8a1a8a61378b3af4f8b
change-id: 20221117-b4-amlogic-bindings-convert-8ef1d75d426d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
