Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA41C83F11
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMGI/Y+YkIpAlpLKm+MMO6lVI0fhOc6VLGX861PrmRA=; b=rXH3DnDkqrYamSA6RawsQTqf9r
	mKTthxYz5e8Db/HnnatWHzyC3raVUiJ2YNaWvxQKNb5hJwt+OcIZ97g2OM9J29YyJ2A8kGuY9XBcF
	5gjuyA5HtV/JgATCzLsHOipdelp7sZ5XUHaUXJNnxoDQOnVvtOrvUCx6gAstZtZo3FtDIedIyOf2y
	wGBjxLwd65pm4uPtT/U+5Sx1dTro5uCUogm/JcU4MYUd4GrjZEA35qVTFFXfaIvjWLJ4MHmCHsXqW
	ciA4rYKZlagKX+mYy6RJHQ1QVp1uSKexf70xoTmpDTY8esm7NxN2f7cjXK/a/7L4VBtgToH6lUEYH
	Cbulf4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qabNy-009ZMh-0J;
	Mon, 28 Aug 2023 12:30:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qabNu-009ZLs-1M
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Aug 2023 12:30:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31aeef88a55so2566918f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Aug 2023 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693225821; x=1693830621;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kikC2GMZA3lKqRBwEa37aJsf6/FOFnk58xosIM1uppU=;
        b=LOVmckN79tJf+dsYfdpFMqlyjgUFlbVTthUqp4Jlr4IWMUTLUOiHGu5CKu2yCs8G/7
         9cm+58/7BUHNVnOlBboAuhwboP7D2nabsp+ZWsk2kCnm7tLBkSmA272roTrRDeOHgKK3
         kut96HeZbJ+2e1kJsAv4+UJv9qUHBoOdZGCOAVvbl1tUDfvYvT0bJtqrOdEfMP0kU9od
         AOdeMNwvo96VAIjFz+HpSxLfsakfRwc14H5xiMFu/2PJ5bZNhtiyTVmg23//C8kS5GhG
         hErbs3Q4Zbm99CkTt1CXznhuWmdqjBdKfPfd2NmglW2C0hJXqw4HjdwUEJQ/RimdEopk
         3Qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693225821; x=1693830621;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kikC2GMZA3lKqRBwEa37aJsf6/FOFnk58xosIM1uppU=;
        b=dgHc3eu/3WrFK1t8/T/rsl1sZQfqL+v0sJM4N52KDGNbZDTsnr2DtGseHgl4Aiqn4l
         odXLjAC0eUzh9HisjEtl0zFINEN4wpC4SVSsltYsc8O9QxAL+d+5Ri1VvBxqpYVSQ/Zn
         j+pNf5Xg70+U0tmU5+/+x/rkVbIjkzpRnTQzdioTPXTUpKQVPX2rid52Wq0FNxMYb+gY
         2rJauxfhFKVoZVwcYakquzJaTRuT/4rxKzM4/F/scccy8nodtpwxv4OcPUehgyCLWn2W
         K8UfhmNGCmTHUy/JxgB6xT7q0PS14JB+aRnfmrjGcll3jBJkSQRbdZEwvOLLDhgfFSff
         zRag==
X-Gm-Message-State: AOJu0Yx8MAXw9Gb6JgUxn2T55tf6VbwV1sV9RQy9/nADz8IbWYoDqUkF
	kIJo1iQstFY1ArCKyoXAKP3D1RRFpynkEfH7Qv5Og5Qh
X-Google-Smtp-Source: AGHT+IHHFmAz5oQdVaLNKoDebNOA4cP6Xfs7jD1J8pUPSk3dEDjD/HL1YdFzkfPYDfeMPrIptx4XPA==
X-Received: by 2002:a5d:4a12:0:b0:317:49a2:1f89 with SMTP id m18-20020a5d4a12000000b0031749a21f89mr18915512wrq.1.1693225820676;
        Mon, 28 Aug 2023 05:30:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5e59:c27b:747a:3f52? ([2a01:e0a:982:cbb0:5e59:c27b:747a:3f52])
        by smtp.gmail.com with ESMTPSA id k12-20020a5d518c000000b003143cb109d5sm10486910wrv.14.2023.08.28.05.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 05:30:20 -0700 (PDT)
Message-ID: <413d4c70-fcd4-479d-967b-59130c1a68eb@linaro.org>
Date: Mon, 28 Aug 2023 14:30:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] tty: serial: meson: Add a earlycon for the S4 SoC
Content-Language: en-US, fr
To: tanure@linux.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20230828121053.60838-1-tanure@linux.com>
 <7720b990-c9cf-4c3d-8bb2-928b3b17f089@linaro.org>
 <CAJX_Q+0AWcY7SySsdtVn=7xE8H0YtLBfN2XrKSOZMGB-60NRhg@mail.gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <CAJX_Q+0AWcY7SySsdtVn=7xE8H0YtLBfN2XrKSOZMGB-60NRhg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_053022_461865_EA3419F7 
X-CRM114-Status: GOOD (  13.26  )
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

SGksCgpPbiAyOC8wOC8yMDIzIDE0OjI2LCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gT24gTW9uLCBB
dWcgMjgsIDIwMjMgYXQgMToxNuKAr1BNIE5laWwgQXJtc3Ryb25nCj4gPG5laWwuYXJtc3Ryb25n
QGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4gT24gMjgvMDgvMjAyMyAxNDoxMCwg
THVjYXMgVGFudXJlIHdyb3RlOgo+Pj4gVGhlIG5ldyBBbWxvZ2ljIFM0IFNvQyBkb2VzIG5vdCBo
YXZlIGEgYWx3YXlzLW9uIHVhcnQsIHNvIGFkZAo+Pj4gT0ZfRUFSTFlDT05fREVDTEFSRSBmb3Ig
aXQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29t
Pgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgNCArKy0t
Cj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIGIvZHJp
dmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+Pj4gaW5kZXggNzkwZDkxMGRhZmE1Li44ZGZh
YTI2MGU1NDUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5j
Cj4+PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+PiBAQCAtNjQ2LDgg
KzY0Niw4IEBAIG1lc29uX3NlcmlhbF9lYXJseV9jb25zb2xlX3NldHVwKHN0cnVjdCBlYXJseWNv
bl9kZXZpY2UgKmRldmljZSwgY29uc3QgY2hhciAqb3B0Cj4+PiAgICAgICAgcmV0dXJuIDA7Cj4+
PiAgICB9Cj4+Pgo+Pj4gLU9GX0VBUkxZQ09OX0RFQ0xBUkUobWVzb24sICJhbWxvZ2ljLG1lc29u
LWFvLXVhcnQiLAo+Pj4gLSAgICAgICAgICAgICAgICAgbWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNv
bGVfc2V0dXApOwo+Pj4gK09GX0VBUkxZQ09OX0RFQ0xBUkUobWVzb24sICJhbWxvZ2ljLG1lc29u
LWFvLXVhcnQiLCBtZXNvbl9zZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cCk7Cj4+PiArT0ZfRUFS
TFlDT05fREVDTEFSRShtZXNvbiwgImFtbG9naWMsbWVzb24tczQtdWFydCIsIG1lc29uX3Nlcmlh
bF9lYXJseV9jb25zb2xlX3NldHVwKTsKPj4KPj4gTm90IHN1cmUgd2h5IHlvdSB3b3VsZCBjaGFu
Z2UgYm90aCBsaW5lcywgYW5kIHdoZXJlJ3MgdGhlIHQ3IGVudHJ5ID8KPiBvaywgYnV0IHdlIGRv
bid0IG5lZWQgdDcsIHJpZ2h0PyBUNyB3aWxsIHVzZSBTNCBjb21wYXRpYmxlIGxpbmUuCgpJbmRl
ZWQsIEkgZm9yZ2V0IHlvdSBmaW5hbGx5IHVzZWQgYW1sb2dpYyxtZXNvbi1zNC11YXJ0IGFzIGZh
bGxiYWNrLgoKUGxlYXNlIGluZGljYXRlIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKSSds
bCBhY2sgdGhlIHJldmVydCB0aGVuLAoKVGhhbmtzLApOZWlsCgo+Pgo+PiBOZWlsCj4+Cj4+Pgo+
Pj4gICAgI2RlZmluZSBNRVNPTl9TRVJJQUxfQ09OU09MRV9QVFIoX2Rldm5hbWUpICgmbWVzb25f
c2VyaWFsX2NvbnNvbGVfIyNfZGV2bmFtZSkKPj4+ICAgICNlbHNlCj4+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
