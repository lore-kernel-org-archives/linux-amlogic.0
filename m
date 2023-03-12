Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C631C6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycOowwfO2Zj+gS0JTU5pjtXy49R2j4h8FHmjeLP/M48=; b=XpSc6u5fzLYFlS
	dxjAOWLTuyFCgunKbwWFZLjlKPiOF6QtjqwgA8RwpZLRxs1nK4KJKgkHc/3S+L0aJnrDavn57ZA9i
	KC2UenRJhAS9RiFj7zsQwt0sajOW34Ln+bjLClrnHH5OAc9M1/DbKHGMKmoalw6kbwME7eP+LdjJN
	D1OS6119WD9ptwGdZqXwPChLLq/UQToe6kUOmSfh6Aud193Ttc9T6egi+pOYLtTuUXmKgendyj3Wx
	pYjBLS/X76rGf/u8who/bbW9dZtX1gzzhQDMMshcAEvYr+VtT/BjpbNGRgwTe5lDrIPgplN6cqsnA
	t6tUfPCV+9YiHxiNSo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLdd-002MbF-QC; Sun, 12 Mar 2023 13:21:25 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWO-002Iih-Mw
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pr1jUKnL41ZyOFBU50NsUPyS/zukAR1uIPxn6pkxwwo=; b=cJTfJ8IGA5SKKAkQ/NtmA1L0rW
	2qH7JcDPEp+W+SAbNfHR0wY3ioJRDSM0GrIqdP+VLc61BjDzKup2P92puDVE4gw2UJSGw3wlZghlK
	Cyhu3JYRzF8n3PwfJTjgNtW6enET4VuBQxY4AQfJkIOqk20jAWQYJ8WVdyeUV4DHl+sFgegw2GRMa
	Yza3aDWqV/kXXvzQV2tqLNu1cv/fb0EYlSTijuM0/rZ1HK7cyB5s6s4qo9L9PLU5Mdscp2Wa23dBu
	gE9v4sAA1U0ELBq+LXtwj8T2174NyImSt3N3iW/dAn+N/w9AXMBy9Cb2HTzJnI9cO180ACIPSymLs
	CuRc93FA==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLW7-0011D2-2r
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:13:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id x3so38432659edb.10
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr1jUKnL41ZyOFBU50NsUPyS/zukAR1uIPxn6pkxwwo=;
        b=d/Be+KE/rae1AooRcRo7NJaoA4jh14ihaoslOYJLSEXJQusR7E+0E7WGgKwVRvJoU4
         7cdi5lsie8od8sSeQOijQ+CU4K2wFTybbFVmGoqHZm94v3n/12QgP7a8B5fLk8P3oQWA
         Oi+Wf1t4BtkYlyqaXjU8X/nXEzUjjdeyZmjOvBGcEe/zF3N/ZANNaRkblY9p/FtqC7p/
         QCvhTboN2UXxOhL+7/WonTj8O2ca0sj3nz65riaVKnjdeP2wrgFMxLx26N7hQlzLO47j
         ME0hrCDR4+HnZG+PoqQA8nwhxmvt0zQP33761Ra+sweUSgGDS99wyFfsfyWun3OK5zxy
         bVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr1jUKnL41ZyOFBU50NsUPyS/zukAR1uIPxn6pkxwwo=;
        b=7m7Fl0aNPqz5yUF79+6FzJUoWGr29qc9wJTacfGpPff6CxttgszR04PqjVTvLTuNxR
         VC/Fq070VnfV6NdLI49qcfj5TxsmaQZHucrWB9aIzeSm8lk0W/EtUlwLBqWRVif4QzuE
         aSGuWBbEXrkntPaIlOnbSYX7Re6XE/3UJr2z5aP++43R9pHXDcfWzts2nZHTHS0lBvX3
         tNSqsHXKEa1Oja5Gpehc8NhemqBVvuOSXISbSGPvW3YjUk7b8/0rVZXVGG2xZEymAVo3
         o26V02ZvcUFwEakZQp+o9H5zQTq653ObBecsk5hcGwO7/FcS5ku4Lf1kBswiuFGdV9IF
         rv+A==
X-Gm-Message-State: AO0yUKVLAn8InKN3PVJmrhAo3SfNcq8EIc9yYzEsflTiGN/d+ZS/jWmI
	W2NXZ33esnjf174X0jb6d53ulw==
X-Google-Smtp-Source: AK7set/eBPmURAU386Ic8efAZKpGibHAFxF6646hcUlmwtY5zSg8zn253Ru88JXsM5LrkN6l2cpu5w==
X-Received: by 2002:a17:906:6988:b0:923:c55d:efd2 with SMTP id i8-20020a170906698800b00923c55defd2mr3351678ejr.68.1678626817635;
        Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
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
Subject: [PATCH 07/28] media: platform: allegro-dvt: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:57 +0100
Message-Id: <20230312131318.351173-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131340_289797_083B4FCA 
X-CRM114-Status: GOOD (  14.69  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYWxsZWdyby1kdnQv
YWxsZWdyby1jb3JlLmM6Mzk5NTozNDogZXJyb3I6IOKAmGFsbGVncm9fZHRfaWRz4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbGxlZ3JvLWR2dC9hbGxlZ3JvLWNvcmUu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYWxsZWdyby1kdnQvYWxsZWdyby1j
b3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FsbGVncm8tZHZ0L2FsbGVncm8tY29yZS5j
CmluZGV4IDI0MjM3MTRhZmNiOS4uN2ZjMTk3YTAyY2MyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL2FsbGVncm8tZHZ0L2FsbGVncm8tY29yZS5jCisrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vYWxsZWdyby1kdnQvYWxsZWdyby1jb3JlLmMKQEAgLTQwMDksNyArNDAwOSw3
IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFsbGVncm9fZHJpdmVyID0gewogCS5y
ZW1vdmUgPSBhbGxlZ3JvX3JlbW92ZSwKIAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJhbGxlZ3Jv
IiwKLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKGFsbGVncm9fZHRfaWRzKSwKKwkJ
Lm9mX21hdGNoX3RhYmxlID0gYWxsZWdyb19kdF9pZHMsCiAJCS5wbSA9ICZhbGxlZ3JvX3BtX29w
cywKIAl9LAogfTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
