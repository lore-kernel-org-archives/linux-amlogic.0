Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A10C3DA7F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2024 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xgn6nIzriOQzbz2yOwx037yP3qpD17+cCbmmBdYALFg=; b=fAbgjybAnmSTsg
	P/hUFk30xn3wSREQV/rj2MQG4d8NieuV/WVZUHQ+BuPuw5gVm3YBFOmyNLSB6qjNLv3OQYKQBokU6
	ki38gIz0mcxYx8oDHesYmKGoS/6y0yEVLYq8uXhPpMSEt63L1povhbUZwqrsAdl7D+HhWyKtIdUWm
	nSsP2b9LMlRT/SIL42aBN1YjmHvntPCVJWDzRKaijnudRQJMoGM7clnojw7lfvjV/RNSHABVgID3i
	hOZj7uZVKiOlBe4FyjnJ//O4BZqPjWq3DbY68Zbt6VISOM3fnElAVR4jSi3zeKkg5JiBNXPUcFIIb
	c1svwnrVU5qDyTgOFoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb0FF-0000000GS94-10bc;
	Mon, 05 Aug 2024 16:07:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb0FB-0000000GS71-0HmY
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Aug 2024 16:07:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-428e0d18666so32959995e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2024 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722874050; x=1723478850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLnycLNpcQG5GUSmWzuFCsE23qxX0cM+qsqCFWzhcF4=;
        b=AhO55PbMEMmKHdhfHqg+wgSeaS2OOq1A4OxFWZeMTANkjeHHTuhcUfZedsANR/P1Ec
         rXTBmA07a/UYOjLxdXyMuRB/nbv5vw/Zg9xXmNCxzQgQzUNKQlGP1QY68LT1CV0PH23T
         /bD2EDi0jj+7luRkfK1bPQ1qqvsZsjvX0BBwTfh99tiBEEP+WoTOZoQYo44TEW7tG5LJ
         yJIN6828BFmLNcLE2zV0tmL+HXlpgM/5tEpTIyE/h3lvhJIlk+Lm5oCUdKjvbprRmpq3
         +Jk4Jpog9/7h1Lit5+H9ZlnaulfkLrJfVWxnZiYD94WmUSG5egIgN/0VEAygdHKY7TJL
         Dg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722874050; x=1723478850;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLnycLNpcQG5GUSmWzuFCsE23qxX0cM+qsqCFWzhcF4=;
        b=tL6daUf2clf2xD/dwWmwVQwG6ojjmvN49O6FHbW/o/4vkpMtJl3VRtjbwXtcJrCqaB
         VwJwFHcry+iT95otkcPZiB24MUCsc4wsSqaTMwP6tp/kau3mMMCNJ20v70dmb+/5JnGt
         BM2OBV6iFZKr7R409augrf160vbghCM3auJENSn8QKNU9zylbVPZ+YVaXQLKhnrLfSMt
         FNPZ/0XeyBzy0rR2delk4wTrtb2Y7yRrXClY+ezVcrwd+HeJlpHb6MDvetguTfL4vsah
         aNUiyhCBqvDm999Z5r4p5y7qJoO0bgErELPkcGYR8+5qF9FX/zvGg1G/kYk7uFYCJN4j
         YSxw==
X-Forwarded-Encrypted: i=1; AJvYcCW4fe5sbJpefLFOi/MzoogQqJD73gZA/yUxf9GPmp6Rjl75Ppo2DHQ3vs52jrhoF4/1/N/we+wMhuQOw7VU+U2uIbW3yH22Iyz3M+XIzo55QBc=
X-Gm-Message-State: AOJu0YyGP97Dgmog141JW93neXLZLpF/cGn7+MvxdlZz6fYXp1/ZcDbu
	+6FGRHBDeozowlADhQfbOLGD0oBjsE1b1DjLhHc+J2ILYgTEAM+v/V5P/gOJ7uw=
X-Google-Smtp-Source: AGHT+IF7E+JH5oT9xq8G5w8s8h2rAblTnJFziKMkgTgJWNnfhajr1VdmMfvwoBX7+IWMhH58JY1aHw==
X-Received: by 2002:a05:600c:a04:b0:426:6ea8:5037 with SMTP id 5b1f17b1804b1-428e6b93136mr74516395e9.37.1722874049736;
        Mon, 05 Aug 2024 09:07:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e06c:bc48:dc7f:827a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd169697sm10229385f8f.107.2024.08.05.09.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 09:07:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>,  linux-rt-users@vger.kernel.org,
  Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com,  Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <20240805153309.k_SfHw62@linutronix.de> (Sebastian Andrzej
	Siewior's message of "Mon, 5 Aug 2024 17:33:09 +0200")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
	<1j5xsow839.fsf@starbuckisacylon.baylibre.com>
	<7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
	<1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
	<20240805153309.k_SfHw62@linutronix.de>
Date: Mon, 05 Aug 2024 18:07:28 +0200
Message-ID: <1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_090733_184430_3CBB3D9E 
X-CRM114-Status: GOOD (  47.82  )
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

T24gTW9uIDA1IEF1ZyAyMDI0IGF0IDE3OjMzLCBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxi
aWdlYXN5QGxpbnV0cm9uaXguZGU+IHdyb3RlOgoKPiBPbiAyMDI0LTA3LTI5IDE3OjU3OjA1IFsr
MDIwMF0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+IE9uIE1vbiAyOSBKdWwgMjAyNCBhdCAxNjoy
OCwgTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiB3cm90ZToKPj4gCj4+ID4gT24gTW9u
LCBKdWwgMjksIDIwMjQgYXQgMDU6MDY6NTBQTSArMDIwMCwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4gPj4gT24gTW9uIDI5IEp1bCAyMDI0IGF0IDE1OjQ0LCBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOgo+PiA+Cj4+ID4+ID4gSSBkb24ndCByZWNhbGwgdGhpcyBjb21pbmcg
dXAgbXVjaCBUQkguICBJdCBtYXkgYmUgdGhhdCBwZW9wbGUganVzdCBzZXQKPj4gPj4gPiByYXcg
c3BpbmxvY2tzIHdoZW4gdGhleSBuZWVkIGl0LCBvciB0aGF0IHRoZXJlJ3Mgbm90IG1hbnkgcGVv
cGxlIHVzaW5nCj4+ID4+ID4gcmVsZXZhbnQgZGV2aWNlcyB3aXRoIFJUIGtlcm5lbHMuCj4+ID4K
Pj4gPj4gSSBoYXZlIG5vdCBiZWVuIHBsYXlpbmcgbXVjaCB3aXRoIFJUIFRCSCwgYnV0IEFGQUlL
LCB3aXRoIFJUIGlycQo+PiA+PiBoYW5kbGVycyBhcmUgdGhyZWFkZWQgdW5sZXNzIElSUUZfTk9f
VEhSRUFEIGlzIHNldC4gSW4gdGhpcyBjYXNlLAo+PiA+PiBzb21ldGhpbmcgcHJlZW1wdGlibGUg
aW4gdGhlIGhhbmRsZXIgc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0uCj4+ID4KPj4gPj4gVGhlIGF4
Zy1maWZvIGRyaXZlcnMgZG8gbm90IGhhdmUgSVJRRl9OT19USFJFQUQgc28gc29tZXRoaW5nIGlz
IGEgYml0Cj4+ID4+IHVuY2xlYXIgaGVyZS4KPj4gPgo+PiA+IFllYWgsIGl0J3MgZGVmaW5pdGVs
eSBsaWtlbHkgdG8gaGFwcGVuIGFsbCB0aGUgdGltZSBmb3IgcGVvcGxlIHVzaW5nIFJUCj4+ID4g
d2l0aCByZWxldmFudCBkZXZpY2VzLiAgSSdtIG5vdCBzdXJlIEkgaGF2ZSBhIGdvb2Qgc2Vuc2Ug
b2YgaWYgaXQncwo+PiA+IGxpa2VseSB0byBiZSBhIG5hc3R5IHN1cnByaXNlIHRvIHN3aXRjaCBy
YXcgc3BpbmxvY2tzIG9uIGJ5IGRlZmF1bHQgd2hlbgo+PiA+IGl0J3MgY3VycmVudGx5IGNvbnRy
b2xsYWJsZSwgSSdkIGV4cGVjdCBpdCdsbCBnZW5lcmFsbHkgYmUgZmluZSBidXQgaXQncwo+PiA+
IHBvc3NpYmx5IGEgYml0IHJ1ZGUgdG8gYW55IHVzZXJzIHRoYXQgZG9uJ3QgdXNlIGludGVycnVw
dHMuLi4KPj4gCj4+IEluZGVlZCBpdCBpcyBiaXQgcmFkaWNhbC4KPj4gCj4+IE15IGNvbmNlcm4g
d2l0aCB0aGlzIHBhdGNoIGlzIHRoYXQsIElJVUMsIHRoZSBoYW5kbGVyIHNob3VsZCBiZQo+PiB0
aHJlYWRlZCB1bmRlciBSVCBhbmQgdGhlcmUgc2hvdWxkIGJlIG5vIHByb2JsZW0gd2l0aCB0aGUg
c3BpbmxvY2sgQVBJLgo+PiAKPj4gQWRkaW5nIHRoZSBSVCBmb2xrcyB0byB0cnkgdG8gZ2V0IGEg
YmV0dGVyIHVuZGVyc3RhbmRpbmcsIHRoZXkgc2hvdWxkCj4+IGhhdmUgYmVlbiBDQ2VkIGFueXdh
eS4KPgo+IEknbSBub3Qgc3VyZSBpZiBtYWtpbmcgdGhlIGxvY2sgYSByYXdfc3BpbmxvY2tfdCBz
b2x2ZXMgYWxsIHRoZQo+IHByb2JsZW1zLiBUaGUgcmVnbWFwIGlzIHJlZ21hcF9tbWlvIHNvIGRp
cmVjdCBtZW1vcnktYWNjZXNzIGFuZCBsb29rcwo+IHNpbXBsZSBlbm91Z2ggdG8gZG8gc28uIElu
IHJlZ21hcF9tbWlvX3dyaXRlKCkgSSBzZWUgY2xrX2VuYWJsZSgpIGFuZAo+IGFuZCB0aGlzIHVz
ZXMgYSBzcGlubG9ja190IHNvIHdlIHNob3VsZCBiZSBiYWNrIGF0IHRoZSBzYW1lIHByb2JsZW0u
Cj4gVGhlcmUgbWlnaHQgYmUgYW4gYWRkaXRpb25hbCBwcm9ibGVtIGlmIHJlZy1jYWNoaW5nIGlz
IGVuYWJsZWQuCgpIaSBTZWJhc3RpYW4sCgpUaGFua3MgYSBsb3QgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byBkaWcgaW50byB0aGUgZHJpdmVyIHNwZWNpZmljcy4KVGhlIElSUSBoYW5kbGVyIGlzIGFj
dHVhbGx5IG5vdCBhd2Z1bGx5IGNyaXRpY2FsIGluIHRoaXMgY2FzZS4gVGhlIEhXCndpbGwgY29u
dGludWUgdG8gcnVuIHJlZ2FyZGxlc3Mgb2YgdGhlIElSUSBiZWluZyBhY2tlZCBvciBub3QKClRo
ZSBwdXJwb3NlIG9mIHRoZSBoYW5kbGVyIGlzIG1haW5seSB0byBsZXQgQWxzYSBrbm93IHRoYXQg
MSAob3IgbW9yZSkKcGVyaW9kIGlzIHJlYWR5LiBJZiBhbHNhIGlzIHRvbyBzbG93IHRvIHJlYWN0
LCBhbmQgdGhlIGJ1ZmZlciBhbGxvd3MKanVzdCBhIGZldyBwZXJpb2RzLCB0aGUgSFcgbWF5IHVu
ZGVyL292ZXJmbG93IHRoZSBidWZmZXIuCgpJUlFGX09ORVNIT1QgaXMgZmluZSBiZWNhdXNlIHNu
ZF9wY21fcGVyaW9kX2VsYXBzZWQoKSAnbm90aWZpZXMnCmFsbCBwYXN0IHBlcmlvZHMsIG5vdCBq
dXN0IG9uZS4gVGhlIGlycSBoYW5kbGVyIGRvZXMgbm90IG5lZWQgdG8KcnVuIGFnYWluIHVudGls
IHRoaXMgZnVuY3Rpb24gaGFzIGJlZW4gY2FsbGVkLiBJdCBhbHNvIGhlbHBzIGlmIHRoZQpwZXJp
b2QgaXMgcmlkaWN1bG91c2x5IHNtYWxsLCB0byB0cnkgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2Yg
SVJRcy4KCj4KPiBMZXQgbWUgcHJvcG9zZSB0d28gYWx0ZXJuYXRpdmVzOgo+ICMxOiBXaHkgdHdv
IGhhbmRsZXJzIGlmIHdlIGhhdmUgSVJRRl9PTkVTSE9UIGFuZCB0aGUgcHJpbWFyeSBkb2VzIGFs
bW9zdAo+ICAgICBub3RoaW5nLiBBc3N1bWluZyB0aGUgdGhyZWFkIGlzIGFsd2F5cyB3b2tlbiB1
cCBhbmQgdGhlICJ1bmV4cGVjdGVkCj4gICAgIGlycSIgY2FzZSBkb2VzIG5vdCBoYXBwZW4uIElm
IHNvLCB3aHkgbm90OgoKVGhhdCB3YXMgbWFpbmx5IHRoZXJlIGZvciBpbml0aWFsIGRlYnVnZ2lu
Zy4gSXQgZG9lcyBub3QgaGFwcGVuICh5ZXQpLgoKPgo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
bWVzb24vYXhnLWZpZm8uYyBiL3NvdW5kL3NvYy9tZXNvbi9heGctZmlmby5jCj4gaW5kZXggN2U2
MDkwYWY3MjBiOS4uNjBhZjA1YTNjYWQ2YiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvbWVzb24v
YXhnLWZpZm8uYwo+ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9heGctZmlmby5jCj4gQEAgLTIyMCw5
ICsyMjAsMjEgQEAgc3RhdGljIGlycXJldHVybl90IGF4Z19maWZvX3BjbV9pcnFfYmxvY2soaW50
IGlycSwgdm9pZCAqZGV2X2lkKQo+ICBzdGF0aWMgaXJxcmV0dXJuX3QgYXhnX2ZpZm9fcGNtX2ly
cV9ibG9ja190aHJlYWQoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ICB7Cj4gIAlzdHJ1Y3Qgc25k
X3BjbV9zdWJzdHJlYW0gKnNzID0gZGV2X2lkOwo+ICsJc3RydWN0IGF4Z19maWZvICpmaWZvID0g
YXhnX2ZpZm9fZGF0YShzcyk7Cj4gKwl1bnNpZ25lZCBpbnQgc3RhdHVzOwo+ICsKPiArCXJlZ21h
cF9yZWFkKGZpZm8tPm1hcCwgRklGT19TVEFUVVMxLCAmc3RhdHVzKTsKPiArCXN0YXR1cyA9IEZJ
RUxEX0dFVChTVEFUVVMxX0lOVF9TVFMsIHN0YXR1cyk7Cj4gKwo+ICsJLyogVXNlIHRoZSB0aHJl
YWQgdG8gY2FsbCBwZXJpb2QgZWxhcHNlZCBvbiBub25hdG9taWMgbGlua3MgKi8KPiArCWlmICgh
KHN0YXR1cyAmIEZJRk9fSU5UX0NPVU5UX1JFUEVBVCkpIHsKPiArCQlkZXZfZGJnKGF4Z19maWZv
X2RldihzcyksICJ1bmV4cGVjdGVkIGlycSAtIFNUUyAweCUwMnhcbiIsCj4gKwkJCXN0YXR1cyk7
Cj4gKwkJcmV0dXJuIElSUV9OT05FOwo+ICsJfQo+ICsJYXhnX2ZpZm9fYWNrX2lycShmaWZvLCBz
dGF0dXMpOwo+ICAKPiAgCXNuZF9wY21fcGVyaW9kX2VsYXBzZWQoc3MpOwo+IC0KPiAgCXJldHVy
biBJUlFfSEFORExFRDsKPiAgfQo+ICAKPiBAQCAtMjUxLDkgKzI2Myw5IEBAIGludCBheGdfZmlm
b19wY21fb3BlbihzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPiAgCWlmIChy
ZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlyZXQgPSByZXF1ZXN0X3RocmVhZGVkX2lycShm
aWZvLT5pcnEsIGF4Z19maWZvX3BjbV9pcnFfYmxvY2ssCj4gLQkJCQkgICBheGdfZmlmb19wY21f
aXJxX2Jsb2NrX3RocmVhZCwKPiAtCQkJCSAgIElSUUZfT05FU0hPVCwgZGV2X25hbWUoZGV2KSwg
c3MpOwo+ICsJcmV0ID0gcmVxdWVzdF90aHJlYWRlZF9pcnEoZmlmby0+aXJxLCBOVUxMLAo+ICsJ
CQkJICAgYXhnX2ZpZm9fcGNtX2lycV9ibG9ja190aHJlYWQsIElSUUZfT05FU0hPVCwKPiArCQkJ
CSAgIGRldl9uYW1lKGRldiksIHNzKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAg
Cj4KPiAjMjogSWYgdHdvIGhhbmRlcnMgYXJlIHJlcXVpcmVkIGR1ZSB0byAkUkVBU09OIHRoZW4g
cHJpbWFyeSBzaG91bGQgQUNLLwo+ICAgICBkaXNhYmxlIHRoZSBpbnRlcnJ1cHQgbGluZSB3aGls
ZSB0aGUgc2Vjb25kYXJ5LyB0aHJlYWRlZCBoYW5kbGVyIGlzCj4gICAgIHJ1bm5pbmcuIEluIHRo
aXMgaXMgY2FzZSB0aGVuIElSUUZfT05FU0hPVCBpcyBub3QgbmVlZGVkIGJlY2F1c2UgaXRzCj4g
ICAgICJ0YXNrcyIgaXMgcGVyZm9ybWVkIGJ5IHRoZSBwcmltYXJ5IGhhbmRsZXI6Cj4KPiBkaWZm
IC0tZ2l0IGEvc291bmQvc29jL21lc29uL2F4Zy1maWZvLmMgYi9zb3VuZC9zb2MvbWVzb24vYXhn
LWZpZm8uYwo+IGluZGV4IDdlNjA5MGFmNzIwYjkuLjViNGM1MThlYjRjY2QgMTAwNjQ0Cj4gLS0t
IGEvc291bmQvc29jL21lc29uL2F4Zy1maWZvLmMKPiArKysgYi9zb3VuZC9zb2MvbWVzb24vYXhn
LWZpZm8uYwo+IEBAIC0yMDUsMTEgKzIwNSwxNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYXhnX2Zp
Zm9fcGNtX2lycV9ibG9jayhpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gIAo+ICAJcmVnbWFwX3Jl
YWQoZmlmby0+bWFwLCBGSUZPX1NUQVRVUzEsICZzdGF0dXMpOwo+ICAJc3RhdHVzID0gRklFTERf
R0VUKFNUQVRVUzFfSU5UX1NUUywgc3RhdHVzKTsKPiAtCWF4Z19maWZvX2Fja19pcnEoZmlmbywg
c3RhdHVzKTsKPiAgCj4gIAkvKiBVc2UgdGhlIHRocmVhZCB0byBjYWxsIHBlcmlvZCBlbGFwc2Vk
IG9uIG5vbmF0b21pYyBsaW5rcyAqLwo+IC0JaWYgKHN0YXR1cyAmIEZJRk9fSU5UX0NPVU5UX1JF
UEVBVCkKPiArCWlmIChzdGF0dXMgJiBGSUZPX0lOVF9DT1VOVF9SRVBFQVQpIHsKPiArCQkvKgo+
ICsJCSAqIEFDS3MvIERpc2FibGVzIHRoZSBpbnRlcnJ1cHQgdW50aWwgcmUtZW5hYmxlZCBieQo+
ICsJCSAqIGF4Z19maWZvX3BjbV9pcnFfYmxvY2tfdGhyZWFkKCkKPiArCQkgKi8KPiArCQlheGdf
Zmlmb19hY2tfaXJxKGZpZm8sIHN0YXR1cyk7Cj4gIAkJcmV0dXJuIElSUV9XQUtFX1RIUkVBRDsK
PiArCX0KPiAgCj4gIAlkZXZfZGJnKGF4Z19maWZvX2RldihzcyksICJ1bmV4cGVjdGVkIGlycSAt
IFNUUyAweCUwMnhcbiIsCj4gIAkJc3RhdHVzKTsKPiBAQCAtMjUzLDcgKzI1OCw3IEBAIGludCBh
eGdfZmlmb19wY21fb3BlbihzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPiAg
Cj4gIAlyZXQgPSByZXF1ZXN0X3RocmVhZGVkX2lycShmaWZvLT5pcnEsIGF4Z19maWZvX3BjbV9p
cnFfYmxvY2ssCj4gIAkJCQkgICBheGdfZmlmb19wY21faXJxX2Jsb2NrX3RocmVhZCwKPiAtCQkJ
CSAgIElSUUZfT05FU0hPVCwgZGV2X25hbWUoZGV2KSwgc3MpOwo+ICsJCQkJICAgMCwgZGV2X25h
bWUoZGV2KSwgc3MpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+Cj4gT24gdGhlIFBS
RUVNUFRfUlQgYm90aCBoYW5kbGVyIHdpbGwgYmUgdGhyZWFkZWQuCj4gIAo+IE15IGZhdm9yaXRl
IGlzICMxLiBBbHNvIEFDS2luZyB0aGUgaW50ZXJydXB0IG9ubHkgaWYgaXQgb2NjdXJyZWQgZm9y
IHRoZQo+IGRldmljZS8gZHJpdmVyIGluIGNoYXJnZS4gT3RoZXJ3aXNlIGRvbid0IGNhcmXigKYK
CkknZCBwcmVmZXIgIzEgdG9vLiBJUlEgaXMgbm90IHNoYXJlZCwgc28gdGhlIG93bmVyc2hpcCBz
aG91bGQgYmUgZmluZS4KCkhvd2V2ZXIgSSBzdGlsbCBkb24ndCBmdWxseSB1bmRlcnN0YW5kIHdo
YXQgd2UgYXJlIGZpeGluZyBoZXJlIFRCSC4gSXQKc2VlbXMgaXQgY291bGQgYXBwbHkgdG8gb3Ro
ZXIgcGFydHMgb2YgdGhlIGtlcm5lbCBzbyBJJ2QgbGlrZSB0bwp1bmRlcnN0YW5kIHdoYXQgaXMg
d3JvbmcgKGFuZCBhdm9pZCByZXBlYXRpbmcgdGhlIHNhbWUgbWlzdGFrZSkKCiogV2l0aCBQUkVF
TVBUX1JULCBib3RoIGhhbmRsZXIgd2lsbCB0aHJlYWRlZCwgc28gdGhleSBzaG91bGQgYmUgYWJs
ZSB0bwogIGNhbGwgcHJlZW1wdGlibGUgZnVuY3Rpb24sIHJpZ2h0ID8KKiBJZiBzbywgYW5kIHNw
aW5sb2NrX2xvY2soKSBhY3R1YWxseSBiZWNvbWVzIHByZWVtcHRpYmxlIHdpdGgKICBQUkVFTVBU
X1JUIGFzIHN0YXRlZCBpbiB0aGlzIGNoYW5nZSBkZXNjcmlwdGlvbiwgd2h5IGlzIGl0IHByb2Js
ZW0gaGVyZSA/CgpEbyB5b3UgaGF2ZSBhbiBpZGVhIGFib3V0IHdoYXQgaXMgZ29pbmcgb24gPwoK
QWdhaW4sIHRoYW5rcyBhIGxvdCBmb3IgeW91ciBoZWxwLgoKPgo+IFNlYmFzdGlhbgoKLS0gCkpl
cm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
