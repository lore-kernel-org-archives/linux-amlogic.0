Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E062DC47080
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:02:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C57A610C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C57A610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMbsiut5OZaU54x3zjLa5opMsdn7aXuIGccQtmfQz2I=; b=PQk3kBjmpi+Oc1
	r+R6wfJfHCY61HrmqVviUe6RCzWzKOJNBLDYct2JmB7b7SWQQ9/nlg09Nk2SVsdsPUqsau3y2DJ2B
	XLXr1o+H+z8JLXkpHEqn3yrbMTag8lzyRtGY/33VbPEqG6tPJiEXpjMCHR9kgnhnyYbTpc8Ad0afa
	KdQCjGyoFdyxnWrXsz86S5ma3TZfYQ0/8SPdiDwAnx6EvhqfnhjrwHtNRY+LDFYSG/SyWsvf0Ic0R
	Qy2WJBS81bemYc+LfS3wZqy001yrXjFZCrwuv/aZmNGbe9qmlUYaDh0FYFKSV0DL6EagnHcl/1p8T
	oF2rJJCexGe+Wy+j78yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0I8-00FUCT-Ds; Tue, 01 Jun 2021 09:02:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0HW-00FTz5-BZ
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 09:01:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so1422844wmh.4
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EDi2mw6WIsOG9a2qhW6Yl1ooRjSzYn5fhSnlTxTnEKk=;
 b=L1bePSihMHTzgesRU+wOrg4LnzZm+Y8hnaNfY37fI2E8QemwtowmMVZQHaH3NBa8hd
 ZfpDirz7yNc4eJJ+Fi6Thw2q00k4xizx7nQS4OETwvntWQ2Bt1fUT7m2Zq8UCIR52V3O
 IymmuT0bvj2PQfAVmii/pphvrHdbV+zq/ADfu5unvwpNGLF3X0APCWAtJ2fHH7w1F2B4
 1X4Q1Pvs8oFPfXjlnUkN39SO32F4ZSJv2BWBEy1mfPPh00Fo82WddJj3XiKglcjLFNQK
 +8W+ejmPWtWaQFdx12jeIMPlj0Ja+H3qAfAylb2DmlfvZ3twgWJjWEI+if7vEwBGOJ2P
 rxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EDi2mw6WIsOG9a2qhW6Yl1ooRjSzYn5fhSnlTxTnEKk=;
 b=nfgM32uTz7kJe6yx+/MS4buo3xerophKVg65Sl2aBYxHosl2MHjrYZRyWcxrFzHpso
 gxbbBtZxWyQi5qosVp+jUmBxOpFqMLEGSiot25TY+mfF93owZmZGf0V4YWXgmYCL0YuH
 0C+VYCeXt4dsm1TgfKGJEQq0r8J3U/eNHPD/9VhS3dYoqIbhNLmalTV4Xko6PDJGDAj+
 oeSM16nPRFJETbx1+hYx1uLtOfCIxuH3biyE4QvvP+DvDgVqYkK6KEmX046qMUzWgyF/
 79Odg5/alTVaFps6jl3Dq6NtwmL/yh8G8nSo9IcuSaL7BWH/gysiyPcMAZ9G3tVHQf6x
 gneA==
X-Gm-Message-State: AOAM533xsZnUZJ2xd691Cow24xqkRfQZn2w3fhES+/JJ6RI5YWzvPDcE
 52yMtlxnY+fDUr3PdowVaDTc7Q==
X-Google-Smtp-Source: ABdhPJx4wmLMtfAJcffUQTp7OFN7GQ7uCm4sseVIhGjWnrFYutod890o3lGcfZLNDgyJJASw/yIjKw==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id
 n11mr25617158wmq.180.1622538107692; 
 Tue, 01 Jun 2021 02:01:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 e17sm2668199wre.79.2021.06.01.02.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:01:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/6] arm64: dts: meson-sm1-odroid: add missing enable gpio and
 supply for tf_io regulator
Date: Tue,  1 Jun 2021 11:01:35 +0200
Message-Id: <20210601090140.261768-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601090140.261768-1-narmstrong@baylibre.com>
References: <20210601090140.261768-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; h=from:subject;
 bh=RVG2YgfB1rqHQ1RBvlzfyjp6vgCQYnivHRfs0+IydqI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgtfc7TAEbzF4Q36frgpZgT0AJbdPxo50OtIppfKwp
 waTgzUeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLX3OwAKCRB33NvayMhJ0RAGEA
 DE4xDEZfXa8r3NcvgA66pyh/SHC+2iK+5ZDsBmC+YLj1JTQHZD6IdR15P2tp82uD3PWZ6S0Mwq1ObR
 3ro/yvYlZliQH53njyVzo5lOE6VRZdroEYcjY1kGqpRUk+Oh0vKBgcy3IQPH+kRYjsQVVwKyQAaHjX
 ZC4dVSi+g9Opk2TbJEd/5Xsao8uYZQL2NDr5GH/zvsCOxuHyXAkulzOTD1dcDnwc0cT6dPQvYSUKed
 O0kNvWKc9e4dHo4qj4ylobG/VKR9Y3KngHeHSEApXzQX4t+VhkCSSjcQEwxgjQ0gHlHrNXBxu/JDNK
 BNZgIOcG9ZAbQwp3OeG9bk5WqhRXHFYXnH74nKG0dLt3qafp7ZW3yK5J0MrqyN8ygLGR7YaSmYfA22
 QnmASvCyqySiyEej+Iba0GgZgmqTGpZWhC9PqEdquM1Q/RGtp/oZNIx5FTvHtXoCITisVvuVcf/yGQ
 RWNRutSSxvlOxIcWR1gRdNot/rWACVhYXOmjcvzCxbYvSujTFuNVidICtNVZhcVSy3MKE1CI3BvdZ9
 jScU4AFirjl0DytHS/ieO1oP3R8QPSryXMaeArTuf9lp851vFJ4o4VgzEe040B0oV9I0psAA+APz//
 /ghEmndZiq3zV/rdiVi7AYRvOIaM95sGme9246el5n9+u0lO8kRZS4+DQk2Q==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_020150_409948_25C5D1AB 
X-CRM114-Status: GOOD (  10.33  )
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

As described in the schematics of Odroid-C4 and Odroid-HC4, the TF_IO regulator
is enabled by the GPIOE_2 GPIO and gets it's supply from VCC_5V.

Fixes: 88d537bc92ca ("arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index d14716b3d0f1..af40ba461074 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -46,6 +46,11 @@ tf_io: gpio-regulator-tf_io {
 		regulator-name = "TF_IO";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v>;
+
+		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
 
 		gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
