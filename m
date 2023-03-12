Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA26C7618B
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbbtjoYtl1zMwTtya77asbyZSkuNcoLsL51FUtTNIOY=; b=G/Jof8AqnkjsjB
	Xky4RkNMv5sXIBwS85Q+KWomJ1czC+lxHC7qhJWWXCo3BFTrGtjyvRH5Dx21eTHO8ZeW8oXCmBo9S
	xe2wGRR17KWCtaZtE+ycdrbldwXEBp/aI+BQx/sG8DuPheiDvR8l5+vr6X0wIjUk3mtVuXd92TjnF
	lBIXPHSjgowFHD4q7kU2LQ/TMgIBw+AFrTIVP1ZSxm+lA4Hh6jGdHyffgGl3y9iRV2wb2qbCqT7ZZ
	8C9tNmIgijmhuU+jgR92vc2gK7s5pYKwgXz9S8AsCDqZWcv/SW6mDCZ494SGwQzJ8lGozU5v3XirC
	AVFn75+Kf4Obrc0PeuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM6d-002ZHe-9c; Sun, 12 Mar 2023 13:51:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1U-002WYK-JR
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=; b=MSYfovfvYv44RNsJA2ldDMNdol
	yVP4uHmEinGG4iMlR2gl/wsnldrSAzeCoyn8L+SY9l8ZJbeTH8uIhQr0YwYyEq8w0guUHA9HSS8Xv
	59mzaBolQU4yvhCsrwJxa65dqJp4z+WNKvY6jb5uiLof/+oU88TnnRs1fBfPvCNTB9/EsyQ+Fs43k
	mWakGk/Jg0XtGClRIuKllbPKjN9TmmrDpZ1CHNYul/tTiTaHE69AGe2O1cdKNCzc002ihwCD+lvwB
	dn433NOX1LlDGd5hn/GrrYEmKMBY2XokW3Ss5Xsthbgodp0sjU+puO2ry4N98V3cidKHRLiXg6h16
	WFImKOBA==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWZ-0011Ed-0s
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id cy23so38399151edb.12
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=;
        b=KhyYeWigZGhPF510CvX5h9jE+fAqEKL2Rqs6qyLcdHXMTpfyTrH/yYmW5MTvJeK8nU
         9Y29KFzVe5cxs4J/rOcqaKWnpIbAymZchxZ/wGXUYskLlKXCUtjl0OgM6d1MpMYDwe2B
         5JML0Xz4YjWR3BX2c/3QL3NfzaX094la29OY3e5oakPa2FxDE0KgDp7gO70LZ03aGu6/
         hWXBFSgOOKx8rWZ3Aubf1UN1YZWNDAQIP5CIknOtco2JAOy74u8Thdocrurl29RGgT5l
         qLqTSjhtjfsb+ut1Estkk2Nyx1WDu0Ny1wu+fQDaiUFcO5y10EPZSGOTf7jHfa86mqiH
         i6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=;
        b=IXzYp37hFYoh1e7zvIQALz2dbHq7pH+kJCwLZTLoWIYDqAEVXN0gCZ9ae1NU36kait
         8PeXU0Sl7PWZ+5VBCK3lpD7iQ6nLqzuOYeGkCmGm4ZCW26qk/iUanGMhOLXt4Nxxx/iw
         jGGl20ppciaTnvTzbXcswBmrX6HB+acrSxEBM1McT9iMWCz0j1RMXHdwhr5mooHwwhbb
         ASTZyC0cFw0kOK3jPvoTNZZjXqntBv2NGDyrg86RnHuD1Hcj670+co0qrl0mkY6HkfR6
         g/noQ8vEGOYvz8flbKpTbqw8XMczENHw224PEFdYAWuCeQ+Bcu1DnneQeu6cSBKEcHr9
         OzKQ==
X-Gm-Message-State: AO0yUKUCA751HbjtTm00NT95CYiPL/G0BXmkkySE4ccIIuQOIlDyF6F7
	WJpUDoZgJ0/Pl2kQkHLAJjmI+Q==
X-Google-Smtp-Source: AK7set/LSFpK4yaynBThKlKSPfP1bsBiZFb33g2FppGxi4UYvcynFTqjlnDykMn5irNp8KK0K+3W1Q==
X-Received: by 2002:a05:6402:1105:b0:4b6:821e:1859 with SMTP id u5-20020a056402110500b004b6821e1859mr8115383edv.7.1678626847028;
        Sun, 12 Mar 2023 06:14:07 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:06 -0700 (PDT)
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
Subject: [PATCH 22/28] media: i2c: mt9m111: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:12 +0100
Message-Id: <20230312131318.351173-22-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131407_763207_A2611A47 
X-CRM114-Status: GOOD (  12.67  )
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

VGhlIGRyaXZlciB3aWxsIG1hdGNoIG1vc3RseSBieSBEVCB0YWJsZSAoZXZlbiB0aG91Z2h0IHRo
ZXJlIGlzIHJlZ3VsYXIKSUQgdGFibGUpIHNvIHRoZXJlIGlzIGxpdHRsZSBiZW5lZml0IGluIG9m
X21hdGNoX3B0ciAodGhpcyBhbHNvIGFsbG93cwpBQ1BJIG1hdGNoaW5nIHZpYSBQUlAwMDAxLCBl
dmVuIHRob3VnaCBpdCBtaWdodCBub3QgYmUgcmVsZXZhbnQgaGVyZSkuClRoaXMgYWxzbyBmaXhl
cyAhQ09ORklHX09GIGVycm9yOgoKICBkcml2ZXJzL21lZGlhL2kyYy9tdDltMTExLmM6MTM3MDoz
NDogZXJyb3I6IOKAmG10OW0xMTFfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
ZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL21l
ZGlhL2kyYy9tdDltMTExLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9tdDltMTExLmMg
Yi9kcml2ZXJzL21lZGlhL2kyYy9tdDltMTExLmMKaW5kZXggZjVmZTI3MmQxMjA1Li4yMGVkODdk
ODcyYzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL210OW0xMTEuYworKysgYi9kcml2
ZXJzL21lZGlhL2kyYy9tdDltMTExLmMKQEAgLTEzODIsNyArMTM4Miw3IEBAIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUoaTJjLCBtdDltMTExX2lkKTsKIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBtdDlt
MTExX2kyY19kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAibXQ5bTExMSIsCi0J
CS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihtdDltMTExX29mX21hdGNoKSwKKwkJLm9m
X21hdGNoX3RhYmxlID0gbXQ5bTExMV9vZl9tYXRjaCwKIAl9LAogCS5wcm9iZV9uZXcJPSBtdDlt
MTExX3Byb2JlLAogCS5yZW1vdmUJCT0gbXQ5bTExMV9yZW1vdmUsCi0tIAoyLjM0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
