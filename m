Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E374EE4993
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Aug 2023 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdQX1i/BbER3NdQpL8y6t7Rc6UQTYQsgRGsM792R04Q=; b=Zfflhzcf+rmC9RjiJhI4f5tBx6
	CCNWIQ+TREPSy45SmY1auVY2r212I1qM8Nw0s4hH9SKZdCmo/b9q+/FTUjrNJAqYPYHhZIQE58kk2
	g1ZoGZeTL9IX0gDRtjyLQNo12tk3w8d7GgbFrVkMx+8OlVQS7uz5wbGqY9yEMdlr3JqxIwgIFeSEe
	2NBdV2kx57mXCYCMkJE45DwvRjqoFK30knCsOilghJ0+IQhym7f5Di+MQF52akRDbxVkpB+Au5xrq
	lI4vAeYzLFyAfsB979bS89BII1CUqG0ssV1GvzmrlPF7kqVp+ogVh1SuLKwKskwzO6lgj5g7TnD8V
	ahVQ/c+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRO6-00G2k4-09;
	Tue, 22 Aug 2023 13:25:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRO3-00G2jV-2G
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Aug 2023 13:25:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fee600dce6so29184525e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Aug 2023 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692710733; x=1693315533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hKgghhRN3TguWnTAxKtp6shzze7BpvGg+Ihs5YYqAo=;
        b=pxi+F9on9zwIuNZd+E/OeriMBFKpthRC9z6LlOKnmpPMDe857SyPgfbe9R2O5o4Tg7
         fKVN17SzjkGG2tgqpzy15/nCCYUeFIlrDOyMClwv53w8ngdcLR5TBXkEwoi2L1etCsTK
         EucT7EOXoodspLGY3Q4KObgboypbDopiWFVV/kuHi7R+KObg7zdnFsAW4pbXXnhFR0Nq
         m0/ZjuT/moZWSWrdI7PDTPMt0y+33JmutmMtcgGpU1iwTCQ9Lfp1+huJTGGgJYzquTYE
         aiqclt5S2ojFzxZocqz3QBFrbcAjnFgcqHhS1Bd/0y8EG7m9yjhxQguM8sNzvcxGRLZi
         GQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692710733; x=1693315533;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+hKgghhRN3TguWnTAxKtp6shzze7BpvGg+Ihs5YYqAo=;
        b=jO3MS8UcjsVk7CebDhfnXx1p/Qc+V364HFl+cWO56zxc0zQ9JBxMqW6uD7WZxEbj5c
         mECuXXysnQgcm5zdRxd/2ZGdc7g0iFbV3YbunvhVggaxBDziQXFSOmOnIilhbNLsgAOQ
         DrOoQOaI/XSdhUvvluc6VfnfgAmLiytA4YWwd4mCR7TdDfTPMUusAgkdbeZk6NdFxdsU
         Zy/6iqY9Gc+F6lDQ7e3k0ekOS1Yz5V6CYA+OdhfzS+kAOL4KSXERmsNuIjHmxqYRWtQy
         WCDh5j5ESwE0p09sLx4u94s3+333udnCkk5BB8Td3c1KGay1OWv1Tlnckrl4UmKoS5N6
         uiUg==
X-Gm-Message-State: AOJu0YxieJ982vXVKU4hwZ8U0yLPF9lJyaWSREu3GnUCfUw8ZqNI96HF
	szL2QVUC1lajFAuFUdKdYYMstA==
X-Google-Smtp-Source: AGHT+IHYXYs2OZ2ZSAys4NpOF3y8Z+bVuY3gup7rcbOoiqes71xbSlrooIH2TJ5s702CU92gT0W8Qg==
X-Received: by 2002:adf:fe03:0:b0:319:5a7c:6418 with SMTP id n3-20020adffe03000000b003195a7c6418mr7085688wrr.43.1692710732984;
        Tue, 22 Aug 2023 06:25:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:de4a:6da8:c7fc:12c? ([2a01:e0a:cad:2140:de4a:6da8:c7fc:12c])
        by smtp.gmail.com with ESMTPSA id o2-20020adfcf02000000b00317a04131c5sm15778520wrj.57.2023.08.22.06.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 06:25:31 -0700 (PDT)
Message-ID: <ba6b2484-3180-4f50-a867-6236b025190d@linaro.org>
Date: Tue, 22 Aug 2023 15:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
Content-Language: en-US, fr
To: Zelong Dong <Zelong.Dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-3-zelong.dong@amlogic.com>
 <80fe197a-3f15-d1b8-ed99-adeb4a8c24d2@linaro.org>
 <9dc78ceb-3852-e5e8-0b8e-b95f9bec4557@amlogic.com>
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
In-Reply-To: <9dc78ceb-3852-e5e8-0b8e-b95f9bec4557@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_062535_811021_B7315DCC 
X-CRM114-Status: GOOD (  14.62  )
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

SGksCgpPbiAyMi8wOC8yMDIzIDEzOjExLCBaZWxvbmcgRG9uZyB3cm90ZToKPiAKPiAKPiDlnKgg
MjAyMy8zLzIgMTc6MjQsIE5laWwgQXJtc3Ryb25nIOWGmemBkzoKPj4gT24gMDIvMDMvMjAyMyAw
NzozNCwgemVsb25nIGRvbmcgd3JvdGU6Cj4+PiBGcm9tOiBaZWxvbmcgRG9uZyA8emVsb25nLmRv
bmdAYW1sb2dpYy5jb20+Cj4+Pgo+Pj4gQWRkIG5ldyBjb21wYXRpYmxlIGZvciBBbWxvZ2ljJ3Mg
TWVzb24tUzQgSVIgQ29udHJvbGxlcgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFplbG9uZyBEb25n
IDx6ZWxvbmcuZG9uZ0BhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4gwqAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lc29uLWlyLnR4dCB8IDMgKysrCj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZXNvbi1pci50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVzb24taXIudHh0Cj4+PiBpbmRleCBlZmQ5
ZDI5YThmMTAuLjJhNjY2MmVkZDA0ZCAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZXNvbi1pci50eHQKPj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZXNvbi1pci50eHQKPj4+IEBAIC01LDExICs1
LDE0IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0g
ImFtbG9naWMsbWVzb242LWlyIgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtICJhbWxvZ2lj
LG1lc29uOGItaXIiCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gImFtbG9naWMsbWVzb24t
Z3hiYi1pciIKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSAiYW1sb2dpYyxtZXNvbi1zNC1pciIK
Pj4+IMKgwqAgLSByZWfCoMKgwqDCoMKgwqDCoCA6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQg
bGVuZ3RoIG9mIHRoZSBkZXZpY2UgcmVnaXN0ZXJzCj4+PiDCoMKgIC0gaW50ZXJydXB0c8KgwqDC
oCA6IGEgc2luZ2xlIHNwZWNpZmllciBmb3IgdGhlIGludGVycnVwdCBmcm9tIHRoZSBkZXZpY2UK
Pj4+IMKgIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4+PiDCoMKgIC0gbGludXgscmMtbWFwLW5hbWU6
wqDCoMKgIHNlZSByYy50eHQgZmlsZSBpbiB0aGUgc2FtZSBkaXJlY3RvcnkuCj4+PiArIC0gYW1s
b2dpYyxpci1zdXBwb3J0LWh3LWRlY29kZTogZW5hYmxlIGhhcmR3YXJlIElSIERlY29kZXIsIGFu
ZCByZWdpc3Rlcgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJjIGRyaXZl
ciBhcyB0eXBlIFJDX0RSSVZFUl9TQ0FOQ09ERQo+Pgo+PiBBRkFJSyB0aGlzIGlzIGEgc29mdHdh
cmUgcGFyYW1ldGVyIHNpbmNlIHRoZSBIVyBpcyBjYXBhYmxlIG9mIGRlY29kaW5nLAo+PiBpZiB5
b3Ugd2FudCB0byBtYWtlIHRoZSBIVyBkZWNvZGluZyBhIHJ1bnRpbWUgb3B0aW9uLCBwbGVhc2Ug
dXNlIGFub3RoZXIgd2F5Lgo+IAo+IFBhcnQgMSBwYXRjaCBmb3IgSFcgSVIgRGVjb2RlciB3YXMg
cXVldWVkLCBub3cgSSdtIHByZXBhcmluZyBwYXJ0IDIuCj4gSSBhZGQgYSBuZXcgcHJvcGVydHkg
ImFtbG9naWMsaXItc3VwcG9ydC1ody1kZWNvZGUiIGJlY2F1c2UgSSB0aGluayByYyBkcml2ZXIg
ZG9uJ3Qgc3VwcG9ydCBjaGFuZ2UgdGhlIGRyaXZlciB0eXBlIChlbnVtIHJjX2RyaXZlcl90eXBl
KSBkeW5hbWljYWxseSwgaXQgbmVlZCB0byBkZWNsYXJlIHRoZSB0eXBlIGluIERUUy4KPiBBbSBJ
IHJpZ2h0PwoKRFQgc2hvdWxkIG5vdCBoYXZlIHNvZnR3YXJlIHBhcmFtZXRlcnMsIGl0J3Mgb2sg
dG8gZW5hYmxlIHRoZSBIVyBkZWNvZGluZyBmb3IgYSBzcGVjaWZpYyBjb21wYXRpYmxlIGZvciBl
eGFtcGxlLgoKTmVpbAoKPj4KPj4+IMKgIEV4YW1wbGU6Cj4+Cj4+IFBsZWFzZSBiYXNlIGNoYW5n
ZXMgb24gdG9wIG9mIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMTExNy1iNC1hbWxv
Z2ljLWJpbmRpbmdzLWNvbnZlcnQtdjMtNC1lMjhkZDMxZTNiZWRAbGluYXJvLm9yZy8KPj4KPj4g
VGhhbmtzLAo+PiBOZWlsCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
