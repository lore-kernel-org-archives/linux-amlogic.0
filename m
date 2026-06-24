Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACABCDB481
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HPglrp8tmxBTvaRjr/EieQ5/egOplCChNkA6vTtBRI=; b=wFFydNTJtRIL/9
	lN43+0X01RpP7hGpdhWe7bS3wQbRE457UPRAo8PPJCviKjcu4sZSZWo7agYV6LuHL5GRU8tzangJz
	SZYl8Tk85sDMyB7MRMUnvOCaMqYPcuP4LGe1J+4KtUPtz06pkKy60THQY/KDK9EUO6Xxr+HTzci2y
	a67cWiZ+eu+7L7iMznsv+e29MxtYCSy8EAB7RzKwWUJ7cV9elWrlNnPsPMv+n2nbT3Tu6J93a1yEu
	5RRnCGAYYNcn4Cz/Y2X5Bja+NlbhCs6kqWlBJPk9swAObbYUMC2hLPTaWxSb4SLpOJZ1vvF3Bm5Cn
	zLn55QvCxoDJ3eRtIguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO7T-00000007sCU-0uCU;
	Wed, 24 Jun 2026 13:58:23 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO7P-00000007sA8-3csy
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 13:58:21 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-725cf9a923aso771373137.0
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309498; x=1782914298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPJvPBqHRLtbAIAX38K/sq/Rtd1BSFIp6Jl6pM1DOLQ=;
        b=GMSNmIIIKGSnrbTEsYvJ8zHjypQZ7WyCcPvo0306WRV357aKi3QN0dr6a8Ou6I1Gx4
         bE5poLRJLDfIAIcbXfGFT+QAYib5UO3c170RFpYBlC+TWS5PUZyFK+xdTQ8GCckgKtAS
         Bgviny+zA26FdVfaHeWGsS/GVvm8i5sWKgBdO5fkntBSsPFIh/ZCVYr5CsI28akj6nb2
         2+8CO2IEQw35E2VAF/L3Uco5wIkqTeeFQ1krdRIw63VxvTF07CFoUsZxbaQHkZWb72VY
         Jc6y0Xo4M2x2NhDRF8j3CNRcsUL0Zdbji5z60lnm4bS57mICbSogGhbuBK21q+x3vvc0
         R93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309498; x=1782914298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPJvPBqHRLtbAIAX38K/sq/Rtd1BSFIp6Jl6pM1DOLQ=;
        b=ke27tLw2uvib+qy75C6CwFB7cpcGRwZilNbtd6PrduD0zswVINYKQa9xfvDIvNQKT/
         ZhkY+YA+rjIks2o5wjEKuoG5+yhZW4JALT7NR3AyT0WYWcpCjdkYoiQ6eaMqdCbE9Nxm
         EE/ndG5b/WaKGQ/LWpLFS+/+mO3Tv3IqQqV0Bau9Maouj620gCYBaUG7f7b9zQQUKdwe
         4K1H+v8nIqSgIbkhhHTyiJpoZGWeqCtk+vCgambq8dMtrM/SRStY8Le8H+taqVd2N8qU
         8HHfxrZGjzNqfeXKx2xEOjrW621YQnRi4L2AoFTnt4PevVwbQgL+1SWKKCTPNiHIY3ZW
         IivQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2SKC7gGSy+0ZPf1jbRq2cEyd95Mr2mg2rxo8t9MmLYSBd7Hc2+F7tpdiTCN+ZaWJolyb2ZTQgZHIEHOmM@lists.infradead.org
X-Gm-Message-State: AOJu0YxmbomhhjKYQGI5Yzl6oC7+eFE78ZB2HGFL2nmlVuqcXcFG1cdW
	8MJijrUs6i1H/IDKIIsk1ucx0Kd8RTK94HZTiN/xlSzMJQFKfT0EeZXW
X-Gm-Gg: AfdE7ckblm14UuqbtrwcLQYL2sary49TU1M249vAuGVVDH0U4CybtXDQJIdai3g6UEq
	2qU4M9ATD4Q67KE4y0gjiIx8aSEFcXwzQUFtXygqBDdNPYjb6ZW6CEgxQnRYlDknqVJnIveOngX
	rlYs2PNfMwn+DIY5oPGUKrCsGJxpJUy5GQt2Aug+7TmxKIA2gXh+txAoahcTO7qyRPav0bobFLU
	tRQaPBwgVSd22PUBQjMbwn2N98p+eOxZ99OsQMUHn0MlJjxO0sYWqCCbzRYWN1h2u+TBdLJxngx
	a4gcbyrVWN9hI9t3Y12PcH+y/fLwuKLcT2aMrtbb49Isi0VSA/EQUlklJ6FZxF1CaBtdh0OpUbm
	00m734qtEzrv9CoqMAJ+Ogh29wN8G5mFCLPZkPaakeNbgLlDCU+ds04JH1NFUPRYhzvZdo8SFkH
	ejU+uEF9S2ZZaKv7JkAH1eydGchp5TWpnbSIA=
X-Received: by 2002:a05:6102:4408:b0:631:28c1:154e with SMTP id ada2fe7eead31-73114f0f269mr1737232137.16.1782309498658;
        Wed, 24 Jun 2026 06:58:18 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:58:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
Date: Wed, 24 Jun 2026 21:56:44 +0800
Message-ID: <20260624135650.727077-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065819_910769_AEBE2EBC 
X-CRM114-Status: UNSURE (   7.48  )
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

The PCIe PHY node references mipi_pcie_analog_dphy via its phys property.
Enable this analog PHY node to make PCIe functionally viable.

Fixes: 9715b01da6cf ("arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 7ba249cc3d56..4f13e2b041e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -431,6 +431,10 @@ gpio_speaker: gpio-controller@1f {
 	};
 };
 
+&mipi_pcie_analog_dphy {
+	status = "okay";
+};
+
 &pdm {
 	pinctrl-0 = <&pdm_dclk_a14_pins>, <&pdm_din0_pins>,
 		    <&pdm_din1_pins>, <&pdm_din2_pins>, <&pdm_din3_pins>;
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
