Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771AACDB47E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 10:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=bn7jm3UxLufqlYWvXeE0cvMXisVKflhbzR+254e2dg0=; b=Rp9TMGtvEtv0o3
	7V++ttiJ4j8xKeh+zDMPwyZ7NyqnrGkTm1Zz1hMew4eJzDjtKLEr7HpT6p/phdfmtX4MTTtVcfx3d
	zj16iX1YVUn1sJ0wjHH8N7ihahMo8dCylk7u4BxUvviU+O8Su2Zhf58si99bRALQoV0myyNOxiyUA
	8WaBexdngqqQVHAIoxKv4mscSbv8FB4AtP2tY2VfsdRhopcq23003TV2EjsL2rahzEKSFxSmQVB0I
	oRDpR73LM632xOOOCGuIZSxdncAT1sl+nO24vGod5f4MoV+/J4Oxdi1YgLlDkSBqNlBijDdl8M8n/
	SjDj4snKph76pz6ofS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt3f-000gMg-2l;
	Thu, 12 Oct 2023 10:36:47 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqt3c-000gJr-1E
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Oct 2023 10:36:46 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231012103637euoutp02e15408463ce4c970025930aa425ecc1e~NVdKb0oM60818308183euoutp02w
	for <linux-amlogic@lists.infradead.org>; Thu, 12 Oct 2023 10:36:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231012103637euoutp02e15408463ce4c970025930aa425ecc1e~NVdKb0oM60818308183euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1697106997;
	bh=EwuqdYxq6RmI8Iumq9Pri4LwDFF9YPUS0icPs6UXPs8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=vFtDzTIDaQ6IfCbA8azZxuCF46XFq6hnTiGNVS93KLtIMZcWY4GS1x1/sCF0qGuFE
	 B/okOCXjmDUMIEyoI3+jYJC3Fu1Gj2BlO7oUUWwdRQEwQKwfLej61dRYuquH6Jt8gK
	 XPXmu3qQDARV0JBGYffMZNeKVku9GmAyskcxyoOA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20231012103637eucas1p227ac3175ee6b4748ce8a18405a5bfbca~NVdKAcAuI3182631826eucas1p2D;
	Thu, 12 Oct 2023 10:36:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 49.C0.11320.53CC7256; Thu, 12
	Oct 2023 11:36:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20231012103636eucas1p21eec119a94d1f2adfe8d1c2602bd4012~NVdJdlGu92543125431eucas1p28;
	Thu, 12 Oct 2023 10:36:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231012103636eusmtrp15d574d74f0cd7ebb86e197ed9441e189~NVdJcgEo52245122451eusmtrp1j;
	Thu, 12 Oct 2023 10:36:36 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-fc-6527cc359214
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 28.96.10549.43CC7256; Thu, 12
	Oct 2023 11:36:36 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231012103635eusmtip233868026182a19de666667b3b8ae4fea~NVdI3w2dh3196631966eusmtip2S;
	Thu, 12 Oct 2023 10:36:35 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
	Brunet <jbrunet@baylibre.com>
Subject: [PATCH] arm64: defconfig: add various drivers for Amlogic based
 boards
Date: Thu, 12 Oct 2023 12:36:00 +0200
Message-Id: <20231012103600.3381340-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djP87qmZ9RTDeZPY7Z4v6yH0eLNoyPM
	Fj/btzBZLJjNbbHp8TVWi8u75rBZrD1yl93i/c5bjBYtd0wdOD3WzFvD6PH+Riu7x6ZVnWwe
	d67tYfPYvKTeo2/LKkaPz5vkAtijuGxSUnMyy1KL9O0SuDL6vvxhL/gqUHHhxk/2BsYvfF2M
	nBwSAiYST7qa2LsYuTiEBFYwSvR/P88I4XxhlJi9sZEZwvnMKDFt+n5WmJYJS6+yQSSWM0rs
	ad7CDpIAazna7gpiswkYSnS97WIDsUUEsiXmPZ8LNolZ4BujxK+TE8ESwgKBEhdmLWQEsVkE
	VCUW37zDBGLzCthL7DjTzg6xTV5i/8GzzBBxQYmTM5+wgNjMQPHmrbPBhkoI7OGQWPNkPRtE
	g4vE76nfmSFsYYlXx7dADZKROD25hwWioZ1RYsHv+0wQzgRGiYbntxghqqwl7pz7BTSJA2iF
	psT6XfoQYUeJk7v2sYCEJQT4JG68FYQ4gk9i0rbpzBBhXomONiGIajWJWcfXwa09eOES1Dke
	Ep+eLWaFBFasxJGzJ9kmMCrMQvLaLCSvzUK4YQEj8ypG8dTS4tz01GKjvNRyveLE3OLSvHS9
	5PzcTYzAhHT63/EvOxiXv/qod4iRiYPxEKMEB7OSCO+jTJVUId6UxMqq1KL8+KLSnNTiQ4zS
	HCxK4ryqKfKpQgLpiSWp2ampBalFMFkmDk6pBiadG5fmF4ameOgxyq14Xc5balnJ9GjVW8lj
	vK+apWJMv7rZJp+J9BYsPJfa/s7lVDyLWcsJxYMeZ/5e+jijRdsv/0XdCZXnH6r41/ld3Vmj
	OYMpOPV/vF+qYV+6gYOncmv0L8FVgpdmndqaZX3Xr8vvo7bArZoW+dr9dyRX/GLZZv0taXIn
	l8fSiWtWm81jZhH6fFM8L2eq0cfEnsbChP6IM5FXIzo+sTgYsy872bh7zar9cZ0BLwKe9YQb
	79c6LTK/6eNSxwzG1Aj/f9L+2d8lk6SmpW+N5b6mZ/Vnn2q3Tu60mMdn/YXM45nr3KskflvX
	Wv+54r/4Q7+35kaDL7LrP2UWvfo7eXpxqfkHJZbijERDLeai4kQAAhRK97cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsVy+t/xe7omZ9RTDa7vk7V4v6yH0eLNoyPM
	Fj/btzBZLJjNbbHp8TVWi8u75rBZrD1yl93i/c5bjBYtd0wdOD3WzFvD6PH+Riu7x6ZVnWwe
	d67tYfPYvKTeo2/LKkaPz5vkAtij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
	TJX07WxSUnMyy1KL9O0S9DL6vvxhL/gqUHHhxk/2BsYvfF2MnBwSAiYSE5ZeZeti5OIQEljK
	KPGidT8bREJG4uS0BlYIW1jiz7UusLiQwCdGiSP7wZrZBAwlut6CxDk4RARyJQ7NEQGZwyzw
	i1Hizr4uZpAaYQF/iSmHW9hBbBYBVYnFN+8wgdi8AvYSO860s0PMl5fYf/AsM0RcUOLkzCcs
	IDYzULx562zmCYx8s5CkZiFJLWBkWsUoklpanJueW2yoV5yYW1yal66XnJ+7iREYBduO/dy8
	g3Heq496hxiZOBgPMUpwMCuJ8D7KVEkV4k1JrKxKLcqPLyrNSS0+xGgKdN9EZinR5HxgHOaV
	xBuaGZgamphZGphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTA1rb56WPiS1twqHi3V
	to/zDafm/erI+JbwxinXU3/2+ug4tSVH5iZpV31j2/K/l22msGCDMVvCCeX793cI7jy1rOtU
	gsacJQeUt7msufNc/XfAwmxFyZwzdpLGxfu2bGvuM3o0TbXQTeGL66LypGTF//8lg157v2U4
	dVd2gVBpWU5vzPN7yida1kfzeXl33bT86SPsdrLzpI/HKpfPhqcX62Zf2e698cNBm5K8BQcr
	2coXWTPuCPZbzHGT7bb14/Db9x41RteI51w+YDmnNipR4Xq0uoy9+1R+riYLLu3pvVpZGj9l
	XCRYuJzzz1yXbls99ZuThp3fhpvNIglrlW6evLF9aW3Eb+6J8/rm9iixFGckGmoxFxUnAgCi
	KkR8CwMAAA==
X-CMS-MailID: 20231012103636eucas1p21eec119a94d1f2adfe8d1c2602bd4012
X-Msg-Generator: CA
X-RootMTR: 20231012103636eucas1p21eec119a94d1f2adfe8d1c2602bd4012
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231012103636eucas1p21eec119a94d1f2adfe8d1c2602bd4012
References: <CGME20231012103636eucas1p21eec119a94d1f2adfe8d1c2602bd4012@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_033644_690152_CB116F89 
X-CRM114-Status: UNSURE (   9.17  )
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

Enable drivers for the hardware blocks present on the Amlogic Meson SoC
based boards: Khadas VIM3 and Hardkernel Odroid N2 to increase testing
coverage.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/configs/defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 07011114eef8..d3849aae5925 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -423,6 +423,7 @@ CONFIG_MHI_WWAN_MBIM=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_ADC=m
 CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
@@ -686,6 +687,7 @@ CONFIG_QCOM_SPMI_ADC_TM5=m
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_QCOM_LMH=m
 CONFIG_UNIPHIER_THERMAL=y
+CONFIG_KHADAS_MCU_FAN_THERMAL=m
 CONFIG_WATCHDOG=y
 CONFIG_SL28CPLD_WATCHDOG=m
 CONFIG_ARM_SP805_WATCHDOG=y
@@ -728,6 +730,7 @@ CONFIG_MFD_TPS65219=y
 CONFIG_MFD_TI_AM335X_TSCADC=m
 CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_WCD934X=m
+CONFIG_MFD_KHADAS_MCU=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
@@ -765,6 +768,8 @@ CONFIG_RC_DEVICES=y
 CONFIG_IR_GPIO_CIR=m
 CONFIG_IR_MESON=m
 CONFIG_IR_SUNXI=m
+CONFIG_MEDIA_CEC_SUPPORT=y
+CONFIG_CEC_MESON_G12A_AO=m
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
@@ -1112,6 +1117,7 @@ CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_ISL1208=m
 CONFIG_RTC_DRV_PCF85063=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_M41T80=m
 CONFIG_RTC_DRV_BQ32K=m
 CONFIG_RTC_DRV_RX8581=m
@@ -1167,6 +1173,7 @@ CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_MAX96712=m
+CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
@@ -1460,6 +1467,7 @@ CONFIG_QCOM_L3_PMU=y
 CONFIG_ARM_SPE_PMU=m
 CONFIG_ARM_DMC620_PMU=m
 CONFIG_HISI_PMU=y
+CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_ELE=m
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
