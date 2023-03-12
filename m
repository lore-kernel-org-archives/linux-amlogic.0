Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBEFC6FA99
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxwJIsEfX3+/NtXA9LF6+WQ7jqVLbhvDU3ZkS6kSuk4=; b=ysB+V/9F/lBy1t
	xkwvcHYXalott3jVCyDa0Qr3rMJkc9rbCYdWidcwSwCW1m7L8dWibr1/qvj6vSss2pMlz9sJEY7kE
	/OTo/XOBDPz3Bk3hrQp0aly1FXnuuivJ8oPCnAJzvqxHfm+8h45m8nckCWlU7fMLVsDOr8t5BIhGi
	fl+DGJWWrgp2VgA/L3weT3ovucsMmLOABtsmT05gBQ4D6tws5Fuln69TpoFEcPB2LxS+RBiTNnXaM
	raC5B9/34pNxdk9bEeKfwoQ5fj3txshiGsSRJ9maYyZBUJ3qFQRDa53sUTFmVwCu1ZTNPD8BT9O3A
	wAHjoUjyD4GkqLfKoNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM5D-002YXn-KP; Sun, 12 Mar 2023 13:49:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1F-002WPp-Ku
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=; b=M3x6iELScjQ4p6EeejzIMN/hq+
	eqsXZwXNvOMxtDAq7h9Mrw0apaZkMXs++7tgV7bxBojkNcnjC8XGdYiZnUzth/tjJM1pJbClkd6uH
	gsgn0kOHqFqOkFa3CffjZ2Uztx1Vt0xuchMQcVae3GxuTl8ctkueoGMa0l/sD4BHiH9IWrWnc451S
	UKSHXMKNGZy3A4s++t0x3gJQoT0v67Ng0sN6J6jJHLuLWq3DmQZzqd5Jk4BwLw7g0YPkP3ky8YvDF
	20dSsTDRaTVBA92mfooCcm+6qRdQxT0H7pKM4/luAhnXpSKhEDYYmmFpzHd4F3zVUERVadQxuS5T4
	7fua7QTQ==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWH-0011C2-2i
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:01 +0000
Received: by mail-ed1-x531.google.com with SMTP id er25so10369890edb.5
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=YAxPlJhF1+DE9jUIWYyITWyk7/AONuibeqeBOgc+dWF5fRBbLmZqbk1IYqYlHABI85
         gz1wXPUZjU5FC3mPpXfAfbwnto9A2C8UR5j79ptmQvXc8NIm93NUj7vnZscY32eF5vOQ
         MNqXBlnv4ABmODy3pYii1yEyd13GeBgb4NroSTWOAXhnpEoT/yi4gqdHK3skNRal/Ae+
         3cMpgvlN2t9T17SYFpZKlQ7VLMYX986I32TaxVNtQfKWUgod+jAHKsvNHdpkbRKt4aYk
         B2uanB4ZtOcer65Igqf0RJ3h8hJb/2Xmwgp0Xi2cgPElJofc8L4SdOxvKNLQznQt+/k0
         yqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FklNTrfw75FQnVJC7no5/FQCPZiirAS85g1dWyaYnQ0=;
        b=utb9W91V4g5V3ZP8I7bgcq0hh1hyGb4LEDo7FCV0rp7U6ckK4IDLrc/fmNg7zEGuEf
         VTilCV7Zv4JhTp+same8yVCb+rEKO9G3GG6tPGzBPJGDTkfcP+VaMOyM6foMjwkkm0GI
         gqRxNqyLwP+EdLnO5QjQwZvIUK3rqXyDXAAIXVJnZ58l+uXEtvSkp9Sim2Dmt6J/in25
         NCZ37KR59WQspujL2n7HoB0Wwu7xi0eU7vPVnLKQRXnwbxfi9UbomABTJgjR3+3EKp9d
         Qr2AAymzF0CcfhsYysKBBBLZxH3MXOubkWzqUrVDfWBJJd/QVexDI0S8+OJfuTjt61pr
         ObtA==
X-Gm-Message-State: AO0yUKXtHt30fqZAXJEFPON1ky0P+wVSHj6iVNzt3JHZyFm5nEjPwDV1
	4Tf0icVB5fsPxx1jqXljvidrvA==
X-Google-Smtp-Source: AK7set+1VMb4vP5AkQiutwwyqAr2RuSDyquikjNxXi+uMI4iRdw2RCO1AJJ8nzH1kwmE3q0OOnHeOw==
X-Received: by 2002:aa7:dbc8:0:b0:4f9:deb4:b97f with SMTP id v8-20020aa7dbc8000000b004f9deb4b97fmr5865130edt.13.1678626829419;
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:49 -0700 (PDT)
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
Subject: [PATCH 13/28] media: platform: marvell: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:03 +0100
Message-Id: <20230312131318.351173-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131357_645789_DA2B8180 
X-CRM114-Status: GOOD (  14.83  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWFydmVsbC9tbXAt
ZHJpdmVyLmM6MzY0OjM0OiBlcnJvcjog4oCYbW1wY2FtX29mX21hdGNo4oCZIGRlZmluZWQgYnV0
IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tYXJ2ZWxsL21tcC1kcml2ZXIuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWFydmVsbC9tbXAtZHJpdmVyLmMgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21hcnZlbGwvbW1wLWRyaXZlci5jCmluZGV4IGVmMjJiZjhmMjc2Yy4uYjc3
NDdjN2JhZTQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21hcnZlbGwvbW1w
LWRyaXZlci5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWFydmVsbC9tbXAtZHJpdmVy
LmMKQEAgLTM3Miw3ICszNzIsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtbXBj
YW1fZHJpdmVyID0gewogCS5yZW1vdmUJCT0gbW1wY2FtX3BsYXRmb3JtX3JlbW92ZSwKIAkuZHJp
dmVyID0gewogCQkubmFtZQk9ICJtbXAtY2FtZXJhIiwKLQkJLm9mX21hdGNoX3RhYmxlID0gb2Zf
bWF0Y2hfcHRyKG1tcGNhbV9vZl9tYXRjaCksCisJCS5vZl9tYXRjaF90YWJsZSA9IG1tcGNhbV9v
Zl9tYXRjaCwKIAkJLnBtID0gJm1tcGNhbV9wbV9vcHMsCiAJfQogfTsKLS0gCjIuMzQuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
