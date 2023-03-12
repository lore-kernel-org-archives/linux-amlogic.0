Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBFCC6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/4D2uhmBzK0q4oEu2Lax4JNAPmUaxwFMw8r3D1i/CY=; b=Aw1BeEwV7vfZD8
	1Nplo7vgcH075eR1l6hT4JIsQUzubotH5vUC4MMK6tkjJxXYh+WG+2HMNzdHuhR/B66y+YTl+1gid
	5C8yGBggQqLsiRGh4TGlWzM5h3fiJBlqONkX81h75FJRNE9c0kX5NaZhHm2TvMzg5DvqiHjVCPmFa
	nQ48jz56asQ8PYT87pLR/DersHw0biipbS2Nv2ooc50rN6FJ2BPLuei1XY596jgxWe2uyUD52WZvl
	wesoCW41GjyYwYHaMN9ocgZHeDPiE9VWKzk7RsjTPTZhrX7mMqh/Ulugjm2UIYUG8cdMUKVT1+Hh1
	Xbe7zSeaxDizbR//18ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLcV-002LuO-D1; Sun, 12 Mar 2023 13:20:15 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWL-002Igw-UV
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=; b=Iljn4Qu8XJqujSk1dRZfLXYm7c
	EWdYr1QckfbH33RbeLjyPfiAM6tffqRIRxyri3t8QSpIfan3JXJKHkY9qwJr3GRNusKrVSXAil9od
	ZUnt4bld43EjUZJjp/DkqlvLPD+SVlda4zgkDEaS8vDPeSMCmocHPfiNo8C9lhuqpNVqXDfYzLrgk
	xwP+qxBC3CazrtottqjZUhCFX9AvFkRfF5LbHBoSsqKZxXoc0znnXxZqD+Rd9c8T6/E4bt1z4H8oe
	l9Gpbpd8sbnCoDgtqr3HLF1t/clU/DiUW7cvUjXjVicQLF4gRYgFmDp/q723e+Zl3y2QkO0GCbgTi
	z5M8ckzQ==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWF-00B3ee-7L
	for linux-amlogic@lists.infradead.org; Sun, 12 Mar 2023 13:13:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id x3so38433454edb.10
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=;
        b=GG1FZzu4R08U7ZrQJTDqnm9yyObLtqMDWCx3B/cxyKmqz+Inu/lGru3GBlSAmoNZ2d
         WS9SlIFw7l28qxUjUEIBnfHvBpm5c6g1F4pUDGTJklw6dfbWjyAvPQGUtVzR7OyvFiyQ
         dyuSUmpAGQUkWb8ymF+2KyhC2+95GCs3P8qBCovptLLx92YGuEIvrF2/nQKp3RKdKB2q
         4WRWxJI+thxZatMOq8kxvNE8yRXL8FB+dRcXQH7oOSuC9AcNWcYgasCTPck/INBz0sk4
         D5bd8nEqJArLbuAbevCLQSORbLT9ASQ4UO6q9+5gCJHqKdXkvauSNJboZF8dLbTMmvXn
         eDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=;
        b=dr4DGy0ka5wCejLqGtPDtqW9bs4eh6YFo/4GRS7b6+lfNaKfymWxi/x3vTEevIKLs/
         sxlXFI80trS2ffzyXFPthe2izyhc9FeHTa7ZCpa3fNAcM/YBVJuk9IMDpXjlxrMmQ5lS
         JkcYjMwaOvvLFVVpa2QecSAAyGrIl23sJfY0M74QrZYw60ffOtcGv58F2RB9SWoHXazL
         6W6DZcSJ5j3Li7NsCEpdKG314Y76JDRzzxs7Ki4pkDzz5vyW9obIBmjoK7DCYO5Y0mYx
         ci+9OwfILskarIU0YyjmPrYF4RavXmFiNK9TkoT/W7+mRj035saeChbZoD0e+4UvDre+
         dQlw==
X-Gm-Message-State: AO0yUKUGJ4AjTQ2Jr6YcepnKcMD+pslEGC9LobkG3TGJ6hkwJ7oPdXw+
	vDRUd2/m3Kuf8i0iJ3mdGcRZRg==
X-Google-Smtp-Source: AK7set+7qUF+bcLWEkAr4Cox0v1rHikG9c/U926xfMgDAeF0Y5GVKCnNz9afn9B0OfITyqkEgAYQeQ==
X-Received: by 2002:a05:6402:1005:b0:4f9:f45e:c8b3 with SMTP id c5-20020a056402100500b004f9f45ec8b3mr5025265edu.27.1678626825396;
        Sun, 12 Mar 2023 06:13:45 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/28] media: platform: ti: am437x: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:01 +0100
Message-Id: <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131347_751400_9464037C 
X-CRM114-Status: GOOD (  13.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLiAgVGhpcwphbHNvIGZpeGVz
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdGkvYW00Mzd4L2Ft
NDM3eC12cGZlLmM6MjYyMDozNDogZXJyb3I6IOKAmHZwZmVfb2ZfbWF0Y2jigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3RpL2FtNDM3eC9hbTQzN3gtdnBmZS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90aS9hbTQzN3gvYW00Mzd4LXZwZmUuYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vdGkvYW00Mzd4L2FtNDM3eC12cGZlLmMKaW5kZXggMmRmYWU5
YmMwYmJhLi5mZTg5YjhlMjUwZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
dGkvYW00Mzd4L2FtNDM3eC12cGZlLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90aS9h
bTQzN3gvYW00Mzd4LXZwZmUuYwpAQCAtMjYyOSw3ICsyNjI5LDcgQEAgc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgdnBmZV9kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKIAkJLm5hbWUJPSBW
UEZFX01PRFVMRV9OQU1FLAogCQkucG0JPSAmdnBmZV9wbV9vcHMsCi0JCS5vZl9tYXRjaF90YWJs
ZSA9IG9mX21hdGNoX3B0cih2cGZlX29mX21hdGNoKSwKKwkJLm9mX21hdGNoX3RhYmxlID0gdnBm
ZV9vZl9tYXRjaCwKIAl9LAogfTsKIAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
