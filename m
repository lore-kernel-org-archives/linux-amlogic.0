Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8074C6FD19
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Mar 2023 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekNv1Ib9P5CEvbg9T3L1drPYbTBSmC85r2HvbmEVavA=; b=TP0dAlRKjv2vXe
	fndH1iIre5AFBTAz1HrjFI5Lmi89j+DbYEWCanzzTRBtqyIyoLfk4H7JWjm9J2wK459kfcImOGBcE
	BDA8cxpDbEfcr+oRSdmDcPGfd77kMQte8jcqsvFMMsTTqOlekQcihoKhLQORDL57asgEg+vgt4oDX
	QqDc3x52Rdxgl8wFKOJAmOSSPBDFtLXF6W4Bv89jtotiN+vA+u4Ryva8sepRyqjPH8xDVHsSnbLQ2
	ztZtrQM5oajz2cjUWBjCaoA8jcfQICTQEdb9BNeuo3RjV8LdLmxVXl9Sl3DSkOB9ihUZlspzBChED
	91zJec95YfsForW2cYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM2d-002X62-8P; Sun, 12 Mar 2023 13:47:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM0c-002W4q-Bj; Sun, 12 Mar 2023 13:45:12 +0000
Received: from pendragon.ideasonboard.com (85-76-21-162-nat.elisa-mobile.fi [85.76.21.162])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36404D5F;
	Sun, 12 Mar 2023 14:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1678628709;
	bh=Zge1++nlY4nQwaZw6hX8CIUKOyEq8hcIOLjF6pHDcZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJZ//ZHE3EbQS8Y4lNXhTDBZP4Jjk20f3KPF//qHiq3BrXlTY/FD66fPC10Hvt2+w
	 wHFbQfPcoD3oSwVMGOQUvrcnSdbypRP2LNA6j52wT64JJA/QzIyTJmopOinHD5nKiW
	 ejmyEBAuYy3NuXFkDNOql56IcKUI3wPSj4tTVzEM=
Date: Sun, 12 Mar 2023 15:44:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 26/28] media: i2c: imx290: drop of_match_ptr for ID table
Message-ID: <20230312134456.GN2545@pendragon.ideasonboard.com>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-26-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230312131318.351173-26-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_064510_617323_A40109FD 
X-CRM114-Status: GOOD (  19.21  )
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

SGkgS3J6eXN6dG9mLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIE1hciAxMiwg
MjAyMyBhdCAwMjoxMzoxNlBNICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IFRo
ZSBkcml2ZXIgY2FuIG1hdGNoIG9ubHkgdmlhIHRoZSBEVCB0YWJsZSBzbyB0aGUgdGFibGUgc2hv
dWxkIGJlIGFsd2F5cwo+IHVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQo+IG1hdGNoaW5nIHZpYSBQUlAwMDAxLCBl
dmVuIHRob3VnaCBpdCBtaWdodCBub3QgYmUgcmVsZXZhbnQgaGVyZSkuICBUaGlzCj4gYWxzbyBm
aXhlcyAhQ09ORklHX09GIGVycm9yOgo+IAo+ICAgZHJpdmVycy9tZWRpYS9pMmMvaW14MjkwLmM6
MTM1NDozNDogZXJyb3I6IOKAmGlteDI5MF9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNl
ZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+IAo+IFNpZ25lZC1vZmYtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KClJldmll
d2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+Cgo+IC0tLQo+ICBkcml2ZXJzL21lZGlhL2kyYy9pbXgyOTAuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvaTJjL2lteDI5MC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvaW14MjkwLmMK
PiBpbmRleCA0OWQ2YzhiZGVjNDEuLjNjOTQ3MGZiZmQ1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L21lZGlhL2kyYy9pbXgyOTAuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI5MC5jCj4g
QEAgLTEzNjMsNyArMTM2Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBpbXgyOTBfaTJj
X2RyaXZlciA9IHsKPiAgCS5kcml2ZXIgPSB7Cj4gIAkJLm5hbWUgID0gImlteDI5MCIsCj4gIAkJ
LnBtID0gJmlteDI5MF9wbV9vcHMsCj4gLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRy
KGlteDI5MF9vZl9tYXRjaCksCj4gKwkJLm9mX21hdGNoX3RhYmxlID0gaW14MjkwX29mX21hdGNo
LAo+ICAJfSwKPiAgfTsKPiAgCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
