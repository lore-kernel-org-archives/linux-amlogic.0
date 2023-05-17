Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7467CC77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 May 2023 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDGM7huGPVVZehOfLj8la6ZJdwgDFcnqUw4WnnOacTc=; b=HA6DhcRFphR1Ty
	fmtPARkuODXmUlAUoZMKojSN3dPXNN0Oo8BWv0/zNLL/6SgYjN6MrYx2+nV2HnxpVuu88kLEZdzXd
	izeVOhSOk7diETBnq4QbMeyjSIEeVd0gtROkSBXwcF55QNWmrLqCCTao2E911sRjGMWvR+HyUz3GI
	EYYVEx3CN0Jaup192zhLwmNfk6DW/S5jFxqbsbD7/Wwl+ksp2GGU5ZStxyQecjK55kNJ2lzQcYqN4
	GNIvFzvkAnGogJAn5SYC/Qz6KrAcPjwaIknSL+DnG0ucMnly99pm8agON2seBAfKBCOvNkOyQNzOR
	7ubA4leI7mTGaYZsIPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFTf-009d8g-0T;
	Wed, 17 May 2023 11:37:55 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFTb-009d6c-36;
	Wed, 17 May 2023 11:37:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 378EF55706;
	Wed, 17 May 2023 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1684323464; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nZdcMDZM53ILRxlH9g59ieKwhVNPywvAfYb6Qja4wac=;
	b=DwlMOFGPGqaVRFP97Pvxw+TihOVYHCxLgopEWyALgUQ2pe0bSLNW1KVGBYza6rEo5I4aI9
	nvGmxNzn8NsnuozBDiTeN4qhNZa87VkxcuhzegzKNzJG2gDsgOSNQ4uDDIyuv+SMs+VsPT
	E+OcXyZ79qlqYcHqWNVk+RqC6p5jE+uFx73qFtyuJoP916Zg74GSSmOOKaprBoCqP+fOUu
	H5ns5segL9BFppgvQ25yV6ojCEP/SFQB0qD/hatLQMf23LyAKwhnLtXytlrtgAp3SZZP57
	FXmjjAM+hYjcKOqcD9wP/k8VM86aY4ugixmYsT25mLcx48x19h/e0Q056sLoDg==
Message-ID: <a52335ea-6545-8ca6-d318-38b7ffc64368@lexina.in>
Date: Wed, 17 May 2023 14:37:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com, andy.shevchenko@gmail.com,
 nuno.sa@analog.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
 <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
Content-Language: en-US, ru, ru-RU
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_043752_559741_F93FF5DF 
X-CRM114-Status: GOOD (  16.41  )
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

SGksIE1hcnRpbiwKCk9uIDE2LjA1LjIwMjMgMjI6MDgsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3Jv
dGU6Cj4gSGkgR2VvcmdlLAo+IAo+IHRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaCEKPiAKPiBPbiBN
b24sIE1heSAxNSwgMjAyMyBhdCAxMTowNuKAr1BNIEdlb3JnZSBTdGFyayA8Z25zdGFya0BzYmVy
ZGV2aWNlcy5ydT4gd3JvdGU6Cj4+Cj4+IEZyb206IEdlb3JnZSBTdGFyayA8R05TdGFya0BzYmVy
ZGV2aWNlcy5ydT4KPj4KPj4gQWNjb3JkaW5nIHRvIGRhdGFzaGVldHMgb2Ygc3VwcG9ydGVkIG1l
c29uIFNPQ3MKPj4gbGVuZ3RoIG9mIEFEQ19DTEtfRElWIGZpZWxkIGlzIDYgYml0cyBsb25nCj4g
SSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhpcyBzZW50ZW5jZSB3aGljaCBkb2Vzbid0IGFmZmVj
dCB0aGlzIHBhdGNoCj4gLSBpdCdzIG9ubHkgYWJvdXQgbWFuYWdpbmcgZXhwZWN0YXRpb25zOgo+
IFdoaWNoIFNvQyBhcmUgeW91IHJlZmVycmluZyB0bz8KCkkgY2hlY2tlZCB0aGUgOTA1eCwgOTA1
eDMsIGExMTN4IGRhdGFzaGVldHMgLSB0aGVyZSBpcyB0aGUgc2FtZSByZWdpc3RlciAKd2l0aCA2
IGJpdHMgZm9yICBBRENfQ0xLX0RJVgoKPiBUaGlzIGRpdmlkZXIgaXMgb25seSByZWxldmFudCBv
biBvbGRlciBTb0NzIHRoYXQgcHJlZGF0ZSBHWEJCIChTOTA1KS4KPiBUbyBteSBrbm93bGVkZ2Ug
YWxsIFNvQ3MgZnJvbSBHWEJCIG9ud2FyZHMgcGxhY2UgdGhlIGRpdmlkZXIgaW4gdGhlCj4gbWFp
biBvciBBTyBjbG9jayBjb250cm9sbGVyLCBzbyB0aGlzIGJpdG1hc2sgaXMgaXJyZWxldmFudCB0
aGVyZS4KPiAKPj4gRml4ZXM6IDNhZGJmMzQyNzMzMCAoImlpbzogYWRjOiBhZGQgYSBkcml2ZXIg
Zm9yIHRoZSBTQVIgQURDIGZvdW5kIGluIEFtbG9naWMgTWVzb24gU29DcyIpCj4+IFNpZ25lZC1v
ZmYtYnk6IEdlb3JnZSBTdGFyayA8R05TdGFya0BzYmVyZGV2aWNlcy5ydT4KPiBTaW5jZSBteSBx
dWVzdGlvbiBhYm92ZSBkb2Vzbid0IGFmZmVjdCB0aGlzIHBhdGNoOgo+IFJldmlld2VkLWJ5OiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMKCi0tIApWeWFjaGVzbGF2IEJvY2hhcm92CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
