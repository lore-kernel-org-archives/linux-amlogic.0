Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31896C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oubOjUym7fNGbluZY2Y9ywLghjBRPOeCHz2qOmUQv2Q=; b=A5hw/8jsc5PEpP
	I7qvBGoGbSv/VRIoj/hpcLqSfvofqwjnjeSc6+CznVi+6LYdO9iD2cA3Pu9XVyyLNdENmFP+m7QeV
	6nA9Lk55VSisstKNS2hZTCfvLqbJQleRTu4hiz0QwklfNt16xK5pv0CaqlRQW+ZqWfLvK0s2BZihz
	4dW1jcFub1iT2SQYBSVBnUhYRD+d9wVU6/51RgiVag/1mZVpUHpR7AZj4LKWqYGfrYnBhUHmBIGJY
	HrIvarAgx32J8J0N5Ll2d36B87mH0Ca+HUhkb6HyJACxnqy3LXhWRqm3iOeeaGhym9D4qkDcY4tEY
	8F0uAT3Ces9goLuhe0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLf0-002NE3-6d; Sun, 12 Mar 2023 13:22:50 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWP-002IMm-TK
	for linux-amlogic@lists.infradead.org; Sun, 12 Mar 2023 13:13:59 +0000
Received: by mail-ed1-x536.google.com with SMTP id o12so38496134edb.9
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSUxJvmcYZNHU5p44Si/GkT5n4QeYi/m+nC/+jkGmUY=;
        b=XUpM8Rmy7PnFzNbcL0zTFiuJpFVfxvLHNToRAg/PEhIOn5i3jUDYTrbExuiifCZjBa
         lrh/2gHR1SNfhiAIupdMYuN4BiECY5PDduKMVCgt/dKreE5Wg/tVSsTwrkD15OLzXkYx
         Ecua631wVTD/Oxl54ZVfyIQui2oVuNhx2mQFPm7RKgxRlbbEeYYitaPl/BlXPCrgNlUX
         XZF4sEohO6jZjxrG3VlNIM8pUxH96L5LPxy7NJI/31wC+MsSl6gwuHKl1HyQ4rEQUAi0
         WqFYN5wDqaG6b4ITF6OJjFk5JtUhKdpb608LUw4oYj30y83+6sqO96df1Ud9vqsBjNlQ
         hVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSUxJvmcYZNHU5p44Si/GkT5n4QeYi/m+nC/+jkGmUY=;
        b=MlsVRGm/ClDjdpOAWxpIrM/1l1AIHxO9esK9YzEPTM79dAH7dCp4Gr0uYr6ZjiE9wK
         KBuoZf3DzdjUvtcmXR+1tX1w0OuBoMa2KJ1LcptJejTP4NMa7v/xrnjJJie9ukYwAbe1
         Sh0j9xf6fWDHVvR1xY/h8+TkhcCBGpyG55hKHxMggc7RjzHC8SiCJZx+ugh/3LKDni9V
         M2csxEbCwiLv5Ztk2o3CQN/4mHgacjxAK1QhDQ77gm/V9zLyVpgBPg0PzGU03xahGEh3
         /BiZEb9E4A4Om9bbc5c7SPYA/4VV6Qzydw/NGnmob/PYw3OPLMXKpvO5fFnrgjOh9j9Q
         KQ+A==
X-Gm-Message-State: AO0yUKVDubbwrFx1eU9SPQrpBSaHbHHLYHZQredkD0eF/ritLSFc49uo
	aZrY2O5B/HS1NjkmXZxVHI/X9g==
X-Google-Smtp-Source: AK7set88AuX6ejtTeUpkVuYiIVeDjSz3hY6JSMWqIppvJBvfzaC26FemUOmCOTaRkYyk9DXQpBQS4g==
X-Received: by 2002:a17:906:1d01:b0:923:1714:b3d0 with SMTP id n1-20020a1709061d0100b009231714b3d0mr3219717ejh.19.1678626837477;
        Sun, 12 Mar 2023 06:13:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:57 -0700 (PDT)
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
Subject: [PATCH 17/28] media: platform: sun6i-mipi-csi2: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:07 +0100
Message-Id: <20230312131318.351173-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061358_054993_B2619915 
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
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLiAgVGhpcwphbHNvIGZpeGVz
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3VueGkvc3VuNmkt
bWlwaS1jc2kyL3N1bjZpX21pcGlfY3NpMi5jOjc1MTozNDogZXJyb3I6IOKAmHN1bjZpX21pcGlf
Y3NpMl9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29u
c3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3Vu
eGkvc3VuNmktbWlwaS1jc2kyL3N1bjZpX21pcGlfY3NpMi5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9zdW54aS9zdW42aS1taXBpLWNzaTIvc3VuNmlfbWlwaV9jc2kyLmMgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3N1bnhpL3N1bjZpLW1pcGktY3NpMi9zdW42aV9taXBpX2Nz
aTIuYwppbmRleCBhMjIwY2U4NDliNDEuLjA4NTFiNmI0ZTFmZiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9zdW54aS9zdW42aS1taXBpLWNzaTIvc3VuNmlfbWlwaV9jc2kyLmMK
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdW54aS9zdW42aS1taXBpLWNzaTIvc3VuNmlf
bWlwaV9jc2kyLmMKQEAgLTc1OSw3ICs3NTksNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBzdW42aV9taXBpX2NzaTJfcGxhdGZvcm1fZHJpdmVyID0gewogCS5yZW1vdmUJPSBzdW42
aV9taXBpX2NzaTJfcmVtb3ZlLAogCS5kcml2ZXIJPSB7CiAJCS5uYW1lCQk9IFNVTjZJX01JUElf
Q1NJMl9OQU1FLAotCQkub2ZfbWF0Y2hfdGFibGUJPSBvZl9tYXRjaF9wdHIoc3VuNmlfbWlwaV9j
c2kyX29mX21hdGNoKSwKKwkJLm9mX21hdGNoX3RhYmxlCT0gc3VuNmlfbWlwaV9jc2kyX29mX21h
dGNoLAogCQkucG0JCT0gJnN1bjZpX21pcGlfY3NpMl9wbV9vcHMsCiAJfSwKIH07Ci0tIAoyLjM0
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
