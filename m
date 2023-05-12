Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A69FC77B75
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 10:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a/8ppG4HA3JxmM+7ONTehqdj8TG+O4bXcaEP7I6Ge0=; b=UoKq4oI9w94bGZKQEZxcgKI2/E
	T7AVIvcR00jbQuhjqWikzAkUCvAqUOEzczk1AaofUZ7qao6up++20dIYWprgztSwAaEsyd7Yl9Q8g
	lqJhVuDw2qJic2x7IBRHvVxl7OqGuu4lNaaVmnOzGPF2qaD8nGA0A5n/M179ltNA+z6N7y47ULiuA
	jvYUzH1nhWAstRH/5R9Rn3niglvPOuaQ6OLSOu7Y9WAS/6DJbI1kDILPoTW9/JCeb14orNaz8Fi5O
	auhG1SI8DG2ICZCF4EH2Xn3ld4gCxpAnWAwRrOm+pb/E1JEDZDgc7fU+BTLWq7pENL0aZqhvo8qXm
	m1TmMl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPkQ-00BZ2g-0G;
	Fri, 12 May 2023 10:11:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPkM-00BZ1L-1x
	for linux-amlogic@lists.infradead.org;
	Fri, 12 May 2023 10:11:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f42c865534so41425665e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 12 May 2023 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683886292; x=1686478292;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9FxWivWJPVbRp/nOJzpvmn588X9UgZWMKzBDTI7Mfnc=;
        b=dNJmRYkigUMvMB7lu+l44aLi+HUWM6ug0CERBaLjq8aWdPQwrBXMMGY4bkUSpEzqrz
         OwkAjUcuxAO0CjuAg7r1p6ux/XXcgBmY5R278KwS2aXTqdYM/tybvElKoFzPkc3Y7JZN
         huRr5GwVWOUubmQR4ULyy9q8eW+X93LbEBsiNXKMsvqE1TuIugabtiUxnSa6+FI8CvOv
         zXLwJC80n3+jcU4x6R4X/0EMS29BD6Ir4e8/3N6iOefMeYQlMXyuyawNZBaPpxK5370V
         PpNYGYd2tg9spvV9gZAFUXvBQnNC9Bdj2BRW5FPWvCrJ/XpFficE6mVheNXKBpYNJAE2
         xf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683886292; x=1686478292;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FxWivWJPVbRp/nOJzpvmn588X9UgZWMKzBDTI7Mfnc=;
        b=SQKVuwXyDQNo4qZsECaGuUY06yrQZ8GcDeOo3SSH9/Pwew0OhIKr2PYa4oi8rANOtK
         Akd+PNMHjuI9wNOWQ+8cjmijdIaFmIFvHsjiGHF8no2+2I4ymJg6KjRDYWjX6ojeb2e7
         DHCSLov1o6PXJ+uyuC5g2SFzOFC6Tjo5x9NVMcdZOe7ULpNTMSrOYOsgW9cpPhsSkc0l
         Xu6KMONvpu0ShC18aHYEdo0wbwJX9FCcx8u1jSPKO2Obzxfo/H/8Z7jQfvMS/Tue+qzG
         tIo2EoysJQiAEIFMRKpUXgzxwy3pv/B+fwhyKCAJmiCsKFSbhv41/8lBk1dvjGq2+AXZ
         S7pg==
X-Gm-Message-State: AC+VfDz1flxgshxKKueUjTaPRQWHk/mKt4koDUdMGRUQ/xFFL4dOBL88
	/gfyRSjrz3JSGQbdn8WNLwJl+O2GbUE/BQNlEWjisw==
X-Google-Smtp-Source: ACHHUZ7j69KRqv2NtHMhTkTSuUkDIdWyH6tbjMQVWglcosDge7Hizlm2MN7ZYZkliSfcHGo1acDLag==
X-Received: by 2002:a7b:c012:0:b0:3f0:9d1a:223b with SMTP id c18-20020a7bc012000000b003f09d1a223bmr18351406wmb.16.1683886292167;
        Fri, 12 May 2023 03:11:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:95e3:a02f:1d34:8191? ([2a01:e0a:982:cbb0:95e3:a02f:1d34:8191])
        by smtp.gmail.com with ESMTPSA id z18-20020a1c4c12000000b003f188f608b9sm28060105wmf.8.2023.05.12.03.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 03:11:31 -0700 (PDT)
Message-ID: <e2bd6ca0-ffa1-a1f3-340b-6522dacd099d@linaro.org>
Date: Fri, 12 May 2023 12:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND] pinctrl: meson-axg: add missing GPIOA_18 gpio
 group
Content-Language: en-US
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>
Cc: stable@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230512064925.133516-1-martin@geanix.com>
Organization: Linaro Developer Services
In-Reply-To: <20230512064925.133516-1-martin@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_031134_642080_72D13EB5 
X-CRM114-Status: GOOD (  12.68  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTIvMDUvMjAyMyAwODo0OSwgTWFydGluIEh1bmRlYsO4bGwgd3JvdGU6Cj4gV2l0aG91dCB0
aGlzLCB0aGUgZ3BpbyBjYW5ub3QgYmUgZXhwbGljaXRseSBtdXgnZWQgdG8gaXRzIGdwaW8gZnVu
Y3Rpb24uCj4gCj4gRml4ZXM6IDgzYzU2NjgwNmE2OGEgKCJwaW5jdHJsOiBtZXNvbi1heGc6IEFk
ZCBuZXcgcGluY3RybCBkcml2ZXIgZm9yIE1lc29uIEFYRyBTb0MiKQo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBn
ZWFuaXguY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgZmlyc3QgbWFpbDoKPiAgICogQWRkZWQg
Q2M6IHN0YWJsZSB0byBjb21taXQgbWVzc2FnZQo+ICAgKiBFeHBhbmRlZCBUbzogYW5kIENjOiB3
aXRoIGZ1bGwgbGlzdCBmcm9tIGdldF9tYWludGFpbmVycy5wbAo+IAo+ICAgZHJpdmVycy9waW5j
dHJsL21lc29uL3BpbmN0cmwtbWVzb24tYXhnLmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGlu
Y3RybC1tZXNvbi1heGcuYyBiL2RyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLWF4
Zy5jCj4gaW5kZXggN2JmZWNkZmJhMTc3Li5kMjQ5YTAzNWMyYjkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtbWVzb24tYXhnLmMKPiArKysgYi9kcml2ZXJzL3Bp
bmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1heGcuYwo+IEBAIC00MDAsNiArNDAwLDcgQEAgc3Rh
dGljIHN0cnVjdCBtZXNvbl9wbXhfZ3JvdXAgbWVzb25fYXhnX3BlcmlwaHNfZ3JvdXBzW10gPSB7
Cj4gICAJR1BJT19HUk9VUChHUElPQV8xNSksCj4gICAJR1BJT19HUk9VUChHUElPQV8xNiksCj4g
ICAJR1BJT19HUk9VUChHUElPQV8xNyksCj4gKwlHUElPX0dST1VQKEdQSU9BXzE4KSwKPiAgIAlH
UElPX0dST1VQKEdQSU9BXzE5KSwKPiAgIAlHUElPX0dST1VQKEdQSU9BXzIwKSwKPiAgIAoKUmV2
aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
