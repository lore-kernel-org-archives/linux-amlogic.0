Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63946C54EAA
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56UYZbnlIVLcS8virQRZ3JZIcSQY6RoJASzVugRFrwM=; b=DqMAsZIScKwqSO
	qB4C3t9piLGZqyWfjxp1l50BufX1U7kiaDavx9xxc5Ef8N5eLYnDYm+IQKJiOrDKjMJoMBFaHPj50
	623hh6J6BbQN1rkBC/6D+S4T/3c0bcZe9WzycfWXvcOKWFXfmugM4ley2WWHnSeNaSuZkxLF1ZMIY
	I+/OKqUt3UGTHfB4Y2EsrXG85xMyx6xBRoLhE3ughmpGTrv+LSm07xug82lxBhegqBtndVKMvGx0c
	+UFWKV1LmRiUe/M3BQVqeb7zCQKhQByKRZIStgnNHAIG7ntf+l98bDBMYeqHmb8yyiOL41vS6oFNe
	AcnhTCdyytfFDtb8jyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEUc-002iMB-Kw; Tue, 24 Jan 2023 08:17:22 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEUZ-002iKD-QR
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 08:17:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id h12so9051131wrv.10
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 00:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLCH4vzF1S5fETKgbedPA51jeuB1hlnoXHacM1L7F8A=;
        b=PUCx69XU/ALNSOnNm3wvq0dYsW6xQff+/756CSvgawj5VkarkYeNnvrg5pkIHXeJvC
         tH6jWQZXJGE7SPgHqrLg7MYzAdvLRGLlYUkq5Ip8xwrNY1UH11hLEN22hByAXNFspFKz
         aZiO/3UlZaGGnmfbNQVMLEqgOxtE/FItMeLb3VFNY6HFcQIqWYJKC82PhT8+A4lF1xzN
         ives3T43i1wpt4rZaeNlGoK12ltSem8VVpphw5DSpJkrSdkNYAJAG+SJA/nv4iQKPwSE
         Hb6ajPifB6TjJitYVTr0H5+W327fGX0kdXDAr8Z8xIvJ51i/+rSc8RaavuRsdyXrWZ/k
         JXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLCH4vzF1S5fETKgbedPA51jeuB1hlnoXHacM1L7F8A=;
        b=lzBoX/guSpqyS8/EUwl2RZwhRjJmwB15q7Ziu0rgFflXM1w2h32NDb35k1IZJqUbf3
         K/f0s+JQGA6LArPxTrm8zP1/0+UnraB150igH0whhH4WcumF3XAKhcJFuK0HmU0Zs00p
         dEKx4owie+cka56Frk96zJek7v4O5GyInbQXQIel69Ezwj08o4rlsiRUwS6FCf2BRXAh
         eaA1qo36hD0RLaQ695o7MBuQe6LlOTvyho9MbuxX2E6o1+M8masA4MOWMMpSboRli0ud
         fyhktvvpp07hmHsWR/rG9h1XkcWYVx9CULfKEV2rsXQGr9f/DqZLYC/U2P/A+x8PGnra
         4/Vw==
X-Gm-Message-State: AFqh2ko6q990ova6T8Avt44tgWPYFlq0U2gzo4ELDpDk0iysU/v1w++Q
	H4X4zOnBHjn0mzUztvkRm2NhOg==
X-Google-Smtp-Source: AMrXdXuKhilEOYXCaWzj5MnYT6+XRh6z0kCNN3okw51LIYDecgd5E8Ez0G9+d3ehflLkb16p29wJdA==
X-Received: by 2002:a05:6000:608:b0:2bd:db84:d663 with SMTP id bn8-20020a056000060800b002bddb84d663mr21417965wrb.5.1674548235969;
        Tue, 24 Jan 2023 00:17:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d650f000000b002bdda9856b5sm1263775wru.50.2023.01.24.00.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 00:17:15 -0800 (PST)
Message-ID: <955f4b2a-a750-11a2-0423-72023935723b@linaro.org>
Date: Tue, 24 Jan 2023 09:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] dt-bindings: mmc: correct pwrseq node names
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Tony Huang <tonyhuang.sunplus@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Markus Pargmann <mpa@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20230120085722.171965-1-krzysztof.kozlowski@linaro.org>
 <20230120085722.171965-2-krzysztof.kozlowski@linaro.org>
 <2138388.Mh6RI2rZIc@diego>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2138388.Mh6RI2rZIc@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_001719_887398_A74FC4E2 
X-CRM114-Status: GOOD (  16.53  )
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

T24gMjAvMDEvMjAyMyAxMDozOCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj4gQW0gRnJlaXRhZywg
MjAuIEphbnVhciAyMDIzLCAwOTo1NzoyMiBDRVQgc2NocmllYiBLcnp5c3p0b2YgS296bG93c2tp
Ogo+PiBOb2RlIG5hbWVzIHNob3VsZCBiZSBnZW5lcmljIGFuZCBzaG91bGQgbm90IGNvbnRhaW4g
dW5kZXJzY29yZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1wd3JzZXEtZW1tYy55YW1sICAgfCAyICstCj4+ICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1wd3JzZXEtc2Q4Nzg3Lnlh
bWwgfCAyICstCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1w
d3JzZXEtc2ltcGxlLnlhbWwgfCAyICstCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jLXB3cnNlcS1lbW1jLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1wd3JzZXEtZW1tYy55YW1sCj4+IGluZGV4IDkx
MWE1OTk2ZTA5OS4uNTg4YmU3MzE2OGZhIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1wd3JzZXEtZW1tYy55YW1sCj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jLXB3cnNlcS1lbW1jLnlhbWwKPj4g
QEAgLTQxLDcgKzQxLDcgQEAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+ICBleGFtcGxl
czoKPj4gICAgLSB8Cj4+ICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgo+
PiAtICAgIHNkaGNpMF9wd3JzZXEgewo+PiArICAgIHB3cnNlcSB7Cj4gCj4gW2FwcGxpY2FibGUg
Zm9yIGFsbCAzIGV4YW1wbGVzXQo+IAo+IGhtbSwgcG93ZXItc2VxdWVuY2VzIGFyZSBub3QgbmVj
ZXNzYXJpbHkgdGllZCB0byBhbiBhZGRyZXNzIGFuZCBJIGd1ZXNzCj4gaXQgd2lsbCBiZSB2ZXJ5
IG11Y2ggYSBjb21tb24gY2FzZSB0byBoYXZlIG11bHRpcGxlIG9uZXMgb24gYSBzeXN0ZW0uCj4g
Cj4gU28gbWlnaHQgaXQgYmUgYmV0dGVyIHRvIGZvbGxvdyBvdGhlciBwYXR0ZXJucyAobGlrZSBs
ZWRzKSB0byBudW1iZXIgdGhlbQo+IG9yIHN1Z2dlc3QgYSAiZm9vLXB3cnNlcSIgLyAicHdyc2Vx
LWZvbyI/CgpJbiBzdWNoIGNhc2VzIG9uZSBjYW4gYWRkIG51bWJlciBvciBkZXNjcmlwdGl2ZSBz
dWZmaXggKHB3cnNlcS0wLApwd3JzZXEtZm9vKSwganVzdCBsaWtlIHdlIGRvIGZvciByZWd1bGF0
b3JzLiBIb3dldmVyIHRoZSBleGFtcGxlcyBoYXZlCmhlcmUgb25seSBvbmUgbm9kZSBhbmQgaW4g
c3VjaCBjYXNlICJwd3JzZXEiIGlzIGVub3VnaC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
