Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA4BC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 21:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mp6zmuYhPJkAjFSN022hzQFG/90lx74ZE4ZM+d+QZuI=; b=jonEhTIiMVW1JF
	kMJ6TNHYOT+Yw85a48hk02hkmXzu/8Rf5eZJGQPRI7jpNXWYEbj5Hl/PWBbSKsGn26Fvr3qm0qL0e
	0gnjQzfEfXaRwzIm09IMn44wC8SvyqA3X/Tkb1TJWsUm9SDIkEWK2iT5orZXGgwRyof1ZJ79+0njG
	UVuPt6H8mV6TLjWTSJ+NjJu/wjHyf3L23anZRvgFoqKpkib/1WFY5zV6HU89ScEKl2HK7AJNCQ4RB
	L8joAjK6sx5MtKR0WaJoNW9PuQb4CRKglOmzyjW/LShBAOZiNEsiAdi+I41TZRKLCzu+7JWr+YqZY
	ZBu+XxCNJN6IUN/87MWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNhqM-006zJk-Nf; Fri, 25 Feb 2022 21:09:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNhqA-006zI4-1E; Fri, 25 Feb 2022 21:09:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id s14so9171148edw.0;
 Fri, 25 Feb 2022 13:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :content-language:content-transfer-encoding;
 bh=r+q3BnS/yso16BsfWpj6w5rHbh3h6hD4bXPBdy/jvnw=;
 b=SQL4BzgeZziN33zoc6V/odBjyMQxLclakUGEpkl/6UCYpqfkMIREM07lR4PB83NC93
 1SX+v7FtmA9tMGYAeC06LGaulgvP43oncv6HMhI1e5YZN0fTVwXtNZ1Ed0QkKBkdRkrR
 U2aKy61UxG0yaWWyYOX/XfoQvyR2WMNJMtqGZOsvryyVl3uokTqWnct5m478wtKG13mI
 velXDoyOrmafbDCUejXxUUVtRgR13jQmi813xhv4hIjlXKPy1ZmU26YKC9GkP7gredi5
 0VHzs7zthOKrXh2CRmKIXmuBMhSRQzdUAZPQxTcdT3dXAJOV7WnYkg+sQ6ZNgeKDAQL8
 qmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:content-language:content-transfer-encoding;
 bh=r+q3BnS/yso16BsfWpj6w5rHbh3h6hD4bXPBdy/jvnw=;
 b=fDrznnsB2Q3YXOsz3KmlEiSYKI7qgRufe0Z925+6NheJFbYQNy3mG2tn1Zdg3+xTgZ
 sHRxNsiJ0kzmQXxroPojmN3gEcqOf8LjPfyT3AtMLUj+mmSWdRNhysWx1Zw91y9rLEU5
 9qUqpY0uuSBBFTqBrGj4hOdgoqWUoG+KEBDapYRTOaORslZ4AwL0J3ta3Bxh31jGlXZZ
 ZjTsWcdUDNK0vW77nSeQAr/fN3yQKpgFUpw19pGHIabgtLwHRFYCNPmTphKqFoYDnd57
 JnWziWMQRk8fiE/4ViCJYuPu9+Ru7B9CnAIEWJmfUn80qEoTPr7A43LGeMDlrWQsb5Fc
 kVUg==
X-Gm-Message-State: AOAM532nwEpYPCVh7+maEl6h15KnQIiiOo5P+nazYbWGcQ8oXRSSIqZT
 in3QIPZSABAnZOT2pv4iQD4=
X-Google-Smtp-Source: ABdhPJydKnvqx3rNZJ9qOOIWYHnadxaIIv4GvoIfoNio5jMICEuJlGcgOaL1GudECWijxYd8LzIKrg==
X-Received: by 2002:a05:6402:50cb:b0:412:ab6d:c807 with SMTP id
 h11-20020a05640250cb00b00412ab6dc807mr8879863edb.382.1645823357711; 
 Fri, 25 Feb 2022 13:09:17 -0800 (PST)
Received: from ?IPV6:2a01:c22:7326:e100:c9d3:3c62:2c99:d44b?
 (dynamic-2a01-0c22-7326-e100-c9d3-3c62-2c99-d44b.c22.pool.telefonica.de.
 [2a01:c22:7326:e100:c9d3:3c62:2c99:d44b])
 by smtp.googlemail.com with ESMTPSA id
 r3-20020aa7cb83000000b0040decce18bdsm1838499edt.99.2022.02.25.13.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:09:17 -0800 (PST)
Message-ID: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
Date: Fri, 25 Feb 2022 22:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v5 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_130926_107674_FADE433C 
X-CRM114-Status: GOOD (  14.24  )
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

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgVGl0YW5tZWMgVE0xNjI4IDcgc2VnbWVu
dCBkaXNwbGF5CmNvbnRyb2xsZXIuIEl0J3MgYmFzZWQgb24gcHJldmlvdXMgUkZDIHdvcmsgZnJv
bSBBbmRyZWFzIEbDpHJiZXIuClRoZSBSRkMgdmVyc2lvbiBwbGFjZWQgdGhlIGRyaXZlciBpbiB0
aGUgTEVEIHN1YnN5c3RlbSwgYnV0IHRoaXMgd2FzCk5BSydlZCBieSB0aGUgTEVEIG1haW50YWlu
ZXIuIFRoZXJlZm9yZSBJIG1vdmVkIHRoZSBkcml2ZXIgdG8KL2RyaXZlcnMvYXV4ZGlzcGxheSB3
aGF0IHNlZW1zIG1vc3QgcmVhc29uYWJsZSB0byBtZS4KCkZ1cnRoZXIgY2hhbmdlcyB0byB0aGUg
UkZDIHZlcnNpb246Ci0gRHJpdmVyIGNhbiBiZSBidWlsdCBhbHNvIHcvbyBMRUQgY2xhc3Mgc3Vw
cG9ydCwgZm9yIGRpc3BsYXlzIHRoYXQKICBkb24ndCBoYXZlIGFueSBzeW1ib2xzIHRvIGJlIGV4
cG9zZWQgYXMgTEVEJ3MuCi0gU2ltcGxpZmllZCB0aGUgY29kZSBhbmQgcmV3cm90ZSBhIGxvdCBv
ZiBpdC4KLSBEcml2ZXIgaXMgbm93IGtpbmQgb2YgYSBNVlAsIGJ1dCBmdW5jdGlvbmFsaXR5IHNo
b3VsZCBiZSBzdWZmaWNpZW50CiAgZm9yIG1vc3QgdXNlIGNhc2VzLgotIFVzZSB0aGUgZXhpc3Rp
bmcgNyBzZWdtZW50IHN1cHBvcnQgaW4gdWFwaS9saW51eC9tYXBfdG9fN3NlZ21lbnQuaAogIGFz
IHN1Z2dlc3RlZCBieSBHZWVydCBVeXR0ZXJob2V2ZW4uCgpOb3RlOiBUaGVyZSdzIGEgbnVtYmVy
IG9mIGNoaXBzIGZyb20gb3RoZXIgbWFudWZhY3R1cmVycyB0aGF0IGFyZQogICAgICBhbG1vc3Qg
aWRlbnRpY2FsLCBlLmcuIEZENjI4LCBTTTE2MjguIE9ubHkgZGlmZmVyZW5jZSBJIHNhdyBzbwog
ICAgICBmYXIgaXMgdGhhdCB0aGV5IHBhcnRpYWxseSBzdXBwb3J0IG90aGVyIGRpc3BsYXkgbW9k
ZXMuCiAgICAgIFRNMTYyODogNngxMiwgN3gxMQogICAgICBTTTE2MjhDOiA0eDEzLCA1eDEyLCA2
eDExLCA3eDEwCiAgICAgIEZvciB0eXBpY2FsIGRpc3BsYXlzIG9uIGRldmljZXMgdXNpbmcgdGhl
c2UgY2hpcHMgdGhpcwogICAgICBkaWZmZXJlbmNlIHNob3VsZG4ndCBtYXR0ZXIuCgpTdWNjZXNz
ZnVsbHkgdGVzdGVkIG9uIGEgVFgzIE1pbmkgVFYgYm94IHRoYXQgaGFzIGFuIFNNMTYyOEMgYW5k
IGEKZGlzcGxheSB3aXRoIDQgZGlnaXRzIGFuZCA3IHN5bWJvbHMuCgp2MjoKLSAocmUtKWFkZCBB
bmRyZWFzJyBTb0IgdG8gdHdvIHBhdGNoZXMKLSBmaXggWUFNTCBpc3N1ZXMKLSBpbmNsdWRlIGN0
eXBlLmggZXhwbGljaXRseQotIGFkZCBpbmZvIG1lc3NhZ2UgaW4gcHJvYmUoKQoKdjM6Ci0gcmVt
b3ZlIHBhdGNoIDEgYmVjYXVzZSBpdCBoYXMgYmVlbiBhcHBsaWVkIHZpYSB0aGUgU1BJIHRyZWUg
YWxyZWFkeQotIGZpeCByZW1haW5pbmcgWUFNTCBpc3N1ZXMgaW4gcGF0Y2ggMgotIGZvbGxvdyBN
aWd1ZWwncyBzdWdnZXN0aW9uIG9uIHVzYWdlIG9mIENvLURldmVsb3BlZC1ieQoKdjQ6Ci0gYWRk
IHBhdGNoIGZvciBNQUlOVEFJTkVSUyBlbnRyeQotIGluY29ycG9yYXRlIE1pZ3VlbCdzIHJldmll
dyBjb21tZW50cwotIFJlcGxhY2UgQ28tRGV2ZWxvcGVkLWJ5IHdpdGggQ28tZGV2ZWxvcGVkLWJ5
IChjaGVja3BhdGNoKQp2NToKLSBhZGQgdmVuZG9yIHByZWZpeCB0byBkcml2ZXItc3BlY2lmaWMg
ZHQgcHJvcGVydGllcwoKQW5kcmVhcyBGw6RyYmVyICgxKToKICBkdC1iaW5kaW5nczogdmVuZG9y
LXByZWZpeGVzOiBBZGQgVGl0YW4gTWljcm8gRWxlY3Ryb25pY3MKCkhlaW5lciBLYWxsd2VpdCAo
NSk6CiAgZHQtYmluZGluZ3M6IGF1eGRpc3BsYXk6IEFkZCBUaXRhbiBNaWNybyBFbGVjdHJvbmlj
cyBUTTE2MjgKICBkb2NzOiBBQkk6IGRvY3VtZW50IHRtMTYyOCBhdHRyaWJ1dGUgZGlzcGxheS10
ZXh0CiAgYXV4ZGlzcGxheTogYWRkIHN1cHBvcnQgZm9yIFRpdGFubWVjIFRNMTYyOCA3IHNlZ21l
bnQgZGlzcGxheQogICAgY29udHJvbGxlcgogIGFybTY0OiBkdHM6IG1lc29uLWd4bC1zOTA1dy10
eDMtbWluaTogYWRkIHN1cHBvcnQgZm9yIHRoZSA3IHNlZ21lbnQKICAgIGRpc3BsYXkKICBNQUlO
VEFJTkVSUzogQWRkIGVudHJ5IGZvciB0bTE2MjggYXV4ZGlzcGxheSBkcml2ZXIKCiAuLi4vdGVz
dGluZy9zeXNmcy1kZXZpY2VzLWF1eGRpc3BsYXktdG0xNjI4ICAgfCAgIDcgKwogLi4uL2JpbmRp
bmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwgIHwgIDkyICsrKysrCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCAgfCAgIDIgKwogTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIC4uLi9kdHMvYW1s
b2dpYy9tZXNvbi1neGwtczkwNXctdHgzLW1pbmkuZHRzICB8ICA1OSArKysKIGRyaXZlcnMvYXV4
ZGlzcGxheS9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAxMSArCiBkcml2ZXJzL2F1eGRp
c3BsYXkvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9hdXhkaXNw
bGF5L3RtMTYyOC5jICAgICAgICAgICAgICAgICAgIHwgMzc2ICsrKysrKysrKysrKysrKysrKwog
OCBmaWxlcyBjaGFuZ2VkLCA1NTUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZGV2aWNlcy1hdXhkaXNwbGF5LXRtMTYyOAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhk
aXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9h
dXhkaXNwbGF5L3RtMTYyOC5jCgotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
