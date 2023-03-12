Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7390C74A4B
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/8UaO+DoTHSTV/NJVpS63FconCyv9yckqfe/DBWYds=; b=xCShym4ROVle/T
	YFDt0xZm2W9HKXMyoPdB3/JtK0l+4qEBZMjbml4p2nN6L9/VKLLn165zYwCotx/vZu+M9FgVZrsi3
	P77eDn421Miog2zHKRKZc3qv36/4wqdRJo42KjWxB+5pq8gsbb+DgLiYmBXDH8nV6JOoqfUY2mySJ
	vpKvfpEEHQgW5ZVdn2Npj0s7Mg4uJHQK4SsqUUL8iWCSpTb9JW6skN9ZYKwkNtU3eN9kQUwsjCyYC
	9GG1+XfaF9HLUI/a4wYbTM3V8odGyyXHsG+D5q89Y7LW2Lu4m+VhQ0ELGLw08HXUpQZLOeFbGgDq7
	fGL21kvd2k00xMV0zV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLcg-002M06-7t; Sun, 12 Mar 2023 13:20:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWJ-002IMT-RE
	for linux-amlogic@lists.infradead.org; Sun, 12 Mar 2023 13:13:55 +0000
Received: by mail-ed1-x534.google.com with SMTP id r15so11315031edq.11
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edZ1YtzomlUy1mG3JQnBn+Oq8n+Y+JzAFR8/ksaDlN8=;
        b=PFvlssf4Ggo0VoXlZc2FhUxjUKnB4Eup5x4BhErQZhbBiuiId0oUqCSzyj5+L3ad5w
         wI6FchuGLNBvM91ieUlnkVcU9KFSUcm1EYtijCQcFspt1bzrGvNG3iiXrxY9C+HS3gRS
         /smd1MABeeT4TSBkfeVji+cC8O5AJhgJ0VBS9Fj1bApq6GqFyhw7Gg4+As9zXzm9zak+
         4Z9i2yE5eWKFiHsmntL/Z2XwLUp0qabiZsukjMk3Funkyqc2+A2dYmkPOl4sN3Zuyret
         KZU4GzhA0p7hXpeWwwx7HKQoJEhz0ogqMrGyJOyUMbMpY2OBBaAqZ4bzRXcVEjvfMogv
         4z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edZ1YtzomlUy1mG3JQnBn+Oq8n+Y+JzAFR8/ksaDlN8=;
        b=YsgOd3ZLKcvXi6UcPx/6z25EfhFKwCmKrRtVMaAhWH5HWkfCgVvLCANe8T4BeVzUb7
         18it67ZE0ulEsYH2LbugnFHhIfgTtBQT4lUrDLGYqesSYf/IWVKQwzXskqmSCM48pi5K
         7jJIuxIBvNriehEwgJAImPCQB/Iz3VB7OJ9w07GIDFqPhZDkXHtHHAduBvnz7KaI6s4N
         WXtVKiFFW6uAYQoITB8u6rSz5NS2MjsWBePk9zE9i+pw3Rt0R5Av57cNpmVsgGzUpxeu
         sxLtL3F5qKolJshykXQ1ZUTvlB0nasGqKELlGS92SEX66o8VEOq40P9TATW6nBrqd7bl
         s1Xw==
X-Gm-Message-State: AO0yUKXlQGss8FD0KBznDtXA1rrOYUB7iqqAExMMIIPe5XVyRkKEr83S
	f+8MfRsOQQusSJ7LU4zWRRHerw==
X-Google-Smtp-Source: AK7set9l4BYDUv8WJ9/1tWNIf7xlyiVfxch/+G9YhPZ8oRq9zxCXa6FbFzm0mSfKGHbdS3OEGsdE/A==
X-Received: by 2002:aa7:d952:0:b0:4c6:f2cd:9d72 with SMTP id l18-20020aa7d952000000b004c6f2cd9d72mr30110485eds.5.1678626831365;
        Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:51 -0700 (PDT)
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
Subject: [PATCH 14/28] media: platform: mdp3: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:04 +0100
Message-Id: <20230312131318.351173-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061352_028060_F6FBD542 
X-CRM114-Status: GOOD (  14.91  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRw
My9tdGstbWRwMy1jb3JlLmM6NDk6MzQ6IGVycm9yOiDigJhtZHBfb2ZfaWRz4oCZIGRlZmluZWQg
YnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2Zm
LWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRw
My1jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMt
Y29yZS5jCmluZGV4IDk3ZWRjZDlkMWM4MS4uNDVhNDA3ZTYzYzU5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5jCisrKyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMKQEAgLTM0
OSw3ICszNDksNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZHBfZHJpdmVyID0g
ewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCT0gTURQX01PRFVMRV9OQU1FLAogCQkucG0JPSAmbWRw
X3BtX29wcywKLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG1kcF9vZl9pZHMpLAor
CQkub2ZfbWF0Y2hfdGFibGUgPSBtZHBfb2ZfaWRzLAogCX0sCiB9OwogCi0tIAoyLjM0LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
