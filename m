Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F948C3DA7F
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2024 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoLHc0uJsujl0mXbyxga6N+ri1ncyfiAAjOpQNcWU/4=; b=4W+YrV6czg5PQG
	V7m/ddeXY+3/735BnCffHpsKnP1oVWUQmB3w6QpGupoI1Vq5ZEs4yX+W4GeZB4ngg9Zw8JyZr10bm
	y8HxTLmcrwcHREBw0uqQ2i26XIQmB5yDNh0y+1gl+o0HnILO6oG5Ohes7h1ykZYvQw8W7YYeMJuov
	itb3N2UIfBEEvvmN/LNLU3/+f+MTjUJdcoERQI+ZWbZffoqPZfOa7xNfKnpwvo1xcOazE3fALJ1Z/
	dGwaz6f4SXbFvgUShXSY4zLuD7O+CW5yQcRkBw/fIaivGd53xEyNSysi7rzpkUU8NMOUux521ED5A
	tjOjkyGis+byF4OUZU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRPu-0000000HT0w-1d2A;
	Mon, 12 Aug 2024 09:32:42 +0000
Received: from mx.astralinux.ru ([89.232.161.68])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdRPl-0000000HSpb-2jFC;
	Mon, 12 Aug 2024 09:32:40 +0000
Received: from [10.177.185.108] (helo=new-mail.astralinux.ru)
	by mx.astralinux.ru with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <abelova@astralinux.ru>)
	id 1sdROV-005gCi-Cp; Mon, 12 Aug 2024 12:31:15 +0300
Received: from [10.177.20.58] (unknown [10.177.20.58])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4Wj8RZ4dDkz1gwbf;
	Mon, 12 Aug 2024 12:31:54 +0300 (MSK)
Message-ID: <bb45ed80-7871-47ba-a1fd-ee71dc21a409@astralinux.ru>
Date: Mon, 12 Aug 2024 12:30:57 +0300
MIME-Version: 1.0
User-Agent: RuPost Desktop
Subject: Re: [PATCH] drm/meson: add check to prevent dereference of NULL
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240809124725.17956-1-abelova@astralinux.ru>
 <CAFBinCATiUnR=P9VRBxWeQhf49k6PVxK+nU95G7w94f-mR2HWQ@mail.gmail.com>
Content-Language: ru
From: Anastasia Belova <abelova@astralinux.ru>
In-Reply-To: <CAFBinCATiUnR=P9VRBxWeQhf49k6PVxK+nU95G7w94f-mR2HWQ@mail.gmail.com>
X-DrWeb-SpamScore: 0
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttderjeenucfhrhhomheptehnrghsthgrshhirgcuuegvlhhovhgruceorggsvghlohhvrgesrghsthhrrghlihhnuhigrdhruheqnecuggftrfgrthhtvghrnhepvdegleehkeejueehledvhffhuefhieejudevvdejtdeukefghffgveegteeikeeunecukfhppedutddrudejjedrvddtrdehkeenucfrrghrrghmpehhvghloheplgdutddrudejjedrvddtrdehkegnpdhinhgvthepuddtrddujeejrddvtddrheekmeegudeftdeipdhmrghilhhfrhhomheprggsvghlohhvrgesrghsthhrrghlihhnuhigrdhruhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepmhgrrhhtihhnrdgslhhumhgvnhhsthhinhhglhesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhope
 grihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehjsghruhhnvghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqrghmlhhoghhitgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhrghenucffrhdrhggvsgcutehnthhishhprghmmecunecuvfgrghhsme
X-DrWeb-SpamVersion: Dr.Web Antispam 1.0.7.202406240#1723449779#02
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128, SE: 11.1.12.2210241838, Core engine: 7.00.65.05230, Virus records: 12102994, Updated: 2024-Aug-12 08:00:48 UTC]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_023233_751368_9AA6FA78 
X-CRM114-Status: GOOD (  17.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWFydGluLAoKCjEwLzA4LzI0IDEyOjA5LCBNYXJ0aW4gQmx1bWVuc3RpbmdsINC/0LjR
iNC10YI6Cj4gSGVsbG8gQW5hc3Rhc2lhLAo+Cj4gVGhhbmsgeW91IGZvciB3b3JraW5nIG9uIHRo
aXMhCj4KPiBPbiBGcmksIEF1ZyA5LCAyMDI0IGF0IDI6NDjigK9QTSBBbmFzdGFzaWEgQmVsb3Zh
IDxhYmVsb3ZhQGFzdHJhbGludXgucnU+IHdyb3RlOgo+IFsuLi5dCj4+IEBAIC0zNzMsOSArMzcz
LDExIEBAIHN0YXRpYyBpbnQgbWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2UgKmRl
diwgYm9vbCBoYXNfY29tcG9uZW50cykKPj4gICBmcmVlX2RybToKPj4gICAgICAgICAgZHJtX2Rl
dl9wdXQoZHJtKTsKPj4KPj4gLSAgICAgICBtZXNvbl9lbmNvZGVyX2RzaV9yZW1vdmUocHJpdik7
Cj4+IC0gICAgICAgbWVzb25fZW5jb2Rlcl9oZG1pX3JlbW92ZShwcml2KTsKPj4gLSAgICAgICBt
ZXNvbl9lbmNvZGVyX2N2YnNfcmVtb3ZlKHByaXYpOwo+PiArICAgICAgIGlmIChwcml2KSB7Cj4+
ICsgICAgICAgICAgICAgICBtZXNvbl9lbmNvZGVyX2RzaV9yZW1vdmUocHJpdik7Cj4+ICsgICAg
ICAgICAgICAgICBtZXNvbl9lbmNvZGVyX2hkbWlfcmVtb3ZlKHByaXYpOwo+PiArICAgICAgICAg
ICAgICAgbWVzb25fZW5jb2Rlcl9jdmJzX3JlbW92ZShwcml2KTsKPj4gKyAgICAgICB9Cj4gVGhp
cyBpcyB0aGUgc3RyYWlnaHQtZm9yd2FyZCBhcHByb2FjaC4KPgo+IFRoZXJlJ3MgYmVlbiBjb252
ZXJzaW9ucyBmcm9tIG5vbi1kZXZtXyBmdW5jdGlvbnMgdG8gdGhlaXIgZGV2bV8qCj4gY291bnRl
cnBhcnRzIGluIHRoZSBwYXN0IGluIHZhcmlvdXMgc3Vic3lzdGVtcy4KPiBJIGp1c3QgZm91bmQg
dGhhdCB0aGVyZSdzIGEgZGV2bV9kcm1fZGV2X2FsbG9jKCkgd2hpY2ggc2VlbXMgdG8gYmUKPiBj
YWxsaW5nIGRybV9kZXZfcHV0KCkgYXV0b21hdGljYWxseSAtIGJ1dCBJIGhhdmUgbmV2ZXIgdXNl
ZCBpdCBteXNlbGYKPiBiZWZvcmUuCj4gQXMgYW4gYWx0ZXJuYXRpdmUgdG8geW91ciBzdWdnZXN0
ZWQgYXBwcm9hY2g6IGNvdWxkIHlvdSBwbGVhc2UgbG9vawo+IGludG8gd2hldGhlciBkZXZtX2Ry
bV9kZXZfYWxsb2MoKSBpcyBhIHN1aXRhYmxlIHJlcGxhY2VtZW50IChpZiBub3Q6Cj4ganVzdCBl
eHBsYWluIHdoeSAtIHRoZW4gdGhpcyBwYXRjaCBpcyBnb29kIHRvIGJlIG1lcmdlZCk/CgpJZiBJ
IHVuZGVyc3Rvb2QgY29ycmVjdGx5LCBkZXZtX2RybV9kZXZfYWxsb2MgYWxsb3dzIHRvIGRlbGV0
ZSBkcm1fZGV2X3B1dApmcm9tIGVycm9yIHBhdGggaW4gbWVzb25fZHJ2X2JpbmRfbWFzdGVyIGFu
ZCBpbiBtZXNvbl9kcnZfdW5iaW5kLgoKVGhlbiB0aGUgcHJvcG9zZWQgY2hlY2sgbWF5IGJlIG9t
bWl0ZWQgYW5kIGZ1bmN0aW9uIG1heSBqdXN0IHJldHVybgppbnN0ZWFkIG9mIGp1bXBpbmcgdG8g
ZnJlZV9kcm0uCgpBbmQgd291bGQgaXQgYmUgYmV0dGVyIHRvIHJlbmFtZSBmcmVlX2RybSB0byBy
ZW1vdmVfZW5jb2RlcnM/CgpUaGFuayB5b3UsCkFuYXN0YXNpYSBCZWxvdmEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
