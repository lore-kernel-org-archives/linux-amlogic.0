Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F95C36010
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZ1P6sTz38vi5JJgo/jSOC+1KiqKTn0Z4sNtIOYSMIA=; b=i1GR5uoVirOCca
	QGDKdOXfzqwgbPe0sRjOcOcVAXlhuZ2/3aP7UUGLdiI+OZjG+eS9Y/+vasexu2jO8v8L2ZFNrTczK
	Ikq/PUlHkiNt99BidR7VRMY2ewhqqmCl6EByL4VhKAFh5jREaVVW91zebY0y5/8+JqyHyVjHrq/k6
	teT7X79cXf1lbhzKWVUpvNkp0B33Xzbc6BUf/fTXVptiBm7Ka9PhHiJOg+QtM+uSavEAoBwGOSmID
	d2mpXVqkxRy+lq8ywB+gFVJkQWcoY0TKUTNLiCWrYOKFTqkXwAA02aLLl+s+S54O1FUB3DKkO8kHe
	UWDYkwAg5PkTlFhk4uvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJa-000000025PB-2KXd;
	Mon, 07 Apr 2025 21:47:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1s8N-00000001orE-1gLc;
	Mon, 07 Apr 2025 19:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cjEt/IPzaAdKLiLHC8nJ5ihJ1fjZFnzeMJstnBzp7XQ=; b=WNfTXju/J+uQEFb71+wGkU7uTO
	lEP6eHOaRDzTh3qLjRqAfnGM6fHND/o3GN8b+yXKxHdSx0nvDr6EGDcrDq6nJW1p4bZuwS8z7AcOm
	2wWmNDtURDi43mPRmnKRM6+h6F02F25Rh6Xi4PJ6As8/s6KKopMqqKYT6g1TxNuwnfAsa5yPZxF1W
	DYQ51qMzX+brwujfsaXQYLZ52TK0/zmwATyhtb2fofpXR7XJyJdco80PCkVrVfLitc/TaZNiA7KKT
	j506dIJnR170KpmTofNel0cdtsCivy2FC4BYqGIhOCVhEw13ujtG0VWB7bAZqxvrzI5NAPlsaF/FE
	tO4ok1fg==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1s8K-0000000885B-0kXO;
	Mon, 07 Apr 2025 19:27:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37D604421F;
	Mon,  7 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744054065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjEt/IPzaAdKLiLHC8nJ5ihJ1fjZFnzeMJstnBzp7XQ=;
	b=Gi+8MJKk54bvu0U11jHOJw08NvtnpAzunZzJXO4mlFlnzsLVy8DFQIv5f1cwemOl31f/in
	yXq1Um8EF62nuW+7K5/FANGhJKfIDt3FpxkAeF2Uw52NGHGgsgSLt5hId5UF1i3v6U7LiQ
	QV71SvnJzRB4Bv9Y0pBT6LtPqcjAci3aXj9uPyPUUIhwMeK2lXlaYCBe0svd+nHK7Htak4
	/9HotCk7aCwdmAu+N82j0bdVIG/9XNextLdkUXD3MPHCRUDF3rNzBb5f+B2kzx0rN1agcB
	y2M7EU6B7HGxiOcK1BDKg9fGTg+UZIk8/GVGNr8AJuzWT4pQ2/Cw+JF6m2DEKA==
Date: Mon, 7 Apr 2025 21:27:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, LKML
 <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 02/34] platform: arm64: acer-aspire1-ec: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250407212739.1e991b6a@booty>
In-Reply-To: <a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
	<20250407-drm-bridge-convert-to-alloc-api-v1-2-42113ff8d9c0@bootlin.com>
	<a9000632-a6d1-d369-c317-9ee73aa645dc@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddtuedtfefgueehiefhjeeiffekudfhgfdtledvffekhfegteduieejveevteehnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeefpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_202748_372309_68140329 
X-CRM114-Status: GOOD (  21.60  )
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

SGVsbG8gSWxwbywKCk9uIE1vbiwgNyBBcHIgMjAyNSAxOTo0Njo1OSArMDMwMCAoRUVTVCkKSWxw
byBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gT24g
TW9uLCA3IEFwciAyMDI1LCBMdWNhIENlcmVzb2xpIHdyb3RlOgo+IAo+ID4gVGhpcyBpcyB0aGUg
bmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KPiA+IAo+ID4gLS0t
Cj4gPiAKPiA+IENjOiAiQnJ5YW4gTydEb25vZ2h1ZSIgPGJyeWFuLm9kb25vZ2h1ZUBsaW5hcm8u
b3JnPgo+ID4gQ2M6ICJJbHBvIErDpHJ2aW5lbiIgPGlscG8uamFydmluZW5AbGludXguaW50ZWwu
Y29tPgo+ID4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL3BsYXRmb3JtL2FybTY0L2FjZXItYXNwaXJlMS1lYy5jIHwgNyArKystLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvYWNlci1hc3BpcmUxLWVj
LmMgYi9kcml2ZXJzL3BsYXRmb3JtL2FybTY0L2FjZXItYXNwaXJlMS1lYy5jCj4gPiBpbmRleCA5
NThmZTFiZjVmODViYjY5YWM3OTYyZjIxN2RlOWYwYjQwY2RlOWExLi40Mzg1MzJhMDQ3ZTY4Nzk5
YWM1M2ExNmE0YzgxM2ZjMTZiZTk5N2I5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wbGF0Zm9y
bS9hcm02NC9hY2VyLWFzcGlyZTEtZWMuYwo+ID4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS9hcm02
NC9hY2VyLWFzcGlyZTEtZWMuYwo+ID4gQEAgLTQ1Miw5ICs0NTIsOSBAQCBzdGF0aWMgaW50IGFz
cGlyZV9lY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ID4gIAlpbnQgcmV0Owo+
ID4gIAl1OCB0bXA7Cj4gPiAgCj4gPiAtCWVjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpl
YyksIEdGUF9LRVJORUwpOwo+ID4gLQlpZiAoIWVjKQo+ID4gLQkJcmV0dXJuIC1FTk9NRU07Cj4g
PiArCWVjID0gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKGRldiwgc3RydWN0IGFzcGlyZV9lYywgYnJp
ZGdlLCAmYXNwaXJlX2VjX2JyaWRnZV9mdW5jcyk7Cj4gPiArCWlmIChJU19FUlIoZWMpKQo+ID4g
KwkJcmV0dXJuIFBUUl9FUlIoZWMpOwo+ID4gIAo+ID4gIAllYy0+Y2xpZW50ID0gY2xpZW50Owo+
ID4gIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBlYyk7Cj4gPiBAQCAtNDk3LDcgKzQ5Nyw2
IEBAIHN0YXRpYyBpbnQgYXNwaXJlX2VjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQp
Cj4gPiAgCWZ3bm9kZSA9IGRldmljZV9nZXRfbmFtZWRfY2hpbGRfbm9kZShkZXYsICJjb25uZWN0
b3IiKTsKPiA+ICAJaWYgKGZ3bm9kZSkgewo+ID4gIAkJSU5JVF9XT1JLKCZlYy0+d29yaywgYXNw
aXJlX2VjX2JyaWRnZV91cGRhdGVfaHBkX3dvcmspOwo+ID4gLQkJZWMtPmJyaWRnZS5mdW5jcyA9
ICZhc3BpcmVfZWNfYnJpZGdlX2Z1bmNzOwo+ID4gIAkJZWMtPmJyaWRnZS5vZl9ub2RlID0gdG9f
b2Zfbm9kZShmd25vZGUpOwo+ID4gIAkJZWMtPmJyaWRnZS5vcHMgPSBEUk1fQlJJREdFX09QX0hQ
RDsKPiA+ICAJCWVjLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9VU0I7ICAKPiAK
PiBIaSBMdWNhLAo+IAo+IEl0IHRvb2sgYSB3aGlsZSB0byBsb2NhdGUgd2hlcmUgdGhlIGNvZGUg
Zm9yIHRoZSBuZXcgaGVscGVyIGlzLiBJIHN1Z2dlc3QgCj4gaWYgeW91IG5lZWQgc2VuZCBhbm90
aGVyIHZlcnNpb24gb2YgdGhlIHNlcmllcyBkaXJlY3RseSBsaW5raW5nIHRvIHRoZSAKPiBjb21t
aXQgaW4gdGhlIGNvdmVyIGxldHRlciBzbyB0aGF0IGl0IHdvbid0IHRha2UgbXVsdGlwbGUgaG9v
cHMgdG8gZmluZCBpdCAKPiBpZiBvbmUgd2FudHMgdG8gcmV2aWV3IHRoZSBjb2RlIGFuZCBpcyBu
b3QgaGF2aW5nIGFsbCBkcm0gdHJlZXMgZWFzaWx5IGF0IAo+IGhhbmQuIEhlcmUgaXQgaXMgZm9y
IHRoZSBiZW5lZml0IG9mIG90aGVyIHBkeDg2IHBlb3BsZToKPiAKPiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL21pc2Mva2VybmVsLy0vY29tbWl0LzBjYzZhYWRkN2ZjMWU2Mjli
NzE1ZWEzZDFiYTUzN2VmMmRhOTVlZWMKCkFwb2xvZ2llcywgaW5kZWVkIHlvdSBoYXZlIGEgZ29v
ZCBwb2ludC4gSSBhZGRlZCB0aGUgbGluayB0byB0aGUgY292ZXIKbGV0dGVyIHNvIGl0IHdpbGwg
YmUgaW4gdjIsIGlmIGFueS4KCj4gQWNrZWQtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZp
bmVuQGxpbnV4LmludGVsLmNvbT4KClRoYW5rcyEKCj4gSSBhc3N1bWUgeW91IHdhbnQgdGhpcyB0
byBnbyB0aHJvdWdoIHRoZSBkcm0gdHJlZSB3aGVyZSB0aGUgaGVscGVyIGFscmVhZHkgCj4gaXM/
CgpNWSBiZXN0IGd1ZXNzIGlzIHRoYXQgZHJtLW1pc2MtbmV4dCBpcyB0aGUgYXBwcm9wcmlhdGUg
YnJhbmNoLCBhbmQgaXQKaXMgd2hlcmUgdGhlIGhlbHBlciBpcyBhbHJlYWR5IHByZXNlbnQsIGJ1
dCBJJ2xsIGxldCBtYWludGFpbmVycyBkZWNpZGUKd2hhdCBpcyBtb3N0IGFwcHJvcHJpYXRlLgoK
THVjYQoKLS0gCkx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
