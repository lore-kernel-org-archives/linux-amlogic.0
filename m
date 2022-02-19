Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE06C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvYsYHM0WBbsXSbpnoOYEJqrV4imMt0bonxc0ViR32g=; b=d3faux9/C2Jw9P
	TlEtr7/+LB8/EQdbJSXzbyZxK7bLnl4C2vfVZVMM1qN4hZe68q7Xu4KQkgyk+fw9QgqaLZse8iBHi
	/WvznjZLW25aHVfSiuvabg9cYGpyw35BiAzioUt7VCXXh+2G/IBmKx4LGr5KHpdBcgrxKwqxiJS8t
	4+JIuw6tmr73rfx+Eqv4bfEgDDQdiuxJVtFHacDteBz8JbrzanutWqrfQrEWA/85lzNIL8XruApC3
	Owk4RdxBflmas1EFY3tpT81G7uYSXEGL+v8YLqUJUrTgt0kkYND3fjt0+5aHO42Zqp46TyVHwRZYL
	K4wsVvZlSv9zMzgWe5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLPgi-00GwmD-4T; Sat, 19 Feb 2022 13:22:12 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLPg7-00GwZG-O5; Sat, 19 Feb 2022 13:21:37 +0000
Received: by mail-ed1-x536.google.com with SMTP id h15so3248157edv.7;
 Sat, 19 Feb 2022 05:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=fpauG+TRD67lEqkFOUl8ovsHrrNt32JAGPgb9gRTuM8=;
 b=I/9sZ1OlbKLvWG4qtIMulQQCHX0woCYxCWVD+KGU+EVfwIa6zMU8zx4F83avXtbBQ6
 f01FSr/FPuSp8Ipyy5Y+HkHOmsiS4V0DLXhC8YHCBWPvze4MnUs5QoaOpJjKf7FI+o1S
 Vuin6ENVt8OBCEfS0OQpSqoG16g58qzQImmEjAzAqWlz0KGAcwz703LG32JhWzWmbrYp
 d4oXy4FGqOBwOp3yMy4iNHlBk1H4sZ5SvMphtk/XCFCyejKkZVUv/mx5YyYcgo3xCngL
 79z+yRe8gujGZYFXO3uvDaHkREF9m6nxdi3H8ksBjYYU9BZVRS4EjetYRwsdjy5VCtzn
 108w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=fpauG+TRD67lEqkFOUl8ovsHrrNt32JAGPgb9gRTuM8=;
 b=wHmFB0sd6V3D7Zeyu4F6AVIpd/ESWfAeeWfXYuNkmiYssfeJ9QFp487Mdx0ZmX90Fm
 JkbC0f/L0eOCZk/zJyYDQ4V3dwj/J0HcANcLJ2bkazkGFCdUmCiwm9lZ02fk91FIl9Hu
 0QZs3YT3IAsVPgK5V/GvECJ6YrOlofKJnxwSSw7Jg7noe2ETw8cRRct5ikxaeQaHvbVx
 l7mKKbI+WS3XGe26rC7Iho7W5Y0pPHtoQoxUP3JZz6NeBQBwFjiGDB4bB9AdiXr0w+ja
 1QU2ZqdsuU+c9V3cVpDsDByxasNWBoD6K6GHlN57G2XhX5D/93o0lR170dUa3AWHsRGv
 liQQ==
X-Gm-Message-State: AOAM531GtgPq+mafbUD+8YO+rGXJAuhFDLoz1s2ghicEqetRc77V8YEq
 HQ0nYMCMwWUcVMn9PGg3r58=
X-Google-Smtp-Source: ABdhPJyMdwhFMviXX9vaz5IRwMK3brlTzx8iFzc1fr7HKR2rhSXRpPUyZaN8i6BBGVmPmevkmF7BpA==
X-Received: by 2002:a50:8713:0:b0:410:db7a:4b2a with SMTP id
 i19-20020a508713000000b00410db7a4b2amr12665564edb.140.1645276893863; 
 Sat, 19 Feb 2022 05:21:33 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d?
 (p200300ea8f4d2b005cf9df09c1b3d44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d])
 by smtp.googlemail.com with ESMTPSA id y23sm3287387ejk.153.2022.02.19.05.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 05:21:33 -0800 (PST)
Message-ID: <d8fff247-d3ce-79f0-6d0b-dcce44457681@gmail.com>
Date: Sat, 19 Feb 2022 14:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 3/6] dt-bindings: auxdisplay: Add Titan Micro Electronics
 TM1628
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
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
In-Reply-To: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_052135_807992_3D7A42EB 
X-CRM114-Status: GOOD (  13.05  )
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

QWRkIGEgWUFNTCBzY2hlbWEgYmluZGluZyBmb3IgVE0xNjI4IGF1eGRpc3BsYXkKKDcvMTEtc2Vn
bWVudCBMRUQpIGNvbnRyb2xsZXIuCgpUaGlzIHBhdGNoIGlzIHBhcnRpYWxseSBiYXNlZCBvbiBw
cmV2aW91cyBSRkMgd29yayBmcm9tCkFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4u
CgpTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgot
LS0KIC4uLi9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sICB8IDgyICsr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3Bs
YXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1s
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uZDljYmJjOTUwCi0tLSAvZGV2
L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkv
dGl0YW5tZWMsdG0xNjI4LnlhbWwKQEAgLTAsMCArMSw4MiBAQAorIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb3ItbGF0ZXIgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCist
LS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbGVkcy90aXRhbm1lYyx0bTE2
MjgueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIworCit0aXRsZTogVGl0YW4gTWljcm8gRWxlY3Ryb25pY3MgVE0xNjI4IExFRCBjb250
cm9sbGVyCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAtIHRp
dGFubWVjLHRtMTYyOAorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGdyaWQ6CisgICAg
ZGVzY3JpcHRpb246CisgICAgICBNYXBwaW5nIG9mIGRpc3BsYXkgZGlnaXQgcG9zaXRpb24gdG8g
Z3JpZCBudW1iZXIuCisgICAgICBUaGlzIGltcGxpY2l0bHkgZGVmaW5lcyB0aGUgZGlzcGxheSBz
aXplLgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQ4LWFy
cmF5CisgICAgbWluSXRlbXM6IDEKKyAgICBtYXhJdGVtczogNworCisgIHNlZ21lbnQtbWFwcGlu
ZzoKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIE1hcHBpbmcgb2YgNyBzZWdtZW50IGRpc3BsYXkg
c2VnbWVudHMgQS1HIHRvIGJpdCBudW1iZXJzIDEtMTIuCisgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDgtYXJyYXkKKyAgICBtaW5JdGVtczogNworICAgIG1h
eEl0ZW1zOiA3CisKKyAgIiNhZGRyZXNzLWNlbGxzIjoKKyAgICBjb25zdDogMgorCisgICIjc2l6
ZS1jZWxscyI6CisgICAgY29uc3Q6IDAKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAt
IHJlZworCitwYXR0ZXJuUHJvcGVydGllczoKKyAgIl4uKkBbMS03XSwoWzEtOV18MVswLTZdKSQi
OgorICAgIHR5cGU6IG9iamVjdAorICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICBQcm9wZXJ0aWVz
IGZvciBhIHNpbmdsZSBMRUQuCisKKyAgICBwcm9wZXJ0aWVzOgorICAgICAgcmVnOgorICAgICAg
ICBkZXNjcmlwdGlvbjogfAorICAgICAgICAgIDEtYmFzZWQgZ3JpZCBudW1iZXIsIGZvbGxvd2Vk
IGJ5IDEtYmFzZWQgc2VnbWVudCBiaXQgbnVtYmVyLgorICAgICAgICBtYXhJdGVtczogMQorCisg
ICAgcmVxdWlyZWQ6CisgICAgICAtIHJlZworCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2xlZHMvY29tbW9uLmg+CisKKyAgICBzcGkgeworICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAg
bGVkLWNvbnRyb2xsZXJAMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0gInRpdGFubWVjLHRt
MTYyOCI7CisgICAgICAgICAgICByZWcgPSA8MD47CisgICAgICAgICAgICBzcGktMy13aXJlOwor
ICAgICAgICAgICAgc3BpLWxzYi1maXJzdDsKKyAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5
ID0gPDUwMDAwMD47CisgICAgICAgICAgICBncmlkID0gL2JpdHMvIDggPDQgMyAyIDE+OworICAg
ICAgICAgICAgc2VnbWVudC1tYXBwaW5nID0gL2JpdHMvIDggPDQgNSA2IDEgMiAzIDc+OworICAg
ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47CisgICAgICAgICAgICAjc2l6ZS1jZWxscyA9
IDwwPjsKKworICAgICAgICAgICAgYWxhcm1uQDUsNCB7CisgICAgICAgICAgICAgICAgcmVnID0g
PDUgND47CisgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fQUxBUk07Cisg
ICAgICAgICAgICB9OworICAgICAgICB9OworICAgIH07CisuLi4KLS0gCjIuMzUuMQoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
