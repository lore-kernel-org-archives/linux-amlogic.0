Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42883EB64DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jul 2023 21:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1no1U2izDhVWiDVis1ikUS4CbuB17KuFgPw9Fm4sIGk=; b=dM47pq5SpzYt+8
	sn1WSAByib0bccDveI/exPjjPvD53N9LrJtCto3d1plIksa7rfNw7oOUov6C8eK9usb0INAfP3O82
	aOdHacHrD83XiKo0MFT0JMj9L4rllPYVILV/dhsKa8R4Y7Aq8wdsB9uFyNc0Qf3alfLC0U0IpM64M
	ivhrLGfs0KAT/QAOqCXCaZtusylZWrew4lNy9WffiVBhUDHdjhXMTLiE+ZTYBDdvVK8x5KYlZO99i
	rC6PihvR/T6p5f9gulvvFaBlT4oiUJLZD7dVofXQc94XQy8+zd9cKOCdIGtxKXvSRyEsxD2V40Ez+
	9qNnNlRqlwkPG7uDBGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9AD-00FYyn-30;
	Sun, 16 Jul 2023 21:20:21 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9AB-00FYwW-1Q
	for linux-amlogic@lists.infradead.org;
	Sun, 16 Jul 2023 21:20:20 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5728df0a7d9so38575107b3.1
        for <linux-amlogic@lists.infradead.org>; Sun, 16 Jul 2023 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689542418; x=1692134418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5jVNQL7Cqqr60okI8mc7o8ZzfhGkfsuMA8PNwkU7+4=;
        b=nZrzudf6xWNgDh9pI1qUJneWfZZ979ATLS6xoZ5hymfxndprmeWruOujesfVNEI09I
         imgYXL5vPi+KQbDW/5KpR+WqF2IbuLxDAoGRwDZOkCSomygdREedz7TIyvPhIW4T8HEQ
         Kt/oCml68TYo1IfQTRpYtbqyCrwWR/WX8oNl9zPPtMAWFuOH1jAK8a6w+ij5laChENWX
         dPuuWPHSgDQ2UUK9RqRGemmyAgLUjVEBUDoVX+9MkgSZm7F3SmnWtCCstm8nltqTK+NK
         gyVl/1WGHoIAqIanzO4RdVju//vpXy+qQfT65rYde56kb5xHqBtOWIiaWduXVrYpxINK
         xjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689542418; x=1692134418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5jVNQL7Cqqr60okI8mc7o8ZzfhGkfsuMA8PNwkU7+4=;
        b=IEM4J2FyFsQB44uOzz0hnSC9laiMAE5uXV6/RkUYcSM0k6Ik6GkLm2HEmWFf/VZ7Q+
         lzqvCbXbhiuhljZka1UZBnRIXHC9AvyzaxyoVkyACtNiPwu7rc76XOTKaoE3zHe3skZO
         PXU2p/O0e2fWQykqfcPcKw9N1mtstHCKhTwh3YXswraDvKU3ExPEMVacmpdCYzAM7eNx
         /A3//d/BpsQ4U9PZY5heJeUzOJeMw+No6ATH/QnncsJ5nVKyGq/npa7fnHXIDPSsiZcq
         NSq4IdbCk6JjkRergWLf0cQj3+dLJsWJ7xR9x6xk+9+YMmiv6XcjvHifUa8uLqrwS4GA
         /I/A==
X-Gm-Message-State: ABy/qLaPNvStQFjdzUPBzWAVz0nzBReVIESgUslKlu2UFgYH3GUbbepN
	A0R3W/9Xrhb1NzjXHFJvDdEqbMP7t2C5k6wHAsrMvA==
X-Google-Smtp-Source: APBJJlHFulXWKieW8R5pU5+4sBV9kVYwKWI7RxXFv0PMRLSfeuSHf71kiTm/P4n/g1hxXDT2l3GQ0t6WmONXnWG1MKc=
X-Received: by 2002:a0d:cb4a:0:b0:56d:4b45:f9e1 with SMTP id
 n71-20020a0dcb4a000000b0056d4b45f9e1mr10803683ywd.3.1689542418359; Sun, 16
 Jul 2023 14:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230714122441.3098337-1-huqiang.qin@amlogic.com> <20230714122441.3098337-3-huqiang.qin@amlogic.com>
In-Reply-To: <20230714122441.3098337-3-huqiang.qin@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jul 2023 23:20:07 +0200
Message-ID: <CACRpkdbbUga0biH=1tkCgRzUqNiDGdVf2woda5X2s43ct-na7Q@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] pinctrl: Add driver support for Amlogic C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_142019_489218_859E9126 
X-CRM114-Status: GOOD (  11.17  )
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

SGkgSHVxaWFuZywKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgSnVsIDE0LCAyMDIz
IGF0IDI6MjXigK9QTSBIdXFpYW5nIFFpbiA8aHVxaWFuZy5xaW5AYW1sb2dpYy5jb20+IHdyb3Rl
OgoKPiBBZGQgYSBuZXcgcGluY3RybCBkcml2ZXIgZm9yIEFtbG9naWMgQzMgU29DcyB3aGljaCBz
aGFyZQo+IHRoZSBzYW1lIHJlZ2lzdGVyIGxheW91dCBhcyB0aGUgcHJldmlvdXMgQW1sb2lnYyBT
NC4KCkhvdyBpcyB0aGUgc3BlbGxpbmcgb2YgYW1sb2dpYyB0aGVyZSBpbiB0aGUgZW5kLgoKPiBT
aWduZWQtb2ZmLWJ5OiBIdXFpYW5nIFFpbiA8aHVxaWFuZy5xaW5AYW1sb2dpYy5jb20+Cj4gLS0t
Cj4KPiBWMSAtPiBWMjoKPiAgIEFkZGVkIGEgY29tbWEgdG8gdGhlIGxhc3QgaXRlbSBvZiB0aGUg
YXJyYXkgYW5kIGEgcGVyaW9kIHRvCj4gICB0aGUgY29tbWl0IG1lc3NhZ2UuCgpBbmR5IGhhZCBt
b3JlIGNvbW1lbnRzIGFib3V0IHRoZSBoZWFkZXIgaW5jbHVzaW9uLiBQbGVhc2UKaW5jbHVkZSBh
bGwgdXNlZCBoZWFkZXJzIGRpcmVjdGx5IGFzIHJlcXVlc3RlZCwgSSB0aGluayBpdCdzIGEgZ29v
ZAppZGVhIGFuZCBhdm9pZHMgY29uZnVzaW5nIGNvbXBpbGUgcHJvYmxlbXMuCgpZb3VycywKTGlu
dXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
