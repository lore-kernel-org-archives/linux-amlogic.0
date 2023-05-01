Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF4FC77B73
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjaBodXLChZ8r10z2OXSxAkQL1kUbMBa6y7D+ZP7Ghc=; b=aHA4EyeJyqgTbD
	mJlzCBXrRfr9bxiE4Fmac2DNxTT5E4AEvPO+NGDeU5xSa/vX0Lx26g6Cgxuvb2BN1ume8JbDlAzPG
	A4JivOubiDorw6BV5S10SvsOI1pjeAryINbQ1v1y2j0NULEQcRMFoyynnol0JrDXkJPJeTDxvSXvS
	q7Plk8SfJX/7tevFGm2ocrC/afd1ghDAiWY4Cto/e+WdSKe03ecnusTcPMwQPPD7WZOjERe005a+j
	ksUeRHFXVViXSUhdjKwUrb752tYq6F397aBSouwptE298CTonVLE9bCh3qpEHpYjdUZ2prX5Sv5D4
	MuYqwvycIDHIdQjSjv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptQKo-00FZHg-2K;
	Mon, 01 May 2023 10:00:42 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptQKl-00FZGU-20
	for linux-amlogic@lists.infradead.org;
	Mon, 01 May 2023 10:00:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc22805d3so2105088a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 01 May 2023 03:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682935236; x=1685527236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkOomt6tBl7+mC6uaUyDQKMgbw/xe1HKh6gjrCXxFHs=;
        b=tQsWhEw5bVJYgz0T81aKGWIMqfTt2Hl3bYAAPetvydYCQrz4Y5x3zn2yLB1oof9HIj
         0mQs57cjeI6fK8FpAcA8Ijp5ACB0Vw/Z8VYAa9TTaDNKD1oUB4h5t+tOR378qjrf3Lo8
         q9RT/kk/tEr3BBB3+uZtvVoiYqn3l+ix8xxz9JpnwXE/k7EV2s3Ok3QR1jinjgUxrKwQ
         MQ4KNt2ZNUTjOGTPGV0/ROE3mYkxY2Co/QP+tXsF0B2WmW3cWs2mfH4KmnMD84n3Adih
         VvP2Iuj3oq65T89i3DLEs/jq0y/qWJP+k3M+A2ZYwdOQ9Td+nnTKv2/oQ0zGBSkGuceG
         pIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682935236; x=1685527236;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkOomt6tBl7+mC6uaUyDQKMgbw/xe1HKh6gjrCXxFHs=;
        b=baPtKuk6Cmmu4UEi1KnA3WYs7LdhxJeQ29kT8OiCrjaTEzjVTaoAgUNVyjryChJL0K
         JtuYMC7bQf+91m+hgmreuTmMU2R2FOVQxWoSWcAN0IU0AybUqHNh4VLhwqNCJHT4fzkF
         i5Tsdh0AriyHqleweizYMNlugMtl6gmnlZ2bvCSveibV+sKsPf7rq4j3jUd636ZhpE4y
         Vi8eu0RZdtG7i4YDFOx98C7AGo5asLoHQysUDPM9rmNDroAB6tvH3b4aXLMz5MquUTsi
         DeLGGdZQsYHws93lOCS1viijjiDIfLaDropJiYg4KPvrkG+0VumC1Q1opO1yVN8o+WlD
         1IgQ==
X-Gm-Message-State: AC+VfDwCvwhMD9pzYD6I+goI/KkT79+TBCxNgPmGZELUzvqhVTCSfbSq
	D193srj0LI72NnOQ2kdSwmxRiQ==
X-Google-Smtp-Source: ACHHUZ54UKkHxmw4nSTauFR9wUUVYcouhrju6Lh7lgnQ44osDZooe2HEmZy5gTOuUInPhe/L/FF8mQ==
X-Received: by 2002:aa7:d318:0:b0:501:d6c2:7439 with SMTP id p24-20020aa7d318000000b00501d6c27439mr5088432edq.37.1682935235399;
        Mon, 01 May 2023 03:00:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id g18-20020a056402181200b004c2158e87e6sm11847552edy.97.2023.05.01.03.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 03:00:34 -0700 (PDT)
Message-ID: <87a3bb36-bb75-5c01-dbdc-ee91d6496321@linaro.org>
Date: Mon, 1 May 2023 12:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 2/2] arm64: dts: add support for C3 based Amlogic
 AW409
Content-Language: en-US
To: "xianwei.zhao" <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-3-xianwei.zhao@amlogic.com>
 <4e6469e5-0f6c-4150-4709-7459597f06cc@linaro.org>
 <5a11ccfd-eafa-391a-e2b9-d032510c9e7b@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5a11ccfd-eafa-391a-e2b9-d032510c9e7b@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_030039_659524_23CA7F1E 
X-CRM114-Status: GOOD (  17.83  )
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

T24gMjcvMDQvMjAyMyAxMDo1NCwgeGlhbndlaS56aGFvIHdyb3RlOgo+IEhpIEtyenlzenRvZiwK
PiAKPiAgwqDCoCDCoMKgwqDCoCBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4gCj4gT24gMjAy
My80LzE5IDE1OjQ4LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBb5L2g6YCa5bi45LiN
5Lya5pS25Yiw5p2l6Ieqa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnICDnmoTnlLXlrZDp
gq7ku7bjgILor7forr/pl65odHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb27vvIzku6Xkuobop6Pov5nkuIDngrnkuLrku4DkuYjlvojph43opoFdCj4+Cj4+IFsgRVhU
RVJOQUwgRU1BSUwgXQo+Pgo+PiBPbiAxOS8wNC8yMDIzIDA5OjM4LCA9WGlhbndlaSBaaGFvIHdy
b3RlOgo+Pj4gRnJvbTogWGlhbndlaSBaaGFvPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+
Cj4+PiBBbWxvZ2ljIEMzIGlzIGFuIGFkdmFuY2VkIGVkZ2UgQUkgcHJvY2Vzc29yIGRlc2lnbmVk
IGZvciBzbWFydCBJUCBjYW1lcmEKPj4+IGFwcGxpY2F0aW9ucy4KPj4+Cj4+PiBBZGQgYmFzaWMg
c3VwcG9ydCBmb3IgdGhlIEMzIGJhc2VkIEFtbG9naWMgQVc0MDkgYm9hcmQsIHdoaWNoIGRlc2Ny
aWJlcwo+Pj4gdGhlIGZvbGxvd2luZyBjb21wb25lbnRzOiBDUFUsIEdJQywgSVJRLCBUaW1lciwg
VUFSVC4gSXQncyBjYXBhYmxlIG9mCj4+PiBib290aW5nIHVwIGludG8gdGhlIHNlcmlhbCBjb25z
b2xlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbzx4aWFud2VpLnpoYW9AYW1s
b2dpYy5jb20+Cj4+PiAtLS0KPj4+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2Vm
aWxlICAgICAgICAgIHwgIDEgKwo+Pj4gICAuLi4vYW1sb2dpYy9hbWxvZ2ljLWMzLWMzMDJ4LWF3
NDA5LTI1Nm0uZHRzICAgfCAzMCArKysrKysrCj4+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9hbWxvZ2ljLWMzLmR0c2kgICB8IDg3ICsrKysrKysrKysrKysrKysrKysKPj4+ICAgMyBm
aWxlcyBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5k
dHMKPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9h
bWxvZ2ljLWMzLmR0c2kKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+
PiBpbmRleCBjZDFjNWIwNDg5MGEuLmQyYjVkMGQ3NTBiYyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+PiBAQCAtNzQsMyArNzQsNCBAQCBkdGItJChDT05GSUdf
QVJDSF9NRVNPTikgKz0gbWVzb24tc20xLW9kcm9pZC1oYzQuZHRiCj4+PiAgIGR0Yi0kKENPTkZJ
R19BUkNIX01FU09OKSArPSBtZXNvbi1zbTEtc2VpNjEwLmR0Ygo+Pj4gICBkdGItJChDT05GSUdf
QVJDSF9NRVNPTikgKz0gbWVzb24tc20xLXg5Ni1haXItZ2JpdC5kdGIKPj4+ICAgZHRiLSQoQ09O
RklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXNtMS14OTYtYWlyLmR0Ygo+Pj4gK2R0Yi0kKENPTkZJ
R19BUkNIX0FNTElQQykgKz0gYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0Ygo+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWMzLWMzMDJ4LWF3
NDA5LTI1Nm0uZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMtYzMw
MngtYXc0MDktMjU2bS5kdHMKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLjM4Y2E5OGEzMjE4MQo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5kdHMKPj4+
IEBAIC0wLDAgKzEsMzAgQEAKPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjArIE9SIE1JVCkKPj4+ICsvKgo+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAyMSBBbWxvZ2ljLCBJ
bmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4+PiArICovCj4+PiArCj4+PiArL2R0cy12MS87Cj4+
PiArCj4+PiArI2luY2x1ZGUgImFtbG9naWMtYzMuZHRzaSIKPj4+ICsKPj4+ICsvIHsKPj4+ICsg
ICAgIG1vZGVsID0gIkFtbG9naWMgQzMwMiBhdzQwOSBEZXZlbG9wbWVudCBCb2FyZCI7Cj4+PiAr
ICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYXc0MDkiLCAiYW1sb2dpYyxjMyI7Cj4+IFVuZG9j
dW1lbnRlZCBjb21wYXRpYmxlcy4gUnVuIGNoZWNrcGF0Y2ggYW5kIGZpeCBhbGwgd2FybmluZ3Mu
IEFueXdheSwgSQo+PiBhbSBub3Qgc3VyZSB0aGlzIHdhcnJhbnRzIHNlcGFyYXRlIGFyY2hpdGVj
dHVyZS4gSXNuJ3QgQzMgc3RhbmRhcmQgTWVzb24KPj4gU29DPwo+IFRoZSBwYXRjaCByZWxhdGVk
IHRvIGJpbmRpbmdzIGlzIGNvbW1pdHRlZCwgc2VlOiAKPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyMzA0MDcxMDI3MDQuMTA1NTE1Mi0xLWtlbHZpbi56aGFuZ0BhbWxvZ2ljLmNvbS8K
CkFuZCBob3cgY2FuIHdlIGtub3cgdGhpcz8gVGhlcmUgYXJlIG5vIGJpbmRpbmdzIGluIG5leHQs
IHNvIHlvdSBhcmUKc3VwcG9zZWQgdG8gc2VudCB0aGVzZSB0b2dldGhlci4gQXQgbWluaW11bSBs
aW5rIHRvIHRoZSBiaW5kaW5ncyBwYXRjaC4KCk90aGVyd2lzZSB5b3Ugd2lsbCBrZWVwIGdldHRp
bmcgcmV2aWV3IGNvbW1lbnRzLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
