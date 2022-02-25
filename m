Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84E7C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rb78tYTWwLYWJveFje0Hv4B6hE8qU5CqT1SS8MBrvg=; b=L34M1T08WAHDmK
	J3tpeyMZHGGGmRAiKVyxOu9Zt2wtycGVmMVJaXUeMAuay/VGr0YJJuUN6XycHl8XKLPy4FvQLMXCy
	BFsFdDAfypx9/Pbc9VeGlbaa0sqkXByI3+bjX8WMJLhMv/tn6sjHp5cIZevAWrHSExOXy8Hr/X09y
	g7pWifKWX5WgTa5nFSdIWSpxnBRxVugLuy/Ap1aZCXlilCbmIluQzbJYm6XM6hLPy3vVkgev/t+X5
	lYRO8BqXv5yYPFV3XmdPgBgsAHQ2a+uMtFsoUEKLqMqSWvSC48hiCAcwZkniDckwKrngRsi6Ej3zb
	nVus/yQsRpbpJEIRGdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNi4J-0070Vl-Jx; Fri, 25 Feb 2022 21:24:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNi45-0070Qu-Lg; Fri, 25 Feb 2022 21:23:51 +0000
Received: by mail-ed1-x531.google.com with SMTP id h15so9139428edv.7;
 Fri, 25 Feb 2022 13:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=QFvRzvIdRv3xplrJSGk7DMQfwafyCoO+jIxn5A7f+Mo=;
 b=geFvYOtYlAzZW5zPxS0omthKPQef/gERvsIFmb0VHNW6XMnc+Z5ob5eozbesva5yPr
 72J4JMaInvqxY2jqPbpaI1UkEjzb4uzUPFcZXW48EeYT4cbfennd8+ZOH2vQF4LExoOo
 xt8I0sW+fKIPcboP/lp6KEpt5b8ve0SgyvFiel7TFGIRpGvz+lY7qejjkxbkDq7hkQcG
 CtOCaK2tSj4Qeg+kYGLwwMgfzrbNVPnX+UK4yVGcxhtPNHoOKuAl15GkXT04mzr2VAgl
 nBsMcjStzMttlCxfjct7DaL5VmhC+r7JnzZrLhHRxLZzOo8I2TyC3NsS0mSkEZ8rU8cb
 gEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=QFvRzvIdRv3xplrJSGk7DMQfwafyCoO+jIxn5A7f+Mo=;
 b=e9MxXl98LNUU0dwErtmFmbfS4EuKHtXkfHYU9CAcTaCC5uvkGwcdsVAfPef36DqErl
 sujE6uYtj4armBa/qlL5SWIsyyy/1DMaDVuzF8vP/0xF5VCjZJvNiJxPxR+2n/WrDvfV
 l76vAM/rBJV2BFOySLGwkyWg/DOv2nMdbVqeEwKIkHS3xzxO0MDWBgyKSyG24c2pS1Zq
 8gY8DZLeMX3ZRxRAR9RE1KkNsf9vKd3ioITmIfUSmcWl10//gJ4Su9W504skXl+yJJxh
 RxQ/FL9GOe/8uooaVsCYywkkB1eZ+fiMrnnW93nKWcynDXSTXp8fulvwAqzzY3lAX/HM
 Nzcg==
X-Gm-Message-State: AOAM532zF4xcoqugzs+7Puc6xmEPAuxY0zf0dHjvxhDZHZ71ocY+V8DV
 aihcl4mHBIcOiDJqQW4yAdM=
X-Google-Smtp-Source: ABdhPJybxPWcIY7zb9JmvYjISMMVpmpNYRzrKQ7c/vcl+xvi88vo5XSX1q9NnfQSZTQIWu8iqUMpJA==
X-Received: by 2002:a05:6402:6da:b0:3fd:cacb:f4b2 with SMTP id
 n26-20020a05640206da00b003fdcacbf4b2mr9055727edy.332.1645824228405; 
 Fri, 25 Feb 2022 13:23:48 -0800 (PST)
Received: from ?IPV6:2a01:c22:7326:e100:c9d3:3c62:2c99:d44b?
 (dynamic-2a01-0c22-7326-e100-c9d3-3c62-2c99-d44b.c22.pool.telefonica.de.
 [2a01:c22:7326:e100:c9d3:3c62:2c99:d44b])
 by smtp.googlemail.com with ESMTPSA id
 c17-20020a05640227d100b00410ece2072dsm1999591ede.95.2022.02.25.13.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:23:47 -0800 (PST)
Message-ID: <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
Date: Fri, 25 Feb 2022 22:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro Electronics
 TM1628
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
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
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
In-Reply-To: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_132349_749150_470CB1BA 
X-CRM114-Status: GOOD (  12.49  )
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
cmV2aW91cyB3b3JrIGZyb20KQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPi4KCkNv
LWRldmVsb3BlZC1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+ClNpZ25lZC1vZmYtYnk6
IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Ci0tLQp2NToKLSBhZGQgdmVu
ZG9yIHByZWZpeCB0byBkcml2ZXItc3BlY2lmaWMgcHJvcGVydGllcwotLS0KIC4uLi9iaW5kaW5n
cy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sICB8IDkyICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0x
NjI4LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uMmExZWY2OTJjCi0tLSAvZGV2L251bGwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4
LnlhbWwKQEAgLTAsMCArMSw5MiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb3ItbGF0ZXIgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbCMK
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwor
Cit0aXRsZTogVGl0YW4gTWljcm8gRWxlY3Ryb25pY3MgVE0xNjI4IExFRCBjb250cm9sbGVyCisK
K21haW50YWluZXJzOgorICAtIEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KKyAg
LSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgorCithbGxPZjoKKyAgLSAk
cmVmOiAvc2NoZW1hcy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCMKKworcHJvcGVydGll
czoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogdGl0YW5tZWMsdG0xNjI4CisKKyAgcmVnOgor
ICAgIG1heEl0ZW1zOiAxCisKKyAgdGl0YW5tZWMsZ3JpZDoKKyAgICBkZXNjcmlwdGlvbjoKKyAg
ICAgIE1hcHBpbmcgb2YgZGlzcGxheSBkaWdpdCBwb3NpdGlvbiB0byBncmlkIG51bWJlci4KKyAg
ICAgIFRoaXMgaW1wbGljaXRseSBkZWZpbmVzIHRoZSBkaXNwbGF5IHNpemUuCisgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDgtYXJyYXkKKyAgICBtaW5JdGVt
czogMQorICAgIG1heEl0ZW1zOiA3CisKKyAgdGl0YW5tZWMsc2VnbWVudC1tYXBwaW5nOgorICAg
IGRlc2NyaXB0aW9uOgorICAgICAgTWFwcGluZyBvZiA3IHNlZ21lbnQgZGlzcGxheSBzZWdtZW50
cyBBLUcgdG8gYml0IG51bWJlcnMgMS0xMi4KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50OC1hcnJheQorICAgIG1pbkl0ZW1zOiA3CisgICAgbWF4SXRlbXM6
IDcKKworICAiI2FkZHJlc3MtY2VsbHMiOgorICAgIGNvbnN0OiAyCisKKyAgIiNzaXplLWNlbGxz
IjoKKyAgICBjb25zdDogMAorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisK
K3BhdHRlcm5Qcm9wZXJ0aWVzOgorICAiXi4qQFsxLTddLChbMS05XXwxWzAtNl0pJCI6CisgICAg
dHlwZTogb2JqZWN0CisgICAgJHJlZjogL3NjaGVtYXMvbGVkcy9jb21tb24ueWFtbCMKKyAgICB1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgIFBy
b3BlcnRpZXMgZm9yIGEgc2luZ2xlIExFRC4KKworICAgIHByb3BlcnRpZXM6CisgICAgICByZWc6
CisgICAgICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgMS1iYXNlZCBncmlkIG51bWJlciwg
Zm9sbG93ZWQgYnkgMS1iYXNlZCBzZWdtZW50IGJpdCBudW1iZXIuCisgICAgICAgIG1heEl0ZW1z
OiAxCisKKyAgICByZXF1aXJlZDoKKyAgICAgIC0gcmVnCisKK3VuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9s
ZWRzL2NvbW1vbi5oPgorCisgICAgc3BpIHsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworCisgICAgICAgIGxlZC1jb250cm9sbGVyQDAg
eworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aXRhbm1lYyx0bTE2MjgiOworICAgICAgICAg
ICAgcmVnID0gPDA+OworICAgICAgICAgICAgc3BpLTMtd2lyZTsKKyAgICAgICAgICAgIHNwaS1s
c2ItZmlyc3Q7CisgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDA+OworICAg
ICAgICAgICAgdGl0YW5tZWMsZ3JpZCA9IC9iaXRzLyA4IDw0IDMgMiAxPjsKKyAgICAgICAgICAg
IHRpdGFubWVjLHNlZ21lbnQtbWFwcGluZyA9IC9iaXRzLyA4IDw0IDUgNiAxIDIgMyA3PjsKKyAg
ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+OworICAgICAgICAgICAgI3NpemUtY2VsbHMg
PSA8MD47CisKKyAgICAgICAgICAgIGFsYXJtQDUsNCB7CisgICAgICAgICAgICAgICAgcmVnID0g
PDUgND47CisgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fQUxBUk07Cisg
ICAgICAgICAgICB9OworICAgICAgICB9OworICAgIH07CisuLi4KLS0gCjIuMzUuMQoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
