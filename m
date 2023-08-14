Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5244C001E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Aug 2023 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYf5ri7MxxZ+nnMAKYlQ0aG/G8jflHJOUklpYBPgza8=; b=f+c3QUoZ7ft8TkdBdOu/Lb0fWf
	2qMsUSVE/Mnaukxbr8+lCL0IN3plT8GML56ldIGw5Ge5yAA40KjSNPnfJ1DG5f45vzynb8+aLP+Bf
	YsswRbb6Xzfoe1beavLUlrjA79EORnA+ZP3JSRA/oxU1Jjdzx7BVpmXkcS0cFKYPfqPk1qRTMl8Io
	jpZ7+Azm4i+RIi65cxtd8z2qkw8Abw0hzQJNeqgoFr5cnK4kZ7ujOS+RZsTU01Vk6u4/q6Udk5Kxj
	DruXNEc++6ZrpG818g0cWggu9D5Yp3ornwpkODHn2MO07VrgODIhi8MmdeT8KqeyBrM+I3cJufWlH
	QFYQpg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS9S-00GO64-1L;
	Mon, 14 Aug 2023 07:38:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVS9P-00GO5E-17
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Aug 2023 07:38:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe24dd8898so37323925e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Aug 2023 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691998685; x=1692603485;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BtaZrQAzMY3C2BNbWsPBhj/MtFtsIGPg278AEO8RQZs=;
        b=oww2Mv8CDKfGb6++dMt9FkLnxFb8+zw4f/tqkCazEJVtd8ckFKV2B71OtHul3caxOd
         l+SnF4TUnI5nmYGzyARMNIZJG72nC/MkSI6Q+Xl6gZ2C56DZ9iA/xfNHKHGEFf3WRxWL
         BAhGoz6yaEvAJ9ILKzNDQx98gQ8FF3LiI+4iLMbs39rPWFpLSI5GD+f9zngSTBa20hNT
         i3F9RBhRU5eWtKKbW+muxAmh1w8Jge7SZVwnX7HjomL1KZjVvlKo8XjBzdb3+emAKfsY
         dXBu4TLNg0h6AnBlU0Eu3ghAJH9VX6UlBeaH5MFqUYpLQF4eucoD6GFe63BVnWip5zXK
         mZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691998685; x=1692603485;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtaZrQAzMY3C2BNbWsPBhj/MtFtsIGPg278AEO8RQZs=;
        b=ZDSMlfkc4Nu6YPzQX2wyAKhRhpXIPyANdZivW96Ew9/Y+7A5L6iyl6ZNVHnrUpd4S+
         6dzxEG5//XLsF/9J97fseLUBWwtSiRlv0PbrG4FCfum5ouzJ7DxpjUZcqNOsEFE4Su9O
         Aq+mWdgSVpbITjRvmv5KP5Jwr4h6EyvgbGD8JAdFwL9JmmKrwvOrBMCic8w82/d15HZA
         8JP7LvKzh2UZvsLtrHu5AhIg1PRpQtiQZSDUg+Ul7oDLaY4vVqWyXcqww5EHNvvlp+yd
         nK1gnoD4bKbgfo/g0zX2QFPaRUddJ60urrxyShgvbJX0/ucjrq9pqdtYrLpudeR8UsY3
         JAig==
X-Gm-Message-State: AOJu0YySGVbGinFAv30ticSfWLJz3C6ewsvc7fox2Ql5PZXyme5zcXII
	MzfSt62bxhUhpaoP/fkosGBX2A==
X-Google-Smtp-Source: AGHT+IGGBF9EalQNUGiGQY7O+CRjN8MTlwMZBKosUNjwisqkxL1RRErmSXT+NU1/gd2YA80eBp8CTg==
X-Received: by 2002:a05:600c:215a:b0:3fe:4900:dba8 with SMTP id v26-20020a05600c215a00b003fe4900dba8mr6648865wml.9.1691998684961;
        Mon, 14 Aug 2023 00:38:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id y2-20020adffa42000000b00317e6f06e22sm13577670wrr.77.2023.08.14.00.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 00:38:04 -0700 (PDT)
Message-ID: <0aea6c90-bae0-4400-5ddd-eb792f92664e@linaro.org>
Date: Mon, 14 Aug 2023 09:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 0/3] Add binding header file for GPIO interrupt of
 Amlogic Meson-G12A
To: Linus Walleij <linus.walleij@linaro.org>,
 Huqiang Qin <huqiang.qin@amlogic.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
 <CACRpkdafAWgt9A8km1zLZF9UawXkdqBOEVnMHiRjaF=2SeyhgA@mail.gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdafAWgt9A8km1zLZF9UawXkdqBOEVnMHiRjaF=2SeyhgA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_003807_404257_69254DC6 
X-CRM114-Status: GOOD (  13.99  )
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

T24gMDcvMDgvMjAyMyAxNTozNywgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBNb24sIEp1bCAy
NCwgMjAyMyBhdCA4OjAy4oCvQU0gSHVxaWFuZyBRaW4gPGh1cWlhbmcucWluQGFtbG9naWMuY29t
PiB3cm90ZToKPiAKPj4gQWZ0ZXIgYWRkaW5nIHRoaXMgYmluZGluZyBoZWFkZXIgZmlsZSwgeW91
IGNhbiBpbnR1aXRpdmVseSBmaW5kCj4+IHRoZSBpbnRlcnJ1cHQgbnVtYmVyIGNvcnJlc3BvbmRp
bmcgdG8gZWFjaCBHUElPLCBhbmQgYXBwbHkgaXQKPj4gaW4gdGhlIGZvcm1hdCBvZiBJUlFJRF9Y
WFggd2hlcmUgaXQgbmVlZHMgdG8gYmUgdXNlZC4KPiAoLi4uKQo+IAo+PiBIdXFpYW5nIFFpbiAo
Myk6Cj4+ICAgIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogQWRkIGhlYWRlciBm
aWxlIGZvciBBbWxvZ2ljCj4+ICAgICAgTWVzb24tRzEyQSBTb0NzCj4+ICAgIHBpbmN0cmw6IFJl
cGxhY2UgdGhlIElSUSBudW1iZXIgaW4gdGhlIGRyaXZlciB3aXRoIHRoZSBJUlFJRCBtYWNybwo+
PiAgICAgIGRlZmluaXRpb24KPj4gICAgYXJtNjQ6IGR0czogUmVwbGFjZSB0aGUgSVJRIG51bWJl
ciB3aXRoIHRoZSBJUlFJRCBtYWNybyBkZWZpbml0aW9uCj4gCj4gTmVpbCB3cm90ZToKPj4gV2hh
dCdzIHRoZSBiZXN0IHdheSB0byBhcHBseSB0aGlzIHBhdGNoc2V0ID8KPiAKPiBJIGp1c3QgYXBw
bGllZCBhbGwgdGhyZWUgdG8gdGhlIHBpbiBjb250cm9sIHRyZWUuCj4gCj4gSSBjb3VsZCBoYXZl
IGFwcGxpZWQganVzdCB0aGUgdHdvIGZpcnN0IGFuZCB0aGVuIG9mZmVyZWQgYW4KPiBpbW11dGFi
bGUgYnJhbmNoLiBCdXQgZWguLi4gdG9vIG11Y2ggd29yayBmb3IgdG9vIGxvdyByaXNrLgo+IEJl
dHRlciB0byBqdXN0IGFwcGx5IGl0IGFuZCBob3BlIGFsbCB3b3JrcyBvdXQuIElmIGl0IGV4cGxv
ZGVzCj4gSSBqdXN0IGJhY2sgb3V0IGFuZCBmaWd1cmUgc29tZXRoaW5nIGxpa2UgdGhlIGFib3Zl
LgoKUGVyZmVjdCwgdGh4IDotKQoKTmVpbAoKPiAKPiBZb3VycywKPiBMaW51cyBXYWxsZWlqCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
