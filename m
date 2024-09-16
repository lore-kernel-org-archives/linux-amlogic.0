Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003A4C3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/dwBGfcGTwVyq0Dogi4n0b/sqAmbnArNhuaxYW4lQU=; b=Yu8t8Zm8onTFcA7wRYab+ErDrW
	HjIf8an0De26giRtX/CSo/wSvBwFYoLdII7bTxoyKez4I0szK53kwUtOEpQ7E2PfHiMifQaRt+12U
	0CH1r6BVd0XFoPi3wVoFUN+Tsmgd2i8UUVAqwt0GcEg8ZT+ru38felc7dM9RzZJR6EV7sSG4+Jre7
	REkPzag3oqfLDG+9JInLs9t2nBV8jZnuPMtkXQt+fNuydObqW85klh6sn1j4vygsGbRBt8qFhrmJW
	yTwlfHdiWOMmgzzc1A/eOeE+ZApXoDm8Cjnr+PqZPZ6LjFq0grANLahGyDdbVGpveVyqpKBgu1/zF
	nXwo2WkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq64C-00000003IhJ-1idX;
	Mon, 16 Sep 2024 07:22:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq64A-00000003IgS-1jVI
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 07:22:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-374c180d123so1601901f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726471353; x=1727076153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLjW0/5ZDl0ouUZFFt8vfRFxA6ScieB6Wo2BPonGqig=;
        b=OL99Ta5d4SAa7MLkWXm5apkIYTAK7zg+vgtO7MOG1p4B00c+wBEFggXaGapSKUhmNx
         FjtKd6FbjfeaOvLTboa9GPGuJc1ffnpZc2b2X6Hlx5dpxdEyqwZ5UqODJybz7CD9q8Tq
         jDBS5VzZzQjRfc/rvtVw4YJOQ8bDM9XHcjFQ7EmIFF81K1EBQD+pomrWwhoSkXBMqfiT
         13oJ1BFJLFsuJawLPVUEQteYAkUh1KOi/+4wzR+CsHLSDO2TDNe/bV94tKmA6+mzA63g
         dlITqkH0oxn1QLBe4FIxL0uJfXkKA6NQAfR4optsBxaK1FmYbPR5ffBN26i+e2ObCPjz
         H7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726471353; x=1727076153;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VLjW0/5ZDl0ouUZFFt8vfRFxA6ScieB6Wo2BPonGqig=;
        b=hyBt9mgczCHtWxb9MoAkQrgYYezmx0crOEEhsGXxcXH/1XHe6FbB6vxE6ot27NoM5A
         xxsG4tQLuEehTrc+jtiQIRbjsXzIu134rEBsmekuzEGCEWMADuyutd49vEmgSkWwyYlN
         dBDouphiy+bm9A4OrOKYc6fYF3oyUq5+70afcWM7vVe0CL3a99tK//2p8ZRvINB2zjKf
         5173oq1y5l086Ove1JAJ3MjDOuhYMO+G1ymxqJ8QawDU3AoaG1ua+7Iw920cRnVSuz+b
         wg7C7SAnEtcDNoOtuRQ8uxJamJIj3U3jomJ/e/iOstlz2CNrZI44NQ9Y7eSovn4GNC7G
         SDeg==
X-Forwarded-Encrypted: i=1; AJvYcCV9mR0t6s90/Ve5wlTpNRiqVayuV2VjO/10BXReMPVsJZVcDhx6uyKeT46TaI1njhT0LXln+LPtlpBCZ1C8@lists.infradead.org
X-Gm-Message-State: AOJu0YwApj/2BgM7pbmQABgHnJRGXIPkYeq8qv+L76JlT3b2+jU+e2GL
	1oSqXs3aYrDJ+ySUVdXy9OzOuvRCCyDaa+O/u9CeK7/bByHol4UIBLwvzblEbjP3NITHJ6Oex03
	8
X-Google-Smtp-Source: AGHT+IF8mNG9Q2MKAbQKPDAtK9i1wqbgQMI068oTtpXfSdCmEYXClrggOaykUylFIescX0LCueSBjg==
X-Received: by 2002:a5d:5f49:0:b0:378:8205:58ac with SMTP id ffacd0b85a97d-378d61f1608mr7614486f8f.34.1726471352338;
        Mon, 16 Sep 2024 00:22:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c? ([2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e80eesm6307487f8f.30.2024.09.16.00.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 00:22:31 -0700 (PDT)
Message-ID: <7df4b349-7126-434a-8ae7-ea2db535e8c2@linaro.org>
Date: Mon, 16 Sep 2024 09:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/7] ARM: dts: amlogic: meson6: delete undocumented nodes
To: Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-4-feaabb45916b@linaro.org>
 <CAFBinCD+txhz0x20LXhydZpLk=u4d9FT4=1sOX1bKuDeQqsMjQ@mail.gmail.com>
 <DAFA9AA0-F51E-438E-A486-389164C043CE@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <DAFA9AA0-F51E-438E-A486-389164C043CE@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_002234_479782_BC98D2E7 
X-CRM114-Status: GOOD (  14.86  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTYvMDkvMjAyNCAwNzo1NywgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPj4gT24gMTUgU2Vw
IDIwMjQsIGF0IDExOjEy4oCvUE0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIaSBOZWlsLAo+Pgo+PiBPbiBXZWQs
IFNlcCAxMSwgMjAyNCBhdCAxMjoxOeKAr1BNIE5laWwgQXJtc3Ryb25nCj4+IDxuZWlsLmFybXN0
cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPj4+Cj4+PiBEZWxldGUgbm9kZXMgaW4gbWVzb242LmR0
c2kgdGhhdCBhcmUgY2xlYXJseSB1bmRvY3VtZW50ZWQgJiB1bnVzZWQgZm9yIG1lc29uNiwKPj4+
IGZpeGluZyB0aGUgZm9sbG93aW5nIGNoZWNrIGVycm9yczoKPj4+IGF1ZGlvLWNvbnRyb2xsZXJA
NTQwMDogY29tcGF0aWJsZTowOiAnYW1sb2dpYyxhaXUnIGlzIG5vdCBvbmUgb2YgWydhbWxvZ2lj
LGFpdS1neGJiJywgJ2FtbG9naWMsYWl1LWd4bCcsICdhbWxvZ2ljLGFpdS1tZXNvbjgnLCAnYW1s
b2dpYyxhaXUtbWVzb244YiddCj4+PiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvYW1sb2dpYyxhaXUueWFtbCMKPj4+IGF1ZGlvLWNv
bnRyb2xsZXJANTQwMDogY29tcGF0aWJsZTogWydhbWxvZ2ljLGFpdSddIGlzIHRvbyBzaG9ydAo+
Pj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L3NvdW5kL2FtbG9naWMsYWl1LnlhbWwjCj4+PiAvc29jL2J1c0BjMTEwMDAwMC9wd21AODU1MDog
ZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2FtbG9naWMsbWVz
b24tcHdtJ10KPj4+IC9zb2MvYnVzQGMxMTAwMDAwL3B3bUA4NjUwOiBmYWlsZWQgdG8gbWF0Y2gg
YW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYW1sb2dpYyxtZXNvbi1wd20nXQo+Pj4gcGh5
QDg4MDA6IGNvbXBhdGlibGU6ICdvbmVPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBi
ZSBmaXhlZDoKPj4+ICAgICAgICAgWydhbWxvZ2ljLG1lc29uLW14LXVzYjItcGh5J10gaXMgdG9v
IHNob3J0Cj4+PiAgICAgICAgICdhbWxvZ2ljLG1lc29uLW14LXVzYjItcGh5JyBpcyBub3Qgb25l
IG9mIFsnYW1sb2dpYyxtZXNvbjgtdXNiMi1waHknLCAnYW1sb2dpYyxtZXNvbjhiLXVzYjItcGh5
JywgJ2FtbG9naWMsbWVzb244bTItdXNiMi1waHknXQo+Pj4gICAgICAgICAnYW1sb2dpYyxtZXNv
bi1neGJiLXVzYjItcGh5JyB3YXMgZXhwZWN0ZWQKPj4+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waHkvYW1sb2dpYyxtZXNvbjhiLXVzYjIt
cGh5LnlhbWwjCj4+PiBwaHlAODgyMDogY29tcGF0aWJsZTogJ29uZU9mJyBjb25kaXRpb25hbCBm
YWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgo+Pj4gICAgICAgICBbJ2FtbG9naWMsbWVzb24tbXgt
dXNiMi1waHknXSBpcyB0b28gc2hvcnQKPj4+ICAgICAgICAgJ2FtbG9naWMsbWVzb24tbXgtdXNi
Mi1waHknIGlzIG5vdCBvbmUgb2YgWydhbWxvZ2ljLG1lc29uOC11c2IyLXBoeScsICdhbWxvZ2lj
LG1lc29uOGItdXNiMi1waHknLCAnYW1sb2dpYyxtZXNvbjhtMi11c2IyLXBoeSddCj4+PiAgICAg
ICAgICdhbWxvZ2ljLG1lc29uLWd4YmItdXNiMi1waHknIHdhcyBleHBlY3RlZAo+Pj4gICAgICAg
ICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BoeS9hbWxv
Z2ljLG1lc29uOGItdXNiMi1waHkueWFtbCMKPj4+IC9zb2MvYnVzQGMxMTAwMDAwL21tY0A4YzIw
OiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYW1sb2dpYyxt
ZXNvbi1teC1zZGlvJ10KPj4+IG1tY0A4ZTAwOiBjb21wYXRpYmxlOjA6ICdhbWxvZ2ljLG1lc29u
LW14LXNkaGMnIGlzIG5vdCBvbmUgb2YgWydhbWxvZ2ljLG1lc29uOC1zZGhjJywgJ2FtbG9naWMs
bWVzb244Yi1zZGhjJywgJ2FtbG9naWMsbWVzb244bTItc2RoYyddCj4+PiAgICAgICAgIGZyb20g
c2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbW1jL2FtbG9naWMsbWVz
b24tbXgtc2RoYy55YW1sIwo+Pj4gbW1jQDhlMDA6IGNvbXBhdGlibGU6IFsnYW1sb2dpYyxtZXNv
bi1teC1zZGhjJ10gaXMgdG9vIHNob3J0Cj4+PiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbW1jL2FtbG9naWMsbWVzb24tbXgtc2RoYy55YW1s
Iwo+Pj4gcmVtb3RlcHJvY0AxYzogY29tcGF0aWJsZTowOiAnYW1sb2dpYyxtZXNvbi1teC1hby1h
cmMnIGlzIG5vdCBvbmUgb2YgWydhbWxvZ2ljLG1lc29uOC1hby1hcmMnLCAnYW1sb2dpYyxtZXNv
bjhiLWFvLWFyYyddCj4+PiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvcmVtb3RlcHJvYy9hbWxvZ2ljLG1lc29uLW14LWFvLWFyYy55YW1sIwo+
Pj4gcmVtb3RlcHJvY0AxYzogY29tcGF0aWJsZTogWydhbWxvZ2ljLG1lc29uLW14LWFvLWFyYydd
IGlzIHRvbyBzaG9ydAo+Pj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL3JlbW90ZXByb2MvYW1sb2dpYyxtZXNvbi1teC1hby1hcmMueWFtbCMK
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGlu
YXJvLm9yZz4KPj4gR2VuZXJhbGx5IEknbSBmaW5lIHdpdGggdGhpcy4gSSdtIHdvbmRlcmluZyBp
ZiB3ZSBzaG91bGQgZ28gb25lIHN0ZXAKPj4gZnVydGhlciBieSBkZWNvbW1pc3Npb25pbmcgTWVz
b242IHN1cHBvcnQ/Cj4+IFRvIGJlIHNwZWNpZmljIGhlcmUsIEknbSB0aGlua2luZyBvZiByZW1v
dmluZyBNQUNIX01FU09ONiBmcm9tCj4+IGFyY2gvYXJtL21hY2gtbWVzb24vS2NvbmZpZyBhbmQg
ZGVsZXRpbmcgbWVzb242ey5kdHNpLC1hdHYxMjAwLmR0c30KPj4KPj4gSSBkb24ndCBoYXZlIGFu
eSBib2FyZHMgd2l0aCBNZXNvbjYgU29DLCB0aGVyZSdzIG5vIHVwc3RyZWFtIEdQSU8sCj4+IHBp
bmN0cmwsIGNsb2NrLCBNTUMsIDx5b3UgbmFtZSBpdD4gZHJpdmVyIGZvciB0aGF0IFNvQyBlaXRo
ZXIuCj4+IFNvIGFsbCB3ZSBoYXZlIHVwc3RyZWFtIGlzIHRoZSBhYmlsaXR5IHRvIGJvb3QgdG8g
aW5pdHJhbWZzIGFuZCB1c2UKPj4gc2VyaWFsIGNvbnNvbGUocykuCj4+IElmIHNvbWVvbmUgaXMg
aW50ZXJlc3RlZCBpbiBNZXNvbjYgc3VwcG9ydCB0aGV5IHNob3VsZCBicmluZyBpdCBiYWNrCj4+
IGFsb25nIHdpdGggYSBmZXcgbW9yZSBwYXRjaGVzIGZvciB1cHN0cmVhbSBzdXBwb3J0IG9mIGZ1
cnRoZXIKPj4gcGVyaXBoZXJhbHMuCj4gCj4gSSB0aGluayB0aGF04oCZcyBhIHNlbnNpYmxlIG1v
dmUuIExpYnJlRUxFQyB3YXMgb25lIG9mIHRoZSBmZXcgZGlzdHJvcwo+IHRoYXQgc3VwcG9ydGVk
IE1lc29uNiBoYXJkd2FyZSBpbiB0aGUgcGFzdCAodmlhIHRoZSB2ZW5kb3Iga2VybmVsKQo+IGJ1
dCB3ZSBlbmRlZCBzdXBwb3J0IGluIDIwMTguIE1lc29uNiBkZXZpY2VzIGFyZSBtb3N0bHkvYWxs
PyBjaGVhcAo+IEFuZHJvaWQgYm94ZXMgZGF0aW5nIGZyb20gMjAxMS0yMDEzIGFuZCB0aGVzZSBo
YXZlIGVpdGhlciBiZWVuIGJlZW4KPiBkaXNjYXJkZWQgYnkgdXNlcnMgdGhyb3VnaCB1cGdyYWRl
cyBvciB0aGUgYm94ZXMgZGllZCBsb25nIGFnby4gVGhlcmUKPiBpcyBzdGlsbCBjb21tdW5pdHkg
aW50ZXJlc3QgaW4gc3VwcG9ydGluZyBNZXNvbjggYm9hcmRzICh0aGUgOHggY29yZQo+IGRldmlj
ZXMgYXJlIHVzZWQgZm9yIHJldHJvLWdhbWluZykgYnV0IG5vdCB0aGUgZWFybGllciBNZXNvbjYg
b25lcy4KClllYWggbGV0J3MgcmVtb3ZlIG1lc29uNiBkdHNpIGZvciB2Ni4xMywgSSdsbCByZXNw
aW4gdGhpcyBzZXJpZSBidXQgd2l0aAp0aGUgbWVzb242IHJlbW92YWwgYW5kIHNvbWUgbW9yZSBk
dHMgZml4ZXMuCgpOZWlsCgo+IAo+IENocmlzdGlhbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
