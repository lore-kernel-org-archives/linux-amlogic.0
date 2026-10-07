Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98FFCA5FF1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F28Dzp1KDVQItffHiT7ja+WcfTIRQQrQcttJA0gScYU=; b=e6TNY2/NIeRrWC
	as5Em+DZlsodyj18R6Gw1fnXEoqy3Kh0aVhTlv3F86jR2RmSK3/GhD4RgnZuHHK6dPUG/0n7rgexf
	xtPscoCykoNuIldJ0iLqjQozlNIuqhZ3w35ZxxjarBnYDjUkwQMXi1V5yr1wIkEk78AG15uOPXnFF
	+jQOmdCTLkiy/NDVOJDrN/oASpOEecz3FR4cjp5DuB6OsSXFei6VGZ6OiNVOA+m4XtzIbX2UwRExo
	lHIRsfq8ngVGPciSjQlfCt6f88yymzQ/Hpmxu6ZtYBw5eXQqTd5PgAYaoa1qyQn2T+rLl3TBWBG8/
	1ftLZ++g8P2+IfMPziyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOzP-00000002Bza-2itJ;
	Wed, 07 Oct 2026 10:35:11 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOzN-00000002Byn-12mE
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 10:35:10 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac551be4d3so16944677b3.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 03:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369307; x=1791974107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WbqPTpVsUSqxzGbhEjJKYLBCr4VtJGNv2jZWAZtG8M=;
        b=nAWfU5rycocVb0lw3vnMYk18f5D/LABj/C3ZIF4P3o/WEllK6fofDRIWNt37TSJPJO
         D4YLvX8OrWjxdn1poY9x0QDnwgd8/VBhQmsGonmMco8RCgyHz9JVqWriDBey1e+4a5tZ
         wISFCaUCf7B9Gzlp4AoDnUww0cr7RfE1KePh90omlWvv76S3Qj45CH7gEiczrz6LKYIg
         DVbPRXJNZEgnn5Iz+5M4UkCzhApDyAZkomq1+DfPU/Y9MS+Uv2RrHHiS+7DHMB3yQbj/
         aTiLm4lG/Z2vVoJ0OHTnaCElFhE6da9m8GGplEVgT+jXGfQVMhqOMg7m+VTISQQJoxJh
         kQZw==
X-Forwarded-Encrypted: i=1; AKwUvBzcASaiYX1TKRLf65PkXqWwfP7ydMAVR52wkBz+AgbMCfuBY9iLDdyBqwYksaN0QBm5e9zcpknAK0E0AGwe@lists.infradead.org
X-Gm-Message-State: AFq9FYKfTMe6h/5d3HaP080djA+AiY3ua6a2/TjGFqHW3w3WTP+k8kJH
	8VpffBNUwluhPNilvJvNO+IAT2N8cjRwr94iYEqW38SjMxx3hZ3C53ejyI/ziZw7vTPlFA==
X-Gm-Gg: AYBFou0es0zDD9vyvehx1Yu6z5mzsW2eO2xjU8Dsa+a047HFGVjrLq4FN95yVyc7I5W
	uBxx6uw6B6YmWHQyV9KfEfRm4d02tF+3+tZFF1N+UeKNdC/n9qUx+57tVgbTxO45S8mjn0o6Q3p
	KfQlKXZN7DxryC9N4diyAg7gVHL0akSsQiJjsgYcPRvOYATk7C0vgzGGPRcKUuBmq4XbIwIjYlo
	jNdQuaB1pgR0/iht/Bidyb8lhcRO6MCb5L1R92tVIJYyRLlAFjZTRzqrMFDiE86l9WFld+9h8Ct
	L07z7ghIWuvdg6SXWMMYjNdOikIPzz75xsUiapOKeUPiw3VJ/GDzfLVf1FjY9jFjduUrP7RcGvz
	NM1ocf5WgqKYdHJOjjCBd7+yVib7vJfLy04M9lVbfjL+25yJp0+4HULqU29lpb0jX1oyhWepQAv
	7f8rrXYLMdUG9xrcXtNu3D3EL0VfuFEkGaz+/5aJHJ0moHDQVQzClKbJOjZpK06y9A/ZGCpTkUu
	IAjdlqa563ZTwtVbzMH6e5MtmFl6oRo2s2pHbMNS32pO3PfnQCUd7n0qyC7sCMYLZaM0fqJRmBy
	SQ==
X-Received: by 2002:a05:690c:112:b0:881:392b:23db with SMTP id 00721157ae682-8b05af0ab17mr17389607b3.11.1791369307149;
        Wed, 07 Oct 2026 03:35:07 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05a9b5329sm7204177b3.2.2026.10.07.03.35.06
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8726acc5eadso13838527b3.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 03:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8kIeppx4PD+MQE9x67j0T7BOK0tok26kB8l3L+zcf5yK9gyzHY06qawyGG+VnctSBbUN4YJZObuANfJqb@lists.infradead.org
X-Received: by 2002:a05:690c:c748:b0:8ae:c60c:57ec with SMTP id
 00721157ae682-8b05b04e271mr11794257b3.61.1791369305826; Wed, 07 Oct 2026
 03:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <20261007082627.63807-4-tanure@linux.com>
 <asYWEwjFO8g50o1i@squawk>
In-Reply-To: <asYWEwjFO8g50o1i@squawk>
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 7 Oct 2026 11:34:54 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
X-Gm-Features: AclHuK_YBbfO7x4D_vDdU1kkRmRoPOMNGgSI5fmJQcVUylonsGY7I5HRmHvp2sU
Message-ID: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_033509_305978_91E5F14A 
X-CRM114-Status: GOOD (  23.55  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgNywgMjAyNiBhdCAxMDo1MeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAwNywgMjAyNiBhdCAwOToyNjoyM0FNICsw
MTAwLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiBUaGUgVDcgaGFzIHRoZSBzYW1lIGV0aGVybmV0
IGdsdWUgYXMgdGhlIEcxMkEsIGJ1dCB0aGUgY29udHJvbGxlcgo+ID4gcmVhY2hlcyBtZW1vcnkg
dGhyb3VnaCBhIHBpcGVsaW5lIHN0YWdlIHRoYXQgdGhpcyBTb0MgaW5zZXJ0cyBpbiB0aGUKPiA+
IGJ1cyBwYXRoLiBUaGF0IHN0YWdlIGhhcyBhIGdhdGUgb2YgaXRzIG93biwgd2hpY2ggbm8gb3Ro
ZXIgbWVtYmVyIG9mCj4gPiB0aGUgZmFtaWx5IGhhcywgYW5kIG5vdGhpbmcgZWxzZSBpbiBMaW51
eCBjbGFpbXMgaXQuIEl0IGlzIHRoZXJlZm9yZQo+ID4gc3dpdGNoZWQgb2ZmIGFzIHVudXNlZCwg
YW5kIHRoZSBwb3J0IGNhbiB0aGVuIG5vIGxvbmdlciBmaW5pc2ggYQo+ID4gdHJhbnNmZXIuCj4g
Pgo+ID4gRGVzY3JpYmluZyBpdCBuZWVkcyBhIGZvdXJ0aCBjbG9jaywgYW5kIHRoZSBmb3VydGgg
Y2xvY2sgb2YgdGhlCj4gPiBleGlzdGluZyBsaXN0IGRyaXZlcyB0aGUgdGltaW5nIGFkanVzdG1l
bnQgbG9naWMsIHdoaWNoIHRoZSBUNyBuZXZlcgo+ID4gdXNlcy4gU28gdGhlIFQ3IGdldHMgYSBs
aXN0IG9mIGl0cyBvd24gd2l0aCB0aGUgZ2F0ZSBpbiB0aGF0IHBsYWNlLAo+ID4gdW5kZXIgdGhl
IG5hbWUgdGhlIFNEIGFuZCBlTU1DIGNvbnRyb2xsZXJzIGFscmVhZHkgdXNlLgo+ID4KPiA+IEFz
c2lzdGVkLWJ5OiBMTE0KPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4KPgo+IERpZG4ndCBJIGFjayB0aGUgcHJldmlvdXMgdmVyc2lvbj8KU29ycnksIEkg
ZGlkbid0IHJlY2VpdmUgb25lLgo+Cj4gV2hhdCBjaGFuZ2VkPwpOb3RoaW5nLgo+Cj4gVGhhbmtz
LAo+IENvbm9yLgo+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24t
ZHdtYWMueWFtbCAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDQ3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2ljLG1lc29uLWR3bWFjLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+
ID4gaW5kZXggOTBlZjc5MTYxYWIxLi45NjExOGI0ZDE1NjAgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFt
bAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hbWxvZ2lj
LG1lc29uLWR3bWFjLnlhbWwKPiA+IEBAIC0yMyw2ICsyMyw3IEBAIHNlbGVjdDoKPiA+ICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPiA+ICAgICAgICAgICAgLSBhbWxvZ2lj
LG1lc29uLWF4Zy1kd21hYwo+ID4gICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1kd21h
Ywo+ID4gKyAgICAgICAgICAtIGFtbG9naWMsdDctZHdtYWMKPiA+ICAgIHJlcXVpcmVkOgo+ID4g
ICAgICAtIGNvbXBhdGlibGUKPiA+Cj4gPiBAQCAtNTcsNiArNTgsNDcgQEAgYWxsT2Y6Cj4gPiAg
ICAgICAgICAgICAgLSBjb25zdDogY2xraW4xCj4gPiAgICAgICAgICAgICAgLSBjb25zdDogdGlt
aW5nLWFkanVzdG1lbnQKPiA+Cj4gPiArICAjIFRoZSBUNyBhcHBsaWVzIHRoZSBSR01JSSBSWCBk
ZWxheSB0aHJvdWdoIFBSR19FVEgxIGFuZCBuZXZlciBlbmFibGVzIHRoZQo+ID4gKyAgIyB0aW1p
bmcgYWRqdXN0bWVudCBsb2dpYywgc28gaXQgaGFzIG5vIHRpbWluZy1hZGp1c3RtZW50IGNsb2Nr
LiBXaGF0IGl0IGRvZXMKPiA+ICsgICMgbmVlZCBpcyB0aGUgZ2F0ZSBvZiB0aGUgcGlwZWxpbmUg
c3RhZ2UgdGhlIGNvbnRyb2xsZXIgcmVhY2hlcyBEUkFNIHRocm91Z2guCj4gPiArICAtIGlmOgo+
ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAgICBjb21wYXRpYmxlOgo+ID4gKyAgICAg
ICAgICBjb250YWluczoKPiA+ICsgICAgICAgICAgICBjb25zdDogYW1sb2dpYyx0Ny1kd21hYwo+
ID4gKyAgICB0aGVuOgo+ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAgICBjbG9ja3M6
Cj4gPiArICAgICAgICAgIGl0ZW1zOgo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IEdN
QUMgbWFpbiBjbG9jawo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IEZpcnN0IHBhcmVu
dCBjbG9jayBvZiB0aGUgaW50ZXJuYWwgbXV4Cj4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlv
bjogU2Vjb25kIHBhcmVudCBjbG9jayBvZiB0aGUgaW50ZXJuYWwgbXV4Cj4gPiArICAgICAgICAg
ICAgLSBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgICAgICAgY2xvY2sgb2YgdGhlIHBpcGVs
aW5lIHN0YWdlIGluc2VydGVkIGluIHRoZSBidXMgcGF0aCBiZXR3ZWVuCj4gPiArICAgICAgICAg
ICAgICAgIHRoZSBjb250cm9sbGVyIGFuZCB0aGUgRFJBTS4gV2l0aG91dCBpdCwgdGhlIGNvbnRy
b2xsZXIgY2Fubm90Cj4gPiArICAgICAgICAgICAgICAgIGNvbXBsZXRlIERNQSB0cmFuc2ZlcnMu
Cj4gPiArCj4gPiArICAgICAgICBjbG9jay1uYW1lczoKPiA+ICsgICAgICAgICAgaXRlbXM6Cj4g
PiArICAgICAgICAgICAgLSBjb25zdDogc3RtbWFjZXRoCj4gPiArICAgICAgICAgICAgLSBjb25z
dDogY2xraW4wCj4gPiArICAgICAgICAgICAgLSBjb25zdDogY2xraW4xCj4gPiArICAgICAgICAg
ICAgLSBjb25zdDogcGlwZWxpbmUKPiA+ICsKPiA+ICsgICMgRGVsYXkgZGVmaW5pdGlvbnMgZm9y
IE1lc29uOGIgYW5kIG5ld2VyIChpbmNsdWRpbmcgVDcpCj4gPiArICAtIGlmOgo+ID4gKyAgICAg
IHByb3BlcnRpZXM6Cj4gPiArICAgICAgICBjb21wYXRpYmxlOgo+ID4gKyAgICAgICAgICBjb250
YWluczoKPiA+ICsgICAgICAgICAgICBlbnVtOgo+ID4gKyAgICAgICAgICAgICAgLSBhbWxvZ2lj
LG1lc29uOGItZHdtYWMKPiA+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhtMi1kd21h
Ywo+ID4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPiA+ICsgICAg
ICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1heGctZHdtYWMKPiA+ICsgICAgICAgICAgICAgIC0g
YW1sb2dpYyxtZXNvbi1nMTJhLWR3bWFjCj4gPiArICAgICAgICAgICAgICAtIGFtbG9naWMsdDct
ZHdtYWMKPiA+ICsgICAgdGhlbjoKPiA+ICsgICAgICBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAg
YW1sb2dpYyx0eC1kZWxheS1uczoKPiA+ICAgICAgICAgICAgZW51bTogWzAsIDIsIDQsIDZdCj4g
PiAgICAgICAgICAgIGRlZmF1bHQ6IDIKPiA+IEBAIC0xMDYsNiArMTQ4LDcgQEAgYWxsT2Y6Cj4g
PiAgICAgICAgICAgIGNvbnRhaW5zOgo+ID4gICAgICAgICAgICAgIGVudW06Cj4gPiAgICAgICAg
ICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS1kd21hYwo+ID4gKyAgICAgICAgICAgICAgLSBh
bWxvZ2ljLHQ3LWR3bWFjCj4gPiAgICAgIHRoZW46Cj4gPiAgICAgICAgcHJvcGVydGllczoKPiA+
ICAgICAgICAgIHJ4LWludGVybmFsLWRlbGF5LXBzOgo+ID4gQEAgLTE0Myw2ICsxODYsMTAgQEAg
cHJvcGVydGllczoKPiA+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjYtZHdtYWMKPiA+
ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhtMi1kd21hYwo+ID4gICAgICAgICAgICAt
IGNvbnN0OiBzbnBzLGR3bWFjCj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBj
b25zdDogYW1sb2dpYyx0Ny1kd21hYwo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFj
LTUuMTBhCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMKPiA+Cj4gPiAgICByZWc6
Cj4gPiAgICAgIGl0ZW1zOgo+ID4gLS0KPiA+IDIuNTYuMAo+ID4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
