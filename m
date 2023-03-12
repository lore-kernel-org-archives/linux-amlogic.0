Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89872C6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvOOn6vkknKpzQWW0HoltUpUkU8cUuR4bWcR+s8GUHg=; b=gkzvqJs4vNu0zX
	oPz/Ag//nRIeLelzBDI9GjC3MQsJ88bsXkDBNypmzveCXTT4PNhtwlMKemHRA4SiXlYiJPFuOnbvb
	Gwhj+ED1eUkzrwcvdtwyb3oluzmnoJtD4aj0eSJxCk2znmMyqcYmyBJEGfRFpB9CX381863iCw7yU
	jV+OHFa8l8mW+r4hy9Um/ycpvYFz2mTjDLrHEE4gW4EB73qhRUXiRBmU4EwNha6MzQAsDke1G2LKi
	NdvpSB3RSAcEuGheF7SJqYI3uHOhrVy6TIWk6ZEcD5/yRTRzCA9db1KKuXjce0aKPm6bZbh1wi/HM
	wBRBjCOx8EoYKXdvv+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLbb-002LTQ-Kl; Sun, 12 Mar 2023 13:19:19 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWJ-002IVu-5s
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=msjur9BIXfohR7MjKiHFK0aZDyGMTPkmem6NEGtsCjU=; b=ISMTWeriTFU6aKFU+OD+hxlWth
	2r2ZDCwpGme4Fnhp19RUOu2gsqHsirIUm9lO0XQeuthkFOSBDUIMcX0bsn3FhB4agtJNtOSrfi0xW
	KaVsqoae8xwHluIXn/++wisfXI4Ay/dOLmq/X49LpG+IYZX3eMX9JgQpN7mu4XvMAiSl5Qy1cpnpR
	9Wh42mUKBzgU725JsHJTHQ9R3DNpGGYa+k3+t2dRIDzvH9+d/h79ZLwKZJt9+5dBliz1ROwAHjASy
	KeqcPlZWJZGFXoWmt/qwJdYxahYJBYqjaN2L7Rqs7zEwzbJ46g2Oaxj8m7Q+QKERcHO1fgBgFjh3t
	07Az2onQ==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLW3-0011C5-33
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:13:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cn21so8312788edb.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msjur9BIXfohR7MjKiHFK0aZDyGMTPkmem6NEGtsCjU=;
        b=OjW7Ch3WzJANLx1nyByhnbnA+p4+Psja196A21bF0aDMZDj+CjUc/V3NpqZSVXJz7J
         Q4s69NqmOUkMcMhUM52lRFAx8K6Hn3pTbfhlcNGcvYtm9T/Xdmpa1eFwio1guKXpLMjx
         /GbbBdI/iGN+TR2BIZr+OCddK8GbN3qlNgAEbLoQvrd9hqX8CNUxQUr1whlLYlnttiCD
         2ppydo1QRfSLe7qEMLz239tuUQR12OAwkuyjl7KW/bFdhhaPMbQAkE3KxuO+3gWxoGJ9
         OsgpWpgMvsI/YzdsoXmnuGMMDhZQ/0cnC86nUpxdiwnlRbtFNGkMGuAkbk1zVOtaFonr
         m6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msjur9BIXfohR7MjKiHFK0aZDyGMTPkmem6NEGtsCjU=;
        b=ZeaFtmdBzinGwgZPGS3o+MQkoDVwROOlouc+D0hPPTcsjmdqp9ITSdemk09mcD1mGd
         xqV8zX9IAPcFe1q9DHBR0ANht0oZqWFm+2vkcEzsLfsWHoAzeKzh0O75kR9jvgbNHLLK
         RTL5ljm6qlQMtM6Va02CfciZ//OQZx1SLBDRIlb8vegpHkjLznMk7/zZ3t4iH/mcJIZm
         QQlsPPkE/R9YwqSknyfDOmmWVf0eDeOICcEjEpOmgnMUllcXsl0X4vaxxn0ffzb2zjDJ
         lusTqHl7vekVaSKFvs4ePMS6dhXcn22z2nvvD9YsQefgW+8XEVWiYZIj2vgoH6lGMe1+
         44Fw==
X-Gm-Message-State: AO0yUKWWyG1yNwNM7UGDElWwWcGLvhPV01X0nOSXgkUCqL28x+AcLgkl
	PN8hPOxVSzWrj9xaW6J0vXze0g==
X-Google-Smtp-Source: AK7set+x2TzZ8b+2TPoP/NPOIph3epGLp33Dj5+VNI5L1g2bCpHKzqAG9L+GEAXmbu6Kg//PKl57oQ==
X-Received: by 2002:a17:906:5206:b0:8b1:7fa:6588 with SMTP id g6-20020a170906520600b008b107fa6588mr30618440ejm.12.1678626813798;
        Sun, 12 Mar 2023 06:13:33 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:33 -0700 (PDT)
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
Subject: [PATCH 05/28] media: rc: gpio-ir-tx: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:55 +0100
Message-Id: <20230312131318.351173-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131336_251715_B8511038 
X-CRM114-Status: GOOD (  14.81  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcmMvZ3Bpby1pci10eC5jOjI0OjM0
OiBlcnJvcjog4oCYZ3Bpb19pcl90eF9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBb
LVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
bWVkaWEvcmMvZ3Bpby1pci10eC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9yYy9ncGlvLWly
LXR4LmMgYi9kcml2ZXJzL21lZGlhL3JjL2dwaW8taXItdHguYwppbmRleCAyYjgyOWMxNDZkYjEu
LjFhOGZlYTM1N2YxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9yYy9ncGlvLWlyLXR4LmMK
KysrIGIvZHJpdmVycy9tZWRpYS9yYy9ncGlvLWlyLXR4LmMKQEAgLTE5OSw3ICsxOTksNyBAQCBz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBncGlvX2lyX3R4X2RyaXZlciA9IHsKIAkucHJv
YmUJPSBncGlvX2lyX3R4X3Byb2JlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCT0gRFJJVkVSX05B
TUUsCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihncGlvX2lyX3R4X29mX21hdGNo
KSwKKwkJLm9mX21hdGNoX3RhYmxlID0gZ3Bpb19pcl90eF9vZl9tYXRjaCwKIAl9LAogfTsKIG1v
ZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZ3Bpb19pcl90eF9kcml2ZXIpOwotLSAKMi4zNC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
