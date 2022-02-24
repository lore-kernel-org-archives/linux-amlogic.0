Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBACC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GRjrWOSNpdhD+ZZGIENx8iZvjtSIoxuvc2npPOOoZuU=; b=M67mIw7KdMOdMS
	bP671JIg8eM1lUQRv8oRdV26NIXOsxkGMAcyXl4oamw9B5F3zDmriaLhnjlKl0neEkX3WFg3ZNIpT
	4FCed1TuQwa5+mLlgu9u+2dzUTUfLYHojWS9AYad1uzfL6cK52Neba24kqujoss54r8naVyOagdjt
	s+ilb+QPbB3J3l41pjC2osQD2IOLe92XEN1vUD+60xdciz5nSxp26zduonLYh1Olct+fic9LKC5vG
	1B9POEJ18P3Z5fV5TaHgDawBUDqGKtWQzbZLyC/YcBP+1zpPMp9A18NBGxzo3fHRKCsF3ylewpwJh
	w+tQkSx+rjVYpmMsAxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKIX-002Fjk-0X; Thu, 24 Feb 2022 20:01:09 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKI9-002FZF-Sq; Thu, 24 Feb 2022 20:00:49 +0000
Received: by mail-ej1-x632.google.com with SMTP id qx21so6562657ejb.13;
 Thu, 24 Feb 2022 12:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :content-language:content-transfer-encoding;
 bh=/3kA9B1qVgjYJF+SPVMwxfyRv6VJXrJiJNZPzVdWdOQ=;
 b=QP1PhqsGteaJ1Pk5bUu1Y6dowRlHW/8xVAOcBIRgMCnLM38ltbIMyntMQLEy6hbznN
 zQ5IenipVoKjTfdLcvjBFw1c+zvd4l1V0MVpPOUAtuToSJnjraPdEpmqFQjjs2KdPx2b
 ijtkt4bvTP4xYviTKEB5Xh9B/oDiOZL5mtjuAluiX5v/XbqjKiB8D9RgdhZYzz1+S+Y6
 ysVhbw8KlS2QuJBuhpY8B+CiWGffmLQYUKJWjE8oP3lESxDwxY6lLIEC3bfmZxJNTa13
 ve46tD6ilSG8DiBRbz/XqYT4JpZ5vfClcAj0fhZ1sAbxUXxTeWI8aNj39+JY15M4OJ+W
 fYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:content-language:content-transfer-encoding;
 bh=/3kA9B1qVgjYJF+SPVMwxfyRv6VJXrJiJNZPzVdWdOQ=;
 b=4jeC2wzR9Mv6T310/ToJ2eYI4SYEO+iW/5YXMVrAsTuFqzLgr5kEG5zizz9XfhKwKs
 H1lMGDfdo8qnEbNrFXDzMZWac6WK1lSQlB+Zz8eW2thBPmLzkjnfKtaIVPcvkpXwefNH
 BftBJoNFaOL1UKg5YzY4qDZO4s1C3ydr0ZFqdvqu29sMZ0wdu1u3XCKDsFyZmBSW7Q/4
 n20xxdMtEpWxJRBThLPXoxzRvhoqakoMIr0RYvvW517YhtFylj4YWhGRIO9B17eY4B1y
 Xu3TRSwwdHSK03aYXJf6jLGga3B2Ocoq7RbUfH3vbdvNNRSSAXAYFfuOkd1w7eXAjpdn
 t7ZA==
X-Gm-Message-State: AOAM532G0ZDowjLxz7pf2BKQPqVXsVtp8t4tUpNFvnfY9XCS/nj1lMzj
 TwmywyH6eTC4mU47OlTLKFY=
X-Google-Smtp-Source: ABdhPJxFuo+w3f/fLXUoO65roHhS9Ju3YJUgRZLjHzRtMgwLmAc/7c33PkT5jyB2MjVZDbbIFn7UYw==
X-Received: by 2002:a17:906:3152:b0:6cf:d100:a8b2 with SMTP id
 e18-20020a170906315200b006cfd100a8b2mr3541028eje.529.1645732843880; 
 Thu, 24 Feb 2022 12:00:43 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 u5-20020a170906b10500b006ce6fa4f510sm103209ejy.165.2022.02.24.12.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:00:43 -0800 (PST)
Message-ID: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
Date: Thu, 24 Feb 2022 21:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v4 0/6] auxdisplay: Add support for the Titanmec TM1628 7
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
X-CRM114-CacheID: sfid-20220224_120046_019385_918E1FD5 
X-CRM114-Status: GOOD (  14.35  )
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
IChjaGVja3BhdGNoKQoKQW5kcmVhcyBGw6RyYmVyICgxKToKICBkdC1iaW5kaW5nczogdmVuZG9y
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
