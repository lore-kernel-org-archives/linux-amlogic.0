Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA99BC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPH9MCnLkmUda4k/DVk4ImN+ZrbKBDhPJIJWzGThO6M=; b=igQi01znpRTvif
	8QP4ZasW/iHsxHgqrj8v3y89Fli7jEU08TsJVDj+XFwIzHHk4pqd+ow9bSUWKx+0Q41hmjqMbS3/M
	gz+0Frez1gaa37MIglUqzFySL7OxEF3wkiSY4cq8Lr4lrGEyXXLwImUm1nJm1PYNVG1KAhoa1F7tg
	RIRFQv7NmGE2mDSu2UIB0MkvUKNqCU6Begm/dd5f3hUAYTNS9WOVIXk+VuponiOI2E1TDfD9jIIdn
	Ui0Y2nLIYlE1s4ir1u2tTjrP4dslq6EoBxyjnCx+Aivki04YSoZyn04mOh+CNZMecTHtSJOa0sLNz
	/ju34sI2LZaAJJbv4vzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM8x-002aR5-Sz; Sun, 12 Mar 2023 13:53:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM2H-002WyF-Rs
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sj4f7lJPyQLZUYqaER8NG8pmeutfonQX6OO2yd6udaw=; b=ovs9emqkGAc1F4UKR/qSsh1OIN
	XwGcLmqh6nFhEsVaVtlIKFOG0O+QYXt5s8x+9y0eZzvaf7t9YMcNWk8m4vA3NfRl0XJF+NcZiDjxl
	qcR/OQiK/XEUScD4a0txNnwK8BUp9deC37/M8RWqEqv/gYgKcp45gWS3cNRALMGROrKwiDUbf11VC
	Qy5ssSYLJWXvb6/HIEO+d4vwkfmQtWaBtC+6w+mDkue/qZzkLgXcuNYUprIhTn/lB2UJOBLr9idBg
	UakYXdRbQczOiMGZH7OZVKdSdZ+gFMXC5Lvb8FVPsufZYTD0pz3Ctpc5VGl3vLVwe7AJrBzx3PTt/
	byJujBQg==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWA-0011Ef-2L
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:13:47 +0000
Received: by mail-ed1-x534.google.com with SMTP id cn21so8313507edb.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sj4f7lJPyQLZUYqaER8NG8pmeutfonQX6OO2yd6udaw=;
        b=haj+KB/z1L8vJsua2o1vxxCHMhlVmbnayBqVzvMfHTJAHqgBLjuc/m6H8B4mzyAIUc
         62++ksMk1muzp7U2CtB7D9P7OT9ysYz5szaVXEfN0VUDh7fKa3EjKwvqTewvN6LY1vAq
         uKTmvbqcscSxRnCGfJgPFBVKO1QsrON6N8UYL/HmXesYNb1v6+H+yFTBF0epod9JGCNQ
         sopNnojKfIUzWOI7GKiySLHrr51LfhfDQYqJ93VkkJkXadH8VzeSa2sdUn6eUFC1W+Gu
         SmuQmjfkoayusufLq8/6NhHZyZBJHob0DzV+rM0eAmzL5eNCUGhmohmS7ijIcVRPEuYc
         oUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sj4f7lJPyQLZUYqaER8NG8pmeutfonQX6OO2yd6udaw=;
        b=F0hzFvRr+WHGHGJPuQdATksT1PKKP0X1Lx4J5r4UgYVrqXWznF3S5bRvM9q0Q5GKF7
         Gtya49l9EHyZzTP4qTHvNsHxVVPWvN5ydM3XiMM6T584uBu8qgZTxY13kUac6F+f9Mqm
         oITpQssQfzTIY7bp5bCJr1o2Kv1op+tPLE9kByQOG9MtFthClXtSz8jHU+/sZTTnb5Bw
         cQUQOp6CKUU787s8c52r+QsW33OOjLxQjSasa8JY7dYF+SNf7LGX077SRaBjcyzvQ6o5
         ano4BkTjGvMrQh2v7qfhZbdFQr7J/QIQJpAudUzmqA7MJoNav3JtdOfnBlo0j0G2CGHY
         5mrw==
X-Gm-Message-State: AO0yUKV+VRTp2nSx4iWMEQiRiowvoni4xFhS5pFgoG6/5axRYdrvPdZU
	UJGS8kvGZLy90pPooh7r6B5ahQ==
X-Google-Smtp-Source: AK7set/ermG5mPokgNtP87IO4WUZSbcbchCeAghNXlc5QJFzLjHi45cBPkYMiVQWjmGVImmiqhDubQ==
X-Received: by 2002:a17:906:4c8e:b0:8af:447a:ff8e with SMTP id q14-20020a1709064c8e00b008af447aff8emr28369686eju.20.1678626821501;
        Sun, 12 Mar 2023 06:13:41 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:41 -0700 (PDT)
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
Subject: [PATCH 09/28] media: platform: samsung: s5p-jpeg: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:59 +0100
Message-Id: <20230312131318.351173-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131342_925531_77D8275A 
X-CRM114-Status: GOOD (  14.96  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc2Ftc3VuZy9zNXAt
anBlZy9qcGVnLWNvcmUuYzozMTI0OjM0OiBlcnJvcjog4oCYc2Ftc3VuZ19qcGVnX21hdGNo4oCZ
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpT
aWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zYW1zdW5nL3M1cC1qcGVnL2pw
ZWctY29yZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zYW1zdW5nL3M1cC1q
cGVnL2pwZWctY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zYW1zdW5nL3M1cC1qcGVn
L2pwZWctY29yZS5jCmluZGV4IDU1ODE0MDQxYjhkOC4uOGJlOGUzNTk2ZTA3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3NhbXN1bmcvczVwLWpwZWcvanBlZy1jb3JlLmMKKysr
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zYW1zdW5nL3M1cC1qcGVnL2pwZWctY29yZS5jCkBA
IC0zMTY2LDcgKzMxNjYsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzNXBfanBl
Z19kcml2ZXIgPSB7CiAJLnByb2JlID0gczVwX2pwZWdfcHJvYmUsCiAJLnJlbW92ZSA9IHM1cF9q
cGVnX3JlbW92ZSwKIAkuZHJpdmVyID0gewotCQkub2ZfbWF0Y2hfdGFibGUJPSBvZl9tYXRjaF9w
dHIoc2Ftc3VuZ19qcGVnX21hdGNoKSwKKwkJLm9mX21hdGNoX3RhYmxlCT0gc2Ftc3VuZ19qcGVn
X21hdGNoLAogCQkubmFtZQkJPSBTNVBfSlBFR19NMk1fTkFNRSwKIAkJLnBtCQk9ICZzNXBfanBl
Z19wbV9vcHMsCiAJfSwKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
