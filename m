Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03A8C02198
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2025 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtlMNGfO/7jlquLvkGuWaakFYXIL2rA7EkdNjgoxIHM=; b=tEYFtqNV0we9/HW433AS3og1sh
	4j3Ti/6ju7243tNtdSaDzo4/GW+v/6u0Kl53gUGkJj+zTXeS/E3LqoUxPwpGfsbCTiysfjAVb4Yrp
	JSbxnfysmMfMTrgjIY4ZwwOzGGWcf+xtGvXUOeGzwyl3TG8oSlcAHRe+SWZXAlqKlOwzqnvapZWND
	K/ScayPmzRjAqPWPXo7pKyU1i3F3q87ejZuczIqR0uqk8Lz0c4KYLejW9OIvbh+58giXb2UNOplrD
	MAdlZLxMLisUZe5yKmK+XhoM7daX0BVqguazSFmaW6xhNcPZ1fn0FRO1qMAqCkrN8EwUr4NCsNJf0
	oAVGgMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQTx-0000000Gt3s-17Qj;
	Mon, 10 Feb 2025 09:53:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQSB-0000000Gsj2-1NWn
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Feb 2025 09:51:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43675b1155bso46345605e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Feb 2025 01:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739181106; x=1739785906; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyOzPnDD5nV6TA3iG57NOHGaY6BlLamnSYD7hNHtszo=;
        b=mWlwnsftDHNNu7f4OIxkyRxTMp3VK4CbiuHUsNjFtv7aYvq05dQTJkebw358AArfM7
         b4kb6rGA1de5iVI7C30B57hKuaxOu1fk3MEFFTdM05dQB7JJp578uwTYCXoIQ+S52gDl
         ODtHkN75pB9lLH1ttyaf4LRYzaUM2bLQXJtak1LlRR+02lMV4oiOal8HviJ2KNZ2O95U
         FotqGysPwocKO9bHuajq//UMk0PdOd5FRZCx0V+sUnmVU9KTytQWKmaWlnGZYfae1fC8
         SxS3/bsGtaAk6vHT1yNJIy0V0OhxS1qJ7dTzS49yDLQbPJ1YbWPlIjtbcd+vfyzTzw+g
         IdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181106; x=1739785906;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OyOzPnDD5nV6TA3iG57NOHGaY6BlLamnSYD7hNHtszo=;
        b=r3tYpLG/5D0JOwsT1BFrVRnpxxa9HxGtIy7ctM2cbWXJ0B7D5YabQmnXXKf850YWHv
         sSzq9LiiKY3B1WDq3OSzrN5UQiouefIuoKYXDw22+aUZLTfZ/mEeVQIprIuRxi/2qt3t
         wtlePp6iNCUikeA3TDXDo/vL3gN1GU/+S0n65i3H0LLNAm8VZ1DfrcbdNDncR2aUDZim
         5p9njtWPJw80KapRX2fM1dTk0g7Z2nsQUP2b4kps3jQLMhfLLzgHh8WtGjApRu4JLXxB
         ZqMWMT5+HHwgRWmLtC7Gc+20fu/8qruzhGuLSbT1JY+xETk/LNml7GMYyzqmhJ5AN9fb
         KXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLmqWGKtNWl1HCtdf4PW3rgRJ3Zjro6FIs2NO5PZaaC3GJc853W2u7d3SMa89C7SrK0ZWuxeqilcso/ioJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwKRFbET0B+voIxnpl9U+3Wv6EvzCKlw15nGuL3fk7/HD5YJ+AS
	XyqgR8UlxuIsFNmHD4flPZLU4/ZomO1yOKSC8WFM5ncQ1ar+bqAQTMYTbjLvBGo=
X-Gm-Gg: ASbGncvDmmUmrp4wv7pEIN2LforsadLMGx512/inCAuBURsdiUSp0e8s3anEUJ+kMAf
	CteJ30vnEobG2D1xNl6iNx5CectVXdTxPXV58B018Osmz0I7MU6Qe9jNzB02eVkiLUAoRvfjigo
	91c8ANFnYaUIcEV2yhmYuf3frVYiKxC/9UCVCnDWip+SbzO1W/0z1uK+yLF2cOCxh8qDQeMJ5Im
	14KslnSM30YuPwaKV6uIqL24SbCuxr2pO40XxWObNNfMSfDMnRi4UYMbuOzose8esOPEVQWAljH
	gCxbJ27RpUxpR7WRS9jMy4qvtC+/+QvUzxCq1YtbzCqqkMoPiQlcPLnJZseb/0jbu1VL
X-Google-Smtp-Source: AGHT+IG2G+0jkkCrFzcyOswfbkjejbMcC59iHCIyTbbyZg24kwvnpZM5H9uQkhpiqY1F6e5Q+1GToQ==
X-Received: by 2002:a05:600c:511f:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-439249a82dcmr96610705e9.20.1739181105553;
        Mon, 10 Feb 2025 01:51:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394127afcbsm37731515e9.23.2025.02.10.01.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 01:51:45 -0800 (PST)
Message-ID: <c0f9424a-664b-4d77-b8e9-1938e49746fc@linaro.org>
Date: Mon, 10 Feb 2025 10:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
To: Dharma.B@microchip.com, ulf.hansson@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
 <f6d7ffa0-6c08-45fb-9153-5e4aad1ca86a@linaro.org>
 <003ffa44-c88a-4234-a54a-50cd1140982a@microchip.com>
 <7180babd-302a-4f86-8770-bdd9f5c773cf@linaro.org>
 <7de20917-3176-4e80-8ccd-9c01c037cc9a@microchip.com>
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
In-Reply-To: <7de20917-3176-4e80-8ccd-9c01c037cc9a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_015147_371429_DE17475D 
X-CRM114-Status: GOOD (  15.87  )
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

T24gMTAvMDIvMjAyNSAwNjoyOCwgRGhhcm1hLkJAbWljcm9jaGlwLmNvbSB3cm90ZToKPiBPbiAw
Ny8wMi8yNSAyOjQ3IHBtLCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+PiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93Cj4+IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gT24gMDcvMDIvMjAyNSAxMDow
MiwgRGhhcm1hLkJAbWljcm9jaGlwLmNvbSB3cm90ZToKPj4+IE9uIDA3LzAyLzI1IDI6MjUgcG0s
IE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cKPj4+PiB0aGUgY29udGVu
dCBpcyBzYWZlCj4+Pj4KPj4+PiBPbiAwNS8wMi8yMDI1IDA0OjQ4LCBEaGFybWEgQmFsYXN1Ymly
YW1hbmkgd3JvdGU6Cj4+Pj4+IFJlbW92ZSB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBmcm9tIHRo
ZSBsaXN0IG9mIHJlcXVpcmVkIHByb3BlcnRpZXMgYW5kCj4+Pj4+IG1hcmsgaXQgYXMgb3B0aW9u
YWwuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhh
cm1hLmJAbWljcm9jaGlwLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IENoYW5nZXMgaW4gdjI6Cj4+Pj4+
IC0gSW5zdGVhZCBvZiBtb3ZpbmcgdGhlIGNvbXBhdGlibGUgc3RyaW5nIHRvIHRoZSBvdGhlciBi
aW5kaW5nLCBqdXN0Cj4+Pj4+IG1ha2UgaXQKPj4+Pj4gIMKgwqDCoCBvcHRpb25hbCAocmVtb3Zl
IGZyb20gcmVxdWlyZWQgbGlzdCkuCj4+Pj4+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MTIxOS1tbWMtc2xvdC12MS0xLQo+Pj4+PiBkZmM3NDdhM2QzZmJAbWlj
cm9jaGlwLmNvbQo+Pj4+PiAtLS0KPj4+Pj4gIMKgwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21tYy9tbWMtc2xvdC55YW1sIHwgMSAtCj4+Pj4+ICDCoMKgIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1zbG90LnlhbWwgYi8KPj4+Pj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWMtc2xvdC55YW1sCj4+Pj4+IGluZGV4IDFm
MDY2NzgyODA2My4uY2EzZDAxMTRiZmM2IDEwMDY0NAo+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1zbG90LnlhbWwKPj4+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWMtc2xvdC55YW1sCj4+Pj4+IEBAIC0y
OSw3ICsyOSw2IEBAIHByb3BlcnRpZXM6Cj4+Pj4+ICDCoMKgwqDCoMKgwqAgbWF4SXRlbXM6IDEK
Pj4+Pj4KPj4+Pj4gIMKgwqAgcmVxdWlyZWQ6Cj4+Pj4+IC3CoCAtIGNvbXBhdGlibGUKPj4+Pj4g
IMKgwqDCoMKgIC0gcmVnCj4+Pj4KPj4+PiBJZiB5b3UgcmVtb3ZlIGl0IGZyb20gaGVyZSB0aGVu
IGl0J3Mgc3RpbGwgcmVxdWlyZWQgaW4gRG9jdW1lbnRhdGlvbi8KPj4+PiBkZXZpY2V0cmVlL2Jp
bmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLW14LXNkaW8ueWFtbAo+Pj4+IHNvIHBsZWFzZSBhZGQg
aXQuCj4+Pgo+Pj4gSWYgbW92aW5nIHRoZSBjb21wYXRpYmxlIHRvIGl0cyBzcGVjaWZpYyBiaW5k
aW5nIGlzbid0IGFwcHJvcHJpYXRlIChhcwo+Pj4gcGVyIENvbm9yKSwKPj4+IGFuZCBpZiByZW1v
dmluZyBpdCBmcm9tIHRoZSByZXF1aXJlZCBsaXN0IGhlcmUgZG9lc27igJl0IHNlZW0gcmVhc29u
YWJsZQo+Pj4gdG8geW91LAo+Pj4gdGhlbiBhZGRpbmcgYW4gdW5uZWNlc3NhcnkgY29tcGF0aWJs
ZSBzdHJpbmcgaW4gb3VyIERUUyBmaWxlcyBkb2VzbuKAmXQKPj4+IG1ha2Ugc2Vuc2UgdG8gbWUu
Cj4+Pgo+Pj4gV2hhdCBjb3VsZCBiZSB0aGUgc29sdXRpb24gdGhlbj8KPj4KPj4gVGhlIHNvbHV0
aW9uIGlzIHJpZ2h0IGJ1dCB5b3UgbW9kaWZ5IHRoZSBtZXNvbi1teC1zZGlvIGJpbmRpbmdzLCBz
bwo+PiBzaW1wbHkgYWRkIGNvbXBhdGlibGUgaW4gYSByZXF1aXJlZCBsaXN0IGZvciB0aGUgc2xv
dCBub2RlLgo+IAo+IE9rYXksIHdlIGRlY2xhcmUgY29tcGF0aWJsZSBhcyBvcHRpb25hbCBpbiB0
aGUgZ2VuZXJpYyBtbWMtc2xvdCBiaW5kaW5nCj4gYnV0IG1ha2UgaXQgcmVxdWlyZWQgaW4gdGhl
IG1lc29uLW14LXNkaW8gYmluZGluZywgd2hpY2ggaW5oZXJpdHMgZnJvbSBpdC4KPiAKPiBTbyB3
aHkgbm90IGRlZmluZSB0aGUgcHJvcGVydHkgZGlyZWN0bHkgaW4gdGhlIG1lc29uLW14LXNkaW8g
YmluZGluZwo+IGluc3RlYWQ/Cj4gCj4gSXQgZmVlbHMgbGlrZSB0aGUgbW1jLXNsb3QgYmluZGlu
ZyBpdHNlbGYgc2VydmVzIG5vIHJlYWwgcHVycG9zZS4KCkl0J3MgZGVzaWduZWQgdG8gYmUgcmV1
c2VkLCB0aGUgZ29hbCB3YXMgdG8gZmFjaWxpdGF0ZSBtaWdyYXRpb24gb2YKb3RoZXIgbW1jIGNv
bnRyb2xsZXJzIGJpbmRpbmdzLgoKTmVpbAoKPiAKPj4KPj4gU29tZXRoaW5nIGxpa2U6Cj4+ID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLW14LQo+PiBzZGlvLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMsbWVzb24tbXgtCj4+IHNkaW8ueWFtbAo+
PiBpbmRleCAwMjI2ODJhOTc3YzYuLjBkNGQ5Y2E2YThkOSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9hbWxvZ2ljLG1lc29uLW14LXNkaW8ueWFt
bAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FtbG9naWMs
bWVzb24tbXgtc2Rpby55YW1sCj4+IEBAIC02MCw2ICs2MCw5IEBAIHBhdHRlcm5Qcm9wZXJ0aWVz
Ogo+PiAgIMKgwqDCoMKgwqDCoCBidXMtd2lkdGg6Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoCBlbnVt
OiBbMSwgNF0KPj4KPj4gK8KgwqDCoCByZXF1aXJlZDoKPj4gK8KgwqDCoMKgwqAgLSBjb21wYXRp
YmxlCj4+ICsKPj4gICDCoMKgwqDCoCB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+Cj4+
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+Pgo+PiBDb25vciwgSXMgaXQgcmlnaHQgPwo+Pgo+PiBOZWlsCj4+
Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gTmVpbAo+Pj4+Cj4+Pj4+Cj4+Pj4+ICDCoMKgIHVuZXZh
bHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4+Pj4KPj4+Pj4gLS0tCj4+Pj4+IGJhc2UtY29tbWl0
OiA0MGI4ZTkzZTE3YmZmNGE0ZTBjYzEyOWUwNGY5ZmRmNWRhYTUzOTdlCj4+Pj4+IGNoYW5nZS1p
ZDogMjAyNDEyMTktbW1jLXNsb3QtMDU3NDg4OWRhZWEzCj4+Pj4+Cj4+Pj4+IEJlc3QgcmVnYXJk
cywKPj4+Pgo+Pj4KPj4+Cj4+Cj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
