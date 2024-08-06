Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D70CC3DA64
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 06:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qROk8aboHDcHOaFIL9Ek8QJK7jVx4gevd+tYdlzVCOg=; b=IK7cUEhZkIh8u9
	ldu3V1JABVvDtLg6zIgzWM0eK6poMCGqaIkLr+dSlsi7Kj4gAtUDHUWNn078M5pFrUBgdiZ3JqxY1
	hdgNQTbht+7PI+cVO0Hpgq+HhwVVS6HuQ4LgozADiiU+YYwJ9Hh7M7YVQhE2TH8Jl4eCKyzPExxnK
	kM/UZs+vMd6tRnVVmyZEnE1pH3qQwKxmUWY7acuoEusbJ7m25Qt8+iv6B2UEnlxmKsmxFfBUWNpOb
	Di1MEFW1uxwgiXuHr1zbt7UaYTZg7mWtady18GelHMNXv3y8HEQR6VuH4jJSzwFqHLeefUFvAMKWi
	3NGZHtwl7oY/gO72pK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbE1f-00000000i5N-0buO;
	Tue, 06 Aug 2024 06:50:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbE1a-00000000i4K-1jBo;
	Tue, 06 Aug 2024 06:50:30 +0000
Date: Tue, 6 Aug 2024 08:50:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722927024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rYwgW2vpzfVbKjwpUB+DO7Cgb0fWJ3gvVqC78ZYBjc=;
	b=KRNXjRJvNQzui5oqkfFTnZJm+mq5/Uz7KzMCCC2D3wdX+ye1GTrX5Msw+xHtI3OOc1Hdj6
	VieGZ1a/OcRs1m9Sb2Apsmoh29p7j8ragrJqRrkqTqzqWEkNyQJ83OHZPhua96Npo0mpEe
	ALyPCoum7gGChvW2uRhzsZhC8bPmttEZSXIRuy8QVmDTcKZgGI0Bu2e1i1m7QVORQDKD+R
	bb85RgD+Xnhhb0aIybhg3yASzuJvvC5V4LhL3djs7AlTa8zOr56uJSarKVsxymHbK00x3E
	/2asiIoBSLElgrAJZCcVvjtdcfpxSUUlT86D3WjGTe3nt3MpWwhG2OJ6RW5VPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722927024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rYwgW2vpzfVbKjwpUB+DO7Cgb0fWJ3gvVqC78ZYBjc=;
	b=n3ml5t+ugxpduMixS1Q22fM9Y967N/rmITKJzqOlOAMP+ffzesZhFEfh/n6FQXYxf5BhY4
	KO++8jgRBOhm3lAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, linux-rt-users@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, oxffffaa@gmail.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
Message-ID: <20240806065021.PINvpze_@linutronix.de>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
 <20240805153309.k_SfHw62@linutronix.de>
 <1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_235026_618762_618640A6 
X-CRM114-Status: GOOD (  20.30  )
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

T24gMjAyNC0wOC0wNSAxODowNzoyOCBbKzAyMDBdLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IEhp
IFNlYmFzdGlhbiwKSGkgSmVyb21lLAoKPiBUaGFua3MgYSBsb3QgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byBkaWcgaW50byB0aGUgZHJpdmVyIHNwZWNpZmljcy4KPiBUaGUgSVJRIGhhbmRsZXIgaXMg
YWN0dWFsbHkgbm90IGF3ZnVsbHkgY3JpdGljYWwgaW4gdGhpcyBjYXNlLiBUaGUgSFcKPiB3aWxs
IGNvbnRpbnVlIHRvIHJ1biByZWdhcmRsZXNzIG9mIHRoZSBJUlEgYmVpbmcgYWNrZWQgb3Igbm90
Cj4gCj4gVGhlIHB1cnBvc2Ugb2YgdGhlIGhhbmRsZXIgaXMgbWFpbmx5IHRvIGxldCBBbHNhIGtu
b3cgdGhhdCAxIChvciBtb3JlKQo+IHBlcmlvZCBpcyByZWFkeS4gSWYgYWxzYSBpcyB0b28gc2xv
dyB0byByZWFjdCwgYW5kIHRoZSBidWZmZXIgYWxsb3dzCj4ganVzdCBhIGZldyBwZXJpb2RzLCB0
aGUgSFcgbWF5IHVuZGVyL292ZXJmbG93IHRoZSBidWZmZXIuCj4gCj4gSVJRRl9PTkVTSE9UIGlz
IGZpbmUgYmVjYXVzZSBzbmRfcGNtX3BlcmlvZF9lbGFwc2VkKCkgJ25vdGlmaWVzJwo+IGFsbCBw
YXN0IHBlcmlvZHMsIG5vdCBqdXN0IG9uZS4gVGhlIGlycSBoYW5kbGVyIGRvZXMgbm90IG5lZWQg
dG8KPiBydW4gYWdhaW4gdW50aWwgdGhpcyBmdW5jdGlvbiBoYXMgYmVlbiBjYWxsZWQuIEl0IGFs
c28gaGVscHMgaWYgdGhlCj4gcGVyaW9kIGlzIHJpZGljdWxvdXNseSBzbWFsbCwgdG8gdHJ5IHRv
IHJlZHVjZSB0aGUgbnVtYmVyIG9mIElSUXMuCgpJUlFGX09ORVNIT1QgaXMgdXNlZCB0byBkaXNh
YmxlIHRvIGtlZXAgdGhlIElSUSBsaW5lIGRpc2FibGVkIChhZnRlciB0aGUKcHJpbWFyeSBoYW5k
bGVyKSB3aGlsZSB0aGUgdGhyZWFkZWQgaGFuZGxlciBpcyBydW5uaW5nLiBUaGlzIGltcGxpZXMK
dGhhdCB0aGUgcHJpbWFyeSBoYW5kbGVyIG11c3Qgbm90IGJlIHRocmVhZGVkIHVuZGVyIFBSRUVN
UFRfUlQuCuKApgo+IEknZCBwcmVmZXIgIzEgdG9vLiBJUlEgaXMgbm90IHNoYXJlZCwgc28gdGhl
IG93bmVyc2hpcCBzaG91bGQgYmUgZmluZS4KPiAKPiBIb3dldmVyIEkgc3RpbGwgZG9uJ3QgZnVs
bHkgdW5kZXJzdGFuZCB3aGF0IHdlIGFyZSBmaXhpbmcgaGVyZSBUQkguIEl0Cj4gc2VlbXMgaXQg
Y291bGQgYXBwbHkgdG8gb3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbCBzbyBJJ2QgbGlrZSB0bwo+
IHVuZGVyc3RhbmQgd2hhdCBpcyB3cm9uZyAoYW5kIGF2b2lkIHJlcGVhdGluZyB0aGUgc2FtZSBt
aXN0YWtlKQo+IAo+ICogV2l0aCBQUkVFTVBUX1JULCBib3RoIGhhbmRsZXIgd2lsbCB0aHJlYWRl
ZCwgc28gdGhleSBzaG91bGQgYmUgYWJsZSB0bwo+ICAgY2FsbCBwcmVlbXB0aWJsZSBmdW5jdGlv
biwgcmlnaHQgPwoKQ29ycmVjdC4gQnV0IGZsYWdzIGxpa2UgSVJRRl9PTkVTSE9UIHdvbid0IHRo
cmVhZCB0aGUgcHJpbWFyeSBoYW5kbGVyLgoKPiAqIElmIHNvLCBhbmQgc3BpbmxvY2tfbG9jaygp
IGFjdHVhbGx5IGJlY29tZXMgcHJlZW1wdGlibGUgd2l0aAo+ICAgUFJFRU1QVF9SVCBhcyBzdGF0
ZWQgaW4gdGhpcyBjaGFuZ2UgZGVzY3JpcHRpb24sIHdoeSBpcyBpdCBwcm9ibGVtIGhlcmUgPwoK
QmVjYXVzZSBpbiB0aGlzIGNhc2UgdGhlIHByaW1hcnkgaGFuZGxlciBpcyBub3QgdGhyZWFkZWQg
YW5kIHJ1bnMgaW4Kbm90IHByZWVtcHRpYmxlIGhhcmQtSVJRIGNvbnRleHQuCgo+IERvIHlvdSBo
YXZlIGFuIGlkZWEgYWJvdXQgd2hhdCBpcyBnb2luZyBvbiA/CgpZZXMuCgpTZWJhc3RpYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
