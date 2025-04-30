Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36730C3ABA9
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Apr 2025 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7n3y/1ylEb5fiN3/Pb9PUzUADZORbj7nK6uy7HOcWfk=; b=iE8tFQVJvgrmM5
	xX0dghX8Pje1676N+ZjMibB/1nsIihXZprLJH+SbOmHqfbgcAr7caS+zRY8066Y0J2UKvfFvNEH3A
	xwn8iUStMBJrG9XmdWl5M6Yng/R3Z5Wn0NoFJFMi0mYalOQPkIOeTTIjgjafJOTi+KD6jntsSmu9L
	A8b4wiLkRBN6G0cPzlCM+jBKogOXREwTuGr9esT25OnFtx53RE2pXiFjbWdyFXCjNnAjYTIVRKJ55
	agWrUyIiQ3C2nCc89eVhQCZpGaV2EpMs0pW040YQ5St60+S8OaxudbelpbVPQR+7CJScvZqp0vZqx
	FBrdN4cHK5DALDMcvjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAVy-0000000DSvl-1XuP;
	Wed, 30 Apr 2025 16:42:30 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAVu-0000000DSuv-2nQu;
	Wed, 30 Apr 2025 16:42:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BA1E43B4C;
	Wed, 30 Apr 2025 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746031343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpjn8puFQ4rZGChqXBtSZDUYu+Gnq25CP/ziHwcqLbg=;
	b=R78+NOp5gZIYtuRu5VllzkmYwx7C4ExRP6oGMuj+y1Pous6ww+7Ql2UM7ZVR3eAlcgxjhe
	EL8gclRNV+2dQKCHLAwdz+o8e56pdOmAiN7cV69NhlIZ1Qg0rsw+h7L9j1342ejfKdHVKD
	uE60s+5+nsGoETsCeR1S1VmV/agvwj5nqxaJnNF7Lp4/7VVVRHJA5YBJi9V4npOFPIuj/Y
	GYnhX6Vi++Zo8p3uGplK/jU12s6/vcqsRHpTUVKPOD8igRoMeiILoeJRB7IcyZ7wXP/otR
	dWt4vNk84a/q5dbz7ZmTEiiyrfsjSALHZCtQKQ9krgHLd9WIsAwh58D1xVRdnQ==
Date: Wed, 30 Apr 2025 18:42:14 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Anusha
 Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Adam Ford <aford173@gmail.com>, Adrien Grassein
 <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, Andy
 Yan <andy.yan@rock-chips.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benson Leung
 <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph
 Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko
 Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne
 Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE
 <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang
 <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250430184214.0b53dc6b@booty>
In-Reply-To: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
	<20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
	<CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
	<20250430123557.3d8b1de4@booty>
	<CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepieekpdhrtghpthhtohepughirghnuggvrhhssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghru
 geskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_094227_467982_DCBE7E0F 
X-CRM114-Status: GOOD (  26.39  )
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

SGVsbG8gRG91ZywKCk9uIFdlZCwgMzAgQXByIDIwMjUgMDg6NTE6NTIgLTA3MDAKRG91ZyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKCj4gSGksCj4gCj4gT24gV2VkLCBB
cHIgMzAsIDIwMjUgYXQgMzozNuKAr0FNIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9v
dGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IEhlbGxvIERvdWcsCj4gPgo+ID4gT24gTW9uLCAyOCBB
cHIgMjAyNSAxMzo1OTo1MCAtMDcwMAo+ID4gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21p
dW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBbLi4uXQo+ID4gIAo+ID4gPiBSZXZpZXdlZC1ieTogRG91
Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiAjIHBhcmFkZS1wczg2NDAKPiA+
ID4gVGVzdGVkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+ICMg
cGFyYWRlLXBzODY0MCAgCj4gPgo+ID4gVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyEKPiA+Cj4g
PiBIb3dldmVyIEknbGwgYmUgc2VuZGluZyB2MyB3aXRoIHNvbWUgZGlmZmVyZW5jZXMgdy5yLnQu
IHYyLCBpbiBvcmRlciB0bwo+ID4gZml4IHRoZSAzIGJ1Z3MgcmVwb3J0ZWQgYnkgQW5keSBZYW4g
cGx1cyBhIHNpbWlsYXIgb25lIEkgc3BvdHRlZC4gVGhlCj4gPiBmaXgganVzdCBpcyByZXBsYWNp
bmcgUFRSX0VSUigpIHdpdGggRVJSX0NBU1QoKSBpbiB0aGUgNCBjYXNlcyB3aGVyZSB0aGUKPiA+
IGludm9sdmVkIGZ1bmN0aW9uIGlzIHJldHVybmluZyBhIHBvaW50ZXIgaW5zdGVhZCBvZiBhbiBp
bnQuCj4gPgo+ID4gWW91ciByZXZpZXcvdGVzdCB0YWdzIGFwcGVhciBnbG9iYWwgdG8gdGhlIHdo
b2xlIHBhdGNoLCB0aHVzIGJlaW5nIHRoZQo+ID4gcGF0Y2ggZGlmZmVyZW50IEkgdGhpbmsgSSBj
YW5ub3QgaW5jbHVkZSB5b3VyIHRhZ3MgaW4gdjMuCj4gPgo+ID4gTGV0IG1lIGtub3cgaWYgeW91
IHRoaW5rIEkgc2hvdWxkIGRvIGRpZmZlcmVudGx5Lgo+ID4KPiA+IFNvcnJ5IGFib3V0IHRoYXQu
ICAKPiAKPiBJdCdzIGZpbmUgaWYgeW91IHdhbnQgdG8gZHJvcCBteSB0YWcuIEkgZGlkbid0IGhh
dmUgdGltZSB0byByZXZpZXcgdGhlCj4gd2hvbGUgdGhpbmcgYnV0IEkgZmVsdCBsaWtlIEkgc2hv
dWxkIGF0IGxlYXN0IHJldmlldyB0aGUgZHJpdmVycyBJJ20KPiBzaWduZWQgdXAgYXMgYSByZXZp
ZXdlciBmb3IuIFRoYXQgYmVpbmcgc2FpZCwgSSdtIG5vdCBjb3VudGluZyB0YWdzIG9yCj4gYW55
dGhpbmcgc28gSSdtIG5vdCBvZmZlbmRlZCBpZiB0aGV5J3JlIGRyb3BwZWQuCj4gCj4gTXkgdW5k
ZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBoYXNodGFnIGF0IHRoZSBlbmQgaXMgYXQgbGVhc3QgYQo+
IHNlbWktc3RhbmRhcmQgd2F5IHRvIHNheSB0aGF0IG15IHRhZyBvbmx5IGFwcGxpZXMgdG8gYSBz
bWFsbCBwYXJ0IG9mCj4gdGhlIHBhdGNoLCBzbyBpdCBzZWVtcyBsaWtlIGl0IHdvdWxkIGJlIE9L
IHRvIGNhcnJ5IGl0LCB0aG91Z2guLi4KCk9oIGRlYXIuIEkgd2FzIHNvIHN0dXBpZC4gSSBoYWQg
bm90IHNlZW4gdGhlIGNvbW1lbnQgaW4geW91ciB0YWcKbGluZXMuLi4gOi18CgpTbyBpdCdzIGZp
bmUsIEknbGwga2VlcCB5b3VyIHRhZ3MgYXMgdGhlIHBhcmFkZSBkcml2ZXIgaXMgbm90IG1vZGlm
aWVkCmluIHYzLgoKU29ycnkgYWJvdXQgdGhlIG5vaXNlLgoKTHVjYQoKLS0gCkx1Y2EgQ2VyZXNv
bGksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
