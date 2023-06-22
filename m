Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC77AEB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EWoY3a3/PE++Qow4LyX15TTly2J+4vRe9t6W5uNUkg=; b=CVNbJuwMdyG1YeL6bn5Qf3JGAp
	xPJVswGk/2y5SUmXO9hlv+vycgsUZTQ9IfyxjpxTf5vzROdManCm3XsMSqlkpIsbYiWa9VPUepjBz
	eMDYwLrKOeJTATU9c5keC+0LA7+rlW6s9gvHvGRwGVYhRSYOWVJNcr3CG3CPQ5VZGIwU3aJgUfjF4
	rZxsXtHkhXdRag/SeyRrR2sf7t8ASH3FYG3gewaQcYUjZMz6/wfK7xcfZ/jC9H6QW4RUocV5cd+zT
	amwqn6eCDf3CniJ8Nh/es/fsHKfKK8CLsE/sfdo31DTfh/z6QLhpb4Rwl9/ezR3ADmE0sl8PNTWTS
	EbrKZmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFRx-00HNlw-0C;
	Thu, 22 Jun 2023 08:13:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFRs-00HNja-2h
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jun 2023 08:13:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f9ede60140so7729845e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jun 2023 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687421625; x=1690013625;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xBt2ekqJ0sia2Hb53NunP8E+iWHCyIXmjcNKrTqEDs0=;
        b=vXOpyrXgdc0xTE+YD7sbBTCml+Y7FYfUb5kKe6yGOZ+9fCW1pfzc0uJ4t797yaiUz0
         2EcVUfIXaSSfZnGHph1InDSAXeKyh6mCvSYUevjm0E4ZM0Z2gZ9v1jHrveof4pcebirh
         tzxX1HPwwNK8uPLVSOeVwTvLKWVLsQiEo/1EANbeC7kDci655dsHmDye99J4WFL/Rtyo
         WPDbg2J28IKCkFDzf2J2GUs6c3+YXrOJ8nrRM+6x0h8Nn2KZVILHNu56t5O8Ik9ZtqjU
         EMe+mChVF9ddkvlMVwdJIgyFEDPo9kh9P0dLSAUCkTZJJ8uqbCCG/dzNCMihAjgeKh+J
         +3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687421625; x=1690013625;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBt2ekqJ0sia2Hb53NunP8E+iWHCyIXmjcNKrTqEDs0=;
        b=kBJWMNjdJ9kM3EULBgOX2CShN4iYBiUm9pG/6LHKaXxBMPci+ihW01NPCKbCoPTD+N
         36fHiqZ/V0Z61k/aCj/AIf5C2y0MZeuWreVCB+QxQoIPl5NIBp3tIv7IjY4de1I35vwl
         WxnEJePkfFxXNcAr1yt+7zkrIz93FeVVZqDKZqpvm47cb1A9uDZi1Y+Uy35rjuO/H8qn
         pi7Zlc5PC7/Hsu3JJsTODkH6M9auRWf6Mx2QXkT2XXeZta+/w94XidSWZnl8qt0UWf1r
         Cd8V2QyTbRqwPmh4f1dmge8PxycQfHj5RmLSYaMFQN2IpD9LO52C1CjeecGVJn8Nzbd2
         DAQw==
X-Gm-Message-State: AC+VfDyD3mUft4aEZGYbuX1YoFeWvqv0MKzAF6InczfRD21dn8TsH7E7
	RgNeyP4IZs4Gm5wRNB5r5bch7w==
X-Google-Smtp-Source: ACHHUZ475XXZXU/6F2syTDxBr5VRodl+0PPu8YxpHRhgZXoJQaySn7JsPy29tk9ZpN3gB14L12m/0A==
X-Received: by 2002:a05:600c:2945:b0:3f9:b31d:5689 with SMTP id n5-20020a05600c294500b003f9b31d5689mr6828378wmd.36.1687421625062;
        Thu, 22 Jun 2023 01:13:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f692:a800:4794:385? ([2a01:e0a:982:cbb0:f692:a800:4794:385])
        by smtp.gmail.com with ESMTPSA id r19-20020a05600c285300b003f605566610sm17944436wmb.13.2023.06.22.01.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:13:44 -0700 (PDT)
Message-ID: <2fe41e89-9a26-e7ba-6ef6-2c9262bda43d@linaro.org>
Date: Thu, 22 Jun 2023 10:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Content-Language: en-US
To: tanure@linux.com, Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>,
 Artem <art@khadas.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230621133215.109254-1-tanure@linux.com>
 <20230621133215.109254-3-tanure@linux.com>
 <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org>
 <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
 <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com>
 <e4c993e1-8409-1ec0-c1b2-175603052e46@linaro.org>
 <CAJX_Q+09WLqmnWwOL7QESEuDzwZvVVzbtg9Upd5j2LOAYs=vmA@mail.gmail.com>
 <20230622-hardhat-elitism-26f0d0df204f@wendy>
 <CAJX_Q+3+bdXd-NrsQymXerpWZuj3zb8CKHcZRNM_iLSZcp2Mfg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAJX_Q+3+bdXd-NrsQymXerpWZuj3zb8CKHcZRNM_iLSZcp2Mfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_011348_902097_EABC65C3 
X-CRM114-Status: GOOD (  24.24  )
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

T24gMjIvMDYvMjAyMyAwOTozNiwgTHVjYXMgVGFudXJlIHdyb3RlOgo+IE9uIFRodSwgSnVuIDIy
LCAyMDIzIGF0IDg6MTLigK9BTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPiB3cm90ZToKPj4KPj4gT24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgMDc6NDM6MzFBTSArMDEw
MCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+Pj4gT24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgNzowNeKA
r0FNIEtyenlzenRvZiBLb3psb3dza2kKPj4+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+IHdyb3RlOgo+Pj4+IE9uIDIyLzA2LzIwMjMgMDc6MzIsIEx1Y2FzIFRhbnVyZSB3cm90ZToK
Pj4+Pj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgNzoxMuKAr1BNIENvbm9yIERvb2xleSA8Y29u
b3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+PiBPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCAwMzo1
MzowNFBNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+Pj4+IE9uIDIxLzA2
LzIwMjMgMTU6MzIsIEx1Y2FzIFRhbnVyZSB3cm90ZToKPj4+Pj4+Pj4gQW1sb2dpYyBUNyBTb0Nz
IHVzZXMgdGhlIHNhbWUgVUFSVCBjb250cm9sbGVyIGFzIFM0IFNvQ3MgYW5kIEcxMkEuCj4+Pj4+
Pj4+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIGFuIGV4dHJhIGNvbXBhdGlibGUgbGluZSBpbiB0aGUg
ZHJpdmVyLCBidXQKPj4+Pj4+Pj4gYWRkIFQ3IGNvbXBhdGlibGUgbGluZSBmb3IgZG9jdW1lbnRh
dGlvbi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51
cmVAbGludXguY29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgICAgICAgICAgfCAyICsrCj4+Pj4+
Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxv
Z2ljLG1lc29uLXVhcnQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
ZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPj4+Pj4+Pj4gaW5kZXggMDFlYzQ1YjNiNDA2
Li44NjBhYjU4ZDg3YjAgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPj4+Pj4+Pj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29u
LXVhcnQueWFtbAo+Pj4+Pj4+PiBAQCAtMzMsNiArMzMsNyBAQCBwcm9wZXJ0aWVzOgo+Pj4+Pj4+
PiAgICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOGItdWFydAo+Pj4+Pj4+PiAgICAgICAg
ICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4LXVhcnQKPj4+Pj4+Pj4gICAgICAgICAgICAgICAg
IC0gYW1sb2dpYyxtZXNvbi1zNC11YXJ0Cj4+Pj4+Pj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dp
YyxtZXNvbi10Ny11YXJ0Cj4+Pj4+Pj4+ICAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVz
b24tYW8tdWFydAo+Pj4+Pj4+PiAgICAgICAgIC0gZGVzY3JpcHRpb246IEFsd2F5cy1vbiBwb3dl
ciBkb21haW4gVUFSVCBjb250cm9sbGVyIG9uIEcxMkEgU29Dcwo+Pj4+Pj4+PiAgICAgICAgICAg
aXRlbXM6Cj4+Pj4+Pj4+IEBAIC00Niw2ICs0Nyw3IEBAIHByb3BlcnRpZXM6Cj4+Pj4+Pj4+ICAg
ICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhiLXVhcnQKPj4+Pj4+Pj4gICAgICAgICAgICAgLSBh
bWxvZ2ljLG1lc29uLWd4LXVhcnQKPj4+Pj4+Pj4gICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29u
LXM0LXVhcnQKPj4+Pj4+Pj4gKyAgICAgICAgICAtIGFtbG9naWMsbWVzb24tdDctdWFydAo+Pj4+
Pj4+Cj4+Pj4+Pj4gSXQgZG9lcyBub3QgbG9vayBsaWtlIHlvdSB0ZXN0ZWQgdGhlIERUUyBhZ2Fp
bnN0IGJpbmRpbmdzLiBQbGVhc2UgcnVuCj4+Pj4+Pj4gYG1ha2UgZHRic19jaGVja2AgKHNlZQo+
Pj4+Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93cml0aW5nLXNjaGVtYS5y
c3Qgb3IKPj4+Pj4+PiBodHRwczovL3d3dy5saW5hcm8ub3JnL2Jsb2cvdGlwcy1hbmQtdHJpY2tz
LWZvci12YWxpZGF0aW5nLWRldmljZXRyZWUtc291cmNlcy13aXRoLXRoZS1kZXZpY2V0cmVlLXNj
aGVtYS8KPj4+Pj4+PiBmb3IgaW5zdHJ1Y3Rpb25zKS4KPj4+Pj4+Cj4+Pj4+PiBDaGVjayBiYWNr
IG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCBJIHNob3VsZCd2ZSBwb3N0ZWQgYW4gdW50ZXN0ZWQK
Pj4+Pj4+IHZlcnNpb24gb2Ygd2hhdCB5b3UgbmVlZCB0byBhZGQuCj4+Pj4+IEkgc2F3IHRoYXQs
IGJ1dCBhZGRpbmcgYSBTNCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbWUuIEFuZCB5b3UgZGlkbid0
Cj4+Pj4+IHNob3cgdGhlIGVudGlyZSBjaGFuZ2UsIHNvIEkgY2FuJ3QgdW5kZXJzdGFuZCB3aGF0
IHlvdSB3YW50IHRoZXJlLgo+Pj4+Cj4+Pj4gRm9yIHN1cmUgeW91IG5lZWQgc29tZXRoaW5nIHdo
aWNoIGRvZXMgbm90IHRyaWdnZXIgZXJyb3JzLiBJZiB5b3UgY2xhaW0KPj4+PiBhZGRpbmcgUzQg
YXMgZmFsbGJhY2sgZG9lcyBub3QgbWFrZSBzZW5zZSwgdGhlbiB3aHkgZGlkIHlvdSB1c2UgaXQ/
Cj4+Pj4gU2VuZGluZyBhIGNvZGUgd2hpY2ggaXMgY2xlYXJseSBpbmNvcnJlY3QgZG9lcyBub3Qg
bWFrZSBzZW5zZS4KPj4+Pgo+Pj4gU29ycnksIEkgdGhpbmsgd2UgYXJlIHRhbGtpbmcgYWJvdXQg
ZGlmZmVyZW50IHRoaW5ncy4gSXQgZG9lcyBub3QgbWFrZQo+Pj4gc2Vuc2UgdG8gbWUgdG8gYWRk
IGFuIFM0IGxpbmUgaW4gdGhlIGRvY3VtZW50YXRpb24gd2hlbiBpdCBpcyBhbHJlYWR5Cj4+PiB0
aGVyZS4gU28gSSBjb3VsZCBub3QgdW5kZXJzdGFuZCBvciBtYWtlIHNlbnNlIG9mIHRoZSBwYXRj
aCBDb25vciBzZW50Cj4+PiBpbiByZXBseSB0byBteSBWMi4KPj4KPj4gVGhhdCBpcyBqdXN0IGhv
dyBpdCB3b3Jrcy4gWW91IG5lZWQgdG8gc3BlbGwgb3V0IGV4YWN0bHkgd2hpY2gKPj4gY29tYmlu
YXRpb25zIGFyZSBwZXJtaXR0ZWQuIFRoZSBjdXJyZW50IGVudHJ5IGZvciBzNCBzYXlzIHRoYXQg
czQgaXMKPj4gb25seSBwZXJtaXR0ZWQgaW4gaXNvbGF0aW9uLgo+PiBTaW5jZSB5b3UgYXJlIGFk
ZGluZyAiYW1sb2dpYyxtZXNvbi10Ny11YXJ0IiwgImFtbG9naWMsbWVzb24tczQtdWFydCIKPj4g
eW91IG5lZWQgdG8gZXhwbGljaXRseSBhbGxvdyB0aGF0IGNvbWJpbmF0aW9uLiBZb3UnbGwgbm90
aWNlIGlmIHlvdSBsb29rCj4+IGF0IHRoZSBmaWxlIHRoYXQgdGhlIGd4IHVhcnQgYXBwZWFycyBt
b3JlIHRoYW4gb25jZS4KPj4KPj4gR2l2ZW4gdGhlIGcxMmEgd2FzIHRoZSBtb3N0IHJlY2VudGx5
IGFkZGVkIGNvbXBhdGlibGUsIGl0IG1pZ2h0IG1ha2UKPj4gc2Vuc2UgdG8gZm9sbG93IHRoZSBw
YXR0ZXJuIHRoYXQgaXQgaGFkIHNldCwgZ2l2ZW4gdGhlIHRoaW5nIHlvdXIKPj4gb3JpZ2luYWwg
cGF0Y2ggY29waWVkIHRoZSBtYXRjaCBkYXRhIGZyb20gd2FzIHRoZSBnMTJhLiBUaGF0IGNoYW5n
ZSB0bwo+PiB0aGUgZHQtYmluZGluZyB3b3VsZCBsb29rIGxpa2U6Cj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFy
dC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2lj
LG1lc29uLXVhcnQueWFtbAo+PiBpbmRleCAwMWVjNDViM2I0MDYuLmVhZTExZTg3Yjg4YSAxMDA2
NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxv
Z2ljLG1lc29uLXVhcnQueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sCj4+IEBAIC01MCw2ICs1MCwxMyBA
QCBwcm9wZXJ0aWVzOgo+PiAgICAgICAgICAgaXRlbXM6Cj4+ICAgICAgICAgICAgIC0gY29uc3Q6
IGFtbG9naWMsbWVzb24tZzEyYS11YXJ0Cj4+ICAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMs
bWVzb24tZ3gtdWFydAo+PiArICAgICAgLSBkZXNjcmlwdGlvbjoKPj4gKyAgICAgICAgICBFdmVy
eXRoaW5nLUVsc2UgcG93ZXIgZG9tYWluIFVBUlQgY29udHJvbGxlciBvbiBHMTJBIGNvbXBhdGli
bGUgU29Dcwo+PiArICAgICAgICBpdGVtczoKPj4gKyAgICAgICAgICAtIGVudW06Cj4+ICsgICAg
ICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi10Ny11YXJ0Cj4+ICsgICAgICAgICAgLSBjb25zdDog
YW1sb2dpYyxtZXNvbi1nMTJhLXVhcnQKPj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1l
c29uLWd4LXVhcnQKPj4KPj4gICAgIHJlZzoKPj4gICAgICAgbWF4SXRlbXM6IDEKPj4KPj4gL0kv
IGRvbid0IHJlYWxseSBjYXJlIHdoZXRoZXIgeW91IGRvIHRoYXQsIG9yIGRvIHRoZSBzNCB2ZXJz
aW9uIG9mIGl0LAo+PiBidXQgZm9sbG93aW5nIHRoZSBtb3N0IHJlY2VudCBwYXR0ZXJuIG1pZ2h0
IG1ha2UgbW9yZSBzZW5zZS4gV2hlbiBJCj4+IHN1Z2dlc3RlZCBzNCwgaXQgd2FzIGJlY2F1c2Ug
SSBvbmx5IGxvb2tlZCBhdCB0aGUgZHJpdmVyIHBhdGNoIHJhdGhlcgo+PiB0aGFuIHRoZSBjb2Rl
IGl0c2VsZi4KPj4KPj4+IEtyenlzenRvZiwgSSB3aWxsIGNoZWNrIGFnYWluIHdpdGggZHRic19j
aGVjayBhbmQgcmUtc2VuZC4KPj4KPj4gQ2hlZXJzLAo+PiBDb25vci4KPiBJIGFtIHN0cnVnZ2xp
bmcgdG8gdW5kZXJzdGFuZCB0aGlzLiBFdmVyeXRoaW5nIEkgdHJ5IGZhaWxzIHRoZSBjaGVjay4K
CkkganVzdCBhcHBsaWVkIENvbm9yJ3MgY2hhbmdlIG9uIHRvcCBvZiB2Ni40LXJjMSBhbmQgcmFu
OgptYWtlIGR0X2JpbmRpbmdfY2hlY2sgRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKCmFuZCB0aGUg
Y2hlY2sgd2FzIHN1Y2Nlc3NmdWwuCgpOZWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
