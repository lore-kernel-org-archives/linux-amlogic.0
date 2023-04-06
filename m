Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C454C76196
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQahczTDX6m5U8RklKdMarWYGFkFVj9K3m42R5clNV0=; b=qcZ/FdeSWTY+LC
	5W7Jdujn8fcBfI42hHAmd5vgWqW82XNpno/SqkP7YWDMZnIwPzm/TwT26HG/AhZ+2c5Lr2n6uy32O
	EMBdvsv9XRXe3c0HXkGfqhiQTUSWM6bZplTlfL07yUmM51GrThl/42EHzaoI+tYtGQss4RpaW3sZQ
	T9WXFX11yav1lut9CuCT8PfU0WfHZeUClNb+OTEjNgl6oQV1Who5oTu9MKdZ+uCsLF28WO+UQnDoT
	DScS5SRCoTJJi8Bnt5tT6hUo1sWZpsfCX0NsSww6aoIdFPrw9gcthuAXgjzqYrjKvHg7G3gHNUvEc
	PrjYaQlQ3hCqyOitMRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkS7m-007wWc-01;
	Thu, 06 Apr 2023 16:06:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkS7j-007wVG-1P
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Apr 2023 16:06:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id y14so40052968wrq.4
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Apr 2023 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680797165; x=1683389165;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tGBcjAE6j139nGrIeCa4gFdeD5NsoReg/shcLBHBhms=;
        b=ilJZDzEidBWQIUC/WEyHBGDCmt0cL+CP5MSZDpG5JB4DEmx+iCCm2eolefvzKHqePs
         pPr5KEMziD1SfnzjcT7+V2LbK6NO4kGSMU9+vrMBiNxCUo+0yCJLJXN1GOd8xnTsrDFP
         5ttKj7hXEN+WARyIDBN+aJMbKgLwykkxseBQlNWWYddQ7j24/HTKyL2rfD5d9YgpSvH8
         NCOWr7ne1XNH4RceyRoq74JZKlfolKiIu4uOwzNmkdyjCaRkkE3yNkOn5sgi+Brd7EQ9
         BxsNdGp4804+wu6FlQ7CxoZI5ausQcPB0JIBbA10IeZTz+Q1A1ccbUueZTedCg1t2U74
         YoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680797165; x=1683389165;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGBcjAE6j139nGrIeCa4gFdeD5NsoReg/shcLBHBhms=;
        b=Ttm4RXvi47jc9oX/KtUyz9pkQ/230rxsaGN0Q5ruloBwnS+2v7vHEhc9nLiYaFOtak
         WnC9YVgjlhBw6QGcQwIsjbzA6tanI+214sldL8Hw0IEog/aKh12gkeEQS5oi8l7+0eKW
         E92aVH22KAI+PLIQc6UK17RLEEvMuVafDA1ZZC4/c/AutpTR0HSGbwU8hk4x+saKveC3
         Y7hLzMKdKqXjcfyscnoMUizrewCAZM8b8y5qg139bxpVQGs/9S12KEVOOH+LaPDsU1xj
         AEJEJcR/DiYTo0yX5PiaVXrw95X9f4fT8WFfLaZmITXmMniaSzQtDQE3oO1riUgWfJ8U
         GqbQ==
X-Gm-Message-State: AAQBX9ddzHW6KfQ41Neq/cjz8/aGoikfJx9FYSwjniqTU6daWx/PvUCD
	l774wqUtqWe/dW6/yCzt/lFadw==
X-Google-Smtp-Source: AKy350Z6NL84QoajoMkHAcqHoiPnqfDtjwjHP1ozYJ3eK1bhBdJxqz9vdxU74lO60iF0AtXdxGpuBg==
X-Received: by 2002:a5d:6584:0:b0:2ee:ee98:efbe with SMTP id q4-20020a5d6584000000b002eeee98efbemr1836418wru.58.1680797165454;
        Thu, 06 Apr 2023 09:06:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8569:a62a:11bd:c344? ([2a01:e0a:982:cbb0:8569:a62a:11bd:c344])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d634a000000b002e116cbe24esm2112794wrw.32.2023.04.06.09.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 09:06:05 -0700 (PDT)
Message-ID: <9835aeba-6e4c-0594-427b-9990fc07407a@linaro.org>
Date: Thu, 6 Apr 2023 18:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] of: fdt: Allow the kernel to mark nomap regions
 received from fdt
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 martin.blumenstingl@googlemail.com, narmstrong@baylibre.com, stefan@agner.ch
References: <20230406151429.524591-1-tanure@linux.com>
 <20230406151429.524591-3-tanure@linux.com>
 <CAL_JsqL_MLHO-zk0HAmuAmiJQ_TmD4EN5YC0JmRs7PXjStjr3A@mail.gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <CAL_JsqL_MLHO-zk0HAmuAmiJQ_TmD4EN5YC0JmRs7PXjStjr3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_090607_477974_F1D50715 
X-CRM114-Status: GOOD (  29.60  )
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

T24gMDYvMDQvMjAyMyAxNzo0OCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBBcHIgNiwg
MjAyMyBhdCAxMDoxNOKAr0FNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4gd3JvdGU6
Cj4+Cj4+IFJlc2VydmVkIHJlZ2lvbnMgY2FuIGJlIGRlc2NyaWJlZCBpbiBGRFQgYW5kIGRldmlj
ZSB0cmVlcywgYnV0IEZEVCBkb2Vzbid0Cj4+IHByb3ZpZGUgdGhlIHJlbGF0ZWQgZmxhZ3MsIGxp
a2Ugbm9tYXAuCj4gCj4gSXQgdG9vayBtZSBhIG1pbnV0ZSB0byB1bmRlcnN0YW5kIHdoYXQgeW91
IG1lYW50IGJ5IEZEVCB2cy4gZGV2aWNlCj4gdHJlZXMuIFVzZSB0aGUgZXhhY3QgdGhpbmdzIHlv
dSBhcmUgdGFsa2luZyBhYm91dDogL21lbXJlc2VydmUvIGFuZAo+IC9yZXNlcnZlZC1tZW1vcnkg
bm9kZS4KPiAKPj4gU28gYWxsb3cgdGhlIGtlcm5lbCB0byBtYXJrIHJlZ2lvbnMgd2hlcmUgdGhl
IGJhc2UgYW5kIHNpemUgcmVjZWl2ZWQgZnJvbQo+PiB0aGUgZGV2aWNlIHRyZWUgYXJlIHRoZSBz
YW1lIGFzIHRoZSBiYXNlIGFuZCByZWdpb24gb24gRkRULgo+PiBIZXJlIHdlIHRydXN0IHRoYXQg
dGhlIGRldmljZSB0cmVlIGhhcyBhIG1vcmUgdXBkYXRlZCBkZXNjcmlwdGlvbiBvZiB0aGUKPj4g
cmVnaW9uIHRoYW4gdGhlIG9uZSByZWNlaXZlZCBmcm9tIEZEVC4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL29m
L2ZkdC5jIHwgMTAgKysrKysrLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL2ZkdC5jIGIv
ZHJpdmVycy9vZi9mZHQuYwo+PiBpbmRleCBkMWE2OGI2ZDAzYjMuLjc1NGE3ZWE0ZjQ1YyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9vZi9mZHQuYwo+PiArKysgYi9kcml2ZXJzL29mL2ZkdC5jCj4+
IEBAIC00ODIsMTEgKzQ4MiwxMyBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9pbml0X2R0X3Jl
c2VydmVfbWVtb3J5KHBoeXNfYWRkcl90IGJhc2UsCj4+ICAgICAgICAgIGlmIChub21hcCkgewo+
PiAgICAgICAgICAgICAgICAgIC8qCj4+ICAgICAgICAgICAgICAgICAgICogSWYgdGhlIG1lbW9y
eSBpcyBhbHJlYWR5IHJlc2VydmVkIChieSBhbm90aGVyIHJlZ2lvbiksIHdlCj4+IC0gICAgICAg
ICAgICAgICAgKiBzaG91bGQgbm90IGFsbG93IGl0IHRvIGJlIG1hcmtlZCBub21hcCwgYnV0IGRv
bid0IHdvcnJ5Cj4+IC0gICAgICAgICAgICAgICAgKiBpZiB0aGUgcmVnaW9uIGlzbid0IG1lbW9y
eSBhcyBpdCB3b24ndCBiZSBtYXBwZWQuCj4+ICsgICAgICAgICAgICAgICAgKiBzaG91bGQgbm90
IGFsbG93IGl0IHRvIGJlIG1hcmtlZCBub21hcCwgdW5sZXNzIGlzIHRoZSBleGFjdCBzYW1lIHJl
Z2lvbgo+PiArICAgICAgICAgICAgICAgICogKHNhbWUgYmFzZSBhbmQgc2l6ZSksIHdoaWNoIHRo
ZSBrZXJuZWwga25vd3MgYmV0dGVyIGFuZCBzaG91bGQgYmUgYWxsb3dlZCB0byBtYXJrCj4+ICsg
ICAgICAgICAgICAgICAgKiAgaXQgYXMgbm9tYXAuCj4+ICsgICAgICAgICAgICAgICAgKiBCdXQg
ZG9uJ3Qgd29ycnkgaWYgdGhlIHJlZ2lvbiBpc24ndCBtZW1vcnkgYXMgaXQgd29uJ3QgYmUgbWFw
cGVkLgo+PiAgICAgICAgICAgICAgICAgICAqLwo+PiAtICAgICAgICAgICAgICAgaWYgKG1lbWJs
b2NrX292ZXJsYXBzX3JlZ2lvbigmbWVtYmxvY2subWVtb3J5LCBiYXNlLCBzaXplKSAmJgo+PiAt
ICAgICAgICAgICAgICAgICAgIG1lbWJsb2NrX2lzX3JlZ2lvbl9yZXNlcnZlZChiYXNlLCBzaXpl
KSkKPj4gKyAgICAgICAgICAgICAgIGlmIChtZW1ibG9ja19vdmVybGFwc19yZWdpb24oJm1lbWJs
b2NrLm1lbW9yeSwgYmFzZSwgc2l6ZSkgPT0gTUVNQkxPQ0tfT1ZFUkxBUFMgJiYKPj4gKyAgICAg
ICAgICAgICAgICAgICBtZW1ibG9ja19pc19yZWdpb25fcmVzZXJ2ZWQoYmFzZSwgc2l6ZSkgPT0g
TUVNQkxPQ0tfT1ZFUkxBUFMpCj4gCj4gV29uJ3QgdGhpcyBmYWlsIHRvIHdvcmsgYXMgSUlSQyBt
ZW1ibG9jayB3aWxsIG1lcmdlIHJlZ2lvbnMgd2hlbiB0aGV5Cj4gYXJlIGFkamFjZW50IGFuZCBo
YXZlIHRoZSBzYW1lIGF0cnJpYnV0ZXMuCj4gCj4gUGVyaGFwcyBpbnN0ZWFkLCB0aGUgRFQgY29k
ZSBzaG91bGQgaWdub3JlIGFueSAvbWVtcmVzZXJ2ZS8gZW50cmllcwo+IHRoYXQgYXJlIGFsc28g
aW4gL3Jlc2VydmVkLW1lbW9yeS4KPiAKPiBJIHdvdWxkIHN1Z2dlc3QganVzdCByZXZlcnNlIHRo
ZSBvcmRlciB0aGV5IGFyZSBwcm9jZXNzZWQsIGJ1dCBJCj4gc3VzcGVjdCB0aGF0IG1pZ2h0IGNh
dXNlIHNvbWUgcmVncmVzc2lvbi4gVGhpcyBjb2RlIGlzIGFsbCBmcmFnaWxlCj4gZXNwZWNpYWxs
eSB3aXRoIHBsYXRmb3JtcyBwdXR0aW5nIGluIDEwMCByZWdpb25zLgo+IAo+IEZpbmFsbHksIHBl
cmhhcHMgZml4IHUtYm9vdC4gVGhlIHJlYXNvbiB0aGUgcmVzZXJ2ZWQgbG9jYXRpb24gZ29lcyBp
bgo+IGJvdGggcGxhY2VzIHdhcyB0byBzdXBwb3J0IGFuIE9TIG5vdCBzdXBwb3J0aW5nIC9yZXNl
cnZlZC1tZW1vcnkuIEkKPiB0aGluayB0aGF0IHN1cHBvcnQgaGFzIGJlZW4gaW4gcGxhY2UgZm9y
IGEgbG90IGxvbmdlciB0aGFuIGFueW9uZQo+IHdvdWxkIGNhcmUgYWJvdXQuCgpGaXhpbmcgVS1C
b290IHdvbid0IGZpeCBhbHJlYWR5IHRhZ2dlZCBhbmQgaW4tdGhlLWZpZWxkIG1haW5saW5lIHUt
Ym9vdApyZWxlYXNlcyB0aGF0IGFkZHMgL21lbXJlc2VydmUvIGVudHJpZXMsIHNvIHllcyB1LWJv
b3Qgc2hvdWxkIGJlIGRlZmluaXRlbHkKZml4ZWQgYnV0IExpbnV4IHNob3VsZCBpZ25vcmUgdGhl
IC9tZW1yZXNlcnZlLyBlbnRyaWVzIHdoZW4gdGhleSBtYXRjaGVzCmFuIC9yZXNlcnZlZC1tZW1v
cnkgbm9kZSBsaWtlIHdoZW4gdGhlIFUtQm9vdCAvbWVtcmVzZXJ2ZS8gY29kZSB3YXMgYWRkZWQu
CgpOZWlsCgo+IAo+IFJvYgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
