Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE20EB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BzBM2TGZA2IELYO7tX6m01Pp8g8isu5BJwluARECRQ=; b=Qi6EGEUzLGYTnR
	oA58p5wdJc0wH3HZQimzcyJBGAAiNVOtoJbtT20JGsgT5g58yKOEUdS9tEfTG+lD8MQyMZOQIMqA6
	RjrVLonLjpqI33Y/RQfMThUonZLY2deQhqmiZ5z6JlQ/6YYI7MO6HyBcrJr42uZcTfUWr9xF/IkJv
	03ysr8laXlCw62BJA2CAgazapCDE5jJCotfmSAYvsTt8G2NmnS3MmJoqz5n3o9OwP1vcS3t3XsT00
	NjUb8WVDQdWQSsQI7g7IvPtsCWx/VOVgBkHvr27DK/P7zww8CVMrQO2qlI12p4t1mqzcVlBhT+7Mm
	GhcGeL9nV2Ya2miLG7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJue-000sQg-2B;
	Thu, 06 Jul 2023 08:00:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJua-000sOU-2F
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 08:00:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc77e769cso4031575e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688630423; x=1691222423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LzHyhZ3766ra+sxcNP/ExwsumD2y82rPN/8KknPtQQ=;
        b=ZSgCD5/Xzqc6ohe6XCBNIU6cfiQLO6qfelgjYmIgVMH6wsNy7tcTIGIiMQb342DpJ6
         VbLBQWfsvvoBKjjJUp3sckHi2+4Jf5B1XgNFM0LIBKQXRDvwatSv62qKfIanzq4jlmXx
         IEKf9O831C0xkuzXpIo+89mvBVfi9hMOH4noDfAemSUE4wskxb5IkcTN5sXX5KWu6jzB
         luBPMmTPSvUbsASCMPkA/eIUx4zXo1UJaQEppXXRUK6oSo2bjyaWlc5uA2IXmGPn5DeJ
         84mF1V74XLx2Z4cl954Q9+Xq1b/CHScc+Tm/Y71Qib8E/CWJ/+3joAxQzOR24mwRu2iW
         pM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688630423; x=1691222423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LzHyhZ3766ra+sxcNP/ExwsumD2y82rPN/8KknPtQQ=;
        b=JQ5jVbuwfOHGvqvXBcBivgXwt4Daab3WB+ikk5B98qk0Fn0iZMe4By6mGK9cJhFHno
         J2lAOxYSLXiO+uRDRijRHDiEvGd3viez+cMYYHhVw/kX0+60g6GfXnczgv2dyPLmGqg7
         P03lcMKZfiX3xxC64+HhFyRQg8oXRkXdDID5sjjPEfWwvULpfsRMmY2JvcSQnWevKmc+
         KDKNf8KzswcPnXL5WlXZU0a6+7lOw61uvvrJI16Wyk0Enes0tfuiXCu+vvXsOfY5/FAR
         pvEOS5TccLV+Rx+8uQTNMXMY9kl46EK0I+kkszb6zEOGrTacIxkFtksIZPGXv15KYG9+
         6/qw==
X-Gm-Message-State: ABy/qLaUWjL9fv2G6Ej8rQhJ7Fzx1PGZF17dIFOMzj4yseH8bS2RV8hk
	fIMzubCltYzRhh3UfJzvkeYUug==
X-Google-Smtp-Source: APBJJlGe9XBa7Qp5BI30NOFwdvROYBJIKr2+P7IwtfymzU6PMiAIhnzVSR0r4JA7sctPv67fYXpfiA==
X-Received: by 2002:a1c:ed07:0:b0:3fb:d68d:4c6f with SMTP id l7-20020a1ced07000000b003fbd68d4c6fmr735323wmh.14.1688630423141;
        Thu, 06 Jul 2023 01:00:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b003fbb1ce274fsm5587375wmn.0.2023.07.06.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:00:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jul 2023 10:00:19 +0200
Subject: [PATCH 1/3] arm64: dts: amlogic: meson-g12b-odroid-n2: fix usb hub
 hog name
MIME-Version: 1.0
Message-Id: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-1-63ed070eeab2@linaro.org>
References: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
In-Reply-To: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=940;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wn8G9m9VDqCtr/Okvn3AKh56BVrmR4ClWOMn8WHW110=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpnSUB+oLOF9akswI4NJw72dITuS/RSonHhGvRoy5
 gV/fRbmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKZ0lAAKCRB33NvayMhJ0dYnD/
 9cZOf8YLC6qO8huvFBeEB2BlULKccOvHgjcA5v8Y4ThC8O6ljFtGTOyX+3g1LuH3qmVH0L6UxePztA
 G4tc1L+I5R6NA/obmIRMEo0sL0lNguMhGgIYv6xdrtLpA4vj9tv5yl7yl7jcOnCHMFVDA0vUnkQZDM
 WlASAMt+TIbSmtl+8UWoASGYX79nAPGtwoThSGj2K7mIb5Ru53S2JMnu/154qfenPwIsIi/dXYS0Xk
 9QgACEaVR6ryPsAFAV32V36nJ0gOcfYWy7XIb/eWsbD3q7GlC1iIwav2GSeCN2O8N63VEyBUaqDqAw
 WoHPbqTFqrGCGzEMgEUelo8/Zw2IYLFKkdjUPOOt9lhfIpEL4MueecfRS+KQCnrgODguNOf4x+jUT5
 3yxuP96489pIt6l9S1+t2WDizbuNv1q8F9otDpSLzD6Jku+DANbhkQVv9ya5VGM07oL7hJpOOkavH8
 vPiUd/SaU0zp896cT7IZt8QH1VraYL3cWHnPXIlXbf6v9a1umYlQexli1k92HOMLSkC6MEMkEZ3qS0
 /T5wcbOfC5djNlNaE+lrIWt/peIdcL8sC2AVNuKEz73KzWY6v+byczo5IvWZOMdMm7Z4Fk/WlK3ztK
 uuzX5slsMVN8NPRRkAGtfTvfgvD70281Z+PnwPZ4CE6NdW7Iya0hsxXme4wg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_010024_780550_D5542F3C 
X-CRM114-Status: GOOD (  12.28  )
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

This fixes the following dtschema check error:
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: pinctrl@40: bank@40: Unevaluated properties are not allowed ('hog-0' was unexpected)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 24d0442dffb2..a0b6646f73e4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -241,7 +241,7 @@ &gpio {
 	 * This signal should be handled by a USB specific power sequence
 	 * in order to reset the Hub when USB bus is powered down.
 	 */
-	hog-0 {
+	usb-hub-hog {
 		gpio-hog;
 		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
 		output-high;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
