Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB3EEBFD08
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2026 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XSeBTwMJXeVpmBZufIAQ+Y7z0vSOJdvVsixvB0okvM=; b=T4i7AORbOaYivla5XrM3YqzJd3
	22iwphb03SQgitCvX3l6cck0IxE81ht4RPz6Il4rHykqZkZCSipmmmGch6bisuLPbPlDdWYJHpZSO
	v7xYPet5j3pikg5TuCocsZ/cb7Gqe2KGUnD/TVkFWPPJtYEVkHuPCuy8GDjv6yiJagqGf/PkJi9cE
	LW0m6rSWmC0XAXXt2zt9Ocp5f/SUZ+vc0pBsshvAM3HEQeVEJ9wHMGxlc0bTsfJa77W15PGY1isGB
	FuQ07cPF8RBkj0veL1ZF59/epDNNPsTcsgJLCXdI/6GuOsHeo2J/hXdvBCkO+aUtfp5ad/XoDQOTi
	Rxo4zZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBRR-0000000F79m-2ISW;
	Mon, 13 Apr 2026 07:10:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBRO-0000000F78Q-3sev
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Apr 2026 07:10:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so28397845e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Apr 2026 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776064236; x=1776669036; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTEWMiKgWWJTQ9Wt/NJF5efY3D+FA4RYVlQMZj0kIcY=;
        b=zhMqxkaaIscyvXiu3oI4G7BXdWo2cnlk9kg6ySmOZ3+QaxHuxt5pgpu93ZDFkqPrSM
         ysYW4oWZE1wRjN24edG1MpY0jgAtO0U4sjdjzASFggkzr1TTHO29DCML+lkHNaR2zPUN
         jZ3XqtzbVHiVSu5MCaSlMpKPBWmWGr1Ov+q5C2u8/1zqLmbw12UWDKsMqjnsQ7uddwfs
         t9joLnkcQ2XkVZHQ1lCdbbYzxBXLqo1H+FXR/93a3U68LE8a3Na70vAe/HO+/p898U48
         ZyDYQWSS87F8uLFBEsjsW4Jsd0tWvkPOOGn7D4SK9jDbAI9R6ACRv/MQNb6tHGy+i712
         PHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064236; x=1776669036;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTEWMiKgWWJTQ9Wt/NJF5efY3D+FA4RYVlQMZj0kIcY=;
        b=jcYVo1wvpHTV9Cja1Saho+uIZCp49lGb9j+Zxkdyy5cB1hyW7gcwnPMMUvevbLDpS2
         LB2QSPfl3mjfKKdRs46JKH2N5au7Wy/CcR/aMxq8wn8Qpvc0vhs+VFD8pbeyf40KqrvQ
         +t0ZB1jTnLpTt+/b6gdOp/STiQYDltQWBv3VUOpcODg6MTSHB2t9UTUpOjK1XbSMSd3w
         AdJnNBLbH7+oBI7SxbtPrHlr28beUnkT3lcxaYT22V0eJ3tdMaF4N2OrZmHfR88OZJRc
         GxSc8Kdqf0+6GOVeKQa+65lkwEMn49NTzGuOYrNJEcsZW37AXlYfEBXUimCEPDiEAvEI
         NfjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8R7QpXzYf8/716XnXzJcOu94MnFNvXGivmnRLeTNhlStQXmWfMqZJhS4cBJU61vrAqSFBjAP+/Ymuo5V0p@lists.infradead.org
X-Gm-Message-State: AOJu0YwkVEtleGBSUp8IBHr+tIojwOJGlVtdgA5Xd7AnCXv2nqw/CzlS
	L0D8V2AD7/I+T6w1Ezu/Q42S3T2gtysmDxMDlgj9JQ4CxODJcNc5qCdIa6dw1GKbIJOAOu4uB6w
	8ndzT
X-Gm-Gg: AeBDies3ufwdHrI+em/nFfIfj6fO0p+abK/VZ/qbzZD0/RbXiFGz6T8+sG7yZWL4RhQ
	AcpZbTLeTlOszZaUD2YG1SD5mNpT0obVJ75/d4Eog9gXYrYezJ9wV8NoIXV7v2WCkKtkPc2vtfq
	T0EmQtS/6/fm89+zXp7AtHyZq8+6lnyiAyNf0AXDkrQJSTJ62d8876Wf4wJvhgReR6tqs9zTBlB
	znx5mEk1xHIr2ZtyzT8ORYYIL/3gUiTJXgaixYtCcGy5ZJKe8UX1PRx40b+nYKGYbbjWKuTqyCd
	D3Zfq47W0GMyujZkuGLUCt5ZH1uJjZvCfNlJMYjHZUk0yMODPBZUZ/FpR2ILiw2QV5LP+jGFwgk
	l7wbK4wHSPh3HE1gcXFcjA7wZEBvd98d953SkkZ5bBCpwQMswgu81lIJ68mSIAS5NqNxGvhCapT
	LaqlbGSsR+GARYu0wkGO0BMRxEJN5i5qOk7jGAjBC2w36zwlfvFKa59YqDFqI8oHc8k51rkNfrX
	RcFqdSb
X-Received: by 2002:a05:600c:8591:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488d6abe9e4mr118911365e9.26.1776064236236;
        Mon, 13 Apr 2026 00:10:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538c03esm276356665e9.13.2026.04.13.00.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:10:35 -0700 (PDT)
Message-ID: <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
Date: Mon, 13 Apr 2026 09:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
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
In-Reply-To: <20260411-spicy-apricot-newt-afa8a7@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_001039_005910_02DF0B6A 
X-CRM114-Status: GOOD (  13.38  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gNC8xMS8yNiAxMTozMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBGcmksIEFw
ciAxMCwgMjAyNiBhdCAxMDo1MDo1OEFNICswMjAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4g
SGksCj4+Cj4+IEhlcmUncyB0aGUgQW1sb2dpYyBBUk02NCBEVCBjaGFuZ2VzIGZvciB2Ny4xLCBp
bmNsdWRpbmcgYSBidW5jaCBvZiBmaXhlcwo+PiBhbmQgaW1wcm92ZW1lbnRzIGZvciB0aGUgS2hh
ZGFzIFZJTTQgYW5kIFZJTTFzIFNCQ3MsIHBsdXMgc29tZSBhZGRpdGlvbnMKPj4gZm9yIHRoZSBQ
aGljb21tIE4xIGFuZCBhIGNvdXBsZSBvZiBsb3cgcHJpb3JpdHkgZml4ZXMuCj4+Cj4+IFRoYW5r
cywKPj4gTmVpbAo+Pgo+PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDZkZTIz
ZjgxYTVlMDhiZThmYmY1ZThkN2U5ZmViYzcyYTViNWYyN2Y6Cj4+Cj4+ICAgIExpbnV4IDcuMC1y
YzEgKDIwMjYtMDItMjIgMTM6MTg6NTkgLTA4MDApCj4+Cj4+IGFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Ogo+Pgo+PiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9hbWxvZ2ljL2xpbnV4LmdpdCB0YWdzL2FtbG9naWMtYXJtNjQt
ZHQtZm9yLXY3LjEKPj4KPj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDQwMWU1Yzcz
ZWVkZGU4MjI1ZTg3YmQxMWM3OTRiODQwOTI0OGZmNDE6Cj4+Cj4+ICAgIGFybTY0OiBkdHM6IG1l
c29uLWd4bC1wMjMwOiBmaXggZXRoZXJuZXQgUEhZIGludGVycnVwdCBudW1iZXIgKDIwMjYtMDQt
MDggMTQ6Mjc6MjAgKzAyMDApCj4gCj4gRGF5cyBpbiBsaW51eC1uZXh0Ogo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgfCArKysrKysrKyAoOCkKPiAgIC4u
Lgo+IAo+IFNvIGEgZmV3IHRoaW5ncyB3ZXJlIGp1c3QgYXBwbGllZCwgdW5sZXNzIHRoaXMgd2Fz
IHJlYmFzZWQ/CgpUaGlzIG9uZSBoYXMgYmVlbiBhcHBsaWVkIGxhdGVseSwgYnV0IHRoaXMgaXMg
bmV3cyBmb3IgbWUsIEkgYWx3YXlzIHRvb2sKaW4gYWNjb3VudCB0aGUgdGltZSBzcGVudCBpbiB0
aGUgbGlzdHMsIG5vdCBpbiBsaW51eC1uZXh0LgpJIG1hZGUgc3VyZSB0aGlzIG9uZSBsYW5kZWQg
YXQgbGVhc3Qgb25jZSBpbiAtbmV4dCB0byB0cmlnZ2VyIENJcy4KClNvIGlmIHRoZXJl4oCZcyBu
ZXcgcnVsZXMsIHdlIHNob3VsZCBiZSBtYWRlIGF3YXJlIG9mIHRob3NlLgoKPiAKPiBJIHdpbGwg
d2FpdCB3aXRoIHRoaXMuIEl0IG1pZ2h0IG1pc3MgdGhlIG1lcmdlIHdpbmRvdyBpZiB2Ny4wIGlz
Cj4gcmVsZWFzZWQgdGhpcyB3ZWVrZW5kLgoKT2sgd293LCBqdXN0IGxpa2UgdGhhdC4uLiBJIG1l
YW4gdGhlIGFtbG9naWMgRFQgaXMgc3RhYmxlLCBhbGwgcGF0Y2hlcwpwYXRjaGVzIGJpbmRpbmdz
IGNoZWNrcyBhbmQgbm9uZSBpcyBjcml0aWNhbCBzaW5jZSBpdCBtYWlubHkgdG91Y2hlcwpuZXcg
cGxhdGZvcm1zIGFuZCB0aGUgaW5jcmltaW5hdGVkIGNvbW1pdCBpcyBhIGxvdyBwcmlvcml0eSBm
aXggZm9yCjEweSBvbGQgZGV2ZWxvcG1lbnQgYm9hcmRzLi4uCgpOZWlsCgo+IAo+IEJlc3QgcmVn
YXJkcywKPiBLcnp5c3p0b2YKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
