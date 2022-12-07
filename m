Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB57C63706
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMIJm7JHKTSfXHV11TqZjnipC6oWoG4LqtHdhwCtlQg=; b=mvv/XjQO81Myh1
	gxmEcY2vLHoCrPKzWL4BdbOz+hEt020LNF9R0AhpC98RiHWyD4L2AbJx30UXgV0i9kJAdOVpOpIJK
	ggKqLCjZElOxstlBILC6Zb+mfLhuiyRrl7VKMKIeNrFRPrRGiStbrhx3eIy6Kdm7iDCZjuTrgwqgK
	PhiuSbydu2aFn0mJnQFa0GACZO9DFby6vE7nll5R8Nhp3b8V6XjvlXGMkoBSZaUF9l+F8Ej8Kx7vq
	yM6ZiPIjNKYw4SCrKzjU8lIy+v16Z7c2eUXlFWlsL48snx7Bu4cI7x7MBp/dlP8YlPIb9oxmX/hu6
	bco6zIjsUK0KgicUbe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2raX-00HBRi-F9; Wed, 07 Dec 2022 10:23:41 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rZu-00HAbk-UR
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:08 +0000
Received: by mail-lj1-x22f.google.com with SMTP id q7so20344022ljp.9
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AxgtdSHYHP1YbbzJqlPfT18aEYuRk09InbeSd0JHNg=;
        b=tOruhaPzNOR3bQD/ouWBj+2tp/tUN/H/5pGNgjSe2ABiV3vA61PRSLsVlqeAvI3Oro
         vHe3xvQC6FSO988F88LJTaSEr7beyBCC0Xr5mjSQNDZchgwGX/zzIK/HzVUFQm9VSFme
         1SwIrYDkMGRN9sZr262zvK3Rqvw0K0UZRe3qgHO2FEKAoLEeQbmgdeRgDgkeB2V1Z9KU
         ymxi4wc9pFKvlNmuXwlViGvq4nf0puoGFSzB+NSl2FGkbWnZ1skK7Dng2cwxys79bQBL
         B2o3FQDAN5bNXMdZu277dHREbYgTFCPcottzQGS2KMyJNymjfRP+abAi8h8GpG1+lETO
         jymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AxgtdSHYHP1YbbzJqlPfT18aEYuRk09InbeSd0JHNg=;
        b=Q9hroJ1gFDkOuC7zgz1R9Jo20mEzNO06LLdSrgVJ5T+Bm/84og8eifRrCW0xvQI5Em
         s1NKLWqgOPt+oNnNryXMwsvLP90uymdiJwuCMLJJLdfK9JNtbLChrJ8K1ZPMLhkuaoMM
         GaitV6dSYdVZkRTsy0F6LfdPD24g9rzjb3CkT+e85EmtftzxhzLXl7goGBeY29O5lvDf
         TVixSbDGW7Yv8hdYVTtu2HQeT0msqhSNgwpVtyY8ozQhIJivr5F73avwOqnMX0NSOfl1
         ie0nro6aiTDiFHO+D79CwDT4yP7Fg4k0w+88P1HGHEjAcLAIdYhkw8In26SU0N8SZSeH
         USdg==
X-Gm-Message-State: ANoB5pkH9CEbvHNxQe4ScyZ2suLn7sUAUNkpEiYhPqrY03JPnuA88+h7
	uF4fXsA02EWztCrmlDFCgMflMQ==
X-Google-Smtp-Source: AA0mqf77/+pUWb1Bn4v6zLGZhuX5q4wF2Fzv0XKIu9nI2Iw4J7TFxfO02J2gesAVCe0NSJikkfILHA==
X-Received: by 2002:a2e:87d5:0:b0:27a:1ce7:bbcb with SMTP id v21-20020a2e87d5000000b0027a1ce7bbcbmr369003ljj.420.1670408578398;
        Wed, 07 Dec 2022 02:22:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:22:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
Date: Wed,  7 Dec 2022 11:22:45 +0100
Message-Id: <20221207102253.26663-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_022303_003589_7686B8E2 
X-CRM114-Status: UNSURE (   9.90  )
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

Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
unneeded quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
 MAINTAINERS                                                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index 8d844f4312d1..f65c9681a9f7 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/media/cec/amlogic,meson-gx-ao-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson AO-CEC Controller
 
diff --git a/MAINTAINERS b/MAINTAINERS
index e3f3c3e53f77..07cb85cac4c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13553,7 +13553,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+F:	Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
