Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA7C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPxFvGParLAjnt1Wyu96piniK72Nale2VAdsZpyNy+g=; b=M9SjC/cvn5sTyA
	SvHbk4fHt+vfVzGH+bHwDOVp8n1QFTtMDbSilSxW9s6WV+T3bAkm6Cz6C6qnpbkavSWgBmUHLt4y9
	acJNaEJX1SZqkrJ8YEVzO0s/6x5seGcj4ibFEsFtH219eWGCNXY2eGJjs9EZqKcpnnqgEi4yskBME
	KUB1EK9Zn56diX9UhBTWC3LG+5f3n0kNlR+LPp7God9eEi4U/9qYcRg6TPeMIWtBUTZhwmzCdFaEY
	iKjK3rETkkmYNzKiJlC4+ntWWgFmC3JF7pu3l1/t9EnhfCk0zTmNy5xUhcm2sDKldXSvAPZuR8n6x
	ZWqm3cCn6buZFtTRsZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjRN-006CFt-4F; Mon, 13 Mar 2023 14:46:21 +0000
Received: from gofer.mess.org ([88.97.38.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjR8-006C7c-6R; Mon, 13 Mar 2023 14:46:09 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
	id A56CC100072; Mon, 13 Mar 2023 14:45:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1678718756; bh=SPJRtiBE7xPZNdaMyjvNHQcheMbaGg07J1nGRebzO/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZu0MaM6/9PwI7AHozOATv7eGrTxNeV50Xoh89ZkGO4ifvbHdiz18hxsTuO/yLBco
	 9XadZ5vQD/DCbTF+8ZCCrWVgbfwELO3+bhsRDfRZEP3XCnCdTlA/+qzrzBIM/QgLhn
	 3MsOUVw3ALieLxUWWnzkKQAbfC4XdR/jypFaqKaPqX+AMIYNQoD3RGO9diwJt3l/rR
	 8/M03eGACPOFX5yRWWdRx364KxUAzgP4zSnkbvTm88278RJo4hf21KruaTd2mshojs
	 lvbuEpw1LHJzQZuGzTNuD6VhZYm0203UhIP1ruuNkyMgJfsOvIXoa6UUNIVM8u/4db
	 6hxECZ1Wh78wQ==
Date: Mon, 13 Mar 2023 14:45:56 +0000
From: Sean Young <sean@mess.org>
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 05/28] media: rc: gpio-ir-tx: drop of_match_ptr for ID
 table
Message-ID: <ZA83JBcG46hjPp5w@gofer.mess.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230312131318.351173-5-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_074606_398255_CCB4BBDB 
X-CRM114-Status: GOOD (  19.03  )
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

T24gU3VuLCBNYXIgMTIsIDIwMjMgYXQgMDI6MTI6NTVQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgZHJpdmVyIGNhbiBtYXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUg
c28gdGhlIHRhYmxlIHNob3VsZCBiZSBhbHdheXMKPiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRy
IGRvZXMgbm90IGhhdmUgYW55IHNlbnNlICh0aGlzIGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGlu
ZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUp
LiAgVGhpcwo+IGFsc28gZml4ZXMgIUNPTkZJR19PRiBlcnJvcjoKPiAKPiAgIGRyaXZlcnMvbWVk
aWEvcmMvZ3Bpby1pci10eC5jOjI0OjM0OiBlcnJvcjog4oCYZ3Bpb19pcl90eF9vZl9tYXRjaOKA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+
IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mub3JnPgoK
VGhhbmtzClNlYW4KCj4gLS0tCj4gIGRyaXZlcnMvbWVkaWEvcmMvZ3Bpby1pci10eC5jIHwgMiAr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9yYy9ncGlvLWlyLXR4LmMgYi9kcml2ZXJzL21lZGlh
L3JjL2dwaW8taXItdHguYwo+IGluZGV4IDJiODI5YzE0NmRiMS4uMWE4ZmVhMzU3ZjE0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcmMvZ3Bpby1pci10eC5jCj4gKysrIGIvZHJpdmVycy9t
ZWRpYS9yYy9ncGlvLWlyLXR4LmMKPiBAQCAtMTk5LDcgKzE5OSw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIGdwaW9faXJfdHhfZHJpdmVyID0gewo+ICAJLnByb2JlCT0gZ3Bpb19p
cl90eF9wcm9iZSwKPiAgCS5kcml2ZXIgPSB7Cj4gIAkJLm5hbWUJPSBEUklWRVJfTkFNRSwKPiAt
CQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoZ3Bpb19pcl90eF9vZl9tYXRjaCksCj4g
KwkJLm9mX21hdGNoX3RhYmxlID0gZ3Bpb19pcl90eF9vZl9tYXRjaCwKPiAgCX0sCj4gIH07Cj4g
IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZ3Bpb19pcl90eF9kcml2ZXIpOwo+IC0tIAo+IDIuMzQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
