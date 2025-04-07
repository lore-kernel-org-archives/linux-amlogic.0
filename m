Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C5DC3601E
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Apr 2025 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWMkVBsvgLjwYVXV3kkzDJmcbdRTWTB/VQYy7kMbQY0=; b=3pV+rJouDOFwD9
	qhI8KEKhb17sVJFsLD8TR3bZYa+pLeOeFN5j7LQcZRDzgZ1hpTobsf3q2+0pQ9LQJ8bJY9HRGbRXP
	Cz97xG3LimVEHMpcPjtxJHOVfgu32qoasMnQzU2t4eqDw2NWT5k3OYkSTHe3ekYPoIojbxIBn4QZU
	iLCa42wDHAHVM20HZ36pnrqjFNqQjOxta89K7KWirzso6SWitnqXoTaOFp5F4Q2+qDirEPXJe6nCF
	1vJhKH6g3f9oNooDdOlol/kPk0SdPMHc2SziPyqkUflKwhRVJNvyh+dlxhWkPvqDtI4WwVCQxhwJE
	0Pd3a6Yn5I3TkD23SHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nTf-00000000jsZ-3EJl;
	Mon, 07 Apr 2025 14:29:31 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nOX-00000000hzS-19OP;
	Mon, 07 Apr 2025 14:24:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EA45443C1;
	Mon,  7 Apr 2025 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAMpzkdcu4YyVXcoriylpHMenEacmOqIz6YdxYu79ZI=;
	b=Wfrb62ueqx8DP1HYXxaflMLoLXVQDKpQVW2eYS2h4mc9l/ES7x52R1vQeSJpEZ0LQim7Tg
	CcOr9UWg4z1IcXQcrc5Qxb5Gesz+lsq6C0fvaqO60G0crMegAw2JAWQ6ehIlUTZGNbhmWa
	9qRIFuGoXSENuRnMsG1uQttxSugL6rcyEAXZlyHTKHMVZ9WTMxrNpbScipqGe1/ww3VSLr
	PEImoY8BsVjiWVoAKwkKVWhhuIeQZC3FcpYNyO4RhJZz5EKBms0IBYf+wsKxShuz9FYhQv
	ApOuhtEH2d1tZEY+pTzGkIBDBP/xQ1SMj1OqPO5cc5b9ZLV6vad3z+kpbHrenQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:18 +0200
Subject: [PATCH 03/34] drm/bridge: analogix-anx6345: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-3-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jani Nikula <jani.nikula@intel.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeeipdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhst
 hhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_072413_518461_1A7DCF43 
X-CRM114-Status: GOOD (  11.01  )
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KClNpZ25lZC1v
ZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+CgotLS0KCkNj
OiAiVXdlIEtsZWluZS1Lw7ZuaWciIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgpDYzog
QW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgpDYzogRG1pdHJ5IEJhcnlzaGtvdiA8
ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4KQ2M6IFN1aSBKaW5nZmVuZyA8c3VpLmppbmdmZW5nQGxpbnV4LmRl
dj4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUu
YyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeC1hbng2MzQ1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4
LWFueDYzNDUuYwppbmRleCBmMmJhZmE2Y2Y3Nzk1NmVjYWZjODdhYWUzYTJiNjg5MGJkYjM2Y2Zh
Li5mM2ZlNDdiMTJlZGNhMWY5MmRkZDMwNmQxNTJiZTE0NGRmNTY0OWI1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYwpAQCAtNjY0
LDkgKzY2NCwxMCBAQCBzdGF0aWMgaW50IGFueDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQpCiAJc3RydWN0IGRldmljZSAqZGV2OwogCWludCBpLCBlcnI7CiAKLQlhbng2
MzQ1ID0gZGV2bV9remFsbG9jKCZjbGllbnQtPmRldiwgc2l6ZW9mKCphbng2MzQ1KSwgR0ZQX0tF
Uk5FTCk7Ci0JaWYgKCFhbng2MzQ1KQotCQlyZXR1cm4gLUVOT01FTTsKKwlhbng2MzQ1ID0gZGV2
bV9kcm1fYnJpZGdlX2FsbG9jKCZjbGllbnQtPmRldiwgc3RydWN0IGFueDYzNDUsIGJyaWRnZSwK
KwkJCQkJJmFueDYzNDVfYnJpZGdlX2Z1bmNzKTsKKwlpZiAoSVNfRVJSKGFueDYzNDUpKQorCQly
ZXR1cm4gUFRSX0VSUihhbng2MzQ1KTsKIAogCW11dGV4X2luaXQoJmFueDYzNDUtPmxvY2spOwog
CkBAIC03MzgsNyArNzM5LDYgQEAgc3RhdGljIGludCBhbng2MzQ1X2kyY19wcm9iZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50KQogCS8qIExvb2sgZm9yIHN1cHBvcnRlZCBjaGlwIElEICovCiAJ
YW54NjM0NV9wb3dlcm9uKGFueDYzNDUpOwogCWlmIChhbng2MzQ1X2dldF9jaGlwX2lkKGFueDYz
NDUpKSB7Ci0JCWFueDYzNDUtPmJyaWRnZS5mdW5jcyA9ICZhbng2MzQ1X2JyaWRnZV9mdW5jczsK
IAkJZHJtX2JyaWRnZV9hZGQoJmFueDYzNDUtPmJyaWRnZSk7CiAKIAkJcmV0dXJuIDA7CgotLSAK
Mi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
