Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0DFC7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jun 2023 20:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=neFSN6vgh8BM0fH4960g4F9CcvRhev+lSaC4RlDPuno=; b=Oya7Xd1Mqf70s1
	avmUkpHK4NWPZ7T1DWBXksGFSnN/Fsmd/EG0asAIbsN2IzfQ3rjt6NQcae4Gbp8We8B1bW+6j4G8Z
	NzIljBgjdZToSlNP6vb4ocJwkZ2VvNI143PsDDxHeH0tr4hR5pWDzumx2MnEAqVuBtDv1Mp+E1Kz0
	IyfTeL4Mubd9j9R/EAJ4G/WbU2a3jsHsSpDJGttTtcz+vp7o+CcowUv3f8yt2sjzgOgfQLxB0VKnp
	GMF8rPh+9XehkYrF1c+krc4uIn1r+7ZY7+ssgAiXNYAENys8O+JcS8t+Dw9XFL/YFfovmejgZr2ib
	QPN/lcWhbEO0bvPmSyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Gf9-00Gfwe-1L;
	Mon, 05 Jun 2023 20:18:47 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Gf5-00Gfva-1q;
	Mon, 05 Jun 2023 20:18:45 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b1ba018d94so33464421fa.0;
        Mon, 05 Jun 2023 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685996320; x=1688588320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DmAqdFCTWcCnSv3cNxtbIKYt0BJjIXyl6B4XL9Pfx4=;
        b=pAuJ/+en+DXnrhMOQmfLxIW5mtJj9bT2iORrZSmomltq7qrdY4y7ND8wjL+6Nbpoue
         JmE18818aJ0/b+W0fnoSO68NXR5Ym2tBOgAR1mlL5g3UkHvj8Cn+xcpDTy9KBOm6vEBk
         jy6EgYeukLRAGRSZb9J+i5cfBNWCwvT0dn/IqWiFUbYiST+nkMxC+IBIlfAr9Z7b1NXM
         340Vkmw4j3hgOgdZT40piHPcAqoCpiI91PxJ5R3HWJqSmLrij2msaV21cTDwYpaCMZGI
         0XO0HznaoKlIWKUw5GlH32p0gTPyMO4MpCwWlXPxwIB7BrDIBUK8uKtW/kS9wg+9e/cD
         DeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685996320; x=1688588320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DmAqdFCTWcCnSv3cNxtbIKYt0BJjIXyl6B4XL9Pfx4=;
        b=I7vBNKzEaP65zijiRLb+C+F/eYIX/B/gpQHeShnxEh5PhxPySaaj+zkbYs1Zo0IY6O
         e1NnHCzcIPuX2V93XaneCFOM73M6L//GxIyuNXCxa+zM5LmT5mDGdpywuyYFPnbqzd4a
         Hf4CBAchnG7w5AtprZyO8RKNaBX9MuYi/XHc2j2SgmZqgxX+kGFTRYN6B3ruL3DAN3xM
         nXKfqBaE7A5RzQX+bvKcU8Jc/mrZv53ze/yMVipK8gJhEh3vl+UHDnUmaj4Jb5Gcj+Nb
         bOfPvk9gn4s3jdMJrnKuKQv0ElQCX/vRqO1FE2oR8ExT41sf6HieKpicoYu21gw37egi
         p6wQ==
X-Gm-Message-State: AC+VfDxB46HETnAJeThA/MJIeXwT6ENBWtG9pjPsFe+v4V1vPdVxNCWq
	6H+C88tqLMVwi9tov/sWlzAM1bwZFmDfU38YEhI=
X-Google-Smtp-Source: ACHHUZ4nCyRkQvzS2d4v2PHRMh6yMoQjq2Po298dhjhuNHkip3zW6T3mYtWCy6AV+0gnVai4bxaMbvgxz0U0qN//wiU=
X-Received: by 2002:a2e:88da:0:b0:2b0:770f:c83c with SMTP id
 a26-20020a2e88da000000b002b0770fc83cmr214990ljk.4.1685996319762; Mon, 05 Jun
 2023 13:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
 <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
 <a52335ea-6545-8ca6-d318-38b7ffc64368@lexina.in> <CAFBinCDmkGnD5o_rV6K73De2XmHDxRYveDwNAy3iA+Kwr5sdqg@mail.gmail.com>
 <6910550a-b025-0d97-0b39-bc89b235541e@sberdevices.ru> <CAFBinCCk6OziOxt2AY1A25C=9_pibhHsDK0wJNZ_AyHMd=z6SQ@mail.gmail.com>
 <dcb05f27-4c6d-0544-ff0d-288a6848ccaf@sberdevices.ru>
In-Reply-To: <dcb05f27-4c6d-0544-ff0d-288a6848ccaf@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Jun 2023 22:18:28 +0200
Message-ID: <CAFBinCCnAVveiYEOSq=KkBq0kRJti7eWgfRxqiTkQWe9i8mTzA@mail.gmail.com>
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
To: George Stark <gnstark@sberdevices.ru>
Cc: "jic23@kernel.org" <jic23@kernel.org>, Dmitry Rokosov <DDRokosov@sberdevices.ru>, 
	"lars@metafoo.de" <lars@metafoo.de>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>, 
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>, 
	Vyacheslav <adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_131843_632917_FB0B5476 
X-CRM114-Status: GOOD (  18.08  )
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

SGkgR2VvcmdlLAoKT24gVGh1LCBKdW4gMSwgMjAyMyBhdCAxMDo1NuKAr1BNIEdlb3JnZSBTdGFy
ayA8Z25zdGFya0BzYmVyZGV2aWNlcy5ydT4gd3JvdGU6ClsuLi5dCj4gSGVyZSB0aGUgdGVzdCBJ
IHByb21pc2VkOgo+IFF1ZXN0aW9uOiB3aGF0J3MgdGhlIHJlYWwgc2l6ZSBvZiBjbG9jayBkaXZk
ZXIgZmllbGQgaW4gU0FSX0FEQ19SRUczIHJlZ2lzdGVyIGluIHNhcmFkYyBpbiBtZXNvbjggc29j
cz8KPiBUaGUgY3VycmVudCBrZXJuZWwgY29kZSBzYXlzIDUgYml0cwo+IFRoZSBkYXRhc2hlZXQg
c2F5cyA2IGJpdAo+Cj4gVGhlIHBhcmVudCBjbG9jayBvZiBhZGMgY2xvY2sgaXMgMjRNaHoKPiBJ
IGNhbiBjaGVjayBpdCBoZXJlIGJ5Ogo+Cj4gIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Ns
a19zdW1tYXJ5Cj4gICB4dGFsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNCAgICAg
ICAgNCAgICAgICAgMSAgICAyNDAwMDAwMCAgICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAg
IFkKPiAgICAgIGMxMTA4NjgwLmFkYyNhZGNfZGl2ICAgICAgICAgICAgICAxICAgICAgICAxICAg
ICAgICAwICAgICAgMTE0Mjg1OCAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQo+ICAg
ICAgICAgYzExMDg2ODAuYWRjI2FkY19lbiAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAg
ICAgICAxMTQyODU4ICAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCj4KPiBmb3IgZGl2
aWRlciB3aWR0aCA1Yml0IG1pbiBhZGMgY2xvY2sgaXMgMjRNaHogLyAzMiA9ICA3NTBLSFoKPiBm
b3IgZGl2aWRlciB3aWR0aCA2Yml0IG1pbiBhZGMgY2xvY2sgaXMgMjRNaHogLyA2NCA9ICAzNzVL
SHoKPgo+IEkgc3VwcG9zZSB0aGF0IHRoZSBsb3dlciBhZGMgY2xvY2sgcmF0ZSB0aGUgaGlnaGVy
IG1lYXN1cmVtZW50IHRpbWUKPiBzbyBJIG5lZWQgdG8gZ2V0IG1lYXN1cmVtZW50IHRpbWUgYXQg
Ym90aCBjbGsgZnJlcXMgYW5kIHRoZSB0aW1lcyBkaWZmZXIgc28KPiA2Yml0IGRpdmlkZXIgaXMg
cmVhbGx5IGFwcGxpZWQKPgo+IEkgcGVyZm9ybWVkIHRlc3QgYXQgT2Ryb2lkLUMxLCBrZXJuZWwg
Ni4yLXJjOAo+IFR3byBrZXJuZWwgcGF0Y2hlcyBtdXN0IGJlIGFwcGxpZWQ6Cj4KPiB0aGUgdG9w
aWMgc3RhcnRlciBwYXRjaCBhbmQgdGhlIGhlbHBlciBwYXRjaCBhdCB0aGUgZW5kIG9mIHRoZSBs
ZXR0ZXIKPiBJbiB0aGUgaGVscGVyIHBhdGNoIEkgdHVybiBvbiBDTE9DS19BTExPV19XUklURV9E
RUJVR0ZTIHRvIGNoYW5nZSBjbG9jayByYXRlIGZyb20gc2hlIHNoZWxsCj4gYW5kIHVzZSBrdGlt
ZV9nZXRfcmF3X3RzNjQgdG8gbWVhc3VyZSBtZWFzdXJlbWVudCB0aW1lCj4KPiBTbyB0aGUgdGhl
IHRlc3QgaXRzZWxmOgo+IGNhdCAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jL2MxMTAwMDAwLmNi
dXMvYzExMDg2ODAuYWRjL2lpbzpkZXZpY2UwL2luX3ZvbHRhZ2UzX3Jhdwo+IFsgMTc4MS4yMjYz
MDldID09PT0gZnJlcTogMTE0Mjg1OCB0aW1lIDQyNDA4MDAwCj4KPiAjIGVjaG8gNzUwMDAwID4g
L3N5cy9rZXJuZWwvZGVidWcvY2xrL2MxMTA4NjgwLmFkYyNhZGNfZW4vY2xrX3JhdGUKPiAjIGNh
dCAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jL2MxMTAwMDAwLmNidXMvYzExMDg2ODAuYWRjL2lp
bzpkZXZpY2UwL2luX3ZvbHRhZ2UzX3Jhdwo+IFsgMTc5MC43Mjg2NTZdID09PT0gZnJlcTogNzUw
MDAwIHRpbWUgNDkxNzMwMDAKPgo+ICMgZWNobyAzNzUwMDAgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9j
bGsvYzExMDg2ODAuYWRjI2FkY19lbi9jbGtfcmF0ZQo+ICMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0
Zm9ybS9zb2MvYzExMDAwMDAuY2J1cy9jMTEwODY4MC5hZGMvaWlvOmRldmljZTAvaW5fdm9sdGFn
ZTNfcmF3Cj4gWyAxODE2Ljk1NTQ3N10gPT09PSBmcmVxOiAzNzUwMDAgdGltZSA2ODI0NTAwMAo+
Cj4gIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5Cj4gICB4dGFsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgNCAgICAgICAgNCAgICAgICAgMSAgICAyNDAwMDAw
MCAgICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkKPiAgICAgIGMxMTA4NjgwLmFkYyNh
ZGNfZGl2ICAgICAgICAgICAgICAxICAgICAgICAxICAgICAgICAwICAgICAgMzc1MDAwICAgICAg
ICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQo+ICAgICAgICAgYzExMDg2ODAuYWRjI2FkY19l
biAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICAgICAzNzUwMDAgICAgICAgICAgMCAg
ICAgMCAgNTAwMDAgICAgICAgICBZClRoZXNlIHJlc3VsdHMgbG9va3MgZXhjZWxsZW50IC0gdGhh
bmtzIGZvciBzaGFyaW5nIHRoZSB0ZXN0IHJlc3VsdHMhCkNvdWxkIHlvdSBwbGVhc2UgY2hlY2sg
b25lIGxhc3QgdGhpbmc6CiQgZ3JlcCAtaSBhZGMgL3N5cy9rZXJuZWwvZGVidWcvbWVzb24tY2xr
LW1zci9tZWFzdXJlX3N1bW1hcnkKSXQgc2hvdWxkIGNvbmZpcm0gdGhhdCB0aGUgY2xvY2sgcmF0
ZSBpcyAzNzVrSHogKG9yIGNsb3NlIHRvIGl0LCBTb0MKaW50ZXJuYWwgY2xvY2sgbWVhc3VyZW1l
bnQgaXMgbm90IDEwMCUgcHJlY2lzZSkKCk9uY2Ugd2UgaGF2ZSB0aGF0IGNvbmZpcm1hdGlvbjog
Y2FuIHlvdSBwbGVhc2UgcmUtc2VuZCB0aGUgcGF0Y2ggd2l0aAp0aGUgZGVzY3JpcHRpb24gdXBk
YXRlZCBzbyBpdCdzIGNsZWFyIHdoaWNoIFNvQyBnZW5lcmF0aW9ucyBhcmUKYWZmZWN0ZWQgYW5k
IGJ5IHN0YXRpbmcgdGhhdCB0aGUgZml4IHdhcyB0ZXN0ZWQgb24gYSBNZXNvbjhiIE9kcm9pZC1D
MQpib2FyZC4KCgpUaGFuayB5b3UgYW5kIGJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
