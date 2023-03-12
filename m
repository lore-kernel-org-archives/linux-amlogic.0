Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B23EC6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4TLVn/LUKf1zW49Mc3536qrBXq89gilxut0ylp9n/8=; b=qH12gtcuLuiMF1
	zFegj1rOdhs/wdqPUD1jnl8flu3I4yYYZLSw+JL5ZoHd3nsUwsb0WlbqFrdt9/q9EtkTDpbrt6W2a
	fIFE8iZGMVf1ecQ1/XmmssCReHZZWu4SO31lfXEEaZl1Np5aIgjGbU3Xlv65RlVZ04vzxHsOk0Cx+
	WIc24croJhgwZ4soF7U6VcuOzUgJMomnUTLf43BxxU1MAkDfZIQIFC9kkNSWPljol0pCIlAoTR1Jw
	c4bDOX8odlZIYHKU148blef+4KyJWJEzekQbzMLGzi0zfxiITMZe7cRBaM2JIQ4azPWDhVQRF9ueu
	eHg3FiL4cXFqAUuhcC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLXM-002JFZ-Ky; Sun, 12 Mar 2023 13:14:56 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLVy-002IOO-Vk
	for linux-amlogic@lists.infradead.org; Sun, 12 Mar 2023 13:13:33 +0000
Received: by mail-ed1-x534.google.com with SMTP id y4so9041625edo.2
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNTv3xaa9umrxHIJgX0gdbiFrLg5kepDivQRRUUNj8Y=;
        b=mG8+ne6l7Du079iLYFKAm363rTLrrVtTa9ONV2FnnfYLx9z+0BUd74yGDBf9AzPZxX
         QrZ1KXjPmZf0WaAdFO37yPbgZoFxApLLMBsvJhu0hu5AW8aFuRFAdxj0wXjl1Z2FwCdu
         A4uVkL//3t8ItL3/TvFvjOEN6RlwsHBJdOhPwcGGiW6TDk18/oOJ7BImmuG6/EVxPy3s
         89BwwXEdnsV28E71nkiplp+F7zUpWYoW1St11csIMZGdqp/Iz2ukoaZ+bo2P2g/WaIIZ
         jSkYNJB5oJPV1nTr/X5JQWcZ9oaHyq9x+77xqkR56N7qw6d3Vd9krj0g1cqQ9OIP4G3V
         xZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNTv3xaa9umrxHIJgX0gdbiFrLg5kepDivQRRUUNj8Y=;
        b=rSrqrgfLFlGLDUcTrhyUKHp6/Hm8JA44T+6slSVSPWyH4b688QZ1qS/koKRwYBbf32
         Znjcxk0k1vfMpXiOpp9JEc1F7yaapcXDgWb8E23URznq4BsLBt+xLUil+0cniUtT4FRv
         8e4cwm7QsaZSsDUZmuWG30AGZg6lY9zjpGyHnqXknElXOeAN78uwll2c78jbNpOs3I9m
         xA2D5gJwdvTNYLgYDGE7PW/q1W9g50tAffieV+1UnYSpNtLvs9Yvd7mcRFSEQD7JV0CZ
         zwewxo5DlK7BuWLVIvEf9iX9HlQHNTku2M4M7KPPZlBi8+beGc8Q1wKekKXq7UqP8ZN6
         k4IQ==
X-Gm-Message-State: AO0yUKXoe/PJzWD9xx0L0tlhXegvYccLpddJ9/aUY2j9LM8Al0OPHV9c
	AQPjhwPQEcBSixPK3+XPSxg+Fw==
X-Google-Smtp-Source: AK7set9hIVqb2QRhYpBrnz8OxTvSZYTsM/7cq1IWZ524Geu7mNPCnFJjF+tKxEOcIui41/2nlHg9Mw==
X-Received: by 2002:a17:907:869f:b0:8a6:5720:9101 with SMTP id qa31-20020a170907869f00b008a657209101mr37675191ejc.4.1678626809819;
        Sun, 12 Mar 2023 06:13:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:29 -0700 (PDT)
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
Subject: [PATCH 03/28] media: cec: tegra: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:53 +0100
Message-Id: <20230312131318.351173-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061331_110004_7755491A 
X-CRM114-Status: GOOD (  15.55  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL3RlZ3JhL3Rl
Z3JhX2NlYy5jOjQ1NzozNDogZXJyb3I6IOKAmHRlZ3JhX2NlY19vZl9tYXRjaOKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
PgotLS0KIGRyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL3RlZ3JhL3RlZ3JhX2NlYy5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vdGVncmEvdGVncmFfY2VjLmMgYi9kcml2
ZXJzL21lZGlhL2NlYy9wbGF0Zm9ybS90ZWdyYS90ZWdyYV9jZWMuYwppbmRleCA1ZTkwNzM5NWNh
MmUuLjcxMTU2MzZjYTc0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0v
dGVncmEvdGVncmFfY2VjLmMKKysrIGIvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vdGVncmEv
dGVncmFfY2VjLmMKQEAgLTQ2NCw3ICs0NjQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCB0ZWdyYV9jZWNfb2ZfbWF0Y2hbXSA9IHsKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIHRlZ3JhX2NlY19kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSBURUdS
QV9DRUNfTkFNRSwKLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHRlZ3JhX2NlY19v
Zl9tYXRjaCksCisJCS5vZl9tYXRjaF90YWJsZSA9IHRlZ3JhX2NlY19vZl9tYXRjaCwKIAl9LAog
CS5wcm9iZSA9IHRlZ3JhX2NlY19wcm9iZSwKIAkucmVtb3ZlID0gdGVncmFfY2VjX3JlbW92ZSwK
LS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
