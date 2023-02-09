Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F94C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIqgbGIQTS4oINE+2DXENvT8ExXVu2B8j7aB+gkXCT8=; b=H4drtu1+L1e/ocAlBYBepcTAPY
	lD07AOgg8TWERVNogMGwIHL+Gn28GltD5MJkjcdn8AJLuxOnliG8s8A+FYhQQx40STsLsfpXoLbO9
	omKTbm0VqN1GjDUdDCWE6TXu8pZopP77btAYhXIx0hXMiVV80ANFxs8CIl6rA9vDg76UmKkPoZnWM
	Pz201KOTYDtXAZtQHmNeJ2Ms5efjrkHgNz5Ghx6VHoKzl6RKTnXkb2z3j75Yi8ubFsgoxVDmkuBNi
	ZVoRAdgWn4M58V3LfP0NP1oOcu2S/nV4lFemVQaw7XxeCi/JKB9dZz1dFFQIdmx9M4eNgf4OSRMr2
	/tUuPqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2Fb-000Y9w-Br; Thu, 09 Feb 2023 08:25:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2FX-000Y86-JM
	for linux-amlogic@lists.infradead.org; Thu, 09 Feb 2023 08:25:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id o36so883087wms.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Feb 2023 00:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bLQTVKIbz34iaILpH0NErLFZgySx8APs2YYrRkVuwb4=;
        b=HBCoygvakBrcEwOf4vymJr0uzCa2Yh18ZH6mYN2aN5pcSzQocDD/8mkz5H6uMCDsPH
         EhyvtiGJaHwTZFs1VAJF3gbEhHYUNssDvLLEvZCu0vxCdBgVGVvhU/EFxQTk48nUuZVE
         TgQeP9gGPWf+hUInR6bMQjHoGc9yryMCLO3vr/v2xWCxCK1JNYA4HV2i6c386HKqXc1o
         V75MBCUqhtIhWYO1VXPPhMr2tt+AVB2yAQOIIh6Ar/zPX3BoWbVkC4MYCTH177iaM3CQ
         IB5XS25LS4SOiKA8kjgwNi9T9VdoR19YL0sOLuvSIGCAu5M1lfaYcAfhj/+FOFykTI+i
         92hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLQTVKIbz34iaILpH0NErLFZgySx8APs2YYrRkVuwb4=;
        b=YOV/qC4YGnBjVYWEUX1haH4NF5MqWEhD1daoaL3RQvlS7shcj/RqN84f7VR8mvxr8e
         nhiDq8x/vpr7+MZYggFKXUmnp2/z8bDiOLTAXZhoNV3k7gV+PQ6I2LWW61LB3SGy6p3i
         nvBJruNUIcW6xFY2rM+cntNlZ1lL78PBG2D7Po3VYTiPz1NfW2MA35/BtclDZE//ffeq
         sZuhPua/Nyz7BYDgOrDEpBL2UXNwoDdQmWCRoE0lyuOQfJ182G+4AcUIfkYSWJ3sIJmD
         0CuLxpWIEZgUIjjbjDNNI8xbdz7oGZR6PCmggMeF0Y8sT4uNdaC14sITRqzzYHjxpr1C
         smhA==
X-Gm-Message-State: AO0yUKUnMZIdJweqL2cnqpM1T2X5dApYu9dRQqNmQAWjst8FeNB76ok+
	/LdJJS5zBcIy88YeSAOV75Vczw==
X-Google-Smtp-Source: AK7set+xZJ8bhRl5GOjP9i1P0UgeAJvwohi9gHQwL9gXhdiG5a8GIz8mnopa39dCVtj7k8mf42+16A==
X-Received: by 2002:a05:600c:43d2:b0:3d3:513c:240b with SMTP id f18-20020a05600c43d200b003d3513c240bmr9150492wmn.7.1675931143957;
        Thu, 09 Feb 2023 00:25:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5431:990b:7117:b75e? ([2a01:e0a:982:cbb0:5431:990b:7117:b75e])
        by smtp.gmail.com with ESMTPSA id ja13-20020a05600c556d00b003dc4b4dea31sm1067913wmb.27.2023.02.09.00.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 00:25:43 -0800 (PST)
Message-ID: <a376b71b-f0df-1276-d05f-be1c5bab90ae@linaro.org>
Date: Thu, 9 Feb 2023 09:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
 <f06d1676-4fce-846d-d8fe-fa68439b119e@linaro.org>
 <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
 <61db3f1c-b780-4385-f991-ebb4c3423791@linaro.org>
 <4dfc29ef-4d88-f899-3f96-fded32f5736f@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <4dfc29ef-4d88-f899-3f96-fded32f5736f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_002547_662372_44EF7D71 
X-CRM114-Status: GOOD (  17.06  )
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

T24gMDkvMDIvMjAyMyAwNzo0NCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDA4LjAyLjIw
MjMgMTM6NDAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+PiBMZSAyNy8wMS8yMDIzIMOgIDE0OjAy
LCBIZWluZXIgS2FsbHdlaXQgYSDDqWNyaXTCoDoKPj4+IE9uIDI3LjAxLjIwMjMgMDg6NTksIE5l
aWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24gMjYvMDEvMjAyMyAxNTow
MywgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+Pj4+PiBUaGUgdXNhZ2Ugb2YgZWRnZS10cmlnZ2Vy
ZWQgaW50ZXJydXB0cyBsZWFkIHRvIGxvc3QgaW50ZXJydXB0cyB1bmRlciBsb2FkLAo+Pj4+PiBz
ZWUgWzBdLiBUaGlzIHdhcyBjb25maXJtZWQgdG8gYmUgZml4ZWQgYnkgdXNpbmcgbGV2ZWwtdHJp
Z2dlcmVkCj4+Pj4+IGludGVycnVwdHMuCj4+Pj4+IFRoZSByZXBvcnQgd2FzIGFib3V0IFNESU8u
IEhvd2V2ZXIsIGFzIHRoZSBob3N0IGNvbnRyb2xsZXIgaXMgdGhlIHNhbWUKPj4+Pj4gZm9yIFNE
IGFuZCBNTUMsIGFwcGx5IHRoZSBjaGFuZ2UgdG8gYWxsIG1tYyBjb250cm9sbGVyIGluc3RhbmNl
cy4KPj4+Pgo+Pj4+IFRoYW5rcywgSSBhcHBsaWVkIGl0IGluIGZvci1uZXh0IHNvIGl0IHJ1bnMg
b24gdGhlIENJIHRlc3RzLgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFswXSBodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9saW51eC1tbWMvbXNnNzM5OTEuaHRtbAo+Pj4+Pgo+Pj4+PiBGaXhlczogMTQ5
OTIxOGM4MGM5ICgiYXJtNjQ6IGR0czogbW92ZSBjb21tb24gRzEyQSAmIEcxMkIgbW9kZXMgdG8g
bWVzb24tZzEyLWNvbW1vbi5kdHNpIikKPj4+Pgo+Pj4+IEkgdGhpbmsgd2Ugc2hvdWxkIGZpbmQg
YSBiZXR0ZXIgRml4ZXMgb3IgcGVyaGFwcyBzcGxpdCBpbiAzIHNvIGl0IHRhcmdldHMgdGhlCj4+
Pj4gcmlnaHQgY29tbWl0IGFkZGluZyB0aGUgbm9kZXMgZm9yIGVhY2ggZmFtaWx5Lgo+Pj4+Cj4+
PiBUaGlzIHdvdWxkIGJlIHRoZSBjbGVhbmVzdCBvcHRpb24sIHJpZ2h0LiBQcmFjdGljYWxseSBp
dCBzaG91bGRuJ3QgbWFrZQo+Pj4gbXVjaCBvZiBhIGRpZmZlcmVuY2UuIFRoZSBjaG9zZW4gY29t
bWl0IGlzIGZyb20gMjAxOSwgU0RJTyBpbnRlcnJ1cHQKPj4+IHN1cHBvcnQgaGFzIGJlZW4gYWRk
ZWQganVzdCByZWNlbnRseSwgYW5kIHJlZ2FyZGluZyBNTUMvU0QgaXQgc2VlbXMgbm8KPj4+IHBy
b2JsZW1zIGNhdXNlZCBieSBlZGdlLXRyaWdnZXJlZCBpbnRlcnJ1cHRzIGFyZSBrbm93bi4KPj4K
Pj4gSSB1bmRlcnN0YW5kLCBidXQgdGhlIEZpeGVzIHRhZyBtdXN0IHJlZmxlY3Qgd2hhdCBjb21t
aXQgaW50cm9kdWNlZCB0aGUgYnJlYWthZ2UsCj4+IHNvIGVpdGhlciBrZWVwIGEgc2luZ2xlIHBh
dGNoIGJ1dCBsaXN0IGFsbCBjb21taXRzIGludHJvZHVjaW5nIHRoZSBNTUMsIFNEICYgU0RJTyBu
b2Rlcwo+PiBvbiB0aGUgMyBmYW1pbGllcywgb3Igc3BsaXQgaW4gMyBhbmQgc3BlY2lmeSB0aGUg
Y29tbWl0IGludHJvZHVjaW5nIHRoZSBNTUMsIFNEICYgU0RJTwo+PiBub2RlIG9uIGVhY2ggZmFt
aWx5Lgo+Pgo+PiBJJ2xsIHByZWZlciB0aGUgbGF0ZXIuCj4+Cj4+IElmIHRoZSBwYXRjaCBpc24n
dCBhcHBsaWNhYmxlIGZvciBvbGRlciBrZXJuZWxzLCBpdCBkb2Vzbid0IG1hdHRlciBhcyB0aGUg
c3RhYmxlIHRlYW0KPj4gd2lsbCBvbmx5IGFwcGx5IHRoZSBmaXggb24gYSB0cmVlIGlmIGl0IGFw
cGxpZXMgYW5kIGJ1aWxkcy4KPj4gSWYgeW91IHRhcmdldCBhbiBvbGRlciByZWxlYXNlIHlvdSBj
YW4gc3VibWl0IHRoZW0gYSBwYXRjaCByZXdvcmtlZCB0byBhcHBseQo+PiBjb3JyZWN0bHkgaWYg
dGhlIG9yaWdpbmFsIHBhdGNoIGlzIGFscmVhZHkgb25seSBMaW51cyBtYXN0ZXIgdHJlZS4KPj4K
PiBEbyB5b3UgbmVlZCBhIHJldmVydCBmb3IgdGhlIGN1cnJlbnQgIlRFU1QiLWFubm90YXRlZCBj
b21taXQgaW4gbGludXgtbmV4dAo+IGFzIHBhcnQgb2YgdGhlIHNlcmllcz8KCk5vIG5lZWQsIEkn
bGwgcmVtb3ZlIGl0IGZyb20gZm9yLW5leHQuCgpOZWlsCgo+IAo+PiBBbmQgZG9uJ3QgZm9yZ2V0
IGFkZGluZyB0aGUgVGVzdGVkLWJ5IHRhZ3MuCj4+Cj4+IFRoYW5rcywKPj4gTmVpbAo+Pgo+Pj4K
Pj4+PiBJZiB0aGUgdGVzdCBkb2Vzbid0IHJlcG9ydCBhbnkgYnJlYWthZ2UsIEknbGwgcHJvYmFi
bHkgYXNrIHlvdSB0aGF0Lgo+Pj4+Cj4+PiBTdXJlLgo+Pj4KPj4+PiBOZWlsCj4+Pj4KPj4+IEhl
aW5lcgo+Pj4KPj4KPiBIZWluZXIKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
