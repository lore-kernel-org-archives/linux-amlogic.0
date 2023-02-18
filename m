Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7852CC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Feb 2023 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnpkHflmWfqz7NZSSTVTVBl1tzroMugfnjUvIR0VauM=; b=xyoteRiLVvEdLz
	3IAQLnev/u7rvW1MA9MTSkPDNWWHLiVESrHSLl5jvUd0LlmAE9JCFDG/BklrharaBgNkYRGLwn5o3
	kd6SQTPyeMGkN4qzIg+bctlyu5CmKQMKfes0aZYBF92Am2KodstcuFcrm4AmoPpMKGWMNp6cJLHlw
	D7bWUQHelnE6LS/IGZWzgtEkh+d+h68anyw/SQfeKqA1FBWvpYFMPU5/PpbWGH3XGsHQsZ2V82V9V
	Pw6scUH5wLZl7suopvwL2Ad9T5MYK++kn5W2A0MgBZfeXZ0VLomO3DFOoKqVUtIZc+cgT39jhIMQI
	pmEfKStinR+XyHSxkXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTPUH-00HE27-MO; Sat, 18 Feb 2023 15:50:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTPU6-00HE0d-PB; Sat, 18 Feb 2023 15:50:48 +0000
Received: by mail-ed1-x52c.google.com with SMTP id i28so3108360eda.8;
        Sat, 18 Feb 2023 07:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPO0b69EP2YB+k3ItVJXLMqeM3ohdWLRT3U4CQc63CQ=;
        b=NzTqMNmtWa3r8OXtLW4FJBdcxOac+3ezvAGEhnzDhvbMPeBWU0mhRHZluqzKc0yzuP
         ZYtqI3YxcKHf57SJMdRGkbTO1rEqnLN/ZHO/3/jM7pyAWGRs6XlVrSEbaKva4Fgi3whJ
         w8CjDkcEkuRbTKV6SknJlneFJ6RjSkM4A6A/hOPw0jpzSp3PrUeY2kMEH3dDrgLYzGEW
         2RP55hABpxQ0sn0hC3wJGK99UjWwTXb9rEAsiJQL1tSdf+5EDMX9AvzjnZfBSWM6N1Ab
         9b+d0YRHWmAqqkK49ljzeq2zrTz8ZBvVnzPCof1Dz1rFt2kN5+W4O3IuShqYBMF5ZlRT
         2prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPO0b69EP2YB+k3ItVJXLMqeM3ohdWLRT3U4CQc63CQ=;
        b=fpSd1A6I4cMPQ0Oe5wSFnmeExkGqmEA4JO1QM5fElf478DNCg3y6sT3WKqs6SN2jT3
         LoaB6GXIfb5M3uToaYlsayQLtXN9fJejZZtfFCWSKnM4LhbxTLHJ8Qi3gT8zOx3wrwcB
         6zEd2mbSIloUELVk6LS27wW0j0KeiGz7qybstUE0VLu/ibqZwDRlDqLQXtywcPrJMz+x
         vjLVM2hnvrnuwGOa/dUHTuuJwcFMW7gvUwpAbTGesmeIUaX5OgOsl8fw7JRC8yr9O3mH
         8pr9ecESZqLIh/zQWBdT/o9kss1KCsII/w3nwUCErHaqPbqGly8qWgel+Ac0DS2E5hxE
         6tfg==
X-Gm-Message-State: AO0yUKUcuIbL2awTQm2cDd2/EsH0ymE2VMt832WTSrbzQOKPqAVgCpeL
	v6xOoakwlekJHgPIZEaOpn0ctwACLkh8QB/ShoU=
X-Google-Smtp-Source: AK7set/xO7PKbDqF6SekE7NROkLUPWPRQn8n3JP96mu5HqRbij9lt3G1gWcFly6cSy1TmfIw5B6S9/m30ikATBkbo1k=
X-Received: by 2002:a17:906:ce59:b0:8b1:7e1b:5ec1 with SMTP id
 se25-20020a170906ce5900b008b17e1b5ec1mr3046718ejb.6.1676735444390; Sat, 18
 Feb 2023 07:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20230216140725.1181867-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230216140725.1181867-1-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Feb 2023 16:50:33 +0100
Message-ID: <CAFBinCC4zdu+rLk3oGOOyT5mcgoU2qmeF=vjHoarJ9vq1GO59w@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson_saradc: Better handle BL30 not releaseing
 the hardware
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, kernel@pengutronix.de, 
	Lars-Peter Clausen <lars@metafoo.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_075046_882095_76645698 
X-CRM114-Status: GOOD (  11.88  )
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

SGkgVXdlLAoKT24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMzowNyBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IG1lc29uX3Nhcl9h
ZGNfbG9jaygpIG1pZ2h0IHJldHVybiBhbiBlcnJvciBpZiBCTDMwIGRvZXNuJ3QgcmVsZWFzZSBp
dHMKPiBsb2NrIG9uIHRoZSBoYXJkd2FyZS4gSnVzdCByZXR1cm5pbmcgZWFybHkgZnJvbSAucmVt
b3ZlKCkgaXMgd3JvbmcKPiBob3dldmVyIGFzIHRoaXMga2VlcHMgdGhlIGNsb2NrcyBhbmQgcmVn
dWxhdG9ycyBvbiB3aGljaCBpcyBuZXZlcgo+IGNsZWFuZWQgdXAgbGF0ZXIuCj4KPiBTbyBvbmx5
IHNraXAgaGFyZHdhcmUgYWNjZXNzZXMgd2l0aCBhbiBlcnJvciBtZXNzYWdlIGlmCj4gbWVzb25f
c2FyX2FkY19sb2NrKCkgZmFpbHMsIGJ1dCBkaXNhYmxlIGNsb2NrcyBhbmQgcmVndWxhdG9yIGFu
ZCByZXR1cm4KPiB6ZXJvIHRvIHN1cHByZXNzIGFub3RoZXIgZXJyb3IgbWVzc2FnZSBieSB0aGUg
ZHJpdmVyIGNvcmUuClRoZSBjbG9ja3MgYW5kIHJlZ3VsYXRvcnMgYXJlIHNoYXJlZCB3aXRoIHRo
ZSBCTDMwIGZpcm13YXJlLgpJbiBwcmFjdGljZSBJIGhhdmUgbm90IHNlZW4gbWVzb25fc2FyX2Fk
Y19sb2NrKCkgZmFpbCB5ZXQuCgpJIHRoaW5rIGl0J3MgZW5vdWdoIHRvIHByaW50IGFuIGVycm9y
IG1lc3NhZ2UgaWYgbG9ja2luZyBmYWlscywgdGhlbgpjb250aW51ZSBhcyBpZiBub3RoaW5nIGhh
cHBlbmVkLiBVbmxvY2tpbmcgb2J2aW91c2x5IGhhcyB0byBiZSBza2lwcGVkCmFzIHdlbGwgaW4g
dGhpcyBjYXNlLgpUaGVyZSdzIG5vdCBtdWNoIHdlIGNhbiBkbyB0byByZWNvdmVyIGZyb20gdGhp
cyBhbmQgSSBjb25zaWRlciB0aGUKQkwzMCBmaXJtd2FyZSB0byBiZSBoYW5naW5nIChvciBicm9r
ZW4pIGlmIGl0IGRvZXNuJ3QgcmVsZWFzZSB0aGUKbG9jay4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRp
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
