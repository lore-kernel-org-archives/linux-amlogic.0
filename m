Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1991C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tDdM5aoqBFgIJDfjqmVdcez5uELhF/6RM9sCR+sm4s=; b=b7k3jZQtmSZBMPFf/cNC53KAMu
	uhknLUUBe/D9tw3E7ow8x5PaVdC3YjnascpihZmRDvRNXtCCvP/gkiZpYqzV1ZKbj8WZFNszDZsd5
	cgRN8aJSpwVexCtr2lUL/NMsghUERayZW4TmCdwLBoo6sFayevGNkuOQXBVN/KHOlBMh/x+3/24Ta
	fGQ7LsRJNLQTSmzoU1rmeQaW09TdH/n35EQVVFpRtfTcaQoTOJQyYiEa/vW4UlDqD0116pHo9UTzq
	JKTp6bQf11GQsGGQ4qK0+05nIUT5HM27m9L1551OVBhjQtY9r8YqDxt3ky79h0/YHz0T/+Xbpx9j5
	nHAaoPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoJ1-00000008S9t-2bpI;
	Tue, 13 Feb 2024 08:38:19 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoIy-00000008S9Z-13Fe
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:38:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-51178bbb5d9so3649193e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707813494; x=1708418294; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXPlfNasOUmNVQN5Xo/0NoJYpOYXgb4I9baD/+RaFaM=;
        b=gkLNizzB+wJ9rrLk1w4Ixo2wAjg4UiazwV7tZzqu5juVLBwYqpQk6P3elfwnNJNiyl
         zS0FnTbNvCowGTl0Oahc8z89ueUdy/NgwWO+KEuKKjkpf7cSi4BjY+HW/SaH3avhOTyg
         S4NszdvJ3aL7R8pl+UBjZBQY3H68wugEWFp5CtQhFutWsR9ddpJYzV5bgVTK7AKV7MHT
         Mfe7o1dMZg2buTphPlkwnVNrpMIxDa2Vi18eScQxGWG6HmseL2/ZYVFmNdLz2z5RITf4
         aLBp6IOSp0KfheUfEaIWPmuXzvf0IlXFDf/iMyB/jM0YEQPJOknUuB79Hf7GDaMsBXDJ
         x+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813494; x=1708418294;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RXPlfNasOUmNVQN5Xo/0NoJYpOYXgb4I9baD/+RaFaM=;
        b=tXr2RKwErQDdvs4yknCWsPiCZNCTPv9uNTIbWuG5YSsd2YOOlZqA10pCEQeN4otS5c
         C+RDdDosd0EZCrkwQrBYTDpk8VDc92nSvFk3xS1SNLgy9MwuQarW1xzphmKpKS6GJyOU
         luVg05GYwf5l6Kmek7vWue9JNJHY53NH5w0Q+zPFu1M/x/cjcQ6jgbHyqHZmCq1RcOck
         6hA37vg0LUbjaZjN6xw6Al3U/1xtIgLY+xD4R/jpO+uv7Q8FJe2u2W+hGmIK/Ht5qzec
         5j/8DNAwai0Aort8kPdsnmZanJ8TwRedUgFCVRB6KQAUO1eUWfh6egH5Jx5EbDZuSpkI
         /IBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN3yGdpCYTqPdq5pHT99GU4lqOez9M9J1psaI8eE8POhLSKl3JDwHPwXgVpZOKvl3ifsA7oXUifY5zBQtjOoI959ekt0YBODT4DwgCb/54BO4=
X-Gm-Message-State: AOJu0YwrhduPAXkmhpiNvXP3QioqfzqE0zHLpHiJNsYVRHiB2whHJcAE
	pYXDxWHLeAAm45esg0hpaBvIYXDD/+XEub8oafE1MMYIinFp5n+3cPsxgCUuRAQ=
X-Google-Smtp-Source: AGHT+IExvEWxCnsYH2h23+wvPh84TZru8K3RC4vkEiVnBHm0PLoJE0tb1kZ5gA//qpfMe0NC+XOpoA==
X-Received: by 2002:ac2:5201:0:b0:511:66f0:8287 with SMTP id a1-20020ac25201000000b0051166f08287mr5401868lfl.28.1707813494190;
        Tue, 13 Feb 2024 00:38:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYT2BT3oYdNDLBy/GiXKTfN/0dA5ipW2YNTEJc8pvwG+5wpL7oncwzp2v8kNOIbJdFxL/Y2OzEkiv7P+A5EgGrMuMtTJfKnY66sBL8HQWua9UHqywNnKoPcOOScP5fWsMLCdzxyV6reUAbZXUtnkBog/4pIKX6g/xhjfuQf3b9u9z5z6hSTzGNPmFAAn/fZ3lU5Gn43CNMJGytg8+GB9skgS0abVd6eNMaPu1cBGnLZcygtEiEz/r2Psxbgo04HIlyqYwAw3iN/y+58WccH7EqJQJI+pszS2B7+f3cvoPFM07Pda3eWv3uKakSMzKHyR0ls+3ANwAA5lJ/H9DjBdsFP7IbDPqMyOg=
Received: from ?IPV6:2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b? ([2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c028400b00411a0477755sm2857827wmk.9.2024.02.13.00.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 00:38:13 -0800 (PST)
Message-ID: <64f65168-c7b0-4365-8d0a-e57b47797d95@linaro.org>
Date: Tue, 13 Feb 2024 09:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/4] Add support for Freebox fbx8am boards
Content-Language: en-US, fr
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
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
In-Reply-To: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_003816_334753_9CD801A1 
X-CRM114-Status: UNSURE (   9.21  )
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

SGkgTWFyYywKCk9uIDEyLzAyLzIwMjQgMTg6NDcsIE1hcmMgR29uemFsZXogd3JvdGU6Cj4gQWRk
IHN1cHBvcnQgZm9yIEZyZWVib3ggZmJ4OGFtIGJvYXJkcwo+IAo+IE1hcmMgR29uemFsZXogKDQp
Ogo+ICDCoCBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBhZGQgZnJlZWJveAo+ICDCoCBk
dC1iaW5kaW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgZmJ4OGFtIGJpbmRpbmcKPiAgwqAgYXJtNjQ6
IGR0czogYW1sb2dpYzogYWRkIGZieDhhbSBib2FyZAo+ICDCoCBhcm02NDogZHRzOiBhbWxvZ2lj
OiBhZGQgZmJ4OGFtIERUIG92ZXJsYXlzCj4gCj4gIMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWzCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+ICDC
oERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbMKg
wqDCoMKgIHzCoMKgIDIgKwoKVGhpcyBjaGFuZ2UgZG9lc24ndCBhcHBseSBvbiB0b3Agb2YgZWl0
aGVyIHY2LjgtcmMxIG9yIGxpbnV4LW5leHQsIGNvdWxkIHlvdSByZWJhc2Ugb24gdjYuOC1yYzEg
PwoKVGhhbmtzLApOZWlsCgo+ICDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmls
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKwo+
ICDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLWZieDhhbS1icmNtLmR0
c2/CoMKgwqAgfMKgIDM1ICsrKwo+ICDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1nMTJhLWZieDhhbS1yZWFsdGVrLmR0c28gfMKgIDI1ICsrCj4gIMKgYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEtZmJ4OGFtLmR0c8KgwqDCoMKgwqDCoMKgwqDCoCB8IDQ2
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgwqA2IGZpbGVzIGNoYW5nZWQs
IDUzMyBpbnNlcnRpb25zKCspCj4gIMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLWZieDhhbS1icmNtLmR0c28KPiAgwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEtZmJ4OGFtLXJl
YWx0ZWsuZHRzbwo+ICDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tZzEyYS1mYng4YW0uZHRzCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
