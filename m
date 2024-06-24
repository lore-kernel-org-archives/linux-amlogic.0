Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269ECC2BD05
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TLx/Lkh64s62rsIbsQ+wRGI0yZRHQmi8g2DNHYymyS0=; b=YjcxAstD3cDqUD
	5pze3RM7CAugUq7f0AZ9n4/xJhHUu6MXJ0PJ/Zpt5tRXQtsY+0pUiSluq2MaQdmCwJQrN7RchYmcQ
	cPHrvmhMRDGog+ddIqzeLw0jTv/W4wOf5Hmb/gsZ9pMOr9rFC17MXklK0kamTPowGu6CuXYeTW2mZ
	l+WMWNf7l2Mwy1jE5pST1qQ+ADOJz0PiWo9/v1+ABFjg4SUYZWxs8QjCalAInJgz4YeC3wa+O9Ww6
	1N+NHYrtjK8NGPB/NAnM89wQ788EZMmw4qK1rcLRebBe0EkSf3OScap5QrVIZxttPzmTQ+JT+6BKm
	TdQ3Dk+/qntv+FVJu+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLfY8-0000000G9zW-1j3R;
	Mon, 24 Jun 2024 08:59:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLfY4-0000000G9wa-2EiL
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 08:59:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4218180a122so30785355e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719219579; x=1719824379; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qwfp/9sZTXGBVFvGswGxn/KcFzTCnphPWghJX77Bcj4=;
        b=FJd/e4yZ8qpWiJT5kObgLvOHa9wDUi9sVVnkZVcRXs267AmdeMrJkTXyjboJ/p5n7H
         abwl6mwy6GiH7aghviGQgd1ua+QThynAI+DhG+zVixahnTG8w7fR1NVUpTKowEKUMRGk
         vN9qGECBKEm0ekZJObewwFbpP0684bu2XUE3hKN2QPlPGHiFO+rp3cL/rgtGVcZ3KD11
         V/D9JkhA9UCZbMg6WE1fyNGM3Az1fnl6WffgPCu1ketzrSTDrhCzCk5eb2OV8qCobmRi
         97CIsIqiYjVcPd59KhlG3Mlnd8eBqZ++alOowDg40lhtXAL2HshbFeSOLvxJd37HJq0f
         6Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219579; x=1719824379;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qwfp/9sZTXGBVFvGswGxn/KcFzTCnphPWghJX77Bcj4=;
        b=XH+9kweT8IBnoUmPuxK2EQcXbD5i5RsNfFxTsDoJAOfU81BRtR64CWoBlBAJRpQZSl
         CZYonZw8udrsE4L+6vMT+ELvIBOCsqx3aN7mKu//ZK/o+tPL+QGSEBQqK3tbUiAs8Q/q
         ZUOYjQwT7R6xm0RqEyZDHfHIbvoIf/7cUARRU0PFuMiajP5q2spuCZaqVV2oZ3v1rbvw
         nlZ5q6FAj3/CryyktYwPPb0T1VgL3q6CHObqn7RO6bXzOR29yfIV9X6JoNzT2IWvooK8
         zhxZJ3YL9ARkfz3Xf9XLHMEUtNO84/ybum/is39q/zC8PHiNxFe+Kxo4C1kL3Y5ADkAc
         oNIw==
X-Forwarded-Encrypted: i=1; AJvYcCUsy7wh50cvbg3Lc6ZAb1/kvqq9vp3ckluoBCmk6WuUWnyKuznnLDClZG8zBmivACihtRlsH4NWxuf59M56Ck90uwlb3mbwUPALtMgqU4VAx0Y=
X-Gm-Message-State: AOJu0YxLvjG3PR191A9a+GgpyBOQOBIEP9DPYg0XcVPia7R8zHhuJtI6
	v5NqgEaji8toHWzJfv6EGIPFacvgphP38MUIgDhkOmWnag25vC9PY8Nd830LE/s=
X-Google-Smtp-Source: AGHT+IHWiEG8wFKdZAg1jKI0iRl/ES1d+thsjyKmjiaWMU0FQ1O/QCzoZCZ7Pjlz3Pdnc4C07ShYrg==
X-Received: by 2002:a05:6000:18a1:b0:366:eeda:c32d with SMTP id ffacd0b85a97d-366eedac457mr2823891f8f.31.1719219578473;
        Mon, 24 Jun 2024 01:59:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5554sm130779995e9.26.2024.06.24.01.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:59:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 24 Jun 2024 10:59:36 +0200
Subject: [PATCH] arm64: dts: amlogic: ad402: fix thermal zone node name
MIME-Version: 1.0
Message-Id: <20240624-topic-amlogic-upstream-bindings-fixes-dts-round-2-v1-1-0a21f456eb8d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHc1eWYC/x2MywrDIBAAfyXsuQvRpoX0V0oPPla70Ki4JhRC/
 j2S0zAwzA5ClUngNexQaWPhnLqo2wDua1IkZN8d9Kin8aknbLmwQ7P8cuxci7RKZkHLyXOKgoH
 /JOibYM1r8qjx4cxslZrvNgTo31Lpivr2/TmOEy1lBcSDAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4vbufuB4y4HcWNXeFKxHJ6i+FP3N4mNG2mVtr5aRhkc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmeTV5cadVbmem+qAcU4856cQkb1UV3Xs3IR2j/1v2
 rGqX3NCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnk1eQAKCRB33NvayMhJ0VxaEA
 ChHOr0kEAehT4NDtEaOE3JKHCdK00r1EBIEgdTnjHyH9stX4eWTrFpdm1g4I103XVb6HZ03oeMI+w8
 ln66xeYRXK2C5OXFx/zCOKDgRbaPhlHzBSixmE96VdseDvrpYyCe0o6j84kDSgr7uAjokC1WcOtw7P
 tDeHbb9FBbdVOWIbCLyUKb/efiLpW6vjMFafC8PftJBZVW5wXAJWSV3/S+VzsptfcL7ODoQCRrv+Tc
 u6jQe8TK3NSjrHaclHHz6bGfKlO0vgwXhNT7bDM3GXaCEWt4jg+cvboA2cN1348L5fCWvuxxM6mh1a
 P6AsMA8NZECf+zyReYEDLTcK8KybzY93adUsx5UpzRtuUhzORv6lmR2IDefMsBhwguBmUmJOaqcedA
 KOp95Kz0zq+kgI7vnyblt40FyGjz36DbPltwhr+ZIilFBFfacOnSO9JV/HwR1WaGjzUve0IojjMErm
 Cx7rDebMUJHm2ih6UHrk4szyU0gdKZIAd3ZfxTSQ4/2UVXio8/E+UbZ8f3FPV12F3MrhVk3FSRxr8w
 sWH8BjWdzVtfShSQTfEBt9JKln0IOt2gp/0UJS1dT1SQ9zIEgxpfMGkpHsk5YtSqs89OYscQghnWbY
 939ljc83tSGUHj6Lc1BIR1U4JGRlurFSPOj1wyptScVVaB7umcPRMYEEkUDg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_015940_931774_9F4E5B1F 
X-CRM114-Status: UNSURE (   9.13  )
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

Fixes the following:
thermal-zones: 'soc_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

Fixes: 593ab951232b ("arm64: dts: amlogic: ad402: setup thermal-zones")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
index 6883471a93b4..0d92f5253b64 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
@@ -86,7 +86,7 @@ vddio_1v8: regulator-vddio-1v8 {
 	};
 
 	thermal-zones {
-		soc_thermal: soc_thermal {
+		soc_thermal: soc-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			sustainable-power = <130>;

---
base-commit: 202661addeb4130fbd99075ab7b4f5290a692542
change-id: 20240624-topic-amlogic-upstream-bindings-fixes-dts-round-2-5ca9b1193bff

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
