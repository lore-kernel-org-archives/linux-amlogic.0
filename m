Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54E2C77B76
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 07:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7xd1CnTKIMbgtB2n/WAhzBw3pxogYbl1z8h2Ayua9Q=; b=1jA3jXfFvS3u43
	phpg5ylUXcBo0er4qrtbw2DfcssTt78ExurQNTawcO2o3T+f5BLCGI742LgO36ocYLJYK+1TURqf+
	onQEGjhqpFwI55OcN6a5HcNqwD35zIo0FQxYciL/xeARl6OF7VqutbEzpHfTS5XktClW8JYYS05m0
	9WubwP99uDwGNmZ5wMC8iknZYaTn3GKVR9hUbKGj7TxvuL4o+2YfILyyHEuysCCZ+fXkCASHZz1sH
	t63UQbTQbKeu+57531ChTk9Emj2hnfbF9eAjdrRpcHE/emypg9eT/riQRPomR77jxwrQ/WzJhhLJz
	dd0zRTG6ixQ4irJQfGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJUE-00FENx-2s;
	Mon, 17 Apr 2023 07:41:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poICt-00F1jF-1W;
	Mon, 17 Apr 2023 06:19:22 +0000
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B70CC75B;
	Mon, 17 Apr 2023 08:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1681712352;
	bh=hUS3oAOWF+giUHWBAsyfYtTSnpYPnmumb+DnGnesqJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+UHkgsqoMg+RbmFKgO/pKG4ltOgU+p0CEbmAeVPPRN4I/Z0MDEKluVIEqTeJBTh9
	 iHu44ev6JJI4FvruskDtoyatzHO41OXYRlqntM4853wlvujiEUW9lTQTFW+9URIaRu
	 Pthp2nfBkldHSvMHEeDw0JIfxddwHLTf+oIOMJpY=
Date: Mon, 17 Apr 2023 09:19:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-aspeed@lists.ozlabs.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benson Leung <bleung@chromium.org>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Rory Liu <hellojacky0226@hotmail.com>,
	Scott Chao <scott_chao@wistron.corp-partner.google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Ettore Chimenti <ek5.chimenti@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Antti Palosaari <crope@iki.fi>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>, Qiheng Lin <linqiheng@huawei.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Dan Carpenter <error27@gmail.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Benoit Parrot <bparrot@ti.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Michal Simek <michal.simek@xilinx.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Eduardo Valentin <edubezval@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Guenter Roeck <groeck@chromium.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jerome Brunet <jbrunet@baylibre.com>,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>, openbmc@lists.ozlabs.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
	linux-media@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Jeffery <andrew@aj.id.au>, linux-renesas-soc@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 000/117] media: Convert to platform remove callback
 returning void
Message-ID: <20230417061928.GD28551@pendragon.ideasonboard.com>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417060203.le3izz56wt73si6k@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_231919_683652_C88731EE 
X-CRM114-Status: GOOD (  24.99  )
X-Mailman-Approved-At: Mon, 17 Apr 2023 00:41:16 -0700
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

SGkgVXdlLAoKT24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMDg6MDI6MDNBTSArMDIwMCwgVXdlIEts
ZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gTWF1cm8KPiAKPiBPbiBTdW4sIE1hciAyNiwgMjAy
MyBhdCAwNDozMDoyNVBNICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+IEhlbGxv
LAo+ID4gCj4gPiB0aGlzIHNlcmllcyBhZGFwdHMgdGhlIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cg
ZHJpdmVycy9wY2kgdG8gdXNlIHRoZQo+IAo+IGNvcHkmcGFzdGUgZmFpbHVyZSBoZXJlOiBzL3Bj
aS9tZWRpYS8gb2YgY291cnNlLgo+IAo+ID4gLnJlbW92ZV9uZXcoKSBjYWxsYmFjay4gQ29tcGFy
ZWQgdG8gdGhlIHRyYWRpdGlvbmFsIC5yZW1vdmUoKSBjYWxsYmFjawo+ID4gLnJlbW92ZV9uZXco
KSByZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlIHRoZSBkcml2
ZXIgY29yZQo+ID4gZG9lc24ndCAoYW5kIGNhbm5vdCkgY29wZSBmb3IgZXJyb3JzIGR1cmluZyBy
ZW1vdmUuIFRoZSBvbmx5IGVmZmVjdCBvZiBhCj4gPiBub24temVybyByZXR1cm4gdmFsdWUgaW4g
LnJlbW92ZSgpIGlzIHRoYXQgdGhlIGRyaXZlciBjb3JlIGVtaXRzIGEgd2FybmluZy4gVGhlCj4g
PiBkZXZpY2UgaXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybiBmcm9tIC5yZW1v
dmUoKSB1c3VhbGx5IHlpZWxkcyBhCj4gPiByZXNvdXJjZSBsZWFrLgo+ID4gCj4gPiBCeSBjaGFu
Z2luZyB0aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNh
bm5vdAo+ID4gcmVhc29uYWJseSBhc3N1bWUgYW55IG1vcmUgdGhhdCB0aGVyZSBpcyBzb21lIGtp
bmQgb2YgY2xlYW51cCBsYXRlci4KPiA+IAo+ID4gT25seSB0aHJlZSBkcml2ZXJzIG5lZWRlZCBz
b21lIHByZXBhcmF0aW9uIGZpcnN0IHRvIG1ha2Ugc3VyZSB0aGV5Cj4gPiByZXR1cm4gMCB1bmNv
bmRpdGlvbmFsbHkgaW4gdGhlaXIgcmVtb3ZlIGNhbGxiYWNrLiBUaGVuIGFsbCBkcml2ZXJzCj4g
PiBjb3VsZCBiZSB0cml2aWFsbHkgY29udmVydGVkIHdpdGhvdXQgc2lkZSBlZmZlY3RzIHRvIC5y
ZW1vdmVfbmV3KCkuCj4gPiAKPiA+IFRoZSBjaGFuZ2VzIHRvIHRoZSBpbmRpdmlkdWFsIGRyaXZl
cnMgYXJlIGFsbCBvcnRob2dvbmFsLiBJZiBJIG5lZWQgdG8KPiA+IHJlc2VuZCBzb21lIHBhdGNo
ZXMgYmVjYXVzZSBvZiBzb21lIHJldmlldyBmZWVkYmFjaywgSSdkIGxpa2UgdG8gb25seQo+ID4g
c2VuZCB0aGUgcGF0Y2hlcyB0aGF0IGFjdHVhbGx5IG5lZWRlZCBjaGFuZ2VzLCBzbyBwbGVhc2Ug
cGljayB1cCB0aGUKPiA+IHJlbWFpbmluZyBwYXRjaGVzIHRoYXQgZG9uJ3QgbmVlZCBjaGFuZ2lu
ZyB0byByZWR1Y2UgdGhlIGFtb3VudCBvZiBtYWlsLgo+IAo+IEkgZGlkbid0IGhlYXIgYW55dGhp
bmcgYmFjayBhYm91dCBhcHBsaWNhdGlvbiBvZiB0aGlzIHNlcmllcy4gSXMgdGhlcmUgYQo+IGJs
b2NrZXIgc29tZXdoZXJlPwoKSSB0aGluayB0aGUgc2VyaWVzIGdvdCBhcHBsaWVkIHRvIHRoZSBt
YXN0ZXIgYnJhbmNoIG9mCmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9zdGFibGUvbGludXgtc3RhYmxlLmdpdC4KSXQgc2hvdWxkIHRodXMgYXBwZWFyIGluIHY2
LjQuCgpUaGUgY29ycmVzcG9uZGluZyBzZXJpZXMgZm9yIHN0YWdpbmcgbWVkaWEgZHJpdmVycyBo
YXMgYWxzbyBiZWVuIGFwcGxpZWQKdG8gdGhlIHNhbWUgYnJhbmNoIGFzIGZhciBhcyBJIGNhbiB0
ZWxsLgoKPiBBcGFydCBmcm9tIHRoZSB0aHJlZSBwcmVwYXJhdG9yeSBwYXRjaGVzIHRoYXQgYXJl
IGEgcHJlY29uZGl0aW9uIHRvIHRoZQo+IGNvbnZlcnNpb24gb2YgdGhlIHJlc3BlY3RpdmUgZHJp
dmVycywgdGhlIHBhdGNoZXMgYXJlIGFsbCBwYWlyd2lzZQo+IG9ydGhvZ29uYWwuIFNvIGZyb20g
bXkgUE9WIHRoZSBiZXN0IHdvdWxkIGJlIHRvIGFwcGx5IGFsbCBwYXRjaGVzIHRoYXQKPiBzdGls
bCBhcHBseSAod2hpY2ggbWlnaHQgYmUgYWxsKSwgSSB3aWxsIGNhcmUgZm9yIHRoZSBmYWxsb3V0
IGxhdGVyCj4gdGhlbi4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
