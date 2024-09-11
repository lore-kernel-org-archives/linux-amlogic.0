Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EDEEE498F
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XS8UYTKScSuby5EhkGXuNyWbuauRqF/aYiif7X+5Tms=; b=ijZnMd/QRuNBEp
	Q7D96r84K5m4AY4VO8H8SwMKXxglSs3FjS119Kwkb1ZJMS2BqpmLwk2PRJyiCUTcotmrakW75PcLH
	9eaIUL2l8TavURbz3kPdA0ye2JrqyOA3NU4ut5hmjVyxFZh/ohglN2+3IOqTwzSDWwFjzz0X03qqh
	aVMRRTnCuONFGpkIhe8M0dXEo/GoiPh2k1o/Zh6DVWgJrEO/MDVXKLGd6jdk465Uo4wTiUNgDFP4G
	m+Q1GD8UM1li43T7Hr5ff7aGc1B5o3VXdvAPVSCklWpaWQtFObA1tbJzkQCYSsxILrPunPdsfzPSA
	+3xipQGbIsEkChNLIeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKZH-000000095Iu-1Rbb;
	Wed, 11 Sep 2024 10:27:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKS4-000000093KM-15m3
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:19:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so16487445e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049995; x=1726654795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW9k0g2tfwUk0MHcVot7EYfM55mJC939zhR5ttTV7QY=;
        b=bjTPsHcF10Y+rilw6/GVF1eRtqCrxgUJcnsQGmblKj1r0E7GCtP3vnzhTixv1lZbRK
         IBQiug1va8BoqBkSylmiKdUaXWK0aVpcN/ejvG/wKofFInPOmixv8wko63NDYPLbajB8
         e2yAvT8XvM4goJ/iWbk7R6no3hIlQsXB4usB3skD8rghwlGFT0bfAuQ62TMs81+Ny4ld
         HxY9OJXV9wOltal+J2gVi4fckccvxZcHH2p1tUahlJmfIZPU0SSQ7FhfWcGNpbD8kLso
         2zSbG/qMo3FmO8DW1cgaN4+ibljUTEZh28w1lpVHrkGViHpIsIPnCSH5kBseljXRgAtO
         5rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049995; x=1726654795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW9k0g2tfwUk0MHcVot7EYfM55mJC939zhR5ttTV7QY=;
        b=SIkiMabnJ+Yx53xi3nhxReeuL4ILJlITFNuChRTffStxLpAnTyXgzemQbkHs0anohF
         YVQ4tSDEsWCOaVk45Flcj9s7KSQlrtuooFGdsXgNmJMMNLhA0enl7QqeHLTUNP6UWp9t
         UuEcIfuPDiTh6scGLns6LFLVxmKk0jnk7IjD5PpsWy1LJpZLKdffOP4craPsjZa7kRvC
         mfoq4U3xH6lc3deZfX31bN6zdOcUurB9MVz4IjMgx5RHgqbhSRQ/XYxy/BqRk6OSkNqT
         hsCl3GXlSFYsXXgIsdGacDCYjhOxjLAFeRQ+TyoiyN16U7HpUdgldHBMn5W3VH95fvWJ
         z1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUsVQV+fGt3hO5w5xlK1ydVNpyBV4ygRJcjGT0ZuH8LskKRdF9bXqXO7n+tfHUtU+BGSzUvEHW+lXC8InkF@lists.infradead.org
X-Gm-Message-State: AOJu0YySd5Cl/D/WSMWDGzhv3RBbdIuxug+hIUDyWvqioiHrU8furQzG
	URCVU3vZaEufaBR6QPuhS6ypC63SFYZ7kSlos3Ytb8Bwo41oJRXZFf1kKdQrkuw=
X-Google-Smtp-Source: AGHT+IGrJGBuHgROvclb3h/nO/LGhzV/XK0f6cl++KBn+b6C03IxfuW1vJXiIWPu/d/KF2KMFQu6hg==
X-Received: by 2002:a05:6000:128d:b0:374:ba23:4b3f with SMTP id ffacd0b85a97d-378895b798emr11675957f8f.9.1726049994587;
        Wed, 11 Sep 2024 03:19:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a4esm139349125e9.7.2024.09.11.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:19:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 12:19:44 +0200
Subject: [PATCH 5/7] ARM: dts: amlogic: meson8b-odroidc1: fix invalid
 reset-gpio
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-5-feaabb45916b@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=862;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uv4i9SmouGtJ0V9Qz+F5rvo3z7uERMZwd+jUcyFBUu4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4W7D6c5Gvswd2thOKfgBZi2LX9Hg/v4Z3U8me1LD
 humsYiuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuFuwwAKCRB33NvayMhJ0Q5iEA
 CWyAKW39xTrIbOrS/9yxHdmFChZiOnWCHK0t0u678bXrJrAFlYWL3fctioo/scXiSLEeOqQC9eBvsf
 y1vibfY26/lu6ix/4m2iyl1iJJ8XIU7z/8qAqjeEA5pbtOIkQH/i/oX84Ux1ohCD1K1UI570kGLA8G
 MNqLDJQqi1YBaN71X7q8BbyR+konjx6oHITw6v4BXfbkxSnU6OLv6Z3+sgp35CcZfzs1/nYiUw0rKi
 amv6r5y2ztVUc84Zv7tVkodbGmcXaKRMKZ8LTpeHoW6SsotIst+bbOWUknIWjflYOLPPPtkISVbpfe
 6jO7t41MJ9lDlkw9UOFzfsIfZ/ue7oB79hBrwEmEjiDTIXZ0S1IHyTMsVbqFsY3FxVB7acjTaUtIVa
 +XQaUbFfgIpO1axqnWlgIeSYJYOAKMgs+DlvMYAYHjhO+SNCX2unwq6XGYDdSk0a2Z1WDXuY0Ch6Vu
 byoCso3I6sIWNf6iURV6Z4y59ZKIzlhba4q11kAZUTwgqmfgdP4T8L/khSByhPXfYgKk1dJWihUv5i
 05rzNxRzVLbGqpLqLaSXfYG/ikyXDhkU7hEJBsxuYSdog2xLktcQRO1CUMAJQ58bdwR5ZkUwl+Vm3F
 M96bM+AF9YGJRi4qFni7rkKXfYq4dRit4koGHcZUgffqJh0Z9G/RltXk+I/Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_031956_507284_2C40B495 
X-CRM114-Status: GOOD (  10.14  )
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

Use the proper "-gpios" property name, fixing:
hub@1: 'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
index 941682844faf..962bbe3337db 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
@@ -378,6 +378,6 @@ hub@1 {
 		compatible = "usb5e3,610";
 		reg = <1>;
 		vdd-supply = <&p5v0>;
-		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
 	};
 };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
