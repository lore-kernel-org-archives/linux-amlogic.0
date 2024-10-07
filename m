Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9136DCFB43F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpIGAtM8O+M9Vyx2KxfmKQ70DNZiZzEleadoFz9cBdU=; b=G7Qov7pRcuYmz1
	0pwAqweU7aq1D+JstqrMHBqlLAl+P9S78eAl2l89TtVRpVRRNW1tbtVXmrCBOa/uTkFGrVQVDf1jW
	Qwc8a5qKRWfoGir7mlrPanHZBnWLVuw/PsI3GUbUSZ8qGb3mrk9a8x/vuSKSSnt2OnVAurkyIWISU
	UuwbHiKkYVgONy1YuyRROAuFin2v8YYOlaMHGAhyeEj9SBYJzZ3T3SAO7RM0Pl3skBRnf6m0b3ynP
	82qBaYAE37c3d7ki/IBTOcejwXZ4tLiTFE8I7kzlwcbAlBXsXx7AoG+RqWvE+35vrFUiU2ieV3cgc
	3gqAR8s89DmX6cDs6wIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoMG-00000002cY8-39SD;
	Mon, 07 Oct 2024 14:05:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoKu-00000002c9c-2ewd
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 14:03:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37cd8a5aac9so2391254f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728309823; x=1728914623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVr2IsS8iU7XXkbiI5A6nAOUFZD6qR/TZqOX7q9TN0o=;
        b=RwjsXlMxQVklTOEuNxb9M4PuX4abraHnuTNZMfuzxp8NDSIEouwky2K0Vyvg6A+sIh
         mBBfVVTQukD9pfT5SDqJOZ9ZXDzmmbTC19RL6Xm8/hiFHsGdxjeBvoObFblTjSXFHWmU
         w4PDSp/XffKbuLhlMT22jecpql6JtQDw/db7+x0XMSSgrUJPuoKdtCIBjkuuAUS0olj4
         nbljs4Wtdv59H7hgenJ+bzHimLjFrnk8zMZ2ImzOtXernH8XuKf80WMVtAwgaS7sLtho
         M3Vl+WiI87LPUX292x4hS+E2jzQpOod/ON3w9mETWqbvCPisPLLOK/OtzKgU5Sov2sz5
         Ic+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309823; x=1728914623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVr2IsS8iU7XXkbiI5A6nAOUFZD6qR/TZqOX7q9TN0o=;
        b=R1QXovuDIeNpQn6Z2TKSbMlHAT8DSTuptHF0p3yjALInZfM4gpDq6kNYxhfKhhzggL
         wEWImuPauX4sUkbBy+saTdMVUzFNAaSCxbiULJDZwjHTGHVEbbQ+Y6dDL1AtCR8qoIxN
         I4aQZh1zpC7+5NBoDqw/HlJf8OqBDByRW8hmueyxll12Ath3ufF25R+vOh1ntOCpXqL6
         SnQ1hLSPAPfz2YCaqBd0u4Vo0dAX9AmuI4xRoxBPe6xKv4h9EBZiI/6zxszqa8Ux3gMu
         zdEsdzwxAUt8/fvxJWQVIw5oJFgPPG/g9LsUIoduuemNaMpqtRSsAgZc8uxdRjM/9Iq5
         awHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXJpURNFBhNSKWOBPW7IL+dW+w/rYAYYJF+shsN9r+2rsjCyQr5wR2XR30gKMAgcny4jT9Qx/UiTulab9b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0kM2cCWMdF9jQ1FsY8zyN8wQF3iI/4vXLWhaa3L9PIi3DchEE
	zlUWark1ZAo7x0T5vfBGNYhfGqkm7XBjTG+ELMHRJ0jLiUrkhdLWLjY+wgs+Fls=
X-Google-Smtp-Source: AGHT+IGlBNXL6jiOlms/arATbqvK6hhh2vVVMJy1TrndVcuPBAQGVFEaobZODYSQL1Q19P8IilBrzQ==
X-Received: by 2002:adf:e502:0:b0:37c:d2d2:7f67 with SMTP id ffacd0b85a97d-37d0e74b62cmr5560682f8f.30.1728309822881;
        Mon, 07 Oct 2024 07:03:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1688a486sm5857022f8f.0.2024.10.07.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:03:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Oct 2024 16:03:38 +0200
Subject: [PATCH v3 2/3] dt-bindings: mmc: document mmc-slot
MIME-Version: 1.0
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-2-ad4eb22c2a8d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SmXwbLj1U8rjBh2iS+iEiicfCOuWdXkKgQjKYKtfHqM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+o7cZJhIrF6hF8cjd399Jc/9d5nYl5wIUhGC5sT
 0WLyFyWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPqOwAKCRB33NvayMhJ0Tc8D/
 45ev6BkuUccE2pSpmdlc0jNfrqmQszhJwQW2uiW7nwQORHrKMvj7awhcYSKNmaGfHH/KiXVbB4z1Uc
 fc8UwsNPWT0OKhb0f97u0paen4NF8WYBpotA9k7fbj6imzErUCbv+mlgKyPpHjBDOJc/RLhDNTklBE
 ASp0MaFM15Z37P21YmDl1MmsMxcKwQ7qsfu/0ImeHgS6oKtb3HLb1KXVXeP5NPdzAeu/BodBxMC+BG
 MXIpNCYXbOJ9Gs6A/BUOcarerc9lKXTbeJ/TB/TtgD/7J0/DWPNoj5WYqDLR643fkSW0unqnWg/AEF
 rWpgGsVsGyW7G6L82j4kOuQ4leeOZC/Yzn8oz3/6G3cRTQvkLw8dEt/YMR7XGdsO/2oLdi8yIlbSrK
 uATBmu9aC+UJuR32inVQTU3kt34qXNSmFs4i1yaZSfZJ1ifxNEl1ReJz+xo2XaiA/m7hMExLPF0SPz
 gDkPNE5fta0G+7exL8XuKSVFdusT7zWHUZQWKkyjWVWLHFWxugKbNs6gevKcLKMf7dKnNiUDmWiWuX
 xSKO3C7SYT3r8Yzk3EmzWD3ajdb90rArZGftMMFTp+aJs8WeGzZXWZjNK7gqWmJAunh/9l87mEdJWZ
 eRr/RmnsRy58Lut4z2c8XY4fijiRNQtuFXmXupLBedVx+X2VTvgt4zM6wwAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_070344_716268_308997AD 
X-CRM114-Status: GOOD (  11.15  )
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

Document the mmc-slot, which is a subnode of a multi-slot
MMC controller, each slot is represented as a full MMC controller,
the top node handling all the shared resources and slot mux.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/mmc/mmc-slot.yaml          | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
new file mode 100644
index 000000000000..1f0667828063
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mmc-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMC slot properties
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+description:
+  These properties defines slot properties for MMC controlers that
+  have multiple slots or ports provided by the same controller and
+  sharing the same resources.
+
+$ref: mmc-controller-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^slot(@.*)?$"
+
+  compatible:
+    const: mmc-slot
+
+  reg:
+    description:
+      the slot (or "port") ID
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mmc {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      slot@0 {
+        compatible = "mmc-slot";
+        reg = <0>;
+        bus-width = <4>;
+      };
+    };
+
+...

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
