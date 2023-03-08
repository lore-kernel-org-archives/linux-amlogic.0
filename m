Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EABC64EC4
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 14:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K39IfEPuVrfYXNLFb7vykm7TJpMeGZwTOFF1K5Z1TL4=; b=1M7f6/1e3qvEEG
	13+n7NrixwvxlrK9l4xlB1TVqDPeue23ZjSXhziE3eoKA0akBGEjMsYwMxzh+kHZzIEjeZXIBFI5i
	+OYsIDNQLFGrd45s0WMLscu7EAV7fxpl/vHhfHcPcBwW1VAZvbqVZQy2idYWKqHonYHXoT/daVijE
	CXMsmJrsnQtjGfWoZUfcJdmRaEtHC2zxzxv8GUqONxWNjaXT90V+V2eJOwjlzxXaR0KXDVuqCCy4x
	rsBojdNcXSbnllt8GX1q1Trw2wOiBOICyYyVAwr9PJpQ7rAhpiog44gEfCZiTbVNSYG2JTuntOiIv
	BKk8gc4zLIwZDTSjC9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZuop-005ScG-CB; Wed, 08 Mar 2023 14:31:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtpS-005CBR-5p
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 13:27:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso1143039wmp.4
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 05:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678282054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdwwU4SZN57jLYc65t0m5q4ozMpywaQn61AKlSTUX90=;
        b=IclhcuJS4r1Wj2ehrUiQszZVBZTK9pO+Jzz3ws3adJeDGl9owEEGIiGcVUW13/SMxq
         LbouAPpbFGidcW3e55BFNSbWPG/Dqd/Ax3JiNEdSHzOZx3W2/8Cpnu7hApu9W/YmYlv2
         oCF7VvOGQXSmcAnxFI0hv07Utk4sy4minVn62OUM8YGlovGBi+B+3uPn3NCBVznwBiYX
         OVEsTdXyXtu8tDSzoa8dnDfCp9kxs+2XxY9UmYHCvFuMIYe8QaQOBqJml1LqL6C/DDBw
         +qHs3BWrtNrutM/e9SZDIyKsi33nVgzO65wAkLrlLvQ8t/ADACMb1wFu3EU90cCovQ6Q
         AxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678282054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdwwU4SZN57jLYc65t0m5q4ozMpywaQn61AKlSTUX90=;
        b=e3jExwptAntKyjGgwkCwIMe/IWSkw6AZxzr2wJNBq2N51KYUO3dSRIecolyEDOxk+i
         98buSdXS73wLLlautXeYuKa0KYVBO5WfEHGgl9aIOu2Fd7Hub5SCxxtsbJnUfljx0zuP
         uJMf9INhCf3oT0oW7OEg0m3giNdERFcTP+xmXtSUFh0avH6b0YyolD4/6ddjepADxJbG
         Ujdji1r9q9PiWu4hqsDxizZifdQeAItkeq5H2JBY2qrm9sPBKmlFqIDh918LWE6Zpq1O
         N1gZNB6CzHURdsvZSTkTxX12LWfeIF/gQ1jcKwzt68MOTD4tdk9s0kPXTp8vRfvV/GY9
         DJ5Q==
X-Gm-Message-State: AO0yUKUn7whg1888pfKwkaR3ukQ3Z5ZCJx3322gWGdc37dENucuHGaOm
	9Iu/IwNyaGSdQ7zgUDxdmbeVcQ==
X-Google-Smtp-Source: AK7set/Soq1Fvcc7qflRPe93eB2KPEmH/FcDQNhIB1coy2br5SfxGWWl32ofzfkJtiUodMwJmk65YA==
X-Received: by 2002:a05:600c:4509:b0:3eb:32ff:da8 with SMTP id t9-20020a05600c450900b003eb32ff0da8mr17310245wmo.16.1678282054125;
        Wed, 08 Mar 2023 05:27:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003daffc2ecdesm20631491wmo.13.2023.03.08.05.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:27:33 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/5] dt-bindings: first batch of dt-schema conversions
 for Amlogic Meson bindings
Date: Wed, 08 Mar 2023 14:27:28 +0100
Message-Id: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAECNCGQC/5XNwWrDMBAE0F8JOneDtLIcO6f8R+hB8m7sBVcCy
 RGE4H+v2lvpJTkNM4c3T1U4Cxd1PjxV5ipFUmyl+zioafFxZhBqXaFGNMacIHTgv9Y0ywRBIkm
 cC0wpVs4bDHwzdHLUYU+qCcEXhpB9nJZmxPu6tnGRsqX8+H2spsX1Nbwa0GBvGp0bxzD2w2WV6
 HM6pjyrzwZXfAPDH6z3pJ0OoUf3D7NvYLZhjAORNWwD0x9s3/dvD0BBOWYBAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_052738_260644_0C87DABD 
X-CRM114-Status: GOOD (  10.07  )
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
Changes in v4:
- Rebased on v6.3-rc1
- Added Reviewed-by
- Removed applied patch
- Link to v3: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org

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
Neil Armstrong (5):
      dt-bindings: nvmem: convert amlogic-efuse.txt to dt-schema
      dt-bindings: nvmem: convert amlogic-meson-mx-efuse.txt to dt-schema
      dt-bindings: media: convert meson-ir.txt to dt-schema
      dt-bindings: timer: convert timer/amlogic,meson6-timer.txt to dt-schema
      dt-bindings: PCI: convert amlogic,meson-pcie.txt to dt-schema

 .../bindings/media/amlogic,meson6-ir.yaml          |  47 ++++++++
 .../devicetree/bindings/media/meson-ir.txt         |  20 ---
 .../bindings/nvmem/amlogic,meson-gxbb-efuse.yaml   |  57 +++++++++
 .../bindings/nvmem/amlogic,meson6-efuse.yaml       |  57 +++++++++
 .../devicetree/bindings/nvmem/amlogic-efuse.txt    |  48 --------
 .../bindings/nvmem/amlogic-meson-mx-efuse.txt      |  22 ----
 .../devicetree/bindings/pci/amlogic,axg-pcie.yaml  | 134 +++++++++++++++++++++
 .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  70 -----------
 .../bindings/timer/amlogic,meson6-timer.txt        |  22 ----
 .../bindings/timer/amlogic,meson6-timer.yaml       |  54 +++++++++
 10 files changed, 349 insertions(+), 182 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20221117-b4-amlogic-bindings-convert-8ef1d75d426d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
