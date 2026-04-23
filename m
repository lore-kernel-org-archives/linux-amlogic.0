Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EADFDEE38
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 17:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHJl4f3kYKwJ4WXRYYXzHHDcyhxnLex+O0XMtgd8Yf4=; b=3+o4Ve6lSC0+UU
	NZ/SasiITbaKezWLo9V6oxXaSV7vK3FiMXUnvox0KWy2L+EPOO0MzC+qHRxJiJYGey3jA5PzAzb65
	sCs0/mFhRDi1WQAbVlRqrHLcj2MX8JuGS4Fi/ZAtZc5TWDgbyjR6BYZ8fcHv3Tr5foyJKsSAfuVBQ
	QUqFSRJbYt0hBFTrgdZTeZf8tcwYhP8bjSn09J0hL6TJMBQOPAE7t7Rxpdj0D8cVUDYsh0DiBdCtl
	raHcDbMtYZAMNvpAQCVgyH+7SdWMloqTXpSAW0WDx1yxbrTNWaugv65JJpU7uYziiNrmFn0o8QJq2
	j+XD6UJHmj7w+K2GToMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyKv-0000000C5Zy-2pUQ;
	Thu, 23 Apr 2026 17:59:37 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyKt-0000000C5Yg-2DxO;
	Thu, 23 Apr 2026 17:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1776967168;
	bh=QGXWKH7JhojDk/vCfoesF6wdkbcwasz+b8TzqgsvnEY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VidnwjpKlxAHpZXdZ5M8HqNp1+KLzj/lVqpTUjnVCvvI0AlMOvy6xLPjbVADW6Z7T
	 zX2omNSMnvzMFu+5OaTkic3YSw0JBpTj1pMqKOxAH5KG+vq/PHkgVXLcKBhtSsGmGS
	 Vrdc/osIcU6MzDXs3blATAtRvZpS57uE18zfDmjI=
Message-ID: <6bdce57340942334cf7d3c7f7ed0215458717495.camel@crapouillou.net>
Subject: Re: [PATCH v2 10/41] drm/ingenic: remove now-redundant call to
 drm_connector_attach_encoder()
From: Paul Cercueil <paul@crapouillou.net>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, Douglas
 Anderson <dianders@chromium.org>, Laurentiu Palcu	
 <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Frank
 Li	 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Philipp Zabel	 <p.zabel@pengutronix.de>, Anitha Chrisanthus
 <anitha.chrisanthus@intel.com>,  Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Kevin Hilman
 <khilman@baylibre.com>,  Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Clark	
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul	 <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?=	 <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Thierry Reding	 <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han
 <jingoohan1@gmail.com>,  Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park	 <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham	
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven	
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Biju Das	
 <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, Stefan Agner	
 <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek	
 <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 	linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	freedreno@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, 	linux-tegra@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-renesas-soc@vger.kernel.org
Date: Thu, 23 Apr 2026 19:59:21 +0200
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-10-2ae6ca69b390@bootlin.com>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
	 <20260423-drm-bridge-connector-attach_encoder-v2-10-2ae6ca69b390@bootlin.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_105936_039950_FA501F06 
X-CRM114-Status: GOOD (  11.39  )
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

SGkgTHVjYSwKCkxlIGpldWRpIDIzIGF2cmlsIDIwMjYgw6AgMTE6MTcgKzAyMDAsIEx1Y2EgQ2Vy
ZXNvbGkgYSDDqWNyaXTCoDoKPiBkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKCkgaXMgbm93
IGNhbGxlZCBieQo+IGRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQoKS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPgoKQWNrZWQtYnk6
IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PgoKQ2hlZXJzLAotUGF1bAoKPiAt
LS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLWRydi5jIHwgMiAtLQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLWRydi5jCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aW5nZW5pYy9pbmdlbmljLWRybS1kcnYuYwo+IGluZGV4IDQwNjgxMTRhZGY4Yy4uNzAwODhkYjM0
ZjY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLWRy
di5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0tZHJ2LmMKPiBA
QCAtMTMzMCw4ICsxMzMwLDYgQEAgc3RhdGljIGludCBpbmdlbmljX2RybV9iaW5kKHN0cnVjdCBk
ZXZpY2UgKmRldiwKPiBib29sIGhhc19jb21wb25lbnRzKQo+IMKgCQkJcmV0ID0gUFRSX0VSUihj
b25uZWN0b3IpOwo+IMKgCQkJZ290byBlcnJfZHJ2ZGF0YTsKPiDCoAkJfQo+IC0KPiAtCQlkcm1f
Y29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2Rlcik7Cj4gwqAJfQo+IMKg
Cj4gwqAJZHJtX2Zvcl9lYWNoX2VuY29kZXIoZW5jb2RlciwgZHJtKSB7CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
