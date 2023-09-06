Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8882EB8FA5
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Sep 2023 07:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsi6xXDx5onEUdBJDQPbKOYRkNhiG4lujCYG88Vs5pk=; b=ahe5c8r+K9FlYFCfnZ8Gp1/VVt
	iTLLtpHW8YteTq23Vww4eUAPABYDtCkda17oWtdq6gm7UgjGS/D+Kq2y3NPEN8/QARpMFkcj63T3x
	TlXv0dVOeBdSTB9wfjYERAnMlrpU6AzM6XrESQO5uqpx90YMNIk8RHCuZ8oJohKC8vgiC8TjWPuoY
	VjzrH44xFOUlTIe4NQMCzAtrJVvDk7Lq5qN2PHNI/gW8FjaQCOdsL7XwYho9AQ1FE45EAymdJMbO6
	LjLuSM7Uyc6uKE00HlYDr+Rf/P7qnomNis0nG/1bL03kwNEn/4fzvpe4ihV6mbNI9Q5hDdRJY2Bpp
	HiFaQdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmmo-007T87-1x;
	Wed, 06 Sep 2023 07:17:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmml-007T6g-2N
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Sep 2023 07:17:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401f68602a8so31787015e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 06 Sep 2023 00:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693984627; x=1694589427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjFKF8kz0rFgiiIepCyA40GooVbihGUlWbJspHagbd4=;
        b=x0XHXtr2SGVj6daFw5Pf+JMuPvQ5fRyTShkyBj0EEI6Hk/IJqc1SfUs4Mup+LGFNHH
         +ir+ENHFkFujh2xaVOjVM6emi9/LTa7cXQKN4FQVfgi65xwtTv6Tqzv4qqwyw0Dv2gbh
         R8kPPAFoM0dDUzL5OJXAynlcnzVvrwFugPUs5ICqLF7AbGO8rFq6mLomu97PwPMe4P5g
         tO32BXpADHXP9NQs0mDeiGHaKSpqKaPrj/p/IyYXdwnvE3tB7yHsGEN4xqH68jJazyK4
         PYWenrySvf5uSUglVL47siPTWEFtPMmTcJezc6EbcCKdNFSUTUdvtE4vS/PCKJd0Xczq
         KFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693984627; x=1694589427;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zjFKF8kz0rFgiiIepCyA40GooVbihGUlWbJspHagbd4=;
        b=EamAgdhzHgv4aP7HWavsLrVgB4Q5yB7+jsMkh8iDgE7bdd26N+aFd8pRi+jcCtVlT9
         BAZts2ZdFYDbmh7HYJDT4Cj1qnhS4fNMIgD2Aac6mky18SkkbZQf/IkgZcBIeaG5inVt
         SHKhOMgkMlqU00t7UgUFm5kNzlGBq9eAwkf+rVch5ZaU0UOW/WOhhsts9iBw6stOK2nk
         QuEbfJfJ8ouZfXl5wNCZ3BzpMGqxc4F7Itm4ClypPqdYi8tytTVZ6bgQKWfBLGDJ41IF
         wi9HTUK62nM+7Dae2tg8xOFK4DmzFTvw66WEPjx98C32n1Yqk//LtYNuTPQ1cXKda/Py
         h1dg==
X-Gm-Message-State: AOJu0YxuCIS/fgB6liaUGZEr2diOCu60Fj3a/SgJFSwBxxquMyNzkqQe
	bpaGh4X6A+/rQF6Yoad0/qL0dQ==
X-Google-Smtp-Source: AGHT+IG1fAswEQZ+zQpRcdWpRk4PGX5V8rpi9OfzyvdRolXIlsS/nRu0hUXmH2/AJRvuTde7w6CjgQ==
X-Received: by 2002:adf:e5c7:0:b0:314:3e77:f210 with SMTP id a7-20020adfe5c7000000b003143e77f210mr1567493wrn.59.1693984627147;
        Wed, 06 Sep 2023 00:17:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cb13:4315:e6a2:bbdd? ([2a01:e0a:982:cbb0:cb13:4315:e6a2:bbdd])
        by smtp.gmail.com with ESMTPSA id p6-20020adfce06000000b0031ad2f9269dsm19696493wrn.40.2023.09.06.00.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:17:06 -0700 (PDT)
Message-ID: <c5c9000e-0f49-4e87-a5f7-6fbb9aa71bb6@linaro.org>
Date: Wed, 6 Sep 2023 09:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
Content-Language: en-US, fr
To: Zelong Dong <Zelong.Dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <fcdb1fb2-784d-4235-aa47-9e489395c028@linaro.org>
 <646b1955-c89f-a6f5-acd1-a3c68953b0c6@amlogic.com>
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
In-Reply-To: <646b1955-c89f-a6f5-acd1-a3c68953b0c6@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_001711_778954_C196E170 
X-CRM114-Status: GOOD (  13.71  )
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

T24gMDYvMDkvMjAyMyAwOToxMSwgWmVsb25nIERvbmcgd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjMv
OC8yNSAyMDoxOSwgTmVpbCBBcm1zdHJvbmcg5YaZ6YGTOgo+PiBPbiAyNS8wOC8yMDIzIDEzOjUz
LCB6ZWxvbmcgZG9uZyB3cm90ZToKPj4+IEZyb206IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9uZ0Bh
bWxvZ2ljLmNvbT4KPj4+Cj4+PiBNZXNvbiBJUiBDb250cm9sbGVyIHN1cHBvcnRzIGhhcmR3YXJl
IGRlY29kZXIgaW4gTWVzb24tUzQgYW5kIGxhdGVyCj4+PiBTb0MuIFNvIGZhciwgcHJvdG9jb2wg
TkVDIGNvdWxkIGJlIGRlY29kZWQgYnkgaGFyZHdhcmUgZGVjb2Rlci4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBaZWxvbmcgRG9uZyA8emVsb25nLmRvbmdAYW1sb2dpYy5jb20+Cj4+PiAtLS0KPj4+
IMKgIGRyaXZlcnMvbWVkaWEvcmMvbWVzb24taXIuYyB8IDUyMiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0NTEgaW5zZXJ0aW9ucygr
KSwgNzEgZGVsZXRpb25zKC0pCj4+Pgo+Pgo+PiA8c25pcD4KPj4KPj4gSXQgbG9va3MgcHJldHR5
IGdvb2Qgbm93LCBzbyBmYXIgSSdtIG9rIHdpdGggaXQ6Cj4+Cj4+IFJldmlld2VkLWJ5OiBOZWls
IEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPj4KPj4gSSB0aGluayBzb21l
IHRlc3QgcmVwb3J0cyB3b3VsZCBiZSBuZWVkZWQgdG8gYmUgc3VyZSBpdCBkb2Vzbid0IHJlZ3Jl
c3MgZXhpc3RpbmcgSFcuCj4+Cj4+IFRoYW5rcywKPj4gTmVpbAo+IAo+IFNvcnJ5IGZvciBteSBs
YXRlIHJlcGx5LCBJIHNwZW50IGEgbG9uZyB0aW1lIGxvb2tpbmcgZm9yIGRldmVsb3BtZW50IGJv
YXJkcy4KPiBJIHNlYXJjaGVkIE1lc29uLUlSIERUIE5vZGUgZnJvbSBhbGwgdGhlIEFtbG9naWMg
RFQsIG9ubHkgNCBEVFNJIGFzIGZvbGxvdzoKPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZzEyLWNvbW1vbi5kdHNpCj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWF4Zy5kdHNpCj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LmR0c2kKPiBh
cmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL21lc29uLmR0c2kKPiAKPiBTbyBJIHBsYW5uZWQgdG8g
c2FtcGxlIHRoZSBib2FyZHMgdG8gdGVzdDoKPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZzEyYS11MjAwLmR0cwo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1h
eGctczQwMC5kdHMKPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLXM5MDV4
LXAyMTIuZHRzCj4gYXJjaC9hcm0vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbjhiLW9kcm9pZGMxLmR0
cwo+IAo+IFVuZm9ydHVuYXRlbHksIG1lc29uLWd4bC1zOTA1eC1wMjEyICYgbWVzb244Yi1vZHJv
aWRjMSBhcmUgdG9vIG9sZCB0byBiZSBmaW5kLgo+IHRoZXJlIGFyZSBvbmx5IDIgYm9hcmRzIEkg
Z290LCBtZXNvbi1nMTJhLXUyMDAgJiBtZXNvbi1heGctczQwMCwgYW5kIHRoZXkgd29ya2VkLgo+
IAo+IFvCoMKgwqAgMC45NDMwOTddIElSIE5FQyBwcm90b2NvbCBoYW5kbGVyIGluaXRpYWxpemVk
Cj4gW8KgwqDCoCAwLjk0MzE0Nl0gSVIgUkM1KHgvc3opIHByb3RvY29sIGhhbmRsZXIgaW5pdGlh
bGl6ZWQKPiBbwqDCoMKgIDAuOTQ3MDI5XSBJUiBSQzYgcHJvdG9jb2wgaGFuZGxlciBpbml0aWFs
aXplZAo+IFvCoMKgwqAgMC45NTE1MDhdIElSIFJDTU0gcHJvdG9jb2wgaGFuZGxlciBpbml0aWFs
aXplZAo+IFvCoMKgwqAgMC45NTYwODBdIElSIFhNUCBwcm90b2NvbCBoYW5kbGVyIGluaXRpYWxp
emVkCj4gW8KgwqDCoCAwLjk2MTI2Nl0gUmVnaXN0ZXJlZCBJUiBrZXltYXAgcmMtZW1wdHkKPiBb
wqDCoMKgIDAuOTY0Njc0XSByYyByYzA6IG1lc29uLWlyIGFzIC9kZXZpY2VzL3BsYXRmb3JtL3Nv
Yy9mZjgwMDAwMC5idXMvZmY4MDgwMDAuaXIvcmMvcmMwCj4gW8KgwqDCoCAwLjk3MjQzN10gaW5w
dXQ6IG1lc29uLWlyIGFzIC9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZjgwMDAwMC5idXMvZmY4MDgw
MDAuaXIvcmMvcmMwL2lucHV0MAo+IFvCoMKgwqAgMC45ODA5ODNdIHJjIHJjMDogc3cgZGVjb2Rl
ciBpbml0Cj4gW8KgwqDCoCAwLjk4NDA4OV0gbWVzb24taXIgZmY4MDgwMDAuaXI6IHJlY2VpdmVy
IGluaXRpYWxpemVkCj4gCj4gIyBjZCAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jL2ZmODAwMDAw
LmJ1cy9mZjgwODAwMC5pci9yYy9yYzAvCj4gIyBjYXQgcHJvdG9jb2xzCj4gcmMtNSBuZWMgcmMt
NiByYy01LXN6IHhtcCByYy1tbQo+ICMgZWNobyBuZWMgPiBwcm90b2NvbHMKPiAjIGhleGR1bXAg
L2Rldi9pbnB1dC9ldmVudDAKPiAwMDAwMDAwIDAwNjkgMDAwMCAzMTgwIDAwMDUgMDAwNCAwMDA0
IDAxMWIgMDAwMAo+IDAwMDAwMTAgMDA2OSAwMDAwIDMxODAgMDAwNSAwMDAwIDAwMDAgMDAwMCAw
MDAwCj4gMDAwMDAyMCAwMDY5IDAwMDAgZmM4MCAwMDA1IDAwMDQgMDAwNCAwMTFiIDAwMDAKPiAw
MDAwMDMwIDAwNjkgMDAwMCBmYzgwIDAwMDUgMDAwMCAwMDAwIDAwMDAgMDAwMAo+IDAwMDAwNDAg
MDA2OSAwMDAwIDkyZGIgMDAwNyAwMDA0IDAwMDQgMDExYiAwMDAwCj4gMDAwMDA1MCAwMDY5IDAw
MDAgOTJkYiAwMDA3IDAwMDAgMDAwMCAwMDAwIDAwMDAKPiAwMDAwMDYwIDAwNjkgMDAwMCAzODhi
IDAwMDkgMDAwNCAwMDA0IDAxMWIgMDAwMAo+IDAwMDAwNzAgMDA2OSAwMDAwIDM4OGIgMDAwOSAw
MDAwIDAwMDAgMDAwMCAwMDAwCj4gMDAwMDA4MCAwMDY5IDAwMDAgZGU3MiAwMDBhIDAwMDQgMDAw
NCAwMTFiIDAwMDAKPiAwMDAwMDkwIDAwNjkgMDAwMCBkZTcyIDAwMGEgMDAwMCAwMDAwIDAwMDAg
MDAwMAoKSXQncyBmaW5lICEKClRoYW5rcyBmb3IgdGVzdGluZyAhIQoKTmVpbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
