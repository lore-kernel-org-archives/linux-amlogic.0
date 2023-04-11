Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8FBC7619A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 21:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEenF1+KjDT0a60By1IgIzd0sV5o+LkwPvHy2B64mOg=; b=AITeWETSORFnQk
	AsC078vZYL6NavZFwYB+oHm6mOAgEnV/vflmGWEh44yUi/1C2JLZAK0RMuww/mbYUrw69mHPYlVaP
	nW1BqokdVcncyAL5z3uAzTX8+MoNd/QnmZZUtpYiG49H/NDEeCycvyFRHqfPVcHarqrmCgbLTgJmo
	bbhYL3OLmyymL15x8zNTyRy3Uy8S49fJ8npSUKsPzdD06my7EHF2AOeNT51woFI8P0GKXDqYhFwEt
	71NA3IyM8rrzXfIIoibMf/1kn7YkOrh0AHbVEB3hh4rDizz4SNAmTQ5B5mPDjkgytJwWNPSi879k1
	yj58FlR9/x0CNnugDu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmL67-0018FA-1u;
	Tue, 11 Apr 2023 21:00:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmL63-0018ES-34;
	Tue, 11 Apr 2023 21:00:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id he11-20020a05600c540b00b003ef6d684102so3150010wmb.3;
        Tue, 11 Apr 2023 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681246809; x=1683838809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2kZBhq9UoxWuSE0Pmv7xAqI5PwLYRQSgkjur3rAZ18=;
        b=AZf254wGAK9r6weRXgfjjx5NNiqe7EJ+oyXHs9VvaL4m7DL61tbFuoKHNQMfEl2ajK
         y5cKFD9za/EcbxDwksxy58ZFSELZUk4vvpYobqQ//p+NUjfVU2mHFW2+xLBjxcNnrkKs
         jYcu9v29Xr/gzc+pTzWjxC0Ao57m1S4TP7NWLnkJSJeOPGn929b7M9XpB0RDFBoRb0yC
         xF5jR9qkn4yCCTx8YmLen5AYVZpV0iq9+yKWnkU6Ofzj6f8HfInM3DAe0e1/mSu6ciVg
         SQza365MpY2O1NmFLaoOf9V1foZOsYB9jd5QJpNQm8MVEPbSz3DDHotzUeTmtm1B3pP5
         9fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681246809; x=1683838809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2kZBhq9UoxWuSE0Pmv7xAqI5PwLYRQSgkjur3rAZ18=;
        b=zIEx6mZPAk6IP/sVokSPMD4RYT/mozCH25Wk5DGAubkfPo5Bo1RuvbzQRFQyQb10OF
         Pm3TjcssmQymVwzlm8nle/PLJKETAm0BYVe71Q1bnaZZnKlQuds8x9TtNcfD30Wba+4O
         VQt2OZXLLLNUhbnE5E+rkZPtfAFbdKpv5UxuVEdRKzcv5czt4WrpusECCFlrAHhnXOgu
         fr4ws2V6e49EE8XQgId3s/gf/U6tTGCCXDzjpnuoz06PGUWWYL80PTuteqX8qTx7ibYM
         uhK8m2MEMFfRyb0XWGu124LLImEzO0dasho9vr6Ccy7TPkvgJ//wH0Avb7o2lQ6InU+0
         LcWw==
X-Gm-Message-State: AAQBX9f6NH8sS9H/W2mD53/78fe4W+0IO0VIK+QXPwYwfinF20rvP4/7
	VXG/ezdXHUOvzzhdwH7p0lA=
X-Google-Smtp-Source: AKy350YxU62L9HsurjLKnWNXqG0tvvJbkuiioYDY/lqmzJjUpIfJV9f0KgZ5dHO6SO7aYaDC+DmkBw==
X-Received: by 2002:a05:600c:28f:b0:3dc:4b87:a570 with SMTP id 15-20020a05600c028f00b003dc4b87a570mr11095014wmk.35.1681246808555;
        Tue, 11 Apr 2023 14:00:08 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c4bb:c200:90e3:4731:63e4:d333? (dynamic-2a01-0c23-c4bb-c200-90e3-4731-63e4-d333.c23.pool.telefonica.de. [2a01:c23:c4bb:c200:90e3:4731:63e4:d333])
        by smtp.googlemail.com with ESMTPSA id w16-20020a05600c475000b003f092f0e0a0sm3303233wmo.3.2023.04.11.14.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 14:00:08 -0700 (PDT)
Message-ID: <81dea141-da5d-51e2-1349-7bd434547d9f@gmail.com>
Date: Tue, 11 Apr 2023 23:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 4/4] pwm: meson: make full use of common clock
 framework
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
 <05e3b9de-ee38-97b6-7f39-5b6f7de1674f@gmail.com>
 <CAFBinCAdXE+3VrPJAoik_0TFW6TsB0033s+fTYUTNehPrn=PZg@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAFBinCAdXE+3VrPJAoik_0TFW6TsB0033s+fTYUTNehPrn=PZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_140012_015700_690C1D6B 
X-CRM114-Status: GOOD (  13.14  )
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

T24gMTEuMDQuMjAyMyAyMTo0OCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBUdWUs
IEFwciAxMSwgMjAyMyBhdCA5OjI24oCvUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4gKyAgICAgICAgICAgICAgIGluaXQubmFtZSA9IG5h
bWU7Cj4+ICsgICAgICAgICAgICAgICBpbml0Lm9wcyA9ICZjbGtfZ2F0ZV9vcHM7Cj4+ICsgICAg
ICAgICAgICAgICBpbml0LmZsYWdzID0gQ0xLX1NFVF9SQVRFX1BBUkVOVDsKPiBBcyBtdWNoIGFz
IEkgZG9uJ3Qgd2FudCBpdDogSSB0aGluayB3ZSBuZWVkIENMS19JR05PUkVfVU5VU0VEIGhlcmUg
YXMgd2VsbCA6LSgKPiBPbiBHWEJCLCBHWEwgYW5kIEdYTSBTb0NzIHRoZSBib2FyZCBkZXNpZ24g
dHlwaWNhbGx5IHVzZXMgUFdNCj4gcmVndWxhdG9ycyAobGlrZSB0aGUgYm9hcmRzIHVzaW5nIDMy
LWJpdCBTb0NzIGFzIHdlbGwgYXMgbmV3ZXIgYm9hcmRzCj4gdXNpbmcgRzEyQSBvciBsYXRlciBT
b0NzKS4KPiBUaGlzIG1lYW5zOiBpZiB3ZSBlbmFibGUgdGhhdCBQV00gY29udHJvbGxlciBhbmQg
b25lIG9mIHRoZSBjaGFubmVscwo+IGlzIGZpcm13YXJlIG1hbmFnZWQgYW5kIHRoZSBvdGhlciBp
c24ndCB0aGVuIHdlIGNhbiBlbmQgdXAgZGlzYWJsaW5nCj4gdGhlIGNsb2NrIC0gdGFraW5nIGF3
YXkgVkNDSyAod2hpY2ggc3VwcGxpZXMgdGhlIENQVSkgb3IgVkRERUUgKHdoaWNoCj4gc3VwcGxp
ZXMgR1BVIGFuZCB2YXJpb3VzIG90aGVyIGNvbXBvbmVudHMpLgoKSSBzZWUgeW91ciBwb2ludCwg
Z29vZCB0byBrbm93LiBFdmVudHVhbGx5IGl0IG1heSBiZSBhbiBvcHRpb24gdG8KbWFyayBzdWNo
IGZpcm13YXJlLW1hbmFnZWQgcHdtIGNoYW5uZWxzIGluIERULgpJJ2xsIHdhaXQgZm9yIHBvdGVu
dGlhbCBhZGRpdGlvbmFsIGZlZWRiYWNrIHVudGlsIHRvbW9ycm93LCB0aGVuIEknbGwKc3VibWl0
IGEgdmVyc2lvbiBpbmNsLiB0aGUgdHdvIHNtYWxsIGNoYW5nZXMgdG8gYWRkcmVzcyB5b3VyIHJl
bWFya3MuCgo+IEknZCBiZSBoYXBweSBpZiB0aGVyZSBhcmUgb3RoZXIgc3VnZ2VzdGlvbnMgYXJv
dW5kIHRoaXMgdGhvdWdoLgo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
