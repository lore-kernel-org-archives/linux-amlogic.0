Return-Path: <SRS0=5f+e=KF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAA5C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 May 2021 18:42:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7219561466
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 May 2021 18:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7219561466
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ijvNpPsotbhQYLdjn5jLuV5EKuIvEl30t20HJR76oms=; b=BUvLA+15XPnj2Si9gMljQbGK2
	88OqYbfxFzEhQzZRdNi/u1EDvC9G7D4yk0Wv/vojHjLpDkIZixmj+u8zV8NnbyO1uUeP0BIhfoE4w
	Fcm1aSarIcxraBaCfep76KONKax3jbBeAS9Sg9R7vhiianciS0SvAavxaFIyy1xQ9xNTVPSMlH2yc
	mq7zEjTWck1YsGmWDeHgrXQYWchdCobVyWf/Hqb758DAd0cm8NSSo3qkBJLXuwYBewq2lsyKDJQ/e
	z03oqTf37VXkl+JwHi22icZ327WyJpqImTKBj1HrgUmodjEf7UbHTkF3nPA1iHPYIb34rcIMhtQ5p
	bKhnb9erA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgArK-00FSuC-MG; Mon, 10 May 2021 18:42:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgArI-00FStt-Dz
 for linux-amlogic@desiato.infradead.org; Mon, 10 May 2021 18:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=0lAsKPwl7H0EAg3P9Py4bjsSkcKpDPZybKUKs0hgExc=; b=2sZ1/c+WBbv3uYrLRRQpblnn2/
 1Bp1iZ/RlIIRt6lsg2KYKqNwmS+EnvGphyqStTIFqkRXQ+HE+tCtMzUnh9AqREBcfFN+GMy94bM9R
 pQOVgjayK1rcE1wd5p/4b6MwGuo/eCwUHJ1nDf7n060zIz5E9ViEWQ10yGp9xIWYE/b0i5fccWAkL
 +vDeRhkzy9UGaTLmv4ZsD6eWh5UOzMPzKQFcFXLM11eVEU0MDaNAnngQqpeurbu8VXgwJlkcZGQX0
 KSQ9waMcVEJzjB3MaPe9zqo5JpQpVoxtcRnSLADngfx8n46xqgpsnTc251CR5rT/UzZdaWyfbJaTA
 AQmr3crQ==;
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgArF-0092iY-7V
 for linux-amlogic@lists.infradead.org; Mon, 10 May 2021 18:42:22 +0000
Received: by mail-oi1-x22b.google.com with SMTP id u16so16700099oiu.7
 for <linux-amlogic@lists.infradead.org>; Mon, 10 May 2021 11:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0lAsKPwl7H0EAg3P9Py4bjsSkcKpDPZybKUKs0hgExc=;
 b=PaKoxL2CMevbiPvORes55Jde3cMJuwri1HInQoH9mNOkVS32NXqJZeIC+aDgu9opgc
 071fTRPWPHKmaRtX5ku+Mv7JAq1c+cW99HSvUw3B9bDMDm/u0gGWtVuDUKcpop3WlbyN
 nm4CHQGLaU9aRe3KLEWQdbpIeEf2FWXnAuMdCXBlX4cSzizg/6CXMe+HHqtHl7iwyvWh
 W3XV3DCE/blBd5h/HQzcCWgikjTOFvgKZ+qQbyxQELV4tOkZYkvz/FkzE74yAiXcxIaP
 5B+lCQAvhILo5AvE5WPcYsFBtS0NOpRW3Yeqm1JE5CRrA1BR3xUU2MnspA4GUXu0Fsnl
 RdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0lAsKPwl7H0EAg3P9Py4bjsSkcKpDPZybKUKs0hgExc=;
 b=hhMU/ErqZeCGzKmz8T5E8e2Kht3FgEpx2Td4f3Os3htA0M026atNcWutIq8XNLKnOn
 jxPX1uQH4wQnM5QiM8nI2gFXuWuJ/dZLMRgE9+erJ7+p6+hqBDpDMQjDy+nAPrK+VlI4
 pmy0rB4zZweesQ2DhFBuE7EGrNLoPQ93L4zc8Nanob5J31HCpgG9CS9bGhHsl25Y5AJZ
 to0Ny/RZQ71ex68XLK0VSMqHs9sdYFq/7zzXZe5ks0Of6jwcLciPi6uxT/g4c3PkhrmX
 tFGzu8LQjBJQVlLCyFuYU65lH/gK60kKhbRtQ2FdmW7t9ccmw3EsLlzRIpBVhIVFRWGd
 A6hA==
X-Gm-Message-State: AOAM531M3nGd10Y5mRNO6cViKfUgQ3+uz/az3DwFGXIwJP5oXGwwmmkU
 W2JpVZyB2fcXbbUZwae9tBjMBmRp9NdAg2EMzn4=
X-Google-Smtp-Source: ABdhPJwHzakuJIZSkrACR4F4NjNFPV6THkT2F4NrQRV8IJDWIsT04BbVgFiy+iEcahsaIQz9DbjOeMl/tYFFHGPDdeI=
X-Received: by 2002:aca:b383:: with SMTP id c125mr434400oif.60.1620672139674; 
 Mon, 10 May 2021 11:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210510171046.984246-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210510171046.984246-1-u.kleine-koenig@pengutronix.de>
From: Romain Perier <romain.perier@gmail.com>
Date: Mon, 10 May 2021 20:42:07 +0200
Message-ID: <CABgxDoJbnFb+=oSMNrhbBGbFCRZWBQ54Dkyy02YnYm5bveD4gA@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: Simplify using devm_pwmchip_add
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_114221_292627_58ACD37F 
X-CRM114-Status: GOOD (  20.64  )
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

SGksCgpUaGUgInN0cnVjdCBkZXZpY2UgKiIgYXMgZmlyc3QgYXJndW1lbnQgaXMgbWlzc2luZywg
bm9wID8KClJlZ2FyZHMsClJvbWFpbgoKCkxlIGx1bi4gMTAgbWFpIDIwMjEgw6AgMTk6MTEsIFV3
ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IGEgw6ljcml0
IDoKPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gSGVsbG8sCj4KPiB0aGlzIG9idmlvdXNseSBkZXBlbmRz
IG9uIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTA0MDcwODAxNTUuNTUwMDQtMi11Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUKPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+Cj4gIGRy
aXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwgMTIgKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wd20vcHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+IGluZGV4IDllYjA2
MDYxM2NiNC4uZDlkZTQ1NjJlMDAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNv
bi5jCj4gKysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPiBAQCAtNTYwLDMxICs1NjAsMjEg
QEAgc3RhdGljIGludCBtZXNvbl9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgICAgICAgIGlmIChlcnIgPCAwKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+
Cj4gLSAgICAgICBlcnIgPSBwd21jaGlwX2FkZCgmbWVzb24tPmNoaXApOwo+ICsgICAgICAgZXJy
ID0gZGV2bV9wd21jaGlwX2FkZCgmbWVzb24tPmNoaXApOwo+ICAgICAgICAgaWYgKGVyciA8IDAp
IHsKPiAgICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlZ2lz
dGVyIFBXTSBjaGlwOiAlZFxuIiwgZXJyKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsK
PiAgICAgICAgIH0KPgo+IC0gICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbWVzb24p
Owo+IC0KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtc3RhdGljIGludCBtZXNvbl9wd21f
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gLXsKPiAtICAgICAgIHN0cnVj
dCBtZXNvbl9wd20gKm1lc29uID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gLQo+IC0g
ICAgICAgcmV0dXJuIHB3bWNoaXBfcmVtb3ZlKCZtZXNvbi0+Y2hpcCk7Cj4gLX0KPiAtCj4gIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX3B3bV9kcml2ZXIgPSB7Cj4gICAgICAg
ICAuZHJpdmVyID0gewo+ICAgICAgICAgICAgICAgICAubmFtZSA9ICJtZXNvbi1wd20iLAo+ICAg
ICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBtZXNvbl9wd21fbWF0Y2hlcywKPiAgICAg
ICAgIH0sCj4gICAgICAgICAucHJvYmUgPSBtZXNvbl9wd21fcHJvYmUsCj4gLSAgICAgICAucmVt
b3ZlID0gbWVzb25fcHdtX3JlbW92ZSwKPiAgfTsKPiAgbW9kdWxlX3BsYXRmb3JtX2RyaXZlciht
ZXNvbl9wd21fZHJpdmVyKTsKPgo+Cj4gYmFzZS1jb21taXQ6IDZlZmI5NDNiODYxNmVjNTNhNWU0
NDQxOTNkY2NmMWFmOWFkNjI3YjUKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGZhMzljZDBjODUy
ZDEwOWVkOTU3ZGM0NGRjYTViZGNmNWRmZjA2ODUKPiAtLQo+IDIuMzAuMgo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
