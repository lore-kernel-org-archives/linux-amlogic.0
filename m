Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24EAC3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi00jbI/Czm242SYwYbvulgNFzzxBzPaeut56/NybGE=; b=mfSVFFrnrh9zF3
	4x9qizd7BdmwO4Hi62Q/hvahQIxh3fMrMFqFicX9VV4FpBEnLdK4Y0MH9GLfTW3sHGh3yFg1+X79H
	kI1xtIzuxGl7CS7nclJPx2SPsTTXt2IAWOSJqXTRd3db1T+KzMZtnHFdCa9CXdip+rfEZPgkgvLwL
	xr1+Mr7Q/ksBX7oYAxrhW1GuZyHQIBZgFsM7TEqq018xhpVCl2jUpYYDKPDiuC8BC+lIF5xC8qChx
	arsRjXua3noSN6Gi1r6aSm+RJuHfzOJNoaCJu9Du5JcU7dLcrjcGCnIYfg8FqFJQ5btQ2iGWMG9jh
	C8s5/Un/LZy7dd1ooMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6qB-00000003OLA-3DQx;
	Mon, 16 Sep 2024 08:12:11 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6ms-00000003NB6-0M36
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:48 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5356ab89665so4524039e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474124; x=1727078924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rsbSiyM71mODHTPu9JLHGloK45uN6FAOdQl+nPVppY=;
        b=kMnckrg2bMTwRFILB6I+p6vf0TgzOJ1ePmglfXvpG8hsceAOmPPdhv0X50oC+ijz8K
         97PrDU+dxazy5155txXvabhrHovARXMKD7Mq4ID7P8jm22RInWlgt50keof5QCiVJ1cf
         LQ9OtzmNtbZ1YJ1lJTBtFHVtHKHx+cGNQMkbE0mJbphXxN1dVtJGY/XhU44nedaQ22Oa
         TvMuNnBEOOHlhnc0Ypo6OYoZQKQhzhZYnqy33BCqGOAS5LEf5YwowkU4tvyQ08agw0MU
         e/ZEEtJ62wMD4pg3p4cMt+xEHKgmvNtHb/9Gxpy9vAV8daCPWKojrirKuVjXpqsBQM8Y
         LZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474124; x=1727078924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rsbSiyM71mODHTPu9JLHGloK45uN6FAOdQl+nPVppY=;
        b=fj+QQpgFnI+NR+vDwVkFDpy9x0DxCeQ3g9aeqG2EjqUdVfYCjYbJzSXZPNM16pW5bC
         lTT88Ey2MBjnOsV7T9agaWyQuRiQFRMGqUPYeXyem5oqnHdjyKorjvq5MjU2OJPe+lvH
         EgYTTt39pqjeEMadkiVlaCjwQEpR7A+mPP3L1WNpCOES+TovfOsfPtJOYelqwBuV3ij7
         49oIT2XB9MTnlcmzx3MZqh3lj4xRzVaR/b0A9+5sbJZ7Df6s1DrPDbNFxvCa/SjsSXJP
         Agk5/E8ibiWc2ZHC7MMv0NIMEuyXc+XrJBsYauesfY9arm+kVVykWX5UkMzxUQyaTYOJ
         rqhA==
X-Forwarded-Encrypted: i=1; AJvYcCW79i/grQc59sjL9m+JH26ILh8vugGV1hRUewAbzzsi/rwg6BWLYl+MvKo5xlgnB0L97WLWGqTxNNuC10GF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywig0Bd4KffNlkFfgE/8IfL42Bj//LBxvzO2Fnd8nmR/s4cosS1
	HFqZusRXcJFdvYuR01/LLJ73elVTy228pSxBYB4ulm6YlJrDnAKKOTaFjMy9rp0=
X-Google-Smtp-Source: AGHT+IGeYYiQmn4lHzDy++xVLZnjV4G+rnbzuhYdFOi1c7P53YevUahnkDAMBRV3H21walWQwmZ2Tw==
X-Received: by 2002:a05:6512:1153:b0:533:466d:698c with SMTP id 2adb3069b0e04-53678feb525mr7075144e87.39.1726474123083;
        Mon, 16 Sep 2024 01:08:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:30 +0200
Subject: [PATCH v2 01/11] ARM: dts: amlogic: meson6: fix clk81 node name
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-1-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=885;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pMewlYYDF9agGKPA3HCGL/qAhfwWWF/OUrcnBP2XiME=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eEEKe9s41rFo1BlQuTVP892PJvMrTQAUrZfwSF
 twdCR0qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhAAKCRB33NvayMhJ0YhED/
 4vq3I8WXmal1J7yJ1RWWrrAYi2MRPxMzaGUvDUIq/Bt3h1NWlxmRXp7ZaVBIDUGPxM4uHpf3CvcoYL
 uIm8KhjU1AhLwlAEr+P4V6Y/CsbfvkhQU9SYSzmHUeLcfQn4PBrVIBOyx+ewE0ph/X6seeDwIt/2ny
 0ZPSDtSjBAxPtXkwoJlwj2Ap4HLbPt5J8ADYYU5dxARsai5bL2DIhIAwOY3vLdFUVQBR8r+uDI5+ds
 gbmzxrSAJM/mQljVCYZx/mEvEstnOt+lGQzoKqZzgwxTwzfxLZSkZ0+l60iJdLPTXwF9BpUZcQQgdP
 yy+pQCBXX8dbISkmeAFzwtyS493SOhIdkIgxR/8vQX0fdPSe/A7nxO1SCTx6qlkuwYKTkVpPyQ5htv
 YZJNTRaWRugVWJQ0E60YkuLmTCpSQtns+07Cut7gBKUPtdTDIesfwmoDGtc7g0R60Fd3Z2pJAqJ7/o
 q5oHlmZdDEBTCZyM1YdRu+0iWI5tBsMEYampbTzKVChIAlgBUn3bydhYDrBPk9DMZ+0KjNoidhFDGz
 anzJ8LUYJWMPTwrZA5oQeDnm9vWeu9Yo1O6nH3DabLSEdGu3ACmhEfYf8bo8izntm58dkp5TZngW2s
 8OmL1nxVqVtj1elkM37AG9Jiov5L6PaoRlzZJ4eswEVnVo7c1T2/8wHdtfkw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010846_171616_2197408A 
X-CRM114-Status: GOOD (  10.13  )
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

Use the proper node name, fixing:
arch/arm/boot/dts/amlogic/meson6-atv1200.dtb: /: clk@0: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson6.dtsi b/arch/arm/boot/dts/amlogic/meson6.dtsi
index 4716030a48d0..1c4ea7266f66 100644
--- a/arch/arm/boot/dts/amlogic/meson6.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson6.dtsi
@@ -36,7 +36,7 @@ apb2: bus@d0000000 {
 		ranges = <0x0 0xd0000000 0x40000>;
 	};
 
-	clk81: clk@0 {
+	clk81: clk81 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <200000000>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
