Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6CFC6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqoA9OB1/bvDvt14o560hnHjPcs3L/lrSrE7Lc3inMQ=; b=Vl+AqhGDDtLjMO
	vf8o2jyH22kd9apSt+6h6P13lfrfsz6iBX7aNl244/ehSUdNgdZy8gyC1G16ICGUVgR5V1Scb+aNL
	GTyC3HzJyDkEPs0hgoEKCi7U3E0CS/zobxvhiQfhnvsxqdRBCYhbjufcdOtWnx7W6jOfW0BJ6i6Bb
	jbyCMxYgN+BWZKkxS3VznOGGv3SWe9vZr0eGRVBXdvj84HPt/cWArrNXrwIEq5pxBuUzO0jDjKH3m
	f1qhYvCSvcto15CtvcM43FSl/K5dAAqIZO3sDrV0jRcMZdfK6SNuf0kLJ0QTuId49BddcaNND8Fx9
	v17A7tWArYmmn1LpTFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLeJ-002Mvb-SX; Sun, 12 Mar 2023 13:22:08 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWQ-002Iih-Uh
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=; b=B8zk4DAsFZx1BDRwHvrmOHVlxJ
	C0b/D8cLa+6HiTKL2/cZJN6/4wHiGd8jstF9vM/7JEtOTcmE3nKwHRGFhJiZlZNw0i0FCmh3Tp+J4
	/ar/TavQtyrkhrIINitIis2Ba76gJ67qQ9XIZWimyQCTKDAMjeGAgPiK5eK8FE933lAOi4eXcD0yz
	9mVeKpk0CUECiMPLUdMsdSMmi0Aw49f6aMxB/3D23WgPVKAlcFx8zKb6UJtRiF0Tg/06s5wxceies
	tN0uZuCNu4MQDf5F2ybiWTp/UbnpKBGjjVFRlIIzkiuqeoYniDv8QI0mBL+iw5uSM/GKRwRnTcXXK
	Qf3HUwDA==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLW7-0011D0-01
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:13:43 +0000
Received: by mail-ed1-x52d.google.com with SMTP id ek18so7373918edb.6
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=;
        b=GnWL3jRt7rNHd4ypSq8umyqs1x7+0wYjNeYAKRv1DYI86Q1oa+IH8PWctC1Wn1hOy1
         y93TFuRwH5JaVlqiteoJQLpQ/TFWQauBKf6VIy3rgszMH7kuzi0S7xxTV/DUlNx6kGWz
         bHPb++v6s5Yugrzys+edgMF3SIe18dNXHurPcmVp+cQwX6OFWKlw6aENyrobhpJE+WzO
         oOjc55XzuJIQ+fjO7bGFVCQ9ieALrkOjivsIggJcLhUhMHqPqaqX/EMKpWTLFVuy6Hg8
         u77f9u6QLYp9a+86xO1rMpEyWn1T3CAZdJK+Kz82pdXVzRTthcPtlqhx5FyVWNv5poo/
         sGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buQg6sc8yXPiuj0KpLg54vXnkMGR4QG/BKa5y0Xpa2Y=;
        b=T3w62DZPQAMoEj04lNX2l4UMQNsVlwzlCQ1Jy9tnPz4+ngA6zbd42ed63I3STgN0Wp
         bHSc3OMTC4fKy/C6/JLLUW9N4BgTDp0TcKjfJxDl/vGt0P94FHIfN2alnPwge1o+z7nU
         aaHMS2MA+GNOS+GK2k+Cp5ZteJ72y3+XwUuZpwoFOK5pPtiLr14FI6XZ6wkgmRaiJSWe
         GCyF9VTmFejMQ1VgNqS3iP/eZJXv9S52w13oNTvzly5wJL9XOrLtRYCEGHi1XfJUvWcf
         FPfpIkz128qpDQyPU3BGC0yBg7URGAX9EBZSTcRbn+WzZPzZJb16H6Nglzo+9V2csZxV
         rGAA==
X-Gm-Message-State: AO0yUKVccDpOLdO5nm4lV87EkxAUU8Kz5N0wQX4VU5aYNv3oRP2yOHb7
	DZtzPNi9f9Ui8nlL80Z7z+Ke+A==
X-Google-Smtp-Source: AK7set8WaF2rUwXzajL4x+ub2degb8HIZtrdNRoJNVJTVfKoaxigWqj4b6PT5ae6Lxjnr++xATWHbg==
X-Received: by 2002:a17:907:9806:b0:920:388c:7cb8 with SMTP id ji6-20020a170907980600b00920388c7cb8mr6643262ejc.40.1678626815715;
        Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:35 -0700 (PDT)
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
Subject: [PATCH 06/28] media: rc: ir-rx51: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:56 +0100
Message-Id: <20230312131318.351173-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131339_334297_3D820028 
X-CRM114-Status: GOOD (  14.60  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcmMvaXItcng1MS5jOjI2NDozNDog
ZXJyb3I6IOKAmGlyX3J4NTFfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL21lZGlhL3Jj
L2lyLXJ4NTEuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcmMvaXItcng1MS5jIGIvZHJpdmVy
cy9tZWRpYS9yYy9pci1yeDUxLmMKaW5kZXggYWRiYmU2MzlhMjYxLi4xM2U4MWJmODAwNWQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcmMvaXItcng1MS5jCisrKyBiL2RyaXZlcnMvbWVkaWEv
cmMvaXItcng1MS5jCkBAIC0yNzUsNyArMjc1LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgaXJfcng1MV9wbGF0Zm9ybV9kcml2ZXIgPSB7CiAJLnJlc3VtZQkJPSBpcl9yeDUxX3Jl
c3VtZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSBLQlVJTERfTU9ETkFNRSwKLQkJLm9mX21h
dGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKGlyX3J4NTFfbWF0Y2gpLAorCQkub2ZfbWF0Y2hfdGFi
bGUgPSBpcl9yeDUxX21hdGNoLAogCX0sCiB9OwogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihpcl9y
eDUxX3BsYXRmb3JtX2RyaXZlcik7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
