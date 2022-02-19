Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D08C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZFR7bIHt3CmXGurwDq/MntciVmCRfHcoBtCfh7n0mL4=; b=AmIkYD0A/23IsE
	MuTF33Dx9powCN/NRYWKfFikYenHJJ6YwbUXAHfZ5yyims25vaAW/yrBybDhSrRjKnrJWA3O9e4w9
	3masP1i0fX88TwQMJUKzB5jGhHIqaMiCDJK/8n1laAfOtKAAZEx17vFqWlvRHbnTqqwZOCk/eBrpU
	2zddc3OBry0ZVmU9aaFmxnqIf1BZgKqK8swSeZQ4Ukms0yFbApxLX7zYhPT4gEdtaNiknwxuL6k19
	2fXUMRY9TaihTTmJeqdWNYAf52iJT1jWxvd88JCYcR8zrAGuV2XWwkhUHWF5vvEsKojGgvtGljk8D
	4XQsS00vYEigNKds9LvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLPYP-00GvjM-6N; Sat, 19 Feb 2022 13:13:37 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLPYC-00Gvgx-Ff; Sat, 19 Feb 2022 13:13:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id k25so21411376ejp.5;
 Sat, 19 Feb 2022 05:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:from:to:cc
 :subject:content-transfer-encoding;
 bh=CeX+j8S+ZMIBHihlb3u0Wkc+ChPVHIk0qcdu7jMUVcY=;
 b=Yo9WW4sN7XrtbINqwUTYV2hXIcEgwILCNXAnFOrWwUb7/KTLjKJ70f+qKYpMrjHq6f
 f5NpDWo/29vt4ilqMf17JyXUROs2ey1/K2IwpvVWyzYR2AeSQoPABNQ7jRuuelcw8Xes
 o++i80V4JTjlQu/NzB3dpu5l1AKHCOdiYWCxATGiVE4gTHe7zxDZ6ggKJ/CqbhGWte47
 0Tm3KQrQNkcPZzTYknWvsygS4mmlfj/6a3lTtBtnFBTsDv4drJk865SI3rB04b1iFLdY
 5sdka6DwCxGrEhiXTJLUA2xsW/QojHRqBDWg/2eYg/TI49WJpl9jb9m/sqM+/xwWb6eR
 ygGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:cc:subject:content-transfer-encoding;
 bh=CeX+j8S+ZMIBHihlb3u0Wkc+ChPVHIk0qcdu7jMUVcY=;
 b=wgvgAcu3HoRmQqeo7xh90YxdyT59IvvQ57SQbgxTOLyRDr2o5r+2zSykOtEby31YWI
 D2HcPQ7gRwEYgp7+zP2YwOUKigTsYT8Cq8Nx+Bqpg6xCZxWqeo5Uu5t8d6W+f9xQY4e/
 kLMgi3izFvbsmuyq6BVt9+wPIZ8S/oVvyEbkK2joZNwHXanwCNq0d/qflMQDVUH7ecPZ
 4MMsPlnQUOm+1cSvWd1UKsRRyq4i9C/q3fbOiiCZgH7VFCnFWPUhPr7PuAqeYlQf3boL
 soGHSGC7IFwn0E8DNlR0XBwPMxWNLU0Knd8eFWrZEwjGCsdvkv6JCsJLO9ORgKxcFz9r
 Gf2Q==
X-Gm-Message-State: AOAM530pmsn64bNSrN8crbY+O8FAu8h0OXFJ7J/hhjtKalFxgeSkfzr0
 Yw99XBxijko2YXpvX/0/KKk=
X-Google-Smtp-Source: ABdhPJxUvk2aY3tsottZeK8UirBdfhQt4sEqBSJG/aPh1LAhr9fHXcY8eziH4qDonlADIEAIA+/hdA==
X-Received: by 2002:a17:906:1703:b0:6d0:ee0a:7684 with SMTP id
 c3-20020a170906170300b006d0ee0a7684mr2711626eje.224.1645276398825; 
 Sat, 19 Feb 2022 05:13:18 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d?
 (p200300ea8f4d2b005cf9df09c1b3d44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d])
 by smtp.googlemail.com with ESMTPSA id
 oz23sm3217749ejb.174.2022.02.19.05.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 05:13:18 -0800 (PST)
Message-ID: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
Date: Sat, 19 Feb 2022 14:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7 segment
 display controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_051324_563974_00E749E6 
X-CRM114-Status: GOOD (  15.13  )
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
aGF0IHNlZW1zIG1vc3QgcmVhc29uYWJsZSB0byBtZS4KClRvIGJlIGRlY2lkZWQgaXMgdGhyb3Vn
aCB3aGljaCB0cmVlIHRoaXMgc2VyaWVzIHNob3VsZCBnby4KSSdkIHRoaW5rIFNQSSB3b3VsZCBi
ZSBtb3N0IHN1aXRlZCwgYnV0IHRoYXQncyBhIGRlY2lzaW9uIEkKbGVhdmUgdXAgdG8gdGhlIHJl
c3BlY3RpdmUgbWFpbnRhaW5lcnMuCgpGdXJ0aGVyIGNoYW5nZXMgdG8gdGhlIFJGQyB2ZXJzaW9u
OgotIERyaXZlciBjYW4gYmUgYnVpbHQgYWxzbyB3L28gTEVEIGNsYXNzIHN1cHBvcnQsIGZvciBk
aXNwbGF5cyB0aGF0CiAgZG9uJ3QgaGF2ZSBhbnkgc3ltYm9scyB0byBiZSBleHBvc2VkIGFzIExF
RCdzLgotIFNpbXBsaWZpZWQgdGhlIGNvZGUgYW5kIHJld3JvdGUgYSBsb3Qgb2YgaXQuCi0gRHJp
dmVyIGlzIG5vdyBraW5kIG9mIGEgTVZQLCBidXQgZnVuY3Rpb25hbGl0eSBzaG91bGQgYmUgc3Vm
ZmljaWVudAogIGZvciBtb3N0IHVzZSBjYXNlcy4KLSBVc2UgdGhlIGV4aXN0aW5nIDcgc2VnbWVu
dCBzdXBwb3J0IGluIHVhcGkvbGludXgvbWFwX3RvXzdzZWdtZW50LmgKICBhcyBzdWdnZXN0ZWQg
YnkgR2VlcnQgVXl0dGVyaG9ldmVuLgoKTm90ZTogVGhlcmUncyBhIG51bWJlciBvZiBjaGlwcyBm
cm9tIG90aGVyIG1hbnVmYWN0dXJlcnMgdGhhdCBhcmUKICAgICAgYWxtb3N0IGlkZW50aWNhbCwg
ZS5nLiBGRDYyOCwgU00xNjI4LiBPbmx5IGRpZmZlcmVuY2UgSSBzYXcgc28KICAgICAgZmFyIGlz
IHRoYXQgdGhleSBwYXJ0aWFsbHkgc3VwcG9ydCBvdGhlciBkaXNwbGF5IG1vZGVzLgogICAgICBU
TTE2Mjg6IDZ4MTIsIDd4MTEKICAgICAgU00xNjI4QzogNHgxMywgNXgxMiwgNngxMSwgN3gxMAog
ICAgICBGb3IgdHlwaWNhbCBkaXNwbGF5cyBvbiBkZXZpY2VzIHVzaW5nIHRoZXNlIGNoaXBzIHRo
aXMKICAgICAgZGlmZmVyZW5jZSBzaG91bGRuJ3QgbWF0dGVyLgoKU3VjY2Vzc2Z1bGx5IHRlc3Rl
ZCBvbiBhIFRYMyBNaW5pIFRWIGJveCB0aGF0IGhhcyBhbiBTTTE2MjhDIGFuZCBhCmRpc3BsYXkg
d2l0aCA0IGRpZ2l0cyBhbmQgNyBzeW1ib2xzLgoKQW5kcmVhcyBGw6RyYmVyICgyKToKICBzcGk6
IGdwaW86IEltcGxlbWVudCBMU0IgRmlyc3QgYml0YmFuZyBzdXBwb3J0CiAgZHQtYmluZGluZ3M6
IHZlbmRvci1wcmVmaXhlczogQWRkIFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNzCgpIZWluZXIgS2Fs
bHdlaXQgKDQpOgogIGR0LWJpbmRpbmdzOiBhdXhkaXNwbGF5OiBBZGQgVGl0YW4gTWljcm8gRWxl
Y3Ryb25pY3MgVE0xNjI4CiAgZG9jczogQUJJOiBkb2N1bWVudCB0bTE2MjggYXR0cmlidXRlIGRp
c3BsYXktdGV4dAogIGF1eGRpc3BsYXk6IGFkZCBzdXBwb3J0IGZvciBUaXRhbm1lYyBUTTE2Mjgg
NyBzZWdtZW50IGRpc3BsYXkKICAgIGNvbnRyb2xsZXIKICBhcm02NDogZHRzOiBtZXNvbi1neGwt
czkwNXctdHgzLW1pbmk6IGFkZCBzdXBwb3J0IGZvciB0aGUgNyBzZWdtZW50CiAgICBkaXNwbGF5
CgogLi4uL3Rlc3Rpbmcvc3lzZnMtZGV2aWNlcy1hdXhkaXNwbGF5LXRtMTYyOCAgIHwgICA3ICsK
IC4uLi9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sICB8ICA4MiArKysr
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCAgfCAgIDIgKwog
Li4uL2R0cy9hbWxvZ2ljL21lc29uLWd4bC1zOTA1dy10eDMtbWluaS5kdHMgIHwgIDU5ICsrKwog
ZHJpdmVycy9hdXhkaXNwbGF5L0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRy
aXZlcnMvYXV4ZGlzcGxheS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2
ZXJzL2F1eGRpc3BsYXkvdG0xNjI4LmMgICAgICAgICAgICAgICAgICAgfCAzNjggKysrKysrKysr
KysrKysrKysrCiBkcml2ZXJzL3NwaS9zcGktYml0YmFuZy10eHJ4LmggICAgICAgICAgICAgICAg
fCAgNjYgKysrKwogZHJpdmVycy9zcGkvc3BpLWdwaW8uYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDQyICstCiA5IGZpbGVzIGNoYW5nZWQsIDYyOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMt
ZGV2aWNlcy1hdXhkaXNwbGF5LXRtMTYyOAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9hdXhkaXNwbGF5L3RtMTYyOC5jCgotLSAKMi4zNS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
