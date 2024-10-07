Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931E1CFB441
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 14:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glnPLXUPMkfJj98oTOYndfCXd0ZWwOqdNnPJMNS/RAw=; b=bntL2R/sGX3Ubf
	w6++8MKELLyANAo4PiVCpu408q8eyDsHCQ9Hux4732UMSf6hYfxc7msnCOLd9ruuhX33AVksWmlv/
	HH9WSR1vygxkamvqEJAbnYOAJis6pfU18y9AfO1OO0JeastwxnY3aenmk1y2AieBc0pY4cschcJbb
	jMe9EEeG1WYTgZrzK/IGlOIRX5fMGMnGi+/BJ6o6hSi3e7a11nzznoCW3+N/0+OYJUteLqIKm1zu6
	T92bd/i18rzHcfkWE5CHlQLDnQxfDwS4CCr8K4rYELCdgltNl4AwA3dJn7aarvM5RDWlCLkOuvVrM
	lasnN4sOJEY1i2n2soBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoNa-00000002cxJ-17eX;
	Mon, 07 Oct 2024 14:06:30 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoKu-00000002c98-1ZeE
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 14:03:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37ccd81de57so2969688f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728309822; x=1728914622; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZtuxoWlLG6MIr63M1MjhSb8isJPhAfS/eTEmbC2Jj4=;
        b=dpFR4ScQokxOrkPnJgmeGJFFOcRbsOj6dN8GEXme2I8c2TiBwHgGKTH0MY9N9IgxdD
         ILD7KL4hNOyCBVTqbap2to1+LQ0Pv3t4SPW1kRz0ii7HdCsMnMsed9wpXYWKZEgW6QTb
         +C8LSN0iqeN5y1O2hw1KIE8/eUZVzPxnIARM/YCU6zcTKriircepyHX4azUhs+w7ert2
         pQLkvaMbkhxh5AqMOIReTNiUK31qId1vGZzXqVL9Bs7Ybsr84XQgit0bX/z3qKJ8zUTM
         pLaDOIEzl13fziI/G0rmzpTqbHJOBiEdwhauoWohXCt/cHaIONg3bkMJ2wSwHbDL5xH9
         JKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309822; x=1728914622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZtuxoWlLG6MIr63M1MjhSb8isJPhAfS/eTEmbC2Jj4=;
        b=X6vWyH7JgbCorhe5VyzPk+M/sMq1uF1XIdBG7pPcGnceHQEM5ejLBECypzd47SY35D
         sHHoysLxYGfU+mWB2ej0DE0NgkxH9mJGDe+ef1rJUsJi5Gb7wTN9A8JxQiAooGu7PIO1
         dFj1KJjlzx8ls5lU35W+BpZGN6ehbkIyLYJw6Ooqdggbj8WYnkAQuVGJnTuxhU8mCJej
         Gc2TpERtQDye+5JpKTUpVTPr2FvhoPLr+ybKtG/tgigUEyjOMjkcOCmBci+HbUBTaIgN
         XWpL+bHHWdl4onAKXE5mXWYHr5qr5CNfkhaT9bRAZt8FEbRSI9qbAWWha9DUxhf8haVO
         UdvA==
X-Forwarded-Encrypted: i=1; AJvYcCXCasbKaE2A/I2ZTy6uBg6ZsvOZP6iw+Mzerp9n44XlC/M9u5AlmE5j51FxMEPtihN9Hsbacgog0vo+Jypu@lists.infradead.org
X-Gm-Message-State: AOJu0YxA6Awl0iKl/GUt2blquABO5WQP7LIjoN3RVl3or1jfbpf39csM
	ed6Bc6J/xuBDhlAc5XsUQJB41XTrRoczSdSknUfMGcVP/+56iqqeUxDa+scq9lU=
X-Google-Smtp-Source: AGHT+IF/B1xSevIP+5+TzWYbnSoeJtkilnmlHNqtPz88imFSsCXjbZ/m6dbc7bF4oZnEAdxTygwlpA==
X-Received: by 2002:adf:f04e:0:b0:37c:cc7c:761c with SMTP id ffacd0b85a97d-37d0f66e937mr6688754f8f.3.1728309821984;
        Mon, 07 Oct 2024 07:03:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1688a486sm5857022f8f.0.2024.10.07.07.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:03:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Oct 2024 16:03:37 +0200
Subject: [PATCH v3 1/3] dt-bindings: mmc: controller: move properties
 common with slot out to mmc-controller-common
MIME-Version: 1.0
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=24383;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JXZ2QhO+d2v8gfTqiKI3ynod/BjsAjCgD6utx+4qdzE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+o6z99UeVWhjdJGlVpbNpN+CDgvqGkIkP2qxXsK
 +8FPUZCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPqOgAKCRB33NvayMhJ0VFCD/
 wKiXiEvoVPDlQytUikVq0DV2fbusIpm2dCzBbPm5JfwYvkRNpTRbeqmFYtrU15sNwznT6KqGppyN+X
 SOnt0dzcaUVj5/jBmphOMoA81cpLQc/TpfWwuVoFAs71pMTPWlEp7SvwBEqMI3AXUEADyPbn+jFx8P
 d2Xk8s/F/VMCCij8Q1KK1RdoXuLJeMfy9zQJFW63oG60ZDsfduLe8TudsdOWG8sKaP504K3lrQFOwC
 yZufCX8n71jUzSBWH0QPIftSh64EEbQrdnglGMvGVVsPfHt+nqrOpxG65PFeYX//J685Ep1TF1FjSC
 y5dzjLF/CE7UBuqaKyymwm/Bzm1e+L7eE75j0ErYHJFWZq9jRjdBdEzW0hIgcOfkFxFnAFZB6JlEIh
 bXvn3G0ttJyaEDlqSdQyYnI4fLp2IDpTMMvv1aHZQAGZHu7/yyaTpL/yeLONwV/Y/jP8g8kunA1+8m
 SnrZNAVYjV+jR3qqQvKPkva5WCKBZGRhzVDtT7JhN/n3pAoSs00zSOjGpojDjnRj1z6+Qpm2K3zUNR
 hzSreyJHBGzulcjdVdLMNINWw5aRhzmPkgC5wdU/DFbZoWMh4Tr0v60Gij/Hl4U8DG+wNnef8fb0TZ
 8S/vT7VRkvO0bzaPB4XytOVruQ89oUvjiL1EbU7g+zXfgD3gBeod2QuW93OQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_070344_439742_39250B2A 
X-CRM114-Status: GOOD (  25.60  )
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

Move the common MMC "slot" properties because they are shared by the
single-slot or multi-slot controllers, and will help defining a simple
mmc-slot bindings document with proper slot properties and nodename.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
 .../devicetree/bindings/mmc/mmc-controller.yaml    | 344 +-------------------
 2 files changed, 360 insertions(+), 341 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
new file mode 100644
index 000000000000..e02d3cbcc271
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -0,0 +1,357 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mmc-controller-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMC Controller & Slots Common Properties
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+description: |
+  These properties are common to multiple MMC host controllers and the
+  possible slots or ports for multi-slot controllers.
+
+properties:
+  "#address-cells":
+    const: 1
+    description: |
+      The cell is the slot ID if a function subnode is used.
+
+  "#size-cells":
+    const: 0
+
+  # Card Detection.
+  # If none of these properties are supplied, the host native card
+  # detect will be used. Only one of them should be provided.
+
+  broken-cd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      There is no card detection available; polling must be used.
+
+  cd-gpios:
+    maxItems: 1
+    description:
+      The card detection will be done using the GPIO provided.
+
+  non-removable:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Non-removable slot (like eMMC); assume always present.
+
+  # *NOTE* on CD and WP polarity. To use common for all SD/MMC host
+  # controllers line polarity properties, we have to fix the meaning
+  # of the "normal" and "inverted" line levels. We choose to follow
+  # the SDHCI standard, which specifies both those lines as "active
+  # low." Therefore, using the "cd-inverted" property means, that the
+  # CD line is active high, i.e. it is high, when a card is
+  # inserted. Similar logic applies to the "wp-inverted" property.
+  #
+  # CD and WP lines can be implemented on the hardware in one of two
+  # ways: as GPIOs, specified in cd-gpios and wp-gpios properties, or
+  # as dedicated pins. Polarity of dedicated pins can be specified,
+  # using *-inverted properties. GPIO polarity can also be specified
+  # using the GPIO_ACTIVE_LOW flag. This creates an ambiguity in the
+  # latter case. We choose to use the XOR logic for GPIO CD and WP
+  # lines.  This means, the two properties are "superimposed," for
+  # example leaving the GPIO_ACTIVE_LOW flag clear and specifying the
+  # respective *-inverted property property results in a
+  # double-inversion and actually means the "normal" line polarity is
+  # in effect.
+  wp-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The Write Protect line polarity is inverted.
+
+  cd-inverted:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The CD line polarity is inverted.
+
+  # Other properties
+
+  bus-width:
+    description:
+      Number of data lines.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 4, 8]
+    default: 1
+
+  max-frequency:
+    description: |
+      Maximum operating frequency of the bus:
+        - for eMMC, the maximum supported frequency is 200MHz,
+        - for SD/SDIO cards the SDR104 mode has a max supported
+          frequency of 208MHz,
+        - some mmc host controllers do support a max frequency upto
+          384MHz.
+      So, lets keep the maximum supported value here.
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 400000
+    maximum: 384000000
+
+  disable-wp:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When set, no physical write-protect line is present. This
+      property should only be specified when the controller has a
+      dedicated write-protect detection logic. If a GPIO is always used
+      for the write-protect detection logic, it is sufficient to not
+      specify the wp-gpios property in the absence of a write-protect
+      line. Not used in combination with eMMC or SDIO.
+
+  wp-gpios:
+    maxItems: 1
+    description:
+      GPIO to use for the write-protect detection.
+
+  cd-debounce-delay-ms:
+    description:
+      Set delay time before detecting card after card insert
+      interrupt.
+
+  no-1-8-v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When specified, denotes that 1.8V card voltage is not supported
+      on this system, even if the controller claims it.
+
+  cap-sd-highspeed:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD high-speed timing is supported.
+
+  cap-mmc-highspeed:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      MMC high-speed timing is supported.
+
+  sd-uhs-sdr12:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS SDR12 speed is supported.
+
+  sd-uhs-sdr25:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS SDR25 speed is supported.
+
+  sd-uhs-sdr50:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS SDR50 speed is supported.
+
+  sd-uhs-sdr104:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS SDR104 speed is supported.
+
+  sd-uhs-ddr50:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SD UHS DDR50 speed is supported.
+
+  cap-power-off-card:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Powering off the card is safe.
+
+  cap-mmc-hw-reset:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC hardware reset is supported
+
+  cap-sdio-irq:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      enable SDIO IRQ signalling on this interface
+
+  full-pwr-cycle:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Full power cycle of the card is supported.
+
+  full-pwr-cycle-in-suspend:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Full power cycle of the card in suspend is supported.
+
+  mmc-ddr-1_2v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC high-speed DDR mode (1.2V I/O) is supported.
+
+  mmc-ddr-1_8v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC high-speed DDR mode (1.8V I/O) is supported.
+
+  mmc-ddr-3_3v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC high-speed DDR mode (3.3V I/O) is supported.
+
+  mmc-hs200-1_2v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS200 mode (1.2V I/O) is supported.
+
+  mmc-hs200-1_8v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS200 mode (1.8V I/O) is supported.
+
+  mmc-hs400-1_2v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS400 mode (1.2V I/O) is supported.
+
+  mmc-hs400-1_8v:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS400 mode (1.8V I/O) is supported.
+
+  mmc-hs400-enhanced-strobe:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      eMMC HS400 enhanced strobe mode is supported
+
+  no-mmc-hs400:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      All eMMC HS400 modes are not supported.
+
+  dsr:
+    description:
+      Value the card Driver Stage Register (DSR) should be programmed
+      with.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffff
+
+  no-sdio:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Controller is limited to send SDIO commands during
+      initialization.
+
+  no-sd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Controller is limited to send SD commands during initialization.
+
+  no-mmc:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Controller is limited to send MMC commands during
+      initialization.
+
+  fixed-emmc-driver-type:
+    description:
+      For non-removable eMMC, enforce this driver type. The value is
+      the driver type as specified in the eMMC specification (table
+      206 in spec version 5.1)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 4
+
+  post-power-on-delay-ms:
+    description:
+      It was invented for MMC pwrseq-simple which could be referred to
+      mmc-pwrseq-simple.yaml. But now it\'s reused as a tunable delay
+      waiting for I/O signalling and card power supply to be stable,
+      regardless of whether pwrseq-simple is used. Default to 10ms if
+      no available.
+    default: 10
+
+  supports-cqe:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The presence of this property indicates that the corresponding
+      MMC host controller supports HW command queue feature.
+
+  disable-cqe-dcmd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The presence of this property indicates that the MMC
+      controller\'s command queue engine (CQE) does not support direct
+      commands (DCMDs).
+
+  keep-power-in-suspend:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SDIO only. Preserves card power during a suspend/resume cycle.
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      SDIO only. Enables wake up of host system on SDIO IRQ assertion.
+
+  vmmc-supply:
+    description:
+      Supply for the card power
+
+  vqmmc-supply:
+    description:
+      Supply for the bus IO line power, such as a level shifter.
+      If the level shifter is controlled by a GPIO line, this shall
+      be modeled as a "regulator-fixed" with a GPIO line for
+      switching the level shifter on/off.
+
+  mmc-pwrseq:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      System-on-Chip designs may specify a specific MMC power
+      sequence. To successfully detect an (e)MMC/SD/SDIO card, that
+      power sequence must be maintained while initializing the card.
+
+patternProperties:
+  "^.*@[0-9]+$":
+    type: object
+    description: |
+      On embedded systems the cards connected to a host may need
+      additional properties. These can be specified in subnodes to the
+      host controller node. The subnodes are identified by the
+      standard \'reg\' property. Which information exactly can be
+      specified depends on the bindings for the SDIO function driver
+      for the subnode, as specified by the compatible string.
+
+    properties:
+      compatible:
+        description: |
+          Name of SDIO function following generic names recommended
+          practice
+
+      reg:
+        items:
+          - minimum: 0
+            maximum: 7
+            description:
+              Must contain the SDIO function number of the function this
+              subnode describes. A value of 0 denotes the memory SD
+              function, values from 1 to 7 denote the SDIO functions.
+
+    required:
+      - reg
+
+  "^clk-phase-(legacy|sd-hs|mmc-(hs|hs[24]00|ddr52)|uhs-(sdr(12|25|50|104)|ddr50))$":
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 359
+      description:
+        Set the clock (phase) delays which are to be configured in the
+        controller while switching to particular speed mode. These values
+        are in pair of degrees.
+
+dependencies:
+  cd-debounce-delay-ms: [ cd-gpios ]
+  fixed-emmc-driver-type: [ non-removable ]
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index 58ae298cd2fc..99c01ce318d3 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -18,351 +18,13 @@ description: |
   (and the corresponding mmcblkN devices) by defining an alias in the
   /aliases device tree node.
 
+$ref: mmc-controller-common.yaml#
+
 properties:
   $nodename:
     pattern: "^mmc(@.*)?$"
 
-  "#address-cells":
-    const: 1
-    description: |
-      The cell is the slot ID if a function subnode is used.
-
-  "#size-cells":
-    const: 0
-
-  # Card Detection.
-  # If none of these properties are supplied, the host native card
-  # detect will be used. Only one of them should be provided.
-
-  broken-cd:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      There is no card detection available; polling must be used.
-
-  cd-gpios:
-    maxItems: 1
-    description:
-      The card detection will be done using the GPIO provided.
-
-  non-removable:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Non-removable slot (like eMMC); assume always present.
-
-  # *NOTE* on CD and WP polarity. To use common for all SD/MMC host
-  # controllers line polarity properties, we have to fix the meaning
-  # of the "normal" and "inverted" line levels. We choose to follow
-  # the SDHCI standard, which specifies both those lines as "active
-  # low." Therefore, using the "cd-inverted" property means, that the
-  # CD line is active high, i.e. it is high, when a card is
-  # inserted. Similar logic applies to the "wp-inverted" property.
-  #
-  # CD and WP lines can be implemented on the hardware in one of two
-  # ways: as GPIOs, specified in cd-gpios and wp-gpios properties, or
-  # as dedicated pins. Polarity of dedicated pins can be specified,
-  # using *-inverted properties. GPIO polarity can also be specified
-  # using the GPIO_ACTIVE_LOW flag. This creates an ambiguity in the
-  # latter case. We choose to use the XOR logic for GPIO CD and WP
-  # lines.  This means, the two properties are "superimposed," for
-  # example leaving the GPIO_ACTIVE_LOW flag clear and specifying the
-  # respective *-inverted property property results in a
-  # double-inversion and actually means the "normal" line polarity is
-  # in effect.
-  wp-inverted:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The Write Protect line polarity is inverted.
-
-  cd-inverted:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The CD line polarity is inverted.
-
-  # Other properties
-
-  bus-width:
-    description:
-      Number of data lines.
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 4, 8]
-    default: 1
-
-  max-frequency:
-    description: |
-      Maximum operating frequency of the bus:
-        - for eMMC, the maximum supported frequency is 200MHz,
-        - for SD/SDIO cards the SDR104 mode has a max supported
-          frequency of 208MHz,
-        - some mmc host controllers do support a max frequency upto
-          384MHz.
-      So, lets keep the maximum supported value here.
-
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 400000
-    maximum: 384000000
-
-  disable-wp:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      When set, no physical write-protect line is present. This
-      property should only be specified when the controller has a
-      dedicated write-protect detection logic. If a GPIO is always used
-      for the write-protect detection logic, it is sufficient to not
-      specify the wp-gpios property in the absence of a write-protect
-      line. Not used in combination with eMMC or SDIO.
-
-  wp-gpios:
-    maxItems: 1
-    description:
-      GPIO to use for the write-protect detection.
-
-  cd-debounce-delay-ms:
-    description:
-      Set delay time before detecting card after card insert
-      interrupt.
-
-  no-1-8-v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      When specified, denotes that 1.8V card voltage is not supported
-      on this system, even if the controller claims it.
-
-  cap-sd-highspeed:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD high-speed timing is supported.
-
-  cap-mmc-highspeed:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      MMC high-speed timing is supported.
-
-  sd-uhs-sdr12:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS SDR12 speed is supported.
-
-  sd-uhs-sdr25:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS SDR25 speed is supported.
-
-  sd-uhs-sdr50:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS SDR50 speed is supported.
-
-  sd-uhs-sdr104:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS SDR104 speed is supported.
-
-  sd-uhs-ddr50:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SD UHS DDR50 speed is supported.
-
-  cap-power-off-card:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Powering off the card is safe.
-
-  cap-mmc-hw-reset:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC hardware reset is supported
-
-  cap-sdio-irq:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      enable SDIO IRQ signalling on this interface
-
-  full-pwr-cycle:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Full power cycle of the card is supported.
-
-  full-pwr-cycle-in-suspend:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Full power cycle of the card in suspend is supported.
-
-  mmc-ddr-1_2v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC high-speed DDR mode (1.2V I/O) is supported.
-
-  mmc-ddr-1_8v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC high-speed DDR mode (1.8V I/O) is supported.
-
-  mmc-ddr-3_3v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC high-speed DDR mode (3.3V I/O) is supported.
-
-  mmc-hs200-1_2v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS200 mode (1.2V I/O) is supported.
-
-  mmc-hs200-1_8v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS200 mode (1.8V I/O) is supported.
-
-  mmc-hs400-1_2v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS400 mode (1.2V I/O) is supported.
-
-  mmc-hs400-1_8v:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS400 mode (1.8V I/O) is supported.
-
-  mmc-hs400-enhanced-strobe:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      eMMC HS400 enhanced strobe mode is supported
-
-  no-mmc-hs400:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      All eMMC HS400 modes are not supported.
-
-  dsr:
-    description:
-      Value the card Driver Stage Register (DSR) should be programmed
-      with.
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 0xffff
-
-  no-sdio:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Controller is limited to send SDIO commands during
-      initialization.
-
-  no-sd:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Controller is limited to send SD commands during initialization.
-
-  no-mmc:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Controller is limited to send MMC commands during
-      initialization.
-
-  fixed-emmc-driver-type:
-    description:
-      For non-removable eMMC, enforce this driver type. The value is
-      the driver type as specified in the eMMC specification (table
-      206 in spec version 5.1)
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 4
-
-  post-power-on-delay-ms:
-    description:
-      It was invented for MMC pwrseq-simple which could be referred to
-      mmc-pwrseq-simple.yaml. But now it\'s reused as a tunable delay
-      waiting for I/O signalling and card power supply to be stable,
-      regardless of whether pwrseq-simple is used. Default to 10ms if
-      no available.
-    default: 10
-
-  supports-cqe:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The presence of this property indicates that the corresponding
-      MMC host controller supports HW command queue feature.
-
-  disable-cqe-dcmd:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      The presence of this property indicates that the MMC
-      controller\'s command queue engine (CQE) does not support direct
-      commands (DCMDs).
-
-  keep-power-in-suspend:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
-
-  wakeup-source:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      SDIO only. Enables wake up of host system on SDIO IRQ assertion.
-
-  vmmc-supply:
-    description:
-      Supply for the card power
-
-  vqmmc-supply:
-    description:
-      Supply for the bus IO line power, such as a level shifter.
-      If the level shifter is controlled by a GPIO line, this shall
-      be modeled as a "regulator-fixed" with a GPIO line for
-      switching the level shifter on/off.
-
-  mmc-pwrseq:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      System-on-Chip designs may specify a specific MMC power
-      sequence. To successfully detect an (e)MMC/SD/SDIO card, that
-      power sequence must be maintained while initializing the card.
-
-patternProperties:
-  "^.*@[0-9]+$":
-    type: object
-    description: |
-      On embedded systems the cards connected to a host may need
-      additional properties. These can be specified in subnodes to the
-      host controller node. The subnodes are identified by the
-      standard \'reg\' property. Which information exactly can be
-      specified depends on the bindings for the SDIO function driver
-      for the subnode, as specified by the compatible string.
-
-    properties:
-      compatible:
-        description: |
-          Name of SDIO function following generic names recommended
-          practice
-
-      reg:
-        items:
-          - minimum: 0
-            maximum: 7
-            description:
-              Must contain the SDIO function number of the function this
-              subnode describes. A value of 0 denotes the memory SD
-              function, values from 1 to 7 denote the SDIO functions.
-
-    required:
-      - reg
-
-  "^clk-phase-(legacy|sd-hs|mmc-(hs|hs[24]00|ddr52)|uhs-(sdr(12|25|50|104)|ddr50))$":
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
-    minItems: 2
-    maxItems: 2
-    items:
-      minimum: 0
-      maximum: 359
-      description:
-        Set the clock (phase) delays which are to be configured in the
-        controller while switching to particular speed mode. These values
-        are in pair of degrees.
-
-dependencies:
-  cd-debounce-delay-ms: [ cd-gpios ]
-  fixed-emmc-driver-type: [ non-removable ]
-
-additionalProperties: true
+unevaluatedProperties: true
 
 examples:
   - |

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
