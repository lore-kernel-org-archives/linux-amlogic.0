Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E32FC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMIJm7JHKTSfXHV11TqZjnipC6oWoG4LqtHdhwCtlQg=; b=SaLi+rabb4eNba
	EaKvK8foytR48UrP5TMgkwSot9TVU3ubr7rUnTvOJC4x8qX4mvSkrQliK9HgsZju4TNB14b4F7lhc
	JKy8Xez7tTdwwGod50N47cfVrivm0NIFm4kUf1dyHhrNuKKRbUPPJdVHnG2/qBNWBboyHQZnQ8npN
	W8upDuCKtMSzoxODi+CxlI5aUWfLDyWQFBjsliGM6Vm4A8i7EsT4RpvqnmadKoO1h1FaSmTSvEhnG
	X4fALNDeB9KUfsnUVzcKUJxpk1tYQ56gryYWWopIOPXIu7LoQ4pZ7gwmhLEGoeObS4lR7cML3hHOe
	maSjkCitol1rY+hygQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EC0-00CbVN-PJ; Thu, 08 Dec 2022 10:31:52 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EBh-00Cb23-Ei
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 10:31:36 +0000
Received: by mail-lj1-x22d.google.com with SMTP id x6so1070617lji.10
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AxgtdSHYHP1YbbzJqlPfT18aEYuRk09InbeSd0JHNg=;
        b=vRC/imatoHVwHYY/xYn/XxRuhvdx+OB/SREDy14/PgQFlvrcB0EQ4id+Ayn//84QYK
         arsf1sF22Nuv9HYLsJZwEdrxi758C5vfm5ZOaHEJtq0l7mSlFY73m118j5bw0eEzZpEK
         7Xp9QuvafRfPFLxYttCVahNoYSTwtOcU9Os+EwRSUZK6QgYONFNQPqmoIef+Gc5FzOsc
         r2hrYVDys42CmHewFWsn4iF/mp6c9uznU3JcXO2DwcMrSWsM+fELE3+Zlg43ltpAOqxZ
         8O12HQw3aOU4Pykni54J7as2y1Pkb1ySFTZzA6k4V5WwMbs8gf2/A9CzcxP9jWEnF5gq
         rHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AxgtdSHYHP1YbbzJqlPfT18aEYuRk09InbeSd0JHNg=;
        b=aiav3S/OFV2mPVBAxnesQb9s7Zjdke0P8udVWwk5CYjOmC/EpcuQnHHo1+UrxQd+m8
         +E1iL3fiGjF9wfTWEsmAVaMw00L6aeh3kvZ6wJR28V+KYgAzOd7cCLuah06emDXsVEWm
         P+hla1jY2cAMIjEapJvtFa9fIPpeNuinRBZfJbJnRAlqcWe8TKJJsIa3wnfLbOzxzyj8
         O+hg7lMDzFqqTOniTrlmfjTkoObNvGbq7KPqZ8Q6KfxNkdKXmmfO0GJL+s5+uo/rU1cJ
         nXxDdLyjc6Qz8g6kXPw1ZXBA865FTFFyGHJi2TA5/Zkl1KaqYmHlPauIdwEMpYFphFMK
         Cphw==
X-Gm-Message-State: ANoB5pnRGMggb8NZrZ4Yg7leXKOgsIXc9bkSyC0S6w0Def4sgNNsxh90
	KUYrHkDUFycVcIzAWZ2SeJz2Tw==
X-Google-Smtp-Source: AA0mqf4r+c/Cu2q8bu68UEJNNYlGepHPtzLV4IoukgbIUFguwupiwwM2w6EmGx8lDIrN2xvRWlHB6w==
X-Received: by 2002:a2e:2c15:0:b0:27a:773:7054 with SMTP id s21-20020a2e2c15000000b0027a07737054mr3931835ljs.169.1670495487827;
        Thu, 08 Dec 2022 02:31:27 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:27 -0800 (PST)
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
Subject: [PATCH v4 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
Date: Thu,  8 Dec 2022 11:31:07 +0100
Message-Id: <20221208103115.25512-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_023133_532381_33A0B1AA 
X-CRM114-Status: UNSURE (   9.45  )
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
