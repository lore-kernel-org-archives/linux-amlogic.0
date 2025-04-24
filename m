Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F14C369AB
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Apr 2025 19:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3UZt//4g6t4nqGPJptDInLCYD0K3JApLTOzeGRWjXs=; b=xcxP3RmqjZvfk0
	TIvENIjB2I9XmI6ZOVdUNhw/J71v8cmiDwXEudMI5PAdUNfuZ2EpHgJNndHhNOyJqbqwzgSAIRsOM
	FXznspxSK+sqlmOcSZ+CE5QRnFKnGiky/ILc3oFsfGoRaIM9pXgRqSjpSS8Yi3Xi7MIuaVfVVF7gv
	e7hG5xizP9boRMKl6Ffucd/EuVyBC1vENvQ/lZzf4XmbRjWkTXkkBchZf5SPphjz7tFWPV+q9Lprc
	4clPN1NGmFOuExmm/yuazYk8WL925vYKA7khqpzKD5LzdxpYM1woT+USSVupTx6PRqhTnS6QGsZ6n
	DXMboeFcmHldCIHwieBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82ae-0000000FEvc-1RKd;
	Thu, 24 Apr 2025 19:50:32 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81p3-0000000F6fM-0D1F;
	Thu, 24 Apr 2025 19:01:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A6C64439D;
	Thu, 24 Apr 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/6Zj+wUweRTx+VHVK1CTlVxOlTH40bx6xBYT/U2MxM=;
	b=gQDDO6peFD+MeoI/74dTBBtnqibz0ajwpOD6hA379Dlwkj8gyJ1ZuG4Joul5jS46/Bcmwe
	6tZhghLt8TzyEA9SQi0+HGiTKpHKM/GWIYwv3tqz2h9qm3bN9y/FLbaSwcxepoGlcUIy+p
	AcIktOmce3cZK3joICgcRsf1c5HGqeUQqvAEcLPXHO3rKvnhH7JePomK23u6cKK27GXoZF
	4i63+MMSbHHZac4oeLP/LHROm8sys3wsU5lOXfpQn9fXZLK3fYA2rjt0brvZBz2tIFIoms
	yrt97216v1rEf1bGQ+5Vyw/QLeWnpqyNTrc7oZ82yNjcr4Oub8dwXSlWv4eD3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:34 +0200
Subject: [PATCH v2 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
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
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopegurghvvgdrshhtvghvvghnshhonhesrhgrshhpsggvrhhrhihpihdrtghom
 hdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_120121_218043_D215A200 
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

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KClRoaXMgZHJp
dmVyIGFscmVhZHkgaW1wbGVtZW50cyByZWZjb3VudGluZyBvZiB0aGUgc3RydWN0IHZjNF9kc2ks
IHdoaWNoCmVtYmVkcyBzdHJ1Y3QgZHJtX2JyaWRnZS4gTm93IHRoaXMgaXMgYSBkdXBsaWNhdGUg
b2YgdGhlIHJlZmNvdW50aW5nCmltcGxlbWVudGVkIGJ5IHRoZSBEUk0gYnJpZGdlIGNvcmUsIHNv
IGNvbnZlcnQgdGhlIHZjNF9kc2lfZ2V0L3B1dCgpIGNhbGxzCmludG8gZHJtX2JyaWRnZV9nZXQv
cHV0KCkgY2FsbHMgYW5kIGdldCByaWQgb2YgdGhlIGRyaXZlci1zcGVjaWZpYwpyZWZjb3VudGlu
ZyBpbXBsZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+CgotLS0KCkNjOiAiTWHDrXJhIENhbmFsIiA8bWNhbmFsQGlnYWxp
YS5jb20+CkNjOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29t
PgpDYzogUmFzcGJlcnJ5IFBpIEtlcm5lbCBNYWludGVuYW5jZSA8a2VybmVsLWxpc3RAcmFzcGJl
cnJ5cGkuY29tPgoKQ2hhbmdlZCBpbiB2MjoKLSBmaXggZXJyb3IgY29kZSBjaGVja2luZwotLS0K
IGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jIHwgMzQgKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHNpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kc2kuYwppbmRleCBlZmM2ZjYwNzhiMDI2NzY0YzU5Y2ZiMmEz
M2IyOGE4OGI3MDE4YzNhLi40NThlNWQ5ODc5NjQ1ZjE4YmNiY2FlZWI3MWI1ZjEwMzhmOTU4MWRh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kc2kuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9kc2kuYwpAQCAtNTUyLDggKzU1Miw2IEBAIHN0cnVjdCB2YzRfZHNp
IHsKIAlzdHJ1Y3QgdmM0X2VuY29kZXIgZW5jb2RlcjsKIAlzdHJ1Y3QgbWlwaV9kc2lfaG9zdCBk
c2lfaG9zdDsKIAotCXN0cnVjdCBrcmVmIGtyZWY7Ci0KIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2OwogCiAJc3RydWN0IGRybV9icmlkZ2UgKm91dF9icmlkZ2U7CkBAIC0xNjIyLDI5ICsx
NjIwLDExIEBAIHN0YXRpYyB2b2lkIHZjNF9kc2lfZG1hX2NoYW5fcmVsZWFzZSh2b2lkICpwdHIp
CiAJZHNpLT5yZWdfZG1hX2NoYW4gPSBOVUxMOwogfQogCi1zdGF0aWMgdm9pZCB2YzRfZHNpX3Jl
bGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCi17Ci0Jc3RydWN0IHZjNF9kc2kgKmRzaSA9Ci0JCWNv
bnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgdmM0X2RzaSwga3JlZik7Ci0KLQlrZnJlZShkc2kpOwot
fQotCi1zdGF0aWMgdm9pZCB2YzRfZHNpX2dldChzdHJ1Y3QgdmM0X2RzaSAqZHNpKQotewotCWty
ZWZfZ2V0KCZkc2ktPmtyZWYpOwotfQotCi1zdGF0aWMgdm9pZCB2YzRfZHNpX3B1dChzdHJ1Y3Qg
dmM0X2RzaSAqZHNpKQotewotCWtyZWZfcHV0KCZkc2ktPmtyZWYsICZ2YzRfZHNpX3JlbGVhc2Up
OwotfQotCiBzdGF0aWMgdm9pZCB2YzRfZHNpX3JlbGVhc2VfYWN0aW9uKHN0cnVjdCBkcm1fZGV2
aWNlICpkcm0sIHZvaWQgKnB0cikKIHsKIAlzdHJ1Y3QgdmM0X2RzaSAqZHNpID0gcHRyOwogCi0J
dmM0X2RzaV9wdXQoZHNpKTsKKwlkcm1fYnJpZGdlX3B1dCgmZHNpLT5icmlkZ2UpOwogfQogCiBz
dGF0aWMgaW50IHZjNF9kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciwgdm9pZCAqZGF0YSkKQEAgLTE2NTUsNyArMTYzNSw3IEBAIHN0YXRpYyBpbnQgdmM0
X2RzaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lk
ICpkYXRhKQogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciA9ICZkc2ktPmVuY29kZXIuYmFz
ZTsKIAlpbnQgcmV0OwogCi0JdmM0X2RzaV9nZXQoZHNpKTsKKwlkcm1fYnJpZGdlX2dldCgmZHNp
LT5icmlkZ2UpOwogCiAJcmV0ID0gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRybSwgdmM0X2Rz
aV9yZWxlYXNlX2FjdGlvbiwgZHNpKTsKIAlpZiAocmV0KQpAQCAtMTgxMCwxNSArMTc5MCwxMiBA
QCBzdGF0aWMgaW50IHZjNF9kc2lfZGV2X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgdmM0X2RzaSAq
ZHNpOwogCi0JZHNpID0ga3phbGxvYyhzaXplb2YoKmRzaSksIEdGUF9LRVJORUwpOwotCWlmICgh
ZHNpKQotCQlyZXR1cm4gLUVOT01FTTsKKwlkc2kgPSBkZXZtX2RybV9icmlkZ2VfYWxsb2MoJnBk
ZXYtPmRldiwgc3RydWN0IHZjNF9kc2ksIGJyaWRnZSwgJnZjNF9kc2lfYnJpZGdlX2Z1bmNzKTsK
KwlpZiAoSVNfRVJSKGRzaSkpCisJCXJldHVybiBQVFJfRVJSKGRzaSk7CiAJZGV2X3NldF9kcnZk
YXRhKGRldiwgZHNpKTsKIAotCWtyZWZfaW5pdCgmZHNpLT5rcmVmKTsKLQogCWRzaS0+cGRldiA9
IHBkZXY7Ci0JZHNpLT5icmlkZ2UuZnVuY3MgPSAmdmM0X2RzaV9icmlkZ2VfZnVuY3M7CiAjaWZk
ZWYgQ09ORklHX09GCiAJZHNpLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKICNlbmRp
ZgpAQCAtMTgzNiw3ICsxODEzLDYgQEAgc3RhdGljIHZvaWQgdmM0X2RzaV9kZXZfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IHZjNF9kc2kgKmRzaSA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwogCiAJbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmRzaV9o
b3N0KTsKLQl2YzRfZHNpX3B1dChkc2kpOwogfQogCiBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHZj
NF9kc2lfZHJpdmVyID0gewoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
