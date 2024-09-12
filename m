Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCAAEEB575
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2024 09:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PAJSKLTAMFDUoOoW+wXRNL6EavJqzLPeRFz7DIGuSA=; b=cbicla0qcNRjHck+5p6BJjlrOy
	pIja1zgW60ynt1vdvalVNSpa11N9xiYfHUsUEqFkVJlGXsBcJieuIB83A9Ut8Vn9QkXzf4eep+Dxl
	Jol09wyeEzsAZwy6EJw2MZ+g7VQ0iqxYrrKw9Vpt04txlq7zvnkvwrGQiPTx3NdCw001bnHJV3802
	P+KzbyOpfRbx+SSx1uDXoQDhXORG4bpXvQdH3tDvE8IV07Ad3NSQl33h72dGbugvLRxrW+EgEgjQA
	55PqgvDO4V3FKulJFSXoVP0qSMjW0Mw8U1pPDfulfrSZkIKDCsYqERzaQFn0wQyy/AEpvKJq/LMuf
	SFW6LFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sog6D-0000000CWPs-1QFh;
	Thu, 12 Sep 2024 09:26:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sog69-0000000CWON-3ywi
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Sep 2024 09:26:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cafda818aso6413455e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2024 02:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726133204; x=1726738004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uRShjiG4yggmkzU8PcqDWZaN4MiVvMygjJPwQCLJlQ=;
        b=Bi4IvElVsqAB0IjcY7LhR8tdyYXxFlJ1UpgZOc4/v1HkEcWdU/9pjbOvgJqvZX0SCL
         gd37kgVJGjNV94W01joXgbQKP3A7Qm846TvvD1Rx8Fdjq2DWLXky7ygUNBDTtDP/gKa7
         8JR8YFJuKR9qixo4k0hI60TkV5nJWiyAAPZ47hb3S+y9Ui/X9bBUIaK1lV6wffzV1COI
         rYlfmfiF+v25AKXokx10ZeuSBXRltsySOcg9Ff+G56ptHS9jnjWsd/pxf8MpK+RBBuMX
         RKTz5hQYfESPzfNciVtmROTPDXC2eauvEpvccBbGPlLoKLB16AbIQvNsxEsse00GgRGz
         IFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133204; x=1726738004;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/uRShjiG4yggmkzU8PcqDWZaN4MiVvMygjJPwQCLJlQ=;
        b=XsrmaVk91RqYMVCwCiSyjrJxd9P6vwrHrFTmWQ465+6oUddCc3DHgpTukS7cEcevu0
         uWb3lCSxHzjhKHfTrrYGLlff6t+5zcyClkgNuffo1H9yk9KCoV1RZM0mP13+F3ftwUQK
         7J0X6Dg1FhoVcmQBC8IgfhGZy7SGzocA0Z2in4LrcCrOBBWVTcf0IfRq+UYrkTmp2ClD
         ek/XdgR3t48fZHITDHDKQ/tWu6LQsAAlWwkH1PUH0Vf3C54/isyy3MmIvvBEwelC1014
         TTCqKMITNaVwOtcQpbHY4lsTxyDYO7rpA/CthC9F5rE0bW/k0iEO7s2Skj6zvAD7NF7P
         XUgg==
X-Forwarded-Encrypted: i=1; AJvYcCWUnwC8NFXCxrEdNAL+zdTUmtTaVpUXWijPwyZXX2fbmSQk2DIJatgGVDywc5dAolF8DyuIGGjRsrTq4VJM@lists.infradead.org
X-Gm-Message-State: AOJu0YzinXkcnqjH/ayaqZU5jGtR3UHnRfVXjJIHsHrtiQOUqdroVpaq
	gl0TmkEY9ou3FsVKo04u7Lsb22aKIAbKsXj04s7NmlqJM9hutFkjzHqCy67TE80=
X-Google-Smtp-Source: AGHT+IGH+u+aLztbk+Cab3S2ln2z2Tfx1XqtBVLcdLhlsQ/ZJ/HNq5/ylhTEEgTeESqGC2kj06Bhew==
X-Received: by 2002:a05:600c:5249:b0:42c:d74b:eb26 with SMTP id 5b1f17b1804b1-42cdb5486e9mr18231925e9.21.1726133203625;
        Thu, 12 Sep 2024 02:26:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e79:4ce1:c7be:8add? ([2a01:e0a:982:cbb0:1e79:4ce1:c7be:8add])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb0642f99sm165276565e9.40.2024.09.12.02.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 02:26:43 -0700 (PDT)
Message-ID: <2781e0a7-5ad5-4d93-bbca-55729cc4fe13@linaro.org>
Date: Thu, 12 Sep 2024 11:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/3] amlogic SoC's power-domains fixes
To: George Stark <gnstark@salutedevices.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@salutedevices.com
References: <20240710223214.2348418-1-gnstark@salutedevices.com>
 <26ab17bb-1b2e-4144-8a34-696a92328f52@salutedevices.com>
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
In-Reply-To: <26ab17bb-1b2e-4144-8a34-696a92328f52@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_022646_027641_7CD83880 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

SGksCgpPbiAxMS8wOS8yMDI0IDIzOjU2LCBHZW9yZ2UgU3Rhcmsgd3JvdGU6Cj4gSGVsbG8gTmVp
bAo+IAo+IFBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIHNlcmllcy4gSXQncyAyIG1vbnRocyBh
bHJlYWR5IHNpbmNlIGFjawoKSSdsbCB0YWtlIHBhdGNoIDMgYWZ0ZXIgcGF0Y2ggMiBpcyBhcHBs
aWVkIG9uIHRoZXJtYWwgdHJlZS4KCkRhbmllbCBjb3VsZCB5b3UgdGFrZSBwYXRjaCAyID8KClRo
YW5rcywKTmVpbAoKPiAKPiBPbiA3LzExLzI0IDAxOjMyLCBHZW9yZ2UgU3Rhcmsgd3JvdGU6Cj4+
IEhlcmUncyBzb21lIGZpeGVzIHRvIHRoZSBiaW5kaW5ncyBhbmQgZGV2aWNlIHRyZWUgcmVsYXRl
ZCB0byBBbWxvZ2ljIEExIFNvQy4KPj4gVGhlIFNvQyBwcm92aWRlcyBkZWRpY2F0ZWQgcG93ZXIg
ZG9tYWluIGZvciBmb3IgYWxtb3N0IGFsbCBwZXJpcGhlcnkuCj4+Cj4+IENoYW5nZXMgaW4gdjI6
Cj4+IMKgwqAgZHQtYmluZGluZ3M6IHNwaTogYW1sb2dpYyxhMS1zcGlmYzogbWFrZSBwb3dlci1k
b21haW5zIHJlcXVpcmVkCj4+IMKgwqDCoMKgIC0gZHJvcCB0aGUgcGF0Y2gKPj4gwqDCoCBkdC1i
aW5kaW5nczogdGhlcm1hbDogYW1sb2dpYyx0aGVybWFsOiBhZGQgb3B0aW9uYWwgcG93ZXItZG9t
YWlucwo+PiDCoMKgwqDCoCAtIGRyb3AgcmVxdWlyZWQgY29uZGl0aW9uYWwKPj4gwqDCoMKgwqAg
LSByZXdyaXRlIGNvbW1pdCBtZXNzYWdlCj4+IMKgwqAgZHQtYmluZGluZ3M6IGkyYzogYW1sb2dp
YyxtZXNvbjYtaTJjOiBhZGQgb3B0aW9uYWwgcG93ZXItZG9tYWlucwo+PiDCoMKgwqDCoCAtIGFk
ZCBSdkI6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+PiDCoMKg
wqDCoCAtIGFkZCBSdkI6IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJu
ZWwub3JnPgo+PiDCoMKgIGFybTY0OiBkdHM6IG1lc29uOiBhMTogYmluZCBwb3dlciBkb21haW4g
dG8gdGVtcGVyYXR1cmUgc2Vuc29yCj4+IMKgwqDCoMKgIC0gYWRkIFJ2QjogTmVpbCBBcm1zdHJv
bmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4+IMKgwqAgcHJldmlvdXMgdmVyc2lvbiBb
MV0KPj4KPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA3MDgxOTQ4MDgu
MTgxOTE4NS0zLWduc3RhcmtAc2FsdXRlZGV2aWNlcy5jb20vVC8jbTM5OGMyODNiMzY5MTA4YzVj
NTU3ZTY4YjdhMWFkYTlhYmYzZTVjYmEKPj4KPj4gR2VvcmdlIFN0YXJrICgzKToKPj4gwqDCoCBk
dC1iaW5kaW5nczogaTJjOiBhbWxvZ2ljLG1lc29uNi1pMmM6IGFkZCBvcHRpb25hbCBwb3dlci1k
b21haW5zCj4+IMKgwqAgZHQtYmluZGluZ3M6IHRoZXJtYWw6IGFtbG9naWMsdGhlcm1hbDogYWRk
IG9wdGlvbmFsIHBvd2VyLWRvbWFpbnMKPj4gwqDCoCBhcm02NDogZHRzOiBtZXNvbjogYTE6IGJp
bmQgcG93ZXIgZG9tYWluIHRvIHRlbXBlcmF0dXJlIHNlbnNvcgo+Pgo+PiDCoCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FtbG9naWMsbWVzb242LWkyYy55YW1swqAgfCAz
ICsrKwo+PiDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxv
Z2ljLHRoZXJtYWwueWFtbCB8IDMgKysrCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1hMS5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMSArCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IC0tIAo+
PiAyLjI1LjEKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
