Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16724C6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwbFrfcbhbRdLjhShIp7hdF0hyt04eJ7lSbxEH4CugY=; b=hg8ZOSNi42+jZ7
	UkDPlcWq1PdblId+yT3KpZy7wHx8sgbFtgrsoFp6l4qNPUQnSuUdTWxiE3OnpfgR0RaU79MgLJmwT
	oexEM1u6NgL3iiggwAqsR9PtyZ36bclcH4/UrSwLpV/fKehRMQRgxWkCyXqyocgs1ThdnHcig7/eR
	DPFE6a827yWLxmThvGaWfip4JVHzl1eHzPPe/kd5wueORZ/2z181/mH0sharNQQbYV8571KVUIkZ0
	+L3ZUmtDcjZXJIVl91aT2mXCG0HqYzjD/Qe6vgSx0tLpjmrUJYvIXMEyDQaCaJ9LLzl4ERg2Zfw5O
	0hMMeu1hzld9GSn4U+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbghj-005Wj4-0v; Mon, 13 Mar 2023 11:51:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgdc-005UtO-TR; Mon, 13 Mar 2023 11:46:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7C55EB8104F;
	Mon, 13 Mar 2023 11:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF14C433D2;
	Mon, 13 Mar 2023 11:46:38 +0000 (UTC)
Message-ID: <6f3f5ae4-393a-e25f-997f-c1450cd506b1@xs4all.nl>
Date: Mon, 13 Mar 2023 12:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/28] media: cec: meson: drop of_match_ptr for ID table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joe Tessler <jrt@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
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
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-2-krzysztof.kozlowski@linaro.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230312131318.351173-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_044649_326677_24829488 
X-CRM114-Status: GOOD (  20.05  )
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

T24gMTIvMDMvMjAyMyAxNDoxMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBUaGUgZHJp
dmVyIGNhbiBtYXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUgc28gdGhlIHRhYmxlIHNob3VsZCBi
ZSBhbHdheXMKPiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRyIGRvZXMgbm90IGhhdmUgYW55IHNl
bnNlICh0aGlzIGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZlbiB0
aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+IAo+ICAgZHJpdmVycy9tZWRp
YS9jZWMvcGxhdGZvcm0vbWVzb24vYW8tY2VjLmM6NzExOjM0OiBlcnJvcjog4oCYbWVzb25fYW9f
Y2VjX29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25z
dC12YXJpYWJsZT1dCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IEhhbnMgVmVya3VpbCA8
aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgoKVGhhbmtzIQoKCUhhbnMKCj4gLS0tCj4gIGRyaXZl
cnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29uL2FvLWNlYy5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24vYW8tY2VjLmMgYi9kcml2ZXJzL21lZGlhL2Nl
Yy9wbGF0Zm9ybS9tZXNvbi9hby1jZWMuYwo+IGluZGV4IDZiNDQwZjA2MzVkOS4uMjIzYzA5MmRi
YjZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL21lc29uL2FvLWNl
Yy5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZvcm0vbWVzb24vYW8tY2VjLmMKPiBA
QCAtNzE5LDcgKzcxOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX2Fv
X2NlY19kcml2ZXIgPSB7Cj4gIAkucmVtb3ZlICA9IG1lc29uX2FvX2NlY19yZW1vdmUsCj4gIAku
ZHJpdmVyICA9IHsKPiAgCQkubmFtZSA9ICJtZXNvbi1hby1jZWMiLAo+IC0JCS5vZl9tYXRjaF90
YWJsZSA9IG9mX21hdGNoX3B0cihtZXNvbl9hb19jZWNfb2ZfbWF0Y2gpLAo+ICsJCS5vZl9tYXRj
aF90YWJsZSA9IG1lc29uX2FvX2NlY19vZl9tYXRjaCwKPiAgCX0sCj4gIH07Cj4gIAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
