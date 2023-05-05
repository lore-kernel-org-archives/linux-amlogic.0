Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73DDC77B7D
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 May 2023 06:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peWzh8z3VSyLzheYCcV27wLZ67xLVw2zM5ZYe5xcnkQ=; b=LTORMnfz/N+RGM
	lsa6eSFN82iIwLvzi4zSdX37jhW30Biwy2T7Do5d7ppkVGzbNIqlplQYpGqMJCtuZWIoo9y9Cifff
	1GbiYc2VvKAV1RWeqygU5867mdWYg93p+Q+U8MAV0/Wtr30cBpkPc8VsxW2fSbjKDDDFhlCidh82R
	A0CEPUFax5qYGr4EWAUfmjU1pdvN5sKM/diescclSX4j/GuFlSAJDD/If66ojhA3Ty83ObrTqZH+y
	KZEA7Vbua5Ee0UuLsJvxU+C6C5vCfZWFKEZMnaRgrQjCQmIYwS1xs7FCFS85XE77fof02dfper3fm
	lZ+1WqlufMgdkPf40ipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pup21-009ptZ-1y;
	Fri, 05 May 2023 06:35:05 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pup1v-009psL-2q
	for linux-amlogic@lists.infradead.org;
	Fri, 05 May 2023 06:35:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-965ab8ed1fcso238784366b.2
        for <linux-amlogic@lists.infradead.org>; Thu, 04 May 2023 23:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683268496; x=1685860496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAkyvWyF4krXoVnHjLYv3tN48g1RzcAs8aMEEzXY2gY=;
        b=X45nVQF3OseaTmUfj7pBJRMMAzEWz7c0rrlHEeg+BrFiIdv1eUOV32gLBarmBiwzn0
         84jEgvVTlFFnMepHZlN1g0PIAb7dchn6FVSkf++Cl7dbt7heXfaoOX1nqsnNR5wlo25E
         vh9M5x770KVfSsYFckMSC4Q6zquP5dMn/zUB8PwfA4ocNWqbYRBuAzhHnLfd5vvzkw7e
         43nSs24A3gL9+owhW8f9uvd+0qI6+RuntPGRGZ7aXm/KZ1MPEgyPkwhet1DZ8jZ7/Ug5
         07kdPEvZEP5N3rSqm1qSRuDBJS0GrzG0Hx5s4LsyOYx3PxXqnpibMukZN5CHCgfLa3D5
         PHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683268496; x=1685860496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAkyvWyF4krXoVnHjLYv3tN48g1RzcAs8aMEEzXY2gY=;
        b=OLNWkDyQpBvoRhLGmlX06J8TDr2kRcPrIV2qlz44PmqgP4psReAaEzmPcSYfOQXpZx
         J9KUhDrkWsz8qTzgW9Q0LUOJqrGBKBUeocFhCN23K+jgw11i6VzB2IxOlCsGpbVHi3rg
         OL9lC5bPEalTK+BzEAtK44S4wrmksZtYDtQ3uUEv+eIhP4ibq2PfNWHZdq488tufov9P
         H+PqbJzG+a1YU54aNSQsQZD+7yQd9d4hc/4ngOAc3bGnqyNS8OG5+A9a+/+zUs7EWW+6
         gYW8PB7+55IWb5Bflwcpa0F09dG4mSkKt27gUuqu85QR+M6q1raV1vnQpysfD1VVoe4a
         +kcw==
X-Gm-Message-State: AC+VfDxHpCqCQ8+4ZUU5320XTYsYtcv4LPZd/VtkPmc/nHp2+WbdYLW2
	UWvfLeCIlydkUpy8Pwv6q8lD+g==
X-Google-Smtp-Source: ACHHUZ5SjE3d8BPOgqSEk5hRH8FoxOL9eafK6pUEacEaW4npLAvE4VoedJACFncGXR7rz8xeqACDjQ==
X-Received: by 2002:a17:907:9405:b0:93b:5f2:36c with SMTP id dk5-20020a170907940500b0093b05f2036cmr216973ejc.61.1683268495972;
        Thu, 04 May 2023 23:34:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id kz25-20020a17090777d900b00958434d4ecesm534423ejc.13.2023.05.04.23.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 23:34:55 -0700 (PDT)
Message-ID: <d2ca44b1-71ab-093f-0dee-fa66e4aa378a@linaro.org>
Date: Fri, 5 May 2023 08:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V2] arm64: dts: add support for C3 based Amlogic AW409
Content-Language: en-US
To: "xianwei.zhao" <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230427085859.793802-1-xianwei.zhao@amlogic.com>
 <36e7a445-7d19-911a-1a94-ffc30172e1a3@linaro.org>
 <e3083eab-ba85-3e9b-b3f2-f50816163f9f@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e3083eab-ba85-3e9b-b3f2-f50816163f9f@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_233459_940278_B99DF948 
X-CRM114-Status: GOOD (  18.31  )
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

T24gMDUvMDUvMjAyMyAwNDozNywgeGlhbndlaS56aGFvIHdyb3RlOgo+IEhpIEtyenlzenRvZiwK
PiAgICAgICBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4gCj4gT24gMjAyMy81LzEgMTc6NTgs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IFvkvaDpgJrluLjkuI3kvJrmlLbliLDmnaXo
h6oga3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIOeahOeUteWtkOmCruS7tuOAguivt+iu
v+mXriBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb27vvIzku6Xk
uobop6Pov5nkuIDngrnkuLrku4DkuYjlvojph43opoFdCj4+Cj4+IFsgRVhURVJOQUwgRU1BSUwg
XQo+Pgo+PiBPbiAyNy8wNC8yMDIzIDEwOjU4LCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+PiBBbWxv
Z2ljIEMzIGlzIGFuIGFkdmFuY2VkIGVkZ2UgQUkgcHJvY2Vzc29yIGRlc2lnbmVkIGZvciBzbWFy
dCBJUCBjYW1lcmEKPj4+IGFwcGxpY2F0aW9ucy4KPj4+Cj4+PiBBZGQgYmFzaWMgc3VwcG9ydCBm
b3IgdGhlIEMzIGJhc2VkIEFtbG9naWMgQVc0MDkgYm9hcmQsIHdoaWNoIGRlc2NyaWJlcwo+Pj4g
dGhlIGZvbGxvd2luZyBjb21wb25lbnRzOiBDUFUsIEdJQywgSVJRLCBUaW1lciwgVUFSVC4gSXQn
cyBjYXBhYmxlIG9mCj4+PiBib290aW5nIHVwIGludG8gdGhlIHNlcmlhbCBjb25zb2xlLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29t
Pgo+Pj4KPj4+IC0tLQo+Pj4gVjEgLT4gVjI6IFJlbW92ZSBuZXcgYXJjaCwgYW5kIHVzZSBBUkNI
X01FU09OOwo+Pj4gICAgICAgICAgICBNb2RpZnkgbm9kZSBuYW1lLCBhbmQgZGVsZXRlIHN1cGVy
Zmx1b3VzIGJsYW5rIGxpbmVzLgo+Pj4gLS0tCj4+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9NYWtlZmlsZSAgICAgICAgICB8ICAxICsKPj4+ICAgLi4uL2FtbG9naWMvYW1sb2dpYy1j
My1jMzAyeC1hdzQwOS0yNTZtLmR0cyAgIHwgMjkgKysrKysrKwo+Pj4gICBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy5kdHNpICAgfCA4NiArKysrKysrKysrKysrKysrKysr
Cj4+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKykKPj4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWMzLWMzMDJ4LWF3
NDA5LTI1Nm0uZHRzCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvYW1sb2dpYy1jMy5kdHNpCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9N
YWtlZmlsZQo+Pj4gaW5kZXggY2QxYzViMDQ4OTBhLi5iY2VjODcyYzI0NDQgMTAwNjQ0Cj4+PiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUKPj4+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+Pj4gQEAgLTc0LDMgKzc0LDQgQEAgZHRi
LSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXNtMS1vZHJvaWQtaGM0LmR0Ygo+Pj4gICBk
dGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLXNlaTYxMC5kdGIKPj4+ICAgZHRi
LSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXNtMS14OTYtYWlyLWdiaXQuZHRiCj4+PiAg
IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zbTEteDk2LWFpci5kdGIKPj4+ICtk
dGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gYW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0
Ygo+Pgo+PiBMb29rcyB3cm9uZ2x5IG9yZGVyZWQuICdhJyBpcyBiZWZvcmUgJ20nLgo+IFdpbGwg
ZG8uCj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9n
aWMtYzMtYzMwMngtYXc0MDktMjU2bS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy1jMy1jMzAyeC1hdzQwOS0yNTZtLmR0cwo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWRjZTg4NTBiMzM4Cj4+PiAtLS0gL2Rldi9udWxsCj4+
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1jMy1jMzAyeC1hdzQw
OS0yNTZtLmR0cwo+Pj4gQEAgLTAsMCArMSwyOSBAQAo+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQo+Pj4gKy8qCj4+PiArICogQ29weXJpZ2h0IChjKSAy
MDIxIEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPj4+ICsgKi8KPj4+ICsKPj4+
ICsvZHRzLXYxLzsKPj4+ICsKPj4+ICsjaW5jbHVkZSAiYW1sb2dpYy1jMy5kdHNpIgo+Pj4gKwo+
Pj4gKy8gewo+Pj4gKyAgICAgbW9kZWwgPSAiQW1sb2dpYyBDMzAyIGF3NDA5IERldmVsb3BtZW50
IEJvYXJkIjsKPj4+ICsgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhdzQwOSIsICJhbWxvZ2lj
LGMzIjsKPj4KPj4gTWlzc2luZyBiaW5kaW5ncy4KPj4KPj4gUGxlYXNlIHJ1biBzY3JpcHRzL2No
ZWNrcGF0Y2gucGwgYW5kIGZpeCByZXBvcnRlZCB3YXJuaW5ncy4KPj4KPiBUaGUgYmluZGluZ3Mg
Y29tbWl0dGVkIGJ5IE5laWwsIGl0IGlzIGFwcGxpZWQgdG8gCj4gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQgCj4gKHY2LjUv
YXJtNjQtZHQpLAo+IGJpbmRpbmdzOiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MzA0MDcxMDI3MDQuMTA1NTE1Mi0xLWtlbHZpbi56aGFuZ0BhbWxvZ2ljLmNvbS8KCkl0J3Mgbm90
IGluIHRoZSBuZXh0LCBzbyBwbGVhc2UgYWx3YXlzIGxpbmsgdGhlbS4gV2UgZXhwZWN0IHRoZW0g
YWx3YXlzCnRvZ2V0aGVyLCBzbyBpZiB5b3UgZGVjaWRlIHRvIGRvIG90aGVyd2lzZSwgaXQncyB5
b3VyIGpvYiBub3cgdG8ga2VlcCB1cwppbmZvcm1lZC4gT3RoZXJ3aXNlIGhvdyBjYW4gd2Uga25v
dyB0aGF0IHlvdSBzZW50IGJpbmRpbmdzIG9yIHlvdSBkaWRuJ3Q/CgpCZXN0IHJlZ2FyZHMsCkty
enlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
