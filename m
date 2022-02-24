Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A59C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJygvHhZczcgB6Ox6dcHt2LybgCnfzDzKv3hH8CFCBA=; b=rMo7UGNbHvtJuk
	ddqbrXocz+YptkA4uH2A3BlWcek8ZTVaSOCu8gVLr1uWme5356k/iaNrPxa8Kto7EaWBHZTfQCCbQ
	YFr+PDrgdGQT0ZH8q/lFM5wZzt6CcqBnpHBWJoNb2IH5Jo2QnXP1pycvzXhOjOnopQbpN9iKasw6X
	/1juA048BjGZ0A3mNZr8EGvp0O1Y0bP8xvTwK4aFHTo70sOWVp3blJ04Cfqs6pID9zfNSs5yGwciI
	ocFgu1ZAUTZV2mp54tjCZq3RaGJlCyMQJ+SYcLRT36XHK7VPvgV+czdnePu8mzUsItj4AQ5eic58I
	GbujhArMZGp6dc3W7GIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKSm-002Hmg-96; Thu, 24 Feb 2022 20:11:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKSZ-002HiF-4c; Thu, 24 Feb 2022 20:11:32 +0000
Received: by mail-ej1-x633.google.com with SMTP id gb39so6711750ejc.1;
 Thu, 24 Feb 2022 12:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=LZieaA8IQfeUiT55cuSm8XlrpapnhQkbMv4PqrRswQs=;
 b=CaIYE4lGBxmhFUEqszNJ6ZfSr4qMhwZ2Ixf6B5itoz1D70RNdvcxI2uFwJmCMYV/1m
 tYs/RlOVekU9G4cjKo4Ywb0SXBGI9TOAX7q8kIyDnr190DbDGAS67pciIba+8udgjnv1
 9r0fDMQhzZB/YbfDzdCHmYr53kSEDdmTRlvQW6VdNT2QDi29KpjgqKabEQSq5Twkx6Yh
 nZTb5HANbdVx929RxZE6+xekoynBmiTLUfHf7RsZ2s+K5AH1eDAwv0IpHwcqRcL68Qlq
 2uJbk+4C3L0jDjIUG408NlBNM3qy30SuF91Jbhg44Joqs0yiEqnSy8MEkREidPUCNw8o
 kCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=LZieaA8IQfeUiT55cuSm8XlrpapnhQkbMv4PqrRswQs=;
 b=CdXuWJ3hWoH4yoo3bGPz3bR4DI5vRSsm8TgCQ8ekmKCaxnf0cjYY/qGwVGbTx8Dv64
 ydLITiDnzevnO5XV9SedfMenErgj0Q7JAq0C30+iz2uof66mrvHBgbJzIDgNnfYKlz9n
 ABJQYfG+j2VYHnQFnFToHH59dodJmuG2n/Qt3/LNUuZwnXa79HJZ0KpsZMRzcGuLCXEo
 rhIpFeO+K5RLYcL/dzdqnx71VqhWuZCka5DKW8GASSC+pgiE014FrnAVaMOdVXPCEyTn
 7t4q6ZZwEAprkQ3aWGy/jc+Ol79QEeU/eSNyfppwjtXQbupP70826knt1pHHT3rLf82f
 wNlw==
X-Gm-Message-State: AOAM531Xp0vj4F4XAGqvGfUkAY9wdqA67awd/hYN36Mqw86TkTFfOE+O
 SyGM18SHrnF86PqLpLLqDTYeLXk6V/A=
X-Google-Smtp-Source: ABdhPJx0xxe9oOyj3twkXv1sgWzq1cLG+e4+ameBc800P5R31eA18NyH+o7mjr87HALk7kQXpbMjnw==
X-Received: by 2002:a17:906:6716:b0:6cc:7d95:90af with SMTP id
 a22-20020a170906671600b006cc7d9590afmr3546734ejp.442.1645733489127; 
 Thu, 24 Feb 2022 12:11:29 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 hz20-20020a1709072cf400b006d1b5df5c1fsm140379ejc.17.2022.02.24.12.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:11:28 -0800 (PST)
Message-ID: <ff6197ff-1cb1-9dc1-4efb-c24cb63e29f7@gmail.com>
Date: Thu, 24 Feb 2022 21:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v4 2/6] dt-bindings: auxdisplay: Add Titan Micro Electronics
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
References: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
In-Reply-To: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_121131_220928_19BF7752 
X-CRM114-Status: GOOD (  12.28  )
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
IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Ci0tLQogLi4uL2JpbmRpbmdz
L2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwgIHwgOTIgKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDkyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2
MjgueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
dXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwLi4yYTFlZjY5MmMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2Mjgu
eWFtbApAQCAtMCwwICsxLDkyIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vci1sYXRlciBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sIwor
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisK
K3RpdGxlOiBUaXRhbiBNaWNybyBFbGVjdHJvbmljcyBUTTE2MjggTEVEIGNvbnRyb2xsZXIKKwor
bWFpbnRhaW5lcnM6CisgIC0gQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgorICAt
IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRy
ZWY6IC9zY2hlbWFzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sIworCitwcm9wZXJ0aWVz
OgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiB0aXRhbm1lYyx0bTE2MjgKKworICByZWc6Cisg
ICAgbWF4SXRlbXM6IDEKKworICBncmlkOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgTWFwcGlu
ZyBvZiBkaXNwbGF5IGRpZ2l0IHBvc2l0aW9uIHRvIGdyaWQgbnVtYmVyLgorICAgICAgVGhpcyBp
bXBsaWNpdGx5IGRlZmluZXMgdGhlIGRpc3BsYXkgc2l6ZS4KKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQorICAgIG1pbkl0ZW1zOiAxCisgICAg
bWF4SXRlbXM6IDcKKworICBzZWdtZW50LW1hcHBpbmc6CisgICAgZGVzY3JpcHRpb246CisgICAg
ICBNYXBwaW5nIG9mIDcgc2VnbWVudCBkaXNwbGF5IHNlZ21lbnRzIEEtRyB0byBiaXQgbnVtYmVy
cyAxLTEyLgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQ4
LWFycmF5CisgICAgbWluSXRlbXM6IDcKKyAgICBtYXhJdGVtczogNworCisgICIjYWRkcmVzcy1j
ZWxscyI6CisgICAgY29uc3Q6IDIKKworICAiI3NpemUtY2VsbHMiOgorICAgIGNvbnN0OiAwCisK
K3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKworcGF0dGVyblByb3BlcnRpZXM6
CisgICJeLipAWzEtN10sKFsxLTldfDFbMC02XSkkIjoKKyAgICB0eXBlOiBvYmplY3QKKyAgICAk
cmVmOiAvc2NoZW1hcy9sZWRzL2NvbW1vbi55YW1sIworICAgIHVuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UKKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgUHJvcGVydGllcyBmb3IgYSBzaW5n
bGUgTEVELgorCisgICAgcHJvcGVydGllczoKKyAgICAgIHJlZzoKKyAgICAgICAgZGVzY3JpcHRp
b246IHwKKyAgICAgICAgICAxLWJhc2VkIGdyaWQgbnVtYmVyLCBmb2xsb3dlZCBieSAxLWJhc2Vk
IHNlZ21lbnQgYml0IG51bWJlci4KKyAgICAgICAgbWF4SXRlbXM6IDEKKworICAgIHJlcXVpcmVk
OgorICAgICAgLSByZWcKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxl
czoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2xlZHMvY29tbW9uLmg+CisKKyAg
ICBzcGkgeworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47CisKKyAgICAgICAgbGVkLWNvbnRyb2xsZXJAMCB7CisgICAgICAgICAgICBjb21w
YXRpYmxlID0gInRpdGFubWVjLHRtMTYyOCI7CisgICAgICAgICAgICByZWcgPSA8MD47CisgICAg
ICAgICAgICBzcGktMy13aXJlOworICAgICAgICAgICAgc3BpLWxzYi1maXJzdDsKKyAgICAgICAg
ICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMD47CisgICAgICAgICAgICBncmlkID0gL2Jp
dHMvIDggPDQgMyAyIDE+OworICAgICAgICAgICAgc2VnbWVudC1tYXBwaW5nID0gL2JpdHMvIDgg
PDQgNSA2IDEgMiAzIDc+OworICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47CisgICAg
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgICAgICAgYWxhcm1uQDUsNCB7Cisg
ICAgICAgICAgICAgICAgcmVnID0gPDUgND47CisgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSBM
RURfRlVOQ1RJT05fQUxBUk07CisgICAgICAgICAgICB9OworICAgICAgICB9OworICAgIH07Cisu
Li4KLS0gCjIuMzUuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
