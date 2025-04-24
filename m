Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC1DC369AB
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Apr 2025 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zyc9RHareNuXKu5yg13/rQzVwpsjF+iZ94Va/ZpaC+U=; b=QnMUnNulac2LAoidJX7s3XSRgM
	4tmJEtzbPLNMD3WPsOriefs4RiYIgJEwgk1IQzSKys5sqJKmqtACw+rtSQtB79Qm040wbjT1wuf3t
	LuVU+GDPFbKwqF44MPZQ+Yp++11wEfksgeL0ThXXqaS2WcwUbY8ez5a64K3FbormN8PWqsDu6jZm6
	40G2G8cVAKWEdSubCidgoIw4yFnJ2hxSn6k0h9dPluLsylVzYsq/yIaAlsFNXeKHU1eIVAZ7ZgYfa
	Ut1uX0W1LOiUnhae8U2SPqhWpiyvnOjPph/BtU2Tr4mH+dU9FeoXUx9k19OSYiYpwJ1jQcTe3/A6g
	LA87dQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7utO-0000000DssL-1whV;
	Thu, 24 Apr 2025 11:37:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t44-0000000DXdn-33Uo
	for linux-amlogic@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=; b=TZisszCC/fBfnTCqno6rlXkXS1
	+5KN1DC/UVwxj9jLfknyQi2W2DumoEswx7zYpTRwdfzQm6IMQLeAkIT9eM0jFSUUw/9k/FE33xq9d
	avNp4zX4Co7p1i1ZIt9+SZgjm+gRBhh7Fa0ofCU8dxGGiZS5QdIA5/N7jw3RmP47WN44ioDXvRDnw
	w2tmqLakuq8TD1qm2n/pKGe2LFAcZXQvFHFqEteMmZxcJLyGb2xI/17Hgc7LSfxxBv06KI/3ERHOO
	u2kWsul/30n+9NGeMC+XhkhSGaHnTtZQSgdA1q+jlcsfQSLvzAWPwwuYzyti6MoiYWeE6xhSHglQP
	wDEPu4Tw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t41-0000000Bgxe-2efe
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Apr 2025 09:40:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so4931305e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Apr 2025 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487611; x=1746092411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=;
        b=o9dQdHms+BMUKVPT4TzJwI/4p+yj6ui/oeG2KwxmJ9nLVyW+kg+82HGcwEASKHLXrX
         iuz95jmIW2KhRYthW5qEaE6K7sXZmS/53ggwErrxYMBzqbxo1uuzdS3J0XM22eyWhjNy
         u2E4YJmF2rLn6gtdrfRzdd/y9mzYkN/nzGRIOeWzNZRUJkqLKP7oMARSnbvNZerZWLr1
         mQ6ESrNo4V8qH9otDRfG0aLEQv9Ct/ExdAOnKYBXOkbcun1j/zv6inNcyRcnhsSkWy3C
         MWJTJBxQge8zJGpu6b/Tar+3BWnuxn5K5rRdVbi6P/cbA65CwDvgfQky8eZqUTQmfods
         qxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487611; x=1746092411;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=;
        b=Uuy78uC3RrKcVRPAPIRyF5k4I4ynNiqAdhgEjuOIL39WvUj0P+bdhVENCPpK46exYx
         VZO2KqPKIrlNyFO9ZxxH86nUQSvYhZrAaeejdvTPAccXIk5NGiSJBYeNHhtFsUbOGqld
         JxKCqHW9Ut0XUfJhFYhOFuxxya/w/XBq/Ipd8ylJZ6rgFpGBKjZOmEXcDOx1i7j1uguS
         oqGbHFbWYkZi3dedjFVTvCWBDfdbQTYy4Okpe/OomAVe2cMoA6bAR6vDoVf+9SRv6d24
         QlJuvJmYqf5opjmrhZHBcNPohgtSp5xgt+K1azMFMIhfOhcG90UfpJ3UdotK09ggLDzq
         Nkmg==
X-Forwarded-Encrypted: i=1; AJvYcCV0HCuTghElv5RghBG5Fj2Pbt87cMBCESOrnYESQ89s5dAZzj1yvgHeF7+Dy2omcJIjBbqbO+6OyISwO/Sx@lists.infradead.org
X-Gm-Message-State: AOJu0YwXsP37w6OwEbAis09FLX1VCBweRfVfKp7O3HxpRL4SU5h0JWFE
	WcDeYDbc5UB2jzZzh+TQKmV5FEIISeiy75TGMv11P2+rcuILd+vUlBrrVBMDB+M=
X-Gm-Gg: ASbGnctyKWEE3tLGNd6Yg6lxcHs9QMvMqHhEhmOdv+Ic5bq7YJrBKJSpDgKJ0Fd1aq+
	G9tJ7xwp/382LGonpEiPe/ZPIOBCww5/ZBBs/68sDsB+HWA+KS1f6SjSpm2HwfKHPTRGKzOTZ9X
	ViT5MqUrMec2xU80cXn4HP/q5azx2OTWqEcD3dFGi+hBKF1S7W6yqPyt+CVBRYlcGEO6zdmpu7S
	iC9mv5FKc6ol0fIVEyvItlzgRQ7MOlyOv2/ldvBMrGGGdavLdKpoiYALLmgopK71/Hb+pfLk5jT
	opP7586yFg2uv/SQkzlWOb73b+NcGhci5P0yLTgCskwqIvcTBZofglVI9v+HUHY+RA7qWUHOt8A
	sPvDdy9+0terlcJ0Y1g==
X-Google-Smtp-Source: AGHT+IGbKzH+UdHoa8Vh4y2Ra8BSslqvY1MacnDBCVBoNcCm+y48fIa9KnJUakAXtxUbplXif8s16w==
X-Received: by 2002:a05:600c:3482:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4409bd23196mr21055935e9.13.1745487611286;
        Thu, 24 Apr 2025 02:40:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2b77f9sm13631535e9.25.2025.04.24.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:40:10 -0700 (PDT)
Message-ID: <094c0d7e-7b24-405d-8e44-c981100383f1@linaro.org>
Date: Thu, 24 Apr 2025 11:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
 <ef1ac07a-09c5-4f8a-89d5-44d232f8ae41@amlogic.com>
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
In-Reply-To: <ef1ac07a-09c5-4f8a-89d5-44d232f8ae41@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_104013_814935_0CA217B7 
X-CRM114-Status: GOOD (  13.99  )
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

SGksCgpPbiAyNC8wNC8yMDI1IDEwOjMyLCBLZWx2aW4gWmhhbmcgd3JvdGU6Cj4gSGkgTmVpbCwK
PiAKPiBBcmUgdGhlcmUgYW55IGltcHJvdmVtZW50cyBuZWVkZWQgZm9yIHRoaXMgcGF0Y2hzZXQ/
Cj4gVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyEKCk5vLCB3YWl0aW5nIGZvciBQaGlsaXBwIHRv
IHBpY2sgcGF0Y2ggMS4KClRoYW5rcywKTmVpbAoKPiAKPiBPbiAyMDI1LzQvMTEgMTk6MzgsIEtl
bHZpbiBaaGFuZyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+Cj4+IEFkZCBkdC1iaW5kaW5nIGNvbXBh
dGlibGVzIGFuZCBkZXZpY2Ugbm9kZXMgZm9yIEFtbG9naWMgQTQvQTUgcmVzZXQuCj4+Cj4+IElt
cG9ydGVkIGZyb20gZjIwMjQwOTE4MDc0MjExLjgwNjctMS16ZWxvbmcuZG9uZ0BhbWxvZ2ljLmNv
bQo+Pgo+PiBDaGFuZ2VzIGluIHY2Ogo+PiAtIFJlYmFzZWQgb250byB0aGUgbGF0ZXN0IHY2LjE2
L2FybTY0LWR0Lgo+PiAtIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NTAzMjAtYTQtYTUtcmVzZXQtdjUtMC0yOTZmODNiZjczM2RAYW1sb2dpYy5jb20KPj4KPj4gQ2hh
bmdlcyBpbiB2NToKPj4gLSBSZWJhc2luZyBvbiB0b3Agb2YgdGhlIGxhdGVzdCB1cHN0cmVhbSBj
aGFuZ2VzLgo+PiAtIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAz
MTMtYTQtYTUtcmVzZXQtdjQtMC04MDc2ZjY4NGQ2Y2ZAYW1sb2dpYy5jb20KPj4KPj4gQ2hhbmdl
cyBpbiB2NDoKPj4gLSBSZW1vdmUgdGhlIHN1cGVyZmx1b3VzICdpdGVtcycgaW4gdGhlIGR0LWJp
bmRpbmcuCj4+IC0gUmViYXNpbmcgZHVlIHRvIHJlY2VudCB1cHN0cmVhbSBjaGFuZ2VzLgo+PiAt
IExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDkxODA3NDIxMS44
MDY3LTEtemVsb25nLmRvbmdAYW1sb2dpYy5jb20vCj4+Cj4+IENoYW5nZXMgaW4gdjM6Cj4+IC0g
cmViYXNlIG9uICdhbWxvZ2ljLHQ3LXJlc2V0JyBwYXRjaHNldAo+PiAtIExpbmsgdG8gdjI6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDcxNTA1MTIxNy41Mjg2LTEtemVsb25nLmRv
bmdAYW1sb2dpYy5jb20vCj4+Cj4+IENoYW5nZXMgaW4gdjI6Cj4+IC0gcmVtb3ZlICdhbWxvZ2lj
LHQ3LXJlc2V0Jwo+PiAtIG1vdmUgJ2FtbG9naWMsYzMtcmVzZXQnIHRvIHRoZSBvdGhlciBlbnVt
IGxpc3QKPj4gLSBtb3ZlIHJlc2V0IG5vZGUgZnJvbSBhbWxvZ2ljLWE0LWNvbW1vbi5kdHNpIHRv
Cj4+IMKgwqAgYW1sb2dpYy1hNC5kdHNpL2FtbG9naWMtYTUuZHRzaQo+PiAtIExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDcwMzA2MTYxMC4zNzIxNy0xLXplbG9u
Zy5kb25nQGFtbG9naWMuY29tLwo+Pgo+PiAtLS0KPj4gWmVsb25nIERvbmcgKDMpOgo+PiDCoMKg
wqDCoMKgwqAgZHQtYmluZGluZ3M6IHJlc2V0OiBBZGQgY29tcGF0aWJsZSBmb3IgQW1sb2dpYyBB
NC9BNSBSZXNldCBDb250cm9sbGVyCj4+IMKgwqDCoMKgwqDCoCBhcm02NDogZHRzOiBhbWxvZ2lj
OiBBZGQgQTQgUmVzZXQgQ29udHJvbGxlcgo+PiDCoMKgwqDCoMKgwqAgYXJtNjQ6IGR0czogYW1s
b2dpYzogQWRkIEE1IFJlc2V0IENvbnRyb2xsZXIKPj4KPj4gwqAgLi4uL2JpbmRpbmdzL3Jlc2V0
L2FtbG9naWMsbWVzb24tcmVzZXQueWFtbMKgwqDCoMKgwqDCoMKgIHwgMjIgKysrLS0KPj4gwqAg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTQtcmVzZXQuaMKgwqDCoMKgIHwg
OTMgKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9hbWxvZ2ljLWE0LmR0c2nCoMKgwqDCoMKgwqDCoCB8wqAgOCArKwo+PiDCoCBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hNS1yZXNldC5owqDCoMKgwqAgfCA5NSArKysrKysr
KysrKysrKysrKysrKysrCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2lj
LWE1LmR0c2nCoMKgwqDCoMKgwqDCoCB8wqAgOCArKwo+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDIx
OCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+PiAtLS0KPj4gYmFzZS1jb21taXQ6IDRi
YzI4YWYyZGE4NzY1MzFlNTE4M2QyNWFlODA3ZTYwOGM4MTZkMTgKPj4gY2hhbmdlLWlkOiAyMDI1
MDMxMy1hNC1hNS1yZXNldC02Njk2ZTViMThlMTAKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiAtLSAK
Pj4gS2VsdmluIFpoYW5nIDxrZWx2aW4uemhhbmdAYW1sb2dpYy5jb20+Cj4+Cj4+Cj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
