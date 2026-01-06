Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0503BC47BC5
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OIPZx/BmoKvd3BCl+J/3cuF87OtrFCcQb0d8upShlvQ=; b=zM34n25ru+FpTq
	2wkpWQuXHCWcKA6VykRbrnVK7PosprE+DgNSR5ChQGH4mq3oQ4+v8tkHkCsiaDMuwRwuI1j4eIenP
	6zB/qc+XeBmUDWwE6LmE4LsvuotXHj4kzuUP7DiPDrVwT/m3bXsqMQvhyBLlN38ZHRBNeyCrckv3W
	q1KcptzMg+t0DMvDAnAiAWPPaUuDvpiFlKpaxocihi8EzI3kX1LvE58AQEv/5FDbeQiFgyknbDb8m
	2eP/fAqGjRRL3tkJH6HZDq3szzjfl4/UzgxO4XV9F7SSqGw6NW8BPjfi7ALqC3FpraiFzdMBYWcAA
	1ZdO4I/gpNJD9W6SXS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2qj-0000000CeH0-30Oj;
	Tue, 06 Jan 2026 08:55:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2qc-0000000CeEW-37hI
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 08:55:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60649LaL2254441
	for <linux-amlogic@lists.infradead.org>; Tue, 6 Jan 2026 08:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3O
	BALP6sE0=; b=aLPHJ2W0uZ4N9+nMk7NvPxJI5VOBQbeKQwRcvxMwerWEA1ccgfz
	jCNGrmI9y4C659750jq3jnsy5YNyypRPdaUjYJXkS5zgSS+AC1ksUf6ESK8w0X2S
	5rIprL1jEu0IiNcliscZ9xeZSpltQw52nBQ3weHa7/3PBPRIlNTIZe5XC9BO1JSf
	J3cUbUJLXw+Te4EaUM7cWg42XlKeprSlMtGCdiT3b8ucs3idG18ZxC6pWulPxWFz
	OIkTPvnkKrl1IBTNARdvFee/E9H7oIWu55PN4o5ZiRsWCHCWffbcM8IEVkgty9Su
	WuEnGZzoM+lkmn/T0q6YiL4j0qeWgcVOA/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu420sk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 08:55:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so8854391cf.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 00:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767689725; x=1768294525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3OBALP6sE0=;
        b=igHzls1zYIsnJNNjCu/dxrldw6agwUsgxGMpzW00n4cwLQcBFc7ezuxeEXNLqdRfDe
         83uTc3upTaWyR/e9zBwTMoMpYk0CWOobgLxU4hKdH9w4CrRsWhOcZAH8hBavbG3sUbcs
         fJqDkCeIs2Dk0mFOEIdjD697UVgq+b9OCziTZ2xvkyJPncmEaamWfekmeUc3WKs2i9e0
         iL0Ub8f/PLgOyLIDNSLRAq+6dl5il5EQ0C7It1KBldcLJulQUw89Y5sGZ1cftLDY2uMr
         R21259dSRkidd2iA8mcKBGviMtwP7YOobLj3AbfnmsLMjcH2PUSDOXhGVBvAtMBUkChc
         4nCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689725; x=1768294525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLntyfjjyt1SpCyW5jaihTrhxEUyaOdPS3OBALP6sE0=;
        b=mXRgbIguX27WLIFTDUDI39/OhzDGkM4afF1aWJwFRMJHNZonRIwWBSaG/kzRLm6v7j
         YE0mxyhCietOGC08PbK+aQ/dvfaFIdlFGhrAijH6OlyU/2yvIVTZhbWuJ1Qz/62pRTGy
         OYGw3b0eFIC/r6H7bcTm9lKfMb0CN6snuLC0XfYMt150/Fj5kNYsukN+uGLsZFjO+BBH
         a0n/23YM4ZurtEH02ivOTo+/Rv6Wbn95aXm0UO9SScJXYKnASANaS3VW642IOjjn95jy
         vbffwuFmRMyOj8l/fEQbF4oRx7b53wWa0lh8NuyDmc5wj500kSpIzxfFgw/bzLVcMaig
         s37w==
X-Forwarded-Encrypted: i=1; AJvYcCXGDULin5hgeySPkEV28Rhy2LCh3r4F8BfW4RmzVfKpNyQAoiMDfxEBPsSXsseERpHOE3dCiJs9XMrQphSP@lists.infradead.org
X-Gm-Message-State: AOJu0YwSLnJtXEhHvSPYgCXhKIjbjpzlb3V8d1lalMsm0WkIGy+Strd3
	b7BPMEqVUD1vyH+EJ7XgrU4cPZyqri+wfZ3hh48rsDb1NOI74e6GmfVlugLUOpGdoDyW2IGQU/d
	8iKzq9rh5oTrI3c/sd7TO4/42snsIQd/Wh19qNsgG3Py1FJx4M1oJb3bDXtz5ey03EFduEOppMw
	==
X-Gm-Gg: AY/fxX5ioFhLadj2kUhM/A3y79Nk5Hinl32xtf6IIPxF2gsmdoQ3n36CMs7+SEJuLZ6
	bCk6/BqBvuNM8kc/DvQ19dFvG92mDxLcuzNMi9gG3louUsx/QtrMBt+FGL5DRrdXs1Lir4PJ9yp
	ATZVmsgEclfAdznfwEURoa+RlhjWmpOCK/3yVRXNVP0Wkj6LOPagVuNfyYdQ+5wwDUpYGPpfdHO
	2534HR5HL2Oo3GVaq6zXw58sFfuEk3/PbLVM7wyczxlB73IsqmK3fxpYV6v4emUB59/ifneSUsw
	D1LkCu0yRW4yd80alm9feJvOqtvf+VrdVXJHQ/hAXkcaouXnA7Soa7DASYnsVBtsE5pvC1KLrMs
	XcM7RJU+B/Mfhs92ZkVGtNxmsExARxl3IWvepcho=
X-Received: by 2002:ac8:5fce:0:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4ffa77aa962mr28559771cf.40.1767689725072;
        Tue, 06 Jan 2026 00:55:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMU7QLas00J/5wXs1CjykWn9MmTc1yCeZJJVduAIoL1KbaKbhKziwT3E3DaYERxdSgROGv5A==
X-Received: by 2002:ac8:5fce:0:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4ffa77aa962mr28559581cf.40.1767689724599;
        Tue, 06 Jan 2026 00:55:24 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm3326754f8f.24.2026.01.06.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:55:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
Date: Tue,  6 Jan 2026 09:55:20 +0100
Message-ID: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695ccdfd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=kI-syGhB69xVGPkSyq8A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: k2ZXFSaGeGw0Wawsf9rLiUX5JDWZPYa7
X-Proofpoint-ORIG-GUID: k2ZXFSaGeGw0Wawsf9rLiUX5JDWZPYa7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NSBTYWx0ZWRfX82R+4P5F9Y+e
 +JKJ68t6M082Q8Shdj4B+/3UfSrCcNwXucA+jyuoEto4ekIHchd+V5S/CMawIvCFKaU0ouiWq8R
 bS74UQQMnrpzFXyFFUyIw/0HKmSlP4UuPfqAsNR3Fr/1jzMDdJguD18ImrCFAzpy2xBonOeE3is
 HWN7yxo+dF9VZ1XTwtPCjieLBgJmS5ofoh5Jz8F1zXLL/bD6aLZe2nk4PirwjlWhOjhcVlsGkLA
 mCzXWK8z3VpaC7FnH2sc1nnWVxKgaigSrToJFDQ6XyKWRCyussyvLkFbka8uqo06DuQoYrNZ1XH
 xtiKSEx5JIUcqy4Jgy3tpStace2F58ZIZsxGa29Bb/9iS9D0WIoOqN031UWXizzQDE1e8DSbYmk
 m5l9F2VSj//FfwEGt4+cVA8qTK5DzG33OUe1zKUF4a9uCd2E1jGzdhD2lERb7VGCBId+f1NG2RI
 0Ux1T5a5Tn8jn7ZdAbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005530_440577_DFBB9304 
X-CRM114-Status: GOOD (  14.67  )
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

We currently only build these drivers on ARM but there's nothing that
should stop us from building it with allmodconfig on other
architectures. Extend the build coverage for all meson drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/meson/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 0315e224bce6..ce6aeec2fc79 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -15,25 +15,25 @@ if PINCTRL_MESON
 
 config PINCTRL_MESON8
 	bool "Meson 8 SoC pinctrl driver"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON8B
 	bool "Meson 8b SoC pinctrl driver"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_GXBB
 	tristate "Meson gxbb SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_GXL
 	tristate "Meson gxl SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON8_PMX
 	default ARCH_MESON
 
@@ -42,7 +42,7 @@ config PINCTRL_MESON8_PMX
 
 config PINCTRL_MESON_AXG
 	tristate "Meson axg Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
@@ -51,25 +51,25 @@ config PINCTRL_MESON_AXG_PMX
 
 config PINCTRL_MESON_G12A
 	tristate "Meson g12a Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_A1
 	tristate "Meson a1 Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_MESON_S4
 	tristate "Meson s4 Soc pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_A4
 	bool "AMLOGIC pincontrol"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	default ARCH_MESON
 	help
 	  This is the driver for the pin controller found on Amlogic SoCs.
@@ -80,13 +80,13 @@ config PINCTRL_AMLOGIC_A4
 
 config PINCTRL_AMLOGIC_C3
 	tristate "Amlogic C3 SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
 config PINCTRL_AMLOGIC_T7
 	tristate "Amlogic T7 SoC pinctrl driver"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	select PINCTRL_MESON_AXG_PMX
 	default ARCH_MESON
 
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
