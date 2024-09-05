Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD35CD4F59
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2024 07:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5rGgmlT4fmXTkxIYzZ4VQVo71Z+VoFq65rrUA281MFM=; b=Dms0s+axIPXr0K
	zZlrifpsHZ9UYYfys54M6fmc498ZuGuXGZ7Kizk8z1XstrK677AU/PEVGj/xCxXGnBeZcb0TUiRj4
	qZOdlURsUn6sG/BjN9CT+QPOz1WpRtCkFJ6xVRXSkHGvSYVS6fsbgfxUuLyfij4jv2dzJJkb6KR/P
	0K9ONAW7YiSa/N1fGwEK+oCb6uct/ROKgHAluZZJPOHoT1VW0soLtz6/rvd277snrvo7rN2186nGe
	ex0GVLsJmVO/Lxm7b0GcuojxyLSTrT8dPOVhbzD69lfYE2nEN/nSLPlmNcuudaR30n/7WWi+N9O8n
	L74roJmuFHBEejSqUuWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6WT-00000007HxL-0xfe;
	Thu, 05 Sep 2024 07:03:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6VU-00000007HlD-08ST
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Sep 2024 07:02:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so285854f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 00:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725519734; x=1726124534; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuGQxzeNLR7CXVElCDNlPl/GjShI5gnrrfDitQYmS9k=;
        b=grdZDLKtoF5bVruuqx75uO85OckGQQZoS7KLcWcncghVt4ETP1HBQiHqqMg2ogH7hO
         HR5ny27g+jXdar45xrcWBNO6LNKv7ZhOXwAelhFNYv07sMiaaHbezmCDbGZao8b3THcu
         +d3mDuilvQBIa+xQO71WwidKScY3Vu4nB29pbgodTarVLKPeDYAmfjywYrICzSoAV1+J
         iuKafrppu0qq1RazG4vmdvn2vQ0utKGS92Bysc8qCzol7GTR4m9ez0gjZmM4VylOfpGb
         cdjyyJD3Oak4Pikusp5vKJAVFB6raXvrsa6aJE+dAV2pDDucg2eFt63XW4RhU7kgkEvY
         cpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725519734; x=1726124534;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuGQxzeNLR7CXVElCDNlPl/GjShI5gnrrfDitQYmS9k=;
        b=De5BUrgH3SMKrCYeIAhrSGDwEK5CLv8TL9sM35pzuenkMao8KUeUERucCJAT0IqKMO
         rAnVf2pA/2MIMFqPiFge7qmPB6OmOUTlBzznwrHrwL4gaqYYrjrojGoRKT14l20taXva
         iMUiUmg741lsz81BBfyraUD3nQLDENgbQXu7/bNw+l74bMOsiSPMIUArikFQv7zTCYoE
         hoqD9Y0VlgVES1OVOTYkv30wl+2deHlfiwOIkNUtSsmUPHja73+AF78orNtB8WQ78vgH
         abejjfx1Fc3VGtt+UZg5RFDsq63RoAcYVxLGUfH5y2U5u9/TM0/q0to+VIqCyfbg0pXG
         Jogg==
X-Forwarded-Encrypted: i=1; AJvYcCVGjcGQLK2TQ8P2aROeLkHm3IyVvZGIUPKfr0P4ZuZPcp4wn6tyHM6jZx8JkKsR1tXtF0n4QAUXxwuX3mLg@lists.infradead.org
X-Gm-Message-State: AOJu0YyDkJAG84fVOZFAkDyReUnY/YPntrn1Tca7hM4U9mWrDFdGp4Bv
	xp11pHrZx97+Kk8qN0yFbbDtyY4t42tvnoT31w/j8bMXFzr6fItDhet6J7cJQE0=
X-Google-Smtp-Source: AGHT+IF/zqAZKn/3kHKjMNy5ew72exLnFeqVMed6p0p+agFC9EzZMcJ+j2cDCQ85W3wW9QHpZBMjLg==
X-Received: by 2002:a5d:5351:0:b0:374:ba2b:4d1c with SMTP id ffacd0b85a97d-374ba2b4ea9mr13950066f8f.31.1725519733737;
        Thu, 05 Sep 2024 00:02:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396516sm263936935e9.4.2024.09.05.00.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:02:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Sep 2024 09:02:10 +0200
Subject: [PATCH v2] arm64: dts: amlogic: gxlx-s905l-p271: drop saradc gxlx
 compatible
MIME-Version: 1.0
Message-Id: <20240905-topic-amlogic-upstream-gxlx-drop-iio-compat-v2-1-7a690eb95bc2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHFX2WYC/52NQQ6DIBBFr9Kw7jSA2mhXvUfjggDiJOqQgRob4
 91LPUJXP+8v3ttF8ow+icdlF+xXTEhLAX29CDuaJXhAV1hoqWvZyRoyRbRg5olC2XdMmb2ZIWz
 TBo4pAiKBpTmaDLq1jVTSD3VViWKM7AfcztqrLzxiysSfM76q3/tfZ1WgoO2Mu1fGuE41zwkXw
 3QjDqI/juMLegIsOecAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cuhq/YZ1/hNdVdBIc06m/ERIsG8Bs5oT0bmbvOyYDZ0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm2Vd0gxIfQ9jEaX4HZDtiq2U11EgkGIuVEoRDa2iS
 tPU4KjWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZtlXdAAKCRB33NvayMhJ0RzJD/
 4s5u9cbX4fYmrOsHrwV9udPQYLt2sO7rcgF2bvwzNcBO/7mFVCEecyAJ6CzLMARFCEhXcXtzG1hs+W
 2d57PKyqyAwpXjg5wx0yZL66QJby2HrU9gjgOsKUwrfEadWl5nfN7qH+gbEmca/AJZ75auh2XxFClD
 PsIGqW7iRSZJ/Ty6NDlDttao7X3blIlOV8oiwuP17pl+Qm3S6E4RD3RAJktm6dy9AU75CxUA9IiiPU
 r596npmo+2Qkw8EOw48k1EUAJbCcNSbHACiVbjYm1kxAmXglFURJOLL2ztCpYcdl8RwSX6ONibq/Vo
 K0Tx8Kn2MtlFN9UlMfor2Fgqzfwa3YQv1X89tF1Kc+TSMyOKBleWmhkoIwIfAL3vJRceb7MtNjNOpG
 e8czGe6A18eNLyYhlp4q7ZHWNuU6VxANvM25FI2F6zppquWU9U65gB6xniJfB3QTQ/EwRM12mwO2J5
 4pMZ6yiugMR+UcbaCKvV3ccuDGfD+eN9qXP4IFbd0rqq4gPqpS66K/pfCCwLrs4VdAxYeDR8nm4j5M
 LGb8cIDxAxKAUKliuSHtKp/nl9M17Et6tr7u05bxZJIZtJ1lunOKK8S/52TjVrVVqOPKAIEwejtDuC
 4Wbkm0iMYFCjidGvFmfiH4nakWetDmtNSwTQXvrxzH1YV/sGu0wn1X47x65A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_000216_111533_837A3DA8 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

Drop the undocumented amlogic,meson-gxlx-saradc compatible but dropping the compatible
override, and fix the following DTBs check:
/soc/bus@c1100000/adc@8680: failed to match any schema with compatible: ['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc']

Fixes: f6386b5afa81 ("arm64: dts: meson: add GXLX/S905L/p271 support")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Drop the compatible override instead of dropping only the gxlx compatible, thx martin!
- Link to v1: https://lore.kernel.org/r/20240904-topic-amlogic-upstream-gxlx-drop-iio-compat-v1-1-89ad63aad915@linaro.org
---
 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
index 1221f4545130..942df754a0ed 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
@@ -38,10 +38,6 @@ mali: gpu@c0000 {
 	};
 };
 
-&saradc {
-	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
-};
-
 &usb {
 	dr_mode = "host";
 };

---
base-commit: 6804f0edbe7747774e6ae60f20cec4ee3ad7c187
change-id: 20240904-topic-amlogic-upstream-gxlx-drop-iio-compat-28c5010ef433

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
