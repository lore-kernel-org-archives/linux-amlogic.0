Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A790AC6FD19
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1/UOweiCfid+o5EJZyyGTaFc3SdobPLutqlXUv7fA8=; b=yxJgUsle/Oztjw
	J8VbJ/+u85lXNVSa+zb/ietkyiomSLvZgyAptoTPwUmCj524ji9/ZoMD8FwHkgPQKKltoTD7N1Kkg
	8hglg0TSjQ+2oYHoZFDQEDHf4KWlW1evNvC5cWTyDHmvQ1FOwzO+XL5gYZmRp/Aot2eiaxvFw3PgT
	6T9enOMzMvSuIzrXi1BM+Ly9iV44n4fVpS+yZlLgl90lfWM4riwnglsr5/aNaI2kg2UnDEf3TeGIE
	mFY6O+Y7hmC7O3Szzi+Xt7Sxznq86NACWUSChoz9J4ipVpl1Cg9ePNwRDGRBXojH+LxHUJOtDjluM
	Wyh6K+1N+Ymhdzi3+qdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM6Y-002ZFG-FX; Sun, 12 Mar 2023 13:51:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1S-002WWr-E3
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=; b=HQnlObf4+3Oj1eQwJPuOYvrAN4
	VrBQBnhsj0526SBP6q7EcK+fs5ZiU5XLk4ekGet6k/8XWGkE73QxcNMpuQJRSIA8fs81CC/pAJM8f
	CDyqHiesLzDnGhRxbjzynbE+xnvrKIZ4t/7snALxxvwLfhY2nAG+vlWl+R0JBNtqKaGl8B1L2KBcA
	eIVjs8IIzuQ5Gc357fyyoConEMBzTwRozWCJBr95JfPG0r8nldht6LkcZIqBfhN9k4EnaFmPwtEvb
	YDGNEUAEMHVOA4HdoWyZqUKws4W3WnuyRbu7eL8YocpD2LsUZ9eIIFbeKZ2Isn+rMHYk+cYmUtxMf
	M6xZJP8g==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWX-0011C2-1O
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:10 +0000
Received: by mail-ed1-x531.google.com with SMTP id er25so10371588edb.5
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=;
        b=EgkbAPHTPzo9cfWlbLRM6KLB9a2CDiyTPjgvZIkiQB2D3eAiH7zCEO3VPovDUd+GB4
         KX5pcpWniraKhokFUITVAYNqggo8wmVnv51oebW8T+jTWoS8EYz5RuidnQho16MtLB5Y
         6HnazuF5aS+d0nJV3e7wA/9S90PNSqDWAroW/WjB+cwKhBYuD2AiqFCxO/6DSf+Lzzh5
         s1erEPkcKXTBdvZZEH+znboKjx0L7miHhUyOS7X5sprDW30hvRNz7iLwKLf6cCe9e+VE
         4sxLBtwFF/inQe5VeT2sEqF81F41KzmIGM4nDHT9s2mV60jv2F0INyTIWn4VM/cwT76j
         nAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNgYfofTMT0DwU3/gnE/zf49ZhjV1abWtqYCyvkVzBQ=;
        b=qTLocmEssm2Ac+/TCIGyUyEfjoZ5fusEGV4kRqLdw6rLO1VU+8smFq4J2Ep/IydHjU
         9qOmC8OrIYss2GIp0JgDDIP1ihRb07EC5fWJFFhaERETvPWDlJIl8j+0LDGxR9Utjj5g
         zEVhhEetI4LUZn6856naGXXMsVkr2nvYbCuE05uSdeAeh2pbfusfZ1cZ1kBBwCt+a4eP
         WjhWZbsxZRq7NDZzIv/iNc1AXuX3NgppVgoZO75h7lrsFUvPLD16oCdF0+PSfjsMmMYZ
         LvWjXDiN3UImfjgiCPDKLKZrl6G0Jct0M+m/OVGOjCKwoG1boQhSk7WN1cFkPTEZEPs+
         +aHA==
X-Gm-Message-State: AO0yUKXYFPbD59gptS/zpLycfUyraQw+Bzg0SQkE+03LZDfoY/BfzQtP
	EcfNA9qnKDoYt9N4dv8Vr5UosA==
X-Google-Smtp-Source: AK7set/vg3wcNxuj5n3r+oFsWS7o7VFQ0ZolSjtjcry30Pr24as5+4q+gdgTFv63DmbvH/wtTzc+Fw==
X-Received: by 2002:a17:906:4f94:b0:8ed:e8d6:42c4 with SMTP id o20-20020a1709064f9400b008ede8d642c4mr31116353eju.12.1678626845092;
        Sun, 12 Mar 2023 06:14:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:04 -0700 (PDT)
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
Subject: [PATCH 21/28] media: i2c: isl7998x: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:11 +0100
Message-Id: <20230312131318.351173-21-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131405_737298_A65C54B1 
X-CRM114-Status: GOOD (  13.39  )
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
cyAhQ09ORklHX09GIGVycm9yOgoKICBkcml2ZXJzL21lZGlhL2kyYy9pc2w3OTk4eC5jOjE1NTc6
MzQ6IGVycm9yOiDigJhpc2w3OTk4eF9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBb
LVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
bWVkaWEvaTJjL2lzbDc5OTh4LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9pc2w3OTk4
eC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvaXNsNzk5OHguYwppbmRleCBhZTdhZjJjYzk0ZjUuLmIy
YjM1MTgxNmI4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvaXNsNzk5OHguYworKysg
Yi9kcml2ZXJzL21lZGlhL2kyYy9pc2w3OTk4eC5jCkBAIC0xNjExLDcgKzE2MTEsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgaXNsNzk5OHhfcG1fb3BzID0gewogc3RhdGljIHN0
cnVjdCBpMmNfZHJpdmVyIGlzbDc5OTh4X2kyY19kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKIAkJ
Lm5hbWUgPSAiaXNsNzk5OHgiLAotCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoaXNs
Nzk5OHhfb2ZfbWF0Y2gpLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBpc2w3OTk4eF9vZl9tYXRjaCwK
IAkJLnBtID0gJmlzbDc5OTh4X3BtX29wcywKIAl9LAogCS5wcm9iZV9uZXcJPSBpc2w3OTk4eF9w
cm9iZSwKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
