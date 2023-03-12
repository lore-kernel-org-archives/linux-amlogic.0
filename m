Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8DAC6FD19
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGJIyW1TcJgyuJT0IJD4FzJyusvkAZ2n2qX+SpPOD+Q=; b=x90gvIxl0u3L7Z
	B0vxVJo7MbJQFr+WsjMB3la3Sfr2qK06VAayhqmcTgcQGi79WufnhaoHrFqJ6IWXan1uHWR3B5zHE
	Y/1FFK+e4e1jzVIU5YG1iNZleYIHD9caUUpYMccZ4X+ZcoRgGb0UcxcUOT6wmjOhY+gKmDUfL4Ib/
	GcOUUrAJbQfar/SeCwtee3ZIBimWDijCc3uC+CTx+9MsqLxNQbfgZklHRcZzu12IAGPGveFDXHW3M
	054juz9ZgTMwynQWC4s7MiRBE5oK2nQo9G5M/xxZQaXHrRfxPfszbFZ8w6dPFxrl/oKmBjTtTssyT
	FxjUTHiAUBxh013iCX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM5B-002YWC-FA; Sun, 12 Mar 2023 13:49:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1C-002WPp-5K
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JSjnY2UnQpgl55C0x0EbScbpZu8mF5QaFScRi5nrBhc=; b=hRkrUcOJIaX2wdiY+fvK7QQ96w
	qfV9VvY8PVcxHKLuCB2ROkwr+N+KBSbXi7jblvMgG/AFI9CkADkko3UNegILfbDz3WHucpvcR5Yql
	UVD6b7aBvF93kB365f3DahqWG3p7eLPVZoPUr/KwnrnKsa4rd4lVAxQolz0mVpWRVtryKgj/GryZQ
	tw7E8L+63F2onAg66PpEQK+U6scDdESShTd5UpHMI9dQ+nXP5BHSJik/Eg9bwpULEFmGSQgXOpVvB
	iQHe1sOQKTyqfjI9223Ts4XLB/tYzsGGx8lsFoY2/MmdXCcjJz538FPakIIK/F5ESTUCkWOY6BSSk
	vCKbi2tg==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWH-0011GB-2s
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cn21so8314132edb.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSjnY2UnQpgl55C0x0EbScbpZu8mF5QaFScRi5nrBhc=;
        b=Dc26ZIuGptSW54drxYTvMfBZdnM7T2sqH0Ibrn8Isnx72gXt6vIiQrkYJ/ZXRTKeJu
         wXhScqvsjvycZ/sKKYPGCAOgFQPC157JwyaE2cQ5Co/gRVglSKhEm/qSXfGf8d6yTlWu
         NQEJdDvJriyTDULJvI7FxJ1RcMzG6pc3xa2jz7zclJQIsfcQW/69r3MrW5frrZZEiMUs
         8GlhS8zDtnKywTPP15jmvqXI2iI0UA8V27Mp8bX/cYx8afzVMoEJ++NwRakEsYUy8UnR
         X9/AcWhpkrweQyKVI5gMG7fObgCTsIyIHVoFEj8R4G5wb79/ddG9Kmwm4kVDZBQihQMt
         3fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSjnY2UnQpgl55C0x0EbScbpZu8mF5QaFScRi5nrBhc=;
        b=IfGhwD6z8SeGDtBU3ftV19ut03DR5wSzsdO3KcLDzzzhZfwMYoxlI5xIDGGMMUt7sd
         7fgaojXcxXo254NlJ+MTEg/wPQO9+aQfrbIoJjQ+zFpqu8rDbu+EzQXQdwbeBHSKoT+M
         brvVKIA3CbxfUGv3mIKEWqs58t8X7+N2GAbFJ1MkmsTOxyseWcYAw/R2Z1UH2B9UAkpg
         Kx07m48j3bK9fqipH1TvaTnMYJkFM5wVykNHrTJp4GyJvskww8eWStKw5sG6CWsjRFff
         SdPPEnsL2DHC1sXEd25pfWIqIKb4TLf+ws3ZJhcWU7QmDYTg97ZzHe58ZWdQm02lzVrb
         JoMA==
X-Gm-Message-State: AO0yUKVhCISXHx04wdBJtnOmLDLZ1Q8ZgYWAQX64+ZPhX6h9htK6tXOC
	Uz5KZSrvfr68ds2VKPsD8NSfwQ==
X-Google-Smtp-Source: AK7set/fcAtAWgh3+TRqI/ZkpAQaBtS1MV/NpNDoPVgH7rYzBAYx5gtRCk/B6oCX3nWaWawSfNsODg==
X-Received: by 2002:a17:906:db05:b0:889:5686:486a with SMTP id xj5-20020a170906db0500b008895686486amr37991558ejb.30.1678626827320;
        Sun, 12 Mar 2023 06:13:47 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:47 -0700 (PDT)
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
Subject: [PATCH 12/28] media: platform: verisilicon: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:02 +0100
Message-Id: <20230312131318.351173-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131400_190583_B0C5B83E 
X-CRM114-Status: GOOD (  14.80  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24v
aGFudHJvX2Rydi5jOjYyMjozNDogZXJyb3I6IOKAmG9mX2hhbnRyb19tYXRjaOKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
PgotLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2Rydi5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fZHJ2LmMg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19kcnYuYwppbmRleCBi
MGFlZWRhZTdiNjUuLjQwNDFiNWIzOGM0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fZHJ2LmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS92ZXJpc2lsaWNvbi9oYW50cm9fZHJ2LmMKQEAgLTExMzUsNyArMTEzNSw3IEBAIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGhhbnRyb19kcml2ZXIgPSB7CiAJLnJlbW92ZSA9IGhhbnRy
b19yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJICAgLm5hbWUgPSBEUklWRVJfTkFNRSwKLQkJICAg
Lm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG9mX2hhbnRyb19tYXRjaCksCisJCSAgIC5v
Zl9tYXRjaF90YWJsZSA9IG9mX2hhbnRyb19tYXRjaCwKIAkJICAgLnBtID0gJmhhbnRyb19wbV9v
cHMsCiAJfSwKIH07Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
