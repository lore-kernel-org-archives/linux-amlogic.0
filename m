Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C40C77B7A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 20:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VutxqR7/T0SP0vsDoU0ZEiSgFjxH+EEw6eLR7vWQ+I4=; b=V3FXyAZJeNhusr
	Sl/wzTRRx3AEnwuBvZMivEyoAOS6CVacMxv1n6eCfQd/gYA463BF7NjTnm7YD8zWAVlaB/FyreJwy
	6R7aFWX7L5Yid1Jvi5IzNki4KqCrD/hlcjKClfkfU7y+8asFElisJqOCG/v/c/8qcvcYSkOcFXk9T
	nt/1p4izCHtLnxol9EO1Ync/1WqhxpsUIv26gmtcU7j43d7VA3eWrRuUNIS6AiDBqKaJxW7KI6qqA
	NI4WjpKoDtG7dMf6djXx+aYk7g+ETC059Klaxyro8uCxmUfND1lXquZNWbbc6zFjJpynGvt8oT8lq
	L9jtsx/3nEHK+esXeRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jPB-00Bcz4-1K;
	Mon, 29 May 2023 20:23:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jP8-00BcyY-2m;
	Mon, 29 May 2023 20:23:48 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-970056276acso573626366b.2;
        Mon, 29 May 2023 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685391825; x=1687983825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFRAydikPWX3pKUDK3/GeTj1gN1x9t62tUlv+AAMNb4=;
        b=N0cvIK20DWhi3/jzCpW+vil3DjAaDTVwae9+znU4tOXniLKEfesgKC0Uw5KwZsJ8A8
         utsCxSTqkBiAWbCjF0QUcDu8pfbnmuON/H9YuLgDJ3J/CuBB/BAVjwnnQPNG7aOW4rEX
         E9W1gth1xJfVEshEm4H5R6Bu1SHPbq4iP9MUbLE3lGPmx57VdTQhWAuvW/4+NqD6fuyN
         Tb07M+Wy8CdCV1YOdD1/WMvJGT4S8t+Rm6jm6+GPgMU/M1fnqC8QpIixR2ARhd/X/vNd
         6UqHQvJuMKlXPjwW8kVpzXYxY5qLo5v1f5N/1AG4yoMGrVJo/7ED4otf2rOMTywdN5Ck
         vyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685391825; x=1687983825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFRAydikPWX3pKUDK3/GeTj1gN1x9t62tUlv+AAMNb4=;
        b=Mq47wXdihDuvfjwh22oXSZ6vVzAsKhXfM0/5il7kJcuWK+HnR7r3IqTupamMGBNmiN
         jvmk4YuM1FRSJqauYwQIkyHm5Iv7528LUu6M3IYTVyt3ek0/eZ6+/u2BoLFoMdYIcr38
         k0KLivoFXPDaw6y5BNhNAwRKdalea+aPeiIdAlOw4w9/JEelb6YRhe41ZaArAdTXIQIh
         L5p6sBcOHW52IT5cwjr6dmMzt2kj1wt82EoqZ3G+xPYoKXGLLCNIAtlfhz5TJw/p9+lf
         bcspYZEcoanaSelSPsNvbMbk3roO/Uu4JUeXXih1/TGsWl8lYQoJhSaCqXFD3R+qKXaW
         zRZg==
X-Gm-Message-State: AC+VfDyftTjbDKJf3rV7eRSeShbZL8Jnxm6HTQhJsBDPAOpfUn3+BjB2
	VKKsAG/w3/GxJM1Yqr184hBJZ57vDvvfwoT+d1I=
X-Google-Smtp-Source: ACHHUZ4U9hAAYqL77TzPMBvjLDtEWUIjr70SENM4Z8K9RbkxNwGJXVYJGzi1/9xSXn/jCG1x4JnLMwOlIIEvXc4MlAc=
X-Received: by 2002:a17:906:7945:b0:965:6d21:48bc with SMTP id
 l5-20020a170906794500b009656d2148bcmr275685ejo.75.1685391824685; Mon, 29 May
 2023 13:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
 <20230405195927.13487-5-ddrokosov@sberdevices.ru> <CAFBinCA3uZXzr3RgnWnKV5Qr-CPaZQX5joDg319i_cgzhLJy2g@mail.gmail.com>
 <20230425123304.xjmrkraybp2siwdw@CAB-WSD-L081021> <CAFBinCCqx1oHf+PcXBkeRYHnGQChbTTPRyD8SJU+ait+TG+AjQ@mail.gmail.com>
 <20230511132606.vk52yorf43alwgew@CAB-WSD-L081021> <CAFBinCCmNLQF_qV3k4kgDEAsemEsjL-GQtPex7Pmxrc2sHx30A@mail.gmail.com>
 <20230529134944.dh7isqg5ontfbtpa@CAB-WSD-L081021>
In-Reply-To: <20230529134944.dh7isqg5ontfbtpa@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 29 May 2023 22:23:33 +0200
Message-ID: <CAFBinCBP_pniDTSwBuFBL8YA-GnCuDHn=nCMn9XHXs=_7DFjkA@mail.gmail.com>
Subject: Re: [PATCH v13 4/6] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_132346_901996_EF83F108 
X-CRM114-Status: GOOD (  21.04  )
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

SGVsbG8gRG1pdHJ5LAoKT24gTW9uLCBNYXkgMjksIDIwMjMgYXQgMzo0OeKAr1BNIERtaXRyeSBS
b2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gSGVsbG8gTWFydGlu
LAo+Cj4gQXMgSSBwcm9taXNlZCBiZWZvcmUsIEknbSBub3cgYmFjayB3aXRoIHRoZSB2ZW5kb3In
cyByZXBseSByZWdhcmRpbmcKPiBBVURERFMuIFRoZSBpbmZvcm1hdGlvbiBpcyBzdGlsbCBpbmNv
bXBsZXRlLCBidXQgSSBoYXZlIHByb3ZpZGVkIHRoZQo+IGF2YWlsYWJsZSBkZXRhaWxzIGJlbG93
LiBQbGVhc2UgdGFrZSBhIGxvb2suCkdyZWF0LCB0aGFuayB5b3UgZm9yIGZvbGxvd2luZyB1cCEK
ClsuLi5dCj4gQVVERERTIGlzIGEgZGlyZWN0IGRpZ2l0YWwgc3ludGhlc2l6ZXIgdXNlZCBhcyBh
IGNsb2NrIHNvdXJjZS4gIEl0IGlzCj4gbm90IHVzZWQgYXMgZGVmYXVsdC4gWW91IG5lZWQgdG8g
bW9kaWZ5IHNvbWUgY2xrIHJlZ2lzdGVycyBpbiBkdHMgdG8KPiBlbmFibGUgaXQuIEJhc2ljYWxs
eSwgaXQgaXMgdXNlZCBmb3IgYXVkaW8uCj4KPiBJbiBBMSBkZXNpZ24sIHlvdSBjYW4gdXNlIEFV
RCBERFMgYXMgYSBjbG9jayBzb3VyY2UgYW5kIGl0IGlzIG5vdAo+IG5lY2Vzc2FyeS4gSXQgaXMg
bm90IHVzZWQgaW4gdGhlIEFtbG9naWMgZGVmYXVsdCBzZXR0aW5nLgo+Cj4gQWNjb3JkaW5nIHRv
IHRoZSB2ZW5kb3IsIGl0IGlzIG5vdCBuZWNlc3NhcnkgYW5kIGlzIGN1cnJlbnRseSBkaXNhYmxl
ZAo+IGJ5IGRlZmF1bHQuIFdoaWxlIHdlIGRvbid0IGhhdmUgbXVjaCBpbmZvcm1hdGlvbiBhYm91
dCBBVURERFMsIHRoZQo+IHZlbmRvciBzdWdnZXN0cyB0aGF0IGl0J3Mgbm90IGEgY29tbW9ubHkg
dXNlZCBjbG9jayBvYmplY3QgaW4gQTEKPiBwcm9qZWN0cyBhbmQgaXQgbWF5IGJlIHNraXBwZWQg
aWYgbm90IG5lZWRlZC4KTXkgZ29hbCBpcyB0byBtYWtlIHRoZSBkdC1iaW5kaW5ncyBtYXRjaCB0
aGUgaGFyZHdhcmUgaW1wbGVtZW50YXRpb24uLi4KCj4gQmFzZWQgb24gYWxsIGFib3ZlIGluZm9y
bWF0aW9uLCBJIHN1cHBvc2Ugd2UgY2FuIHNraXAgaXQgbm93LgouLi5idXQgaW4gdGhpcyBjYXNl
IHdlIHNpbXBseSBkb24ndCBoYXZlIGVub3VnaCBpbmZvcm1hdGlvbiAob3RoZXIKdGhhbiBzb21l
IHJlZ2lzdGVyIG5hbWVzIGFuZCBhIGhpZ2ggbGV2ZWwgZGVzY3JpcHRpb24gdGhhdCBpdCBjYW4g
YmUKdXNlZCBhcyBhIGNsb2NrKSB0byBkbyB0aGF0LgpJIHN0aWxsIHRoaW5rIHdlIGRpZCB0aGUg
YmVzdCB3ZSBjb3VsZCBmb3Igbm93LCBzbyBJIGFncmVlIHdpdGggeW91OgpsZXQncyBza2lwIGl0
IGZvciBub3cgKGFuZCBob3BlIHRoYXQgcmV0cm9maXR0aW5nIGl0IGxhdGVyIC0gaWYgd2UKZXZl
ciBuZWVkIGl0IC0gd29uJ3QgYmUgYSBwcm9ibGVtKS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
