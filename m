Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA35C6FD19
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAyGc4LRdYOnRBaC/6bx85bZksf6Wnt7bj71tNqhmNM=; b=BjuYPgehNvOof2
	B4Vlj9UENIfVSoVYS1/FOMXfetZfqNMCIWwpf/zhyvguXkXQ0qPmENEHUgS9F+C7v/S7RFVCYhXMX
	Ld5OWJaMvQlCh54429IZExRPTBjfFGr/3MDsSIdJ1kTR3maW048JeTfHuPR0mEpzTJl5ufDeYc5Gw
	rYfF1XsHNC1P6nKQsAeuDM9jgKcS+j779l2G9/a83L+piNJydTN5IzX8SApEe3rtauoV+va0/Zir6
	Bj8qJln3xqZki0Rv44cIbIjA77lq0ADwRM02RieMRhP0ut77KixmkNRLgHhp/xuWkRAdI+73Mq+yu
	ZnaT1ZhpuNcvXlXB2ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM5q-002YvU-PO; Sun, 12 Mar 2023 13:50:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1L-002WUD-Rd
	for linux-amlogic@bombadil.infradead.org; Sun, 12 Mar 2023 13:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k/JwivpSWSUp7SGgg579h7vvWa7gXoSaXDjfT9QxQC0=; b=UIPXTQJbv8guwspbWAKGQP5cPv
	mnYy6GJJNI+pmCqREaJVcoLvYMteBo+2fRMZSMue5Q+GCKO6QcJFbQmcQF5B+p77w0HvO/xiqVp19
	1ihDRNrGRlQ01357wyFtAOD1GxfxwVSrCxmaplpF/ygl9oUrK53h+MQclNRgYxoMGjZVl9EypXHv9
	qhwI7rQ5VnXz6wNQXzK9aYpNJzG4/vHxkDTGkEPlab+Zp61na/JT0EGbYKkoL0IaPTx0ihddb2T3G
	Qg9kLFhHJFdIT6bJPrnecOy9aQ3uFfOtjF56V7v2DeckW1RiVuCYc8wWFx5ziJWojpxMMLmS4tq+L
	stV8neFA==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWh-0011GB-0N
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cn21so8317169edb.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Mar 2023 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/JwivpSWSUp7SGgg579h7vvWa7gXoSaXDjfT9QxQC0=;
        b=CXU5Sft4Qo94NqQz3mPSkb9P2d9WUUzBRab27MBYfCDp4zAJtkVa4U2gt8ruuAK2fx
         bYmi5lZFbKvFh7jAiwga20LHYuPZuLJ6WwFDw37JcecknQr1EZ6tbXpKsSHrRFM6dH42
         G9jmlFKCdF2j0PJTIZv91TvmWvYmxJetJ5eGnZpcumSgmaLtlgm4+ONduSKLc+F6aFmS
         2wbtsxeM7XjreClsKD102rjyRJhh1sgoZRixqozGJ4sff/5C87OVnI8gkQkfEaJBXzHN
         PLG7p5dhHufbK/Jk1Kg16Rh8G+p1NrvtMOVierX90bJ5vpXVZA5+RMdYqOUEGm66DbRf
         t+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/JwivpSWSUp7SGgg579h7vvWa7gXoSaXDjfT9QxQC0=;
        b=5ShYWNzibp8BTOrwCsbkObJAxLjO+Dulb0Lf9P6sBaL2YqTHUtx+qLQ8J/p/cyY1v9
         V0kuqQFIe/nTbcEepKx73KU+t5Rdi8J95uLBYGSrNX+hENK+UIlOrLESHExE9QHIXRQV
         U1KAVDmwyoz9xD+VyANzBtBBPp1fAnC3x7gm4FEicrRAyw2T+h4VchVH/dmLcwLyfUEL
         R1HqEc7U9EDOcV4kUF/fPiMIDBfEdDd/aAH/cMvEhQXTiFVII7DvVTUdHtBnQHAwoKuE
         58yZwJHngM4y/WCxZQAFY8uAXFW63x0eCG44Imy3PJbDQzycw8mM+AuCWJnVmIsn/mNb
         PlVQ==
X-Gm-Message-State: AO0yUKXENz2F9JB5hlRPUIGDJqhgHLcRxq1ATzFWd4PXwj3wq6b3z9NW
	mUemF0vj2dkqqk4GgsAHiveLTA==
X-Google-Smtp-Source: AK7set9d5tKP82Jz7WZKOjVJ2kxKgLrUjVcq5llmdVffKX9VOgz87qa4igqTtbGBsn15XQe1Xo+erA==
X-Received: by 2002:a17:906:5ca:b0:8f6:ad32:cd51 with SMTP id t10-20020a17090605ca00b008f6ad32cd51mr35131755ejt.62.1678626854759;
        Sun, 12 Mar 2023 06:14:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:14 -0700 (PDT)
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
Subject: [PATCH 26/28] media: i2c: imx290: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:16 +0100
Message-Id: <20230312131318.351173-26-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131427_701036_BC645CFA 
X-CRM114-Status: GOOD (  14.46  )
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
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvbWVkaWEvaTJjL2lteDI5MC5jOjEzNTQ6MzQ6
IGVycm9yOiDigJhpbXgyOTBfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJy
b3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL21lZGlh
L2kyYy9pbXgyOTAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI5MC5jIGIvZHJp
dmVycy9tZWRpYS9pMmMvaW14MjkwLmMKaW5kZXggNDlkNmM4YmRlYzQxLi4zYzk0NzBmYmZkNTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI5MC5jCisrKyBiL2RyaXZlcnMvbWVk
aWEvaTJjL2lteDI5MC5jCkBAIC0xMzYzLDcgKzEzNjMsNyBAQCBzdGF0aWMgc3RydWN0IGkyY19k
cml2ZXIgaW14MjkwX2kyY19kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgID0gImlt
eDI5MCIsCiAJCS5wbSA9ICZpbXgyOTBfcG1fb3BzLAotCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9t
YXRjaF9wdHIoaW14MjkwX29mX21hdGNoKSwKKwkJLm9mX21hdGNoX3RhYmxlID0gaW14MjkwX29m
X21hdGNoLAogCX0sCiB9OwogCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
