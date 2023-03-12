Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6A3C6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZWIM1gJexO7GTsCuN+sjWgNtxd+VCu8Xyn2R7/uCyw=; b=ld4+OhGlP6Sfgr
	oJdw1METUtZeyijntJvm38WumeXoTgAbHahS4+cZDmE5F9kFl0OLbUc91xgpsQrJMOuhlfM2TpB5Q
	ZaoWVYr/5Ddp8Osuwd/uQ4yHaN41CK0cdcJ8x8GjAhRobB14uz1wp8UOebu8QaidbTyoS8aiahARy
	5YEQJjcEbnmtAf4pbPTDV2+fGhnWfl61jkBDSg3RbWhcODmpuDr3nWQGQShipdSF5+asFM+8j32CI
	OpY4wy+MFa2+8Xokq3kTV2Y4yCue7dQnt/1nxv75svAdKca4QW13l6ukJq7CE/QcP4SPjC9DukrXu
	qI+sooE1ZN5sNNE0xdnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLW1-002IRa-K1; Sun, 12 Mar 2023 13:13:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLVx-002IMh-RB
	for linux-amlogic@lists.infradead.org; Sun, 12 Mar 2023 13:13:31 +0000
Received: by mail-ed1-x532.google.com with SMTP id cy23so38394852edb.12
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkWfjOYJTJDW62JPb9CPt+q+UFtZ1H1u4ouIUZRGvZ4=;
        b=dufU2ZEVvJS9S3PuzmfWSiaKt/e7oKmEif/HcTwiDm1Y71Lj42dFTktHXvA2w4XjAm
         z6CgADU73/O+QVxdKfCgfzGdd8q4LJXRA1NAMkyp64omDj5lG0pyjwGLSEUy3YRLQw1F
         jbhPrxxPiruJ9AwZDeljYbj05SqYwHoEeRai4CpSh/z6WTebeg/5Vrjbf2NIr5CzrKuM
         9qiaMAOz27bLtb+MQWNr6IPfIJ9u+UOg7hONEIKoQXcti8nfWdHn2vaNqLwCT+mhFL13
         lxBRmxlvU7xnCcaMng+7C4zdz2s2yxnEIqvlx2C5sHF3menjlKTG6uQs3n0MQ+fjsU1a
         kNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkWfjOYJTJDW62JPb9CPt+q+UFtZ1H1u4ouIUZRGvZ4=;
        b=nfRReaFVq0fK3AfT+qoj58ZMF4kltpCA7eXchqGNcYV1kquONv8E1bTSSMqlkspU2d
         OYHEdUjCpn2Npm7ekOVAbesO+2WajPDVaiTBPEPz7Sd03/MUV50/Ed6wBntr1PiOsY5m
         wLkw05uPo7LwLDAbhXWgKwC7TIXKzrfbRHSlLqDcLKnoH41BcPOIyxtO05CCayNWndK4
         o8jfV/7Zgwv3HRcXMy6s9gpWm+/AOOpnuvSe4l3rHryQx0+9nfyAmKHFH4j8eORxeWDM
         akFMLbMvjDBu4my+tx7yf/SXpst4/yJzvpOozfbDdP5gqlM+ofTZ8D+Gqmf9ofrV6B7W
         NLIA==
X-Gm-Message-State: AO0yUKWSUx/ph3SGTQS4EOtfWERaJYs/qJ9BDE3G2uRc5LQdp8s2v6AO
	HKIqqjhJNqy4boAD5EM3+fNlqA==
X-Google-Smtp-Source: AK7set+ziiDk/Iecc5/4CJWrBGIg9OTBhTAoqLcBDI9ZAK6SPp7SnqnL3CHjfonNxYjxcPQIpQfdww==
X-Received: by 2002:a17:906:f6cc:b0:925:5705:b5b8 with SMTP id jo12-20020a170906f6cc00b009255705b5b8mr2100962ejb.58.1678626807629;
        Sun, 12 Mar 2023 06:13:27 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:27 -0700 (PDT)
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
Subject: [PATCH 02/28] media: cec: meson: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:52 +0100
Message-Id: <20230312131318.351173-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061329_954530_E32937F8 
X-CRM114-Status: GOOD (  14.85  )
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
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL21lZGlh
L2NlYy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMuYzo3MTE6MzQ6IGVycm9yOiDigJhtZXNvbl9hb19j
ZWNfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0
LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS9t
ZXNvbi9hby1jZWMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29u
L2FvLWNlYy5jIGIvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24vYW8tY2VjLmMKaW5k
ZXggNmI0NDBmMDYzNWQ5Li4yMjNjMDkyZGJiNmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEv
Y2VjL3BsYXRmb3JtL21lc29uL2FvLWNlYy5jCisrKyBiL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRm
b3JtL21lc29uL2FvLWNlYy5jCkBAIC03MTksNyArNzE5LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgbWVzb25fYW9fY2VjX2RyaXZlciA9IHsKIAkucmVtb3ZlICA9IG1lc29uX2Fv
X2NlY19yZW1vdmUsCiAJLmRyaXZlciAgPSB7CiAJCS5uYW1lID0gIm1lc29uLWFvLWNlYyIsCi0J
CS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihtZXNvbl9hb19jZWNfb2ZfbWF0Y2gpLAor
CQkub2ZfbWF0Y2hfdGFibGUgPSBtZXNvbl9hb19jZWNfb2ZfbWF0Y2gsCiAJfSwKIH07CiAKLS0g
CjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
