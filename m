Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86E2C25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2OPRJ36j77S7z5C9IjNDysIyoW5nNix+AANSgXTBcg=; b=NB6YFIl759SFmQ
	L+YAt7fBWW+piQYDFgH9rS6H0UJrWgNtRfg6Od1qTVxnXjSC3MGF+9XT9yFfSJ9n3PhcSvGPRp0cr
	pSrE0G5zeWT2XGHA7llC+PsD/jt5Qn1QBkpg51zckyIAQkdTJyV495wocXjLgpo0j4Wy7rENMwHPf
	dRC0B2p0oiYSF/ncm0wkhhjjh7YVkGy0EA5atomwmSQJv23CsZYL3u9yLX/vDOPrM6FbAiu1iaX5D
	yvWVz8mOX96FDisiunBrUK/lgS1JvBoi53ppjkjK1LaEgZvsN8hhERQP6wvo0cZjnSp+qsWsmcXTL
	CpfCbN7Bgdp87CMZ9rWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nL-00000008uNQ-25b9;
	Thu, 06 Jun 2024 08:48:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nC-00000008uEy-1yez
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4215b0bffe1so3677635e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663697; x=1718268497; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LxuYDmiq5fzmLpnOdguSgqEOVkFSy/ReEuW4nl1vrk=;
        b=P7gYZAaNG0njeUmQJhC95PeSd5oKVk8vnrfBqYX1cIUa9ksIdrzet9X3RAkSu4rQ3g
         IZrzz6nBRKFH9erNur6QVdRPdeOlk6k8yB+5o27My1REzFK1F+xQFejVEiyVyPsrwh78
         z5eox+nXNk8p3DaJHaiBy7yvFs/J3gBLU4q0gNIsxt8aBe+b6COKQsEL45R8K/G2DpIY
         LW8Bim2KYRwdCdDrRl58rp0UFVLA6uXM+7Ky2/d5tntzwMk19DgVKxgQOcYr4t6on6Dg
         0Wsn5JEGec9wKy2NHmvUGEtuGVIkQhagq9O4w9oVvmY397KJTn4SQKgM2uPxzjqeMet4
         0Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663697; x=1718268497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LxuYDmiq5fzmLpnOdguSgqEOVkFSy/ReEuW4nl1vrk=;
        b=rdaKQ/xnpOh3D9EUdvMAmXcjhPDrUBNMmrdtGukg4gy+0C2fvyPfBoU4EbZtyRGfxa
         bhHB9UxwNMRpOkLeXv+H8emJenIOIeyKWD5YTFL/YyrmbJrqb10R0HGnR0moYC55r7ZL
         lrJDbd4H9D3pDyoHsgeMpB7WhtCvkKPeyVSdbPihP3s/Xf2l/TfsCzwx7tYCjMFUIqWH
         yTCxvQTFwbozINP6kBcjG367nySlYZ8OsPcCgqm1MNNmDkVbYmXbsfyz3SYdzTxWN5Vz
         +qQKcyCQZqE2dydx6Q0AFAjOau0JbLCmuc3OexC3IZoMk7B8ynYxJXieXBq49Lx1JrbM
         w90w==
X-Forwarded-Encrypted: i=1; AJvYcCWRyWokEhihfCstYlqwo6kDquaz0BkemmBFBMLZMCUeX1zY2a2CGKw9P+oWN7YY+9MqA+IT16+5WPNWndT+EiuHuQX9RW0H95c3VNVWm08boJ0=
X-Gm-Message-State: AOJu0YzLXteb/fRa3f3TJJHthJD6s8J3ASsitdbQihzoz94Pxon+eFfO
	+NpZzcHSiW83JWs4LhaOG3TJSc9kchXGK23n8cMkmH/VRWVkAlBPcOfGzXs8eec=
X-Google-Smtp-Source: AGHT+IGC737hhQwCtbzi2qs+Nh+6AjJoMmHhd/AfeVEaoCfNGjCA+xScDrwx8kHLuR4jh5SnacBuHg==
X-Received: by 2002:a05:600c:310f:b0:421:561f:4c with SMTP id 5b1f17b1804b1-4215acc489amr16495415e9.3.1717663696902;
        Thu, 06 Jun 2024 01:48:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:08 +0200
Subject: [PATCH 01/12] arm64: dts: amlogic: meson-g12b-bananapi: remove
 invalid fan on wrong pwm_cd controller
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-1-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sNilSTNy7onJWc0uTbgdd1uABdsGCQf5JooGVu7ReN0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfKQPRopuS1pMiyV9+ZLfIj26wDhYO3PqW1iXz2
 +i3LHL6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3ygAKCRB33NvayMhJ0VkRD/
 99mZuq73pGJa/SRpIhLugkV4LvE3hGxTpfUwrwtJN1NP5QpuMWc49wdVZzkQK3FoVWTZt4KoTdZHdZ
 yYfUTimcGVwuawK1TQ4taISgd1GKmnp1xUWGpuDSL9OrAM95eIZgb12bcb4txpN4aVpQpkitda77h7
 tF/2q+427ZwOP6+wToxyEafMcpw9VC+2ZZv63aP+FOEKs5W8AtZZqIKV6dNUcbaBEYvUjD1Cqy4GQf
 /VOcwTBM1m8KEEnq3dlTUc4oaHJLwdAc/LJKGjK57X8cJKnd/teem9kTtAeIvnL9vrEmTgdsH6mqLh
 NfizZqa9NBmVE4TRkU+NsA88+nIL933VVUGF4U3xA0ykMC+4siGZeElFIOlyB6DuW/fi21f40LHtBe
 vdCySEGWcmntFSAeRTOSau3MjQfEzoaX9z2WUKCwef2Zq5Qm72Aq38DGDtPrg1RmXu/DapWXnA3paL
 CEhwYqrnPnte4B/F7lF2vj4MIjEc3PXQAWYMvMcuZOj0X5ffT0hA2I3xgmq9GtSQJ+MaVL8fT9iOdu
 DniQwCaPFLKpD2Y4pGdX6uqDXMyqS3C4oYAC2rCACX3YiwW9bvS6v/VuOemCemYG0nORXWER0EwtNy
 0qdt0PSZ65lEJiH5+9qWizGRVQeP9ZFgK4QEEu5LA41CEYN/sspZGpuXdbsQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014818_566689_3F809086 
X-CRM114-Status: GOOD (  10.24  )
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

The fan is connected to the GPIOAO_10 pin, which can be connected to the pwm_AO_cd
controller, but this one is already used for the vddcpu_b regulator.

The fan was wrongly described as using the pwm_cd with the invalid "pwm-gpios"
property, both are wrong so remove the fan until we find an acceptable solution.

This fixes the following error:
pwm@1a000: 'pwm-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 4b8db872bbf3..6a346cb86a53 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -44,13 +44,6 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
 	};
 
-	fan0: pwm-fan {
-		compatible = "pwm-fan";
-		#cooling-cells = <2>;
-		cooling-levels = <0 120 170 220>;
-		pwms = <&pwm_cd 1 40000 0>;
-	};
-
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -374,13 +367,6 @@ &pwm_ab {
 	clock-names = "clkin0";
 };
 
-&pwm_cd {
-	status = "okay";
-	pinctrl-0 = <&pwm_d_x6_pins>;
-	pinctrl-names = "default";
-	pwm-gpios = <&gpio GPIOAO_10 GPIO_ACTIVE_HIGH>;
-};
-
 &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
