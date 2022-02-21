Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8369EC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 20:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UVYSLOyFyctKgOnw6+APMLXFoIbYNWlD1u3hJihffQ=; b=q4POyJ8eg7TldW
	J381N4P26ImjH7zlZwUg+kNeX9nwHqFoctFRyLiP0E/TDuXCbY3Idm8K8vvK47l+8oB61JMmJliF8
	nvaervYTzZIldCQkszOc5i2qxbzE2lr1um4XYCmT2h83uBEW6Hyr/kMoX4Q7v1a4X8Uz1AAZWqQ97
	so25UclyuJyKra+D/M9xkZGesnL1QJ2l38cnb8iZ0jZ4ZezYmd8c340fs/2dQLspjspbJG72Em01Y
	NR2wvlcca/u9Al8Y3JkRy5huVIV5PiP03ag32ZlX4+6Q8ksharw1o8+oeEkzO+Tjm+DcOYBymeTuX
	0uYitx76zDYULOedneWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMFHV-007BIn-52; Mon, 21 Feb 2022 20:27:37 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMFGp-007B2l-Ds; Mon, 21 Feb 2022 20:26:57 +0000
Received: by mail-ed1-x531.google.com with SMTP id u18so31757264edt.6;
 Mon, 21 Feb 2022 12:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=dd134NjBkl8fhO5WBxxq3dG4rqJRhX37CWmAE2Aj2VI=;
 b=WXhkfQHfRShc/s+qx4BbtexHkKdRaIoWOy/LMlFZ42d8AksTRQ17IKdh+0pvehhVlY
 6MjmHpx0Z8Z8OBfHTF+TZ9MsoYsc6al6WUxse2drDxzKgXLtT64O2NWuA4nBlHXB3VWq
 PJJsxBQZLrzZg+wQ3gaQ9Csd/Z9OBS+hEsaEUTU82vuRcguAdNBEOZrUxy0JNL71H0iH
 OrKE6yHXGN9CpHkNtjQdpNdPruSrNeJOq/0pZ9tmB+KIFVr2tpy648wW3xIJOcQLkPoD
 JjZFClQ32xFW7MWj6oQJvI//ly9H/IEdsKTXhOc5oPAAcNfOJy+WS0fJyT2KEbkR21/i
 iyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=dd134NjBkl8fhO5WBxxq3dG4rqJRhX37CWmAE2Aj2VI=;
 b=wJLEJpVQmChvDcVUMfCR0Kbmeu9MxCiVgVitPisPClhGwMuytseaymPQzfrUDyVDoA
 A78MDQgmFepfPuRmGaIs9pRuyH7rXIuWOO7eHs/zcoUJT7DwY47WpjMQH/62VNj/QtWg
 PISv/bpqtMym9qa6MrqRnUh0iLEGtJrRCmH5MixelBYlVjDEoVUfC50axUu5DFIgnFaS
 UIoUJ3t/97EPNePVlLKC8fIDmZzwJit2RrSAX8AWSbuDWM/t8YHHUdp24Af9YS5snvrR
 EuGjbJ4PlO4l/cuJDS+JueFAq6kZwn0K5WYVHQVhKLESPBdafH58u30NfxeW5AeTVX2e
 8VVw==
X-Gm-Message-State: AOAM532GMPO7ZOqmTVdfWy0lYpeCOZMuW1MnbtR3vCLdS5s6IeaVlO7x
 U4sMClY78JOKDuqTnkIhcvM=
X-Google-Smtp-Source: ABdhPJzaqueRJw3KgqhuWsxjs3QEClMbOXRm7JpJl1xJ3fl/7oVyk2YsuGp5uqbgdO+DWhTs9d6gEA==
X-Received: by 2002:aa7:c612:0:b0:40f:2a41:bddb with SMTP id
 h18-20020aa7c612000000b0040f2a41bddbmr23081017edq.291.1645475214128; 
 Mon, 21 Feb 2022 12:26:54 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:b141:a0d:4aad:2a06?
 (p200300ea8f4d2b00b1410a0d4aad2a06.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:b141:a0d:4aad:2a06])
 by smtp.googlemail.com with ESMTPSA id v1sm5565278ejk.11.2022.02.21.12.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:26:53 -0800 (PST)
Message-ID: <39d61ddb-4b54-4a13-fbb2-c0f88d9bf017@gmail.com>
Date: Mon, 21 Feb 2022 21:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 3/6] dt-bindings: auxdisplay: Add Titan Micro Electronics
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
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
In-Reply-To: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_122655_491537_688AE761 
X-CRM114-Status: GOOD (  12.67  )
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
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+ClNpZ25l
ZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Ci0tLQp2MjoK
LSAocmUtKWFkZCBBbmRyZWFzJyBTb0IKLSBmaXggWUFNTCBlcnJvcnMgcmVwb3J0ZWQgYnkgUm9i
Ci0tLQogLi4uL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwgIHwgODgg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlz
cGxheS90aXRhbm1lYyx0bTE2MjgueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4Lnlh
bWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi5kYTdjYzE2ZTcKLS0tIC9k
ZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxh
eS90aXRhbm1lYyx0bTE2MjgueWFtbApAQCAtMCwwICsxLDg4IEBACisjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vci1sYXRlciBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIK
Ky0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9hdXhkaXNwbGF5L3RpdGFu
bWVjLHRtMTYyOC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBUaXRhbiBNaWNybyBFbGVjdHJvbmljcyBUTTE2Mjgg
TEVEIGNvbnRyb2xsZXIKKworbWFpbnRhaW5lcnM6CisgIC0gQW5kcmVhcyBGw6RyYmVyIDxhZmFl
cmJlckBzdXNlLmRlPgorICAtIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gdGl0YW5t
ZWMsdG0xNjI4CisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgZ3JpZDoKKyAgICBkZXNj
cmlwdGlvbjoKKyAgICAgIE1hcHBpbmcgb2YgZGlzcGxheSBkaWdpdCBwb3NpdGlvbiB0byBncmlk
IG51bWJlci4KKyAgICAgIFRoaXMgaW1wbGljaXRseSBkZWZpbmVzIHRoZSBkaXNwbGF5IHNpemUu
CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDgtYXJyYXkK
KyAgICBtaW5JdGVtczogMQorICAgIG1heEl0ZW1zOiA3CisKKyAgc2VnbWVudC1tYXBwaW5nOgor
ICAgIGRlc2NyaXB0aW9uOgorICAgICAgTWFwcGluZyBvZiA3IHNlZ21lbnQgZGlzcGxheSBzZWdt
ZW50cyBBLUcgdG8gYml0IG51bWJlcnMgMS0xMi4KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQorICAgIG1pbkl0ZW1zOiA3CisgICAgbWF4SXRl
bXM6IDcKKworICAiI2FkZHJlc3MtY2VsbHMiOgorICAgIGNvbnN0OiAyCisKKyAgIiNzaXplLWNl
bGxzIjoKKyAgICBjb25zdDogMAorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVn
CisKK3BhdHRlcm5Qcm9wZXJ0aWVzOgorICAiXi4qQFsxLTddLChbMS05XXwxWzAtNl0pJCI6Cisg
ICAgdHlwZTogb2JqZWN0CisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgIFByb3BlcnRpZXMgZm9y
IGEgc2luZ2xlIExFRC4KKworICAgIHByb3BlcnRpZXM6CisgICAgICByZWc6CisgICAgICAgIGRl
c2NyaXB0aW9uOiB8CisgICAgICAgICAgMS1iYXNlZCBncmlkIG51bWJlciwgZm9sbG93ZWQgYnkg
MS1iYXNlZCBzZWdtZW50IGJpdCBudW1iZXIuCisgICAgICAgIG1heEl0ZW1zOiAxCisKKyAgICBy
ZXF1aXJlZDoKKyAgICAgIC0gcmVnCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitl
eGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2xlZHMvY29tbW9uLmg+
CisKKyAgICBzcGkgeworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgI3Np
emUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgbGVkLWNvbnRyb2xsZXJAMCB7CisgICAgICAgICAg
ICBjb21wYXRpYmxlID0gInRpdGFubWVjLHRtMTYyOCI7CisgICAgICAgICAgICByZWcgPSA8MD47
CisgICAgICAgICAgICBzcGktMy13aXJlOworICAgICAgICAgICAgc3BpLWxzYi1maXJzdDsKKyAg
ICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMD47CisgICAgICAgICAgICBncmlk
ID0gL2JpdHMvIDggPDQgMyAyIDE+OworICAgICAgICAgICAgc2VnbWVudC1tYXBwaW5nID0gL2Jp
dHMvIDggPDQgNSA2IDEgMiAzIDc+OworICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47
CisgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgICAgICAgYWxhcm1uQDUs
NCB7CisgICAgICAgICAgICAgICAgcmVnID0gPDUgND47CisgICAgICAgICAgICAgICAgZnVuY3Rp
b24gPSBMRURfRlVOQ1RJT05fQUxBUk07CisgICAgICAgICAgICB9OworICAgICAgICB9OworICAg
IH07CisuLi4KLS0gCjIuMzUuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
