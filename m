Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79397C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 18:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qh/KjYN/VC+tJaW+YTAfT8UlJfFNwQbku/2Z+MDQ0+Y=; b=GKjtyrA8KGR1bA
	3ZUXTxhFlMDf1yf2DMJ7L1DsSHBQX5DPZxzrk+SbWEGvl47CdLaVvqbTNtoGBnDSqltK+XYCSDOK5
	1Ixt1+SIt7UGj8iKie3lEdsoIWgEVpifFxbG9Xh6JcPcPXFIld6HhvQAKakEezNXiW8k/vaIYTvFG
	RaImKdrJPnuvHQ9W0wNckGmUAdC6qIpytiL7qSfRskEQNgSqLr91BClkMylYccqE+IHwZUj6vgaSt
	CdD3toTESrsTlQiYMSCxWC+rDzcb0oiMCNRedoPt9X2CDmaSLHwMwADm4PZuNK/jkXfvtDgEx2Ufl
	L9mkZ5IDc9vBnXAe2wfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvyW-00Fdgw-Ul; Wed, 23 Feb 2022 18:02:52 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvyH-00Fdb8-KS; Wed, 23 Feb 2022 18:02:39 +0000
Received: by mail-ed1-x529.google.com with SMTP id i11so43766943eda.9;
 Wed, 23 Feb 2022 10:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:from:to:cc
 :references:subject:in-reply-to:content-transfer-encoding;
 bh=hoJN2xiYRR/AiZH+KyClQAfus1beCOFyquBC28PraRo=;
 b=BK5rJXWHEtAUExxO90vanXAuMqoIbonOIR0Fe500A/Wi0GoWYYxgDa3IWghcxGlaCA
 lEgtpUVFe1Rh9cz0ZD1iV9nCsIgHde2IGE5bixRcP61Y89haI6IOO8DkycQarHveeWH6
 zoO3+sC4X9et6j+eOY6kKCYiBEGFm0fuIxTDXhvXgphq60t6uYdTp9AhwZJhx3h0xLan
 Wo5KUbwhFKOaofDSP+O2GHPq/mxIhr6jVquB19CMuwkjV3N2/K1EMR0rmFcywDHZzfQo
 7keaLYTqABYT6W83aGQtWFaZtw6g1U7sbT5Iovo/atgRM+3Ui/f7wq36fXhOVfNrQHV9
 hYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:cc:references:subject:in-reply-to
 :content-transfer-encoding;
 bh=hoJN2xiYRR/AiZH+KyClQAfus1beCOFyquBC28PraRo=;
 b=rjrG/Te4c/5NV/2UJS0NqkCgdsQIjpp8Re/CaTIVNNRijPxkQO5l5aZvmFoKtxf+nm
 1WVoOraL4OVh/0Dc11HEUNkV7xK6dZl4UsEhFzg0s4B/I3QMGBUCjPSnu0gZDgyn5+bh
 03n1fQ1yaqimubW+4X+6jwLcMc892en22158J9kq47hUsZuxeoRVWxqxclfFYVuHNO/E
 1eiFDqeIToTBnxQiSGKd4HuS7Y1rFXexfUjQPTZu3a79XxPZt7eL71ZXndFKllPIV0Q4
 3e8bwoiT5QLjAexXENK0i6alhb0PB0g5uAhu0Xm6W7CaxQUFYHi5rWQZvsvkkB8FpgMK
 WhNQ==
X-Gm-Message-State: AOAM53054irVJtGT4hvk8S5U8hMp1uastRF/LX0hzCR6c++TaUm3arWw
 g1YQgQwIIwX5q8eo3QIikUs=
X-Google-Smtp-Source: ABdhPJycAljqrBPqD8wJMoiV0mKJVPvgLcNKwwPiK/7ua7Ct9CK5DDDW+9+DjFMwrvIt2BR8BIn/XQ==
X-Received: by 2002:a05:6402:849:b0:412:8cf5:73db with SMTP id
 b9-20020a056402084900b004128cf573dbmr581155edz.237.1645639355841; 
 Wed, 23 Feb 2022 10:02:35 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:d12c:c0a:f603:b44d?
 (p200300ea8f4d2b00d12c0c0af603b44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:d12c:c0a:f603:b44d])
 by smtp.googlemail.com with ESMTPSA id k9sm138295eje.202.2022.02.23.10.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:02:35 -0800 (PST)
Message-ID: <2b7f0011-8872-70fa-b9b7-50b7817e7084@gmail.com>
Date: Wed, 23 Feb 2022 18:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
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
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
Subject: [PATCH v3 2/5] dt-bindings: auxdisplay: Add Titan Micro Electronics
 TM1628
In-Reply-To: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_100237_706598_4DB28922 
X-CRM114-Status: GOOD (  12.62  )
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
LURldmVsb3BlZC1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+CkNvLURldmVsb3BlZC1i
eTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTog
SGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KLS0tCnYzOgotIGZpeCByZW1h
aW5pbmcgWUFNTCBpc3N1ZXMKLSB1c2UgQ28tRGV2ZWxvcGVkLWJ5Ci0tLQogLi4uL2JpbmRpbmdz
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
