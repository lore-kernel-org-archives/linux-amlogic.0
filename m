Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F0C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4IRN506agKMhA2MwgR+gRU9F76JLerKTfo6DX8BDGA=; b=1HygSl1MmHJgAa
	qXk6odwD84cG8CU/GoD/+1UkcEv9xc3bM0n1iZlBQ8te83QZvp3X4aexA6qW9ZyFL4TLFM3yR2VS7
	Y9kYqxakPTTfgWTDdYGunL8YvP7QKRtnpAOL69EKsbk3u81CzBDG58KLHTMdMY01wCgXQIjIeXgS3
	8PU5Wmn6tLK1eVsuk12S0ghl2ix/R2tt3Gpyuk/b6y22YmAjtXQmQm4BFNLCPhQiueEzaHAdvFqKP
	WoJT34+i1KQ4XBMEjIq6qUOebQiMHCTFTVWH1zRgcObk4MRnKhryBFBOzDNdEo1hahWXuy6EJTUV5
	q3DgUyAD+EjEmqwbOiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMBU8-006fCv-34; Mon, 21 Feb 2022 16:24:24 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMBTv-006f7m-Nv; Mon, 21 Feb 2022 16:24:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id p15so34538497ejc.7;
 Mon, 21 Feb 2022 08:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ArCK5lfgeHCHqGrG/JTjDF+ImUnw3K5a8jgMNQx5ZO8=;
 b=nUlTyTRuCnE1xlzGTdnDHz0m1VmaqizYIvggf4+N8gDuWOQngffRjVw6u0kGWOLiyt
 555yvIvPxWokh/Uu8di5ElbbSYFylotdvpIU3JBSFl3eEVq9JYSkiuXlvDr5Egk8iOmw
 Ln4aLWr23Nbj2oyvhgaYZ9Nal88+IW3FP0rgqb5lccLKy4AWnLcn6BfKgxcZP92+O5OV
 5ChDJVL1/vjeN4VPVVZvleltjVnOktuxqg1TQCkA+0rDauRBpyh7IIfNmZ+vdwtL82sL
 jXG4bMBnQqbw9ObwhilB+htP1wXhuyEbVUJ6QBTd63hYn7fW5uNJnYwM7fRf5+F31QyN
 JtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ArCK5lfgeHCHqGrG/JTjDF+ImUnw3K5a8jgMNQx5ZO8=;
 b=GLZMYAKdikEnNe6uC/dlP0zPRUewyYl8akym+i0DRBQ9IAcg4HWENsIZoc0nFjixmP
 Omx9BzyuNtHrD9IGzGbLRqTn42eNtCVqfrvhgCIAAvV0gVc3VFxBcgmazhf7O/WkOdTf
 LJFHcAQ5iMQPP0DLCs+s822LB8K8C6nqhbicA2T4xk6xk8ncfXYtjyW30UP9wkyd1nLp
 N62MERj6sqe5SqLcyigjYp6HV2UipxrpK8fjSnFkd4HoWyUeG1EweeRyDAhnHrYh7sj3
 fQ/zYh0Z2drq/IwlI9OL4BwtKK8jXlGe620KvEUSNmJKMq9GWYex09m3os/4bbPW0Uuh
 flfg==
X-Gm-Message-State: AOAM530MlZoHOZynRQ00eeVq8iq74SEVFLyCRbTJQWsNJANYOGPi0wmY
 CZ1IwmOsCtHJLKGRJjtD3gs=
X-Google-Smtp-Source: ABdhPJzQu4/qIsGzgNkul+LsenCqmNDHAJm/pm+E3OEy8JfIuSB8yb+R9jRSxIjuJKk6wrdvoW7G2Q==
X-Received: by 2002:a17:907:7349:b0:6d0:91b2:c74a with SMTP id
 dq9-20020a170907734900b006d091b2c74amr13523094ejc.679.1645460647295; 
 Mon, 21 Feb 2022 08:24:07 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:a926:13e5:7f67:226?
 (p200300ea8f4d2b00a92613e57f670226.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:a926:13e5:7f67:226])
 by smtp.googlemail.com with ESMTPSA id bo11sm5267912ejb.24.2022.02.21.08.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 08:24:06 -0800 (PST)
Message-ID: <383cdece-660d-4ced-920d-5661941e6c1d@gmail.com>
Date: Mon, 21 Feb 2022 17:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/6] dt-bindings: auxdisplay: Add Titan Micro Electronics
 TM1628
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jerome Brunet <jbrunet@baylibre.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <d8fff247-d3ce-79f0-6d0b-dcce44457681@gmail.com>
 <1645410969.379359.2041544.nullmailer@robh.at.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <1645410969.379359.2041544.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_082411_801241_F811ED62 
X-CRM114-Status: GOOD (  16.99  )
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

T24gMjEuMDIuMjAyMiAwMzozNiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gU2F0LCAxOSBGZWIg
MjAyMiAxNDoxNzo1NCArMDEwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+PiBBZGQgYSBZQU1M
IHNjaGVtYSBiaW5kaW5nIGZvciBUTTE2MjggYXV4ZGlzcGxheQo+PiAoNy8xMS1zZWdtZW50IExF
RCkgY29udHJvbGxlci4KPj4KPj4gVGhpcyBwYXRjaCBpcyBwYXJ0aWFsbHkgYmFzZWQgb24gcHJl
dmlvdXMgUkZDIHdvcmsgZnJvbQo+PiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwu
Y29tPgo+PiAtLS0KPj4gIC4uLi9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55
YW1sICB8IDgyICsrKysrKysrKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA4MiBpbnNl
cnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwKPj4KPiAKPiBNeSBib3Qg
Zm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgRFRfQ0hFQ0tFUl9GTEFHUz0tbSBkdF9iaW5kaW5n
X2NoZWNrJwo+IG9uIHlvdXIgcGF0Y2ggKERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3IGluIHY1LjEz
KToKPiAKPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4gLi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbDoxMjo1OiBbd2Fy
bmluZ10gd3JvbmcgaW5kZW50YXRpb246IGV4cGVjdGVkIDYgYnV0IGZvdW5kIDQgKGluZGVudGF0
aW9uKQo+IAo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Cj4gL2J1aWxkcy9yb2JoZXJy
aW5nL2xpbnV4LWR0LXJldmlldy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4
ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbDogJ21haW50YWluZXJzJyBpcyBhIHJlcXVpcmVk
IHByb3BlcnR5Cj4gCWhpbnQ6IE1ldGFzY2hlbWEgZm9yIGRldmljZXRyZWUgYmluZGluZyBkb2N1
bWVudGF0aW9uCj4gCWZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9iYXNlLnlhbWwjCj4gL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2
MjgueWFtbDogJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4g
CWhpbnQ6IEEgc2NoZW1hIHdpdGhvdXQgYSAiJHJlZiIgdG8gYW5vdGhlciBzY2hlbWEgbXVzdCBk
ZWZpbmUgYWxsIHByb3BlcnRpZXMgYW5kIHVzZSAiYWRkaXRpb25hbFByb3BlcnRpZXMiCj4gCWZy
b20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9iYXNlLnlh
bWwjCj4gLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRh
bm1lYyx0bTE2MjgueWFtbDogJGlkOiByZWxhdGl2ZSBwYXRoL2ZpbGVuYW1lIGRvZXNuJ3QgbWF0
Y2ggYWN0dWFsIHBhdGggb3IgZmlsZW5hbWUKPiAJZXhwZWN0ZWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwjCj4gL2J1aWxkcy9y
b2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbDogaWdub3JpbmcsIGVycm9yIGluIHNj
aGVtYTogCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0
YW5tZWMsdG0xNjI4LmV4YW1wbGUuZHQueWFtbDowOjA6IC9leGFtcGxlLTAvc3BpL2xlZC1jb250
cm9sbGVyQDA6IGZhaWxlZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWyd0
aXRhbm1lYyx0bTE2MjgnXQo+IAo+IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNr
ZG9jcyk6Cj4gCj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTU5NTAx
Ngo+IAo+IFRoaXMgY2hlY2sgY2FuIGZhaWwgaWYgdGhlcmUgYXJlIGFueSBkZXBlbmRlbmNpZXMu
IFRoZSBiYXNlIGZvciBhIHBhdGNoCj4gc2VyaWVzIGlzIGdlbmVyYWxseSB0aGUgbW9zdCByZWNl
bnQgcmMxLgo+IAo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBh
bmQgZGlkbid0IHNlZSB0aGUgYWJvdmUKPiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxs
aW50JyBpcyBpbnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bwo+IGRhdGU6Cj4gCj4gcGlw
MyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQo+IAo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3Vi
bWl0Lgo+IApUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gV2lsbCBjaGVjayBhbmQgY29uc2lkZXIg
aXQgaW4gdjIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
