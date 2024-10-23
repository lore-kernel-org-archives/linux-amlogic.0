Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ACDCF5386
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2024 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geFGR6HYNUa0C19DJLfmWgLq6F2B53kMeI5QYl0+ud8=; b=yfrCA+km0u1FmCkwEfdKfe0+Ia
	SI1NmuVcu4lLaH7AiQh1G+/mjcPIXtoaJlRyWOeQpHsbH0KbTJS5ITkuvYwx5uZPCxEotIemR/lIc
	hjm0PFAzuR8NNQHEeDHKHXupcy2C5mx/m0rz0z07LFwn93VZPU9Yoe2EnlT1gfOEetYW1w/3afmFX
	Qz9cy1U4Dh3UOgGNl8P2Dvd5XoMoCGq7TEEo+BvBzfgiRBrmiRXyr9sFrJXPcmJYbyPEov+W2RuRD
	3VYTFP8nlIOYpV9TAifd0TvZkxolCgjBYvtmelTOGkaF5g9yafbdVTtzpDnjjzrM/XpxAiskE5/0N
	cue1PW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3atw-0000000EP7y-2NSg;
	Wed, 23 Oct 2024 12:55:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ats-0000000EP7D-3EBn
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Oct 2024 12:55:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so48579215e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Oct 2024 05:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729688143; x=1730292943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4j15xXtw/IxvlFguZh83A3GV2Fkq+2jKQaRzwUo0Kw=;
        b=P36pPFzcG92p4apwldJlueggyfzWNeSBN4g0ToCqnPVCllBvUi1nSf3FEH95apHtZx
         robNP+Y+podSnXcdCu5nh/F8KXC6dXin45XbcgLc6adN2SCFPSPD15+eLSSXb/J4beG0
         RpJgVlGVobnrQ8xOo9WH02wno/nprikELrYXEN2W3RT3ucZS6vvUl06siW5pvwkG//3F
         9rVikGiML55PAadvFQT4C0j2idO/+BoYYEPycW4y9Q2sa+matkV9qRyfiAa2PQSLsJeh
         aYlxe7o5l3IOHI6ZtUy0IGOQl33vLclYVcxuwuxlA2Obf0kiWHmgOqGxxJDWQPRG2tEQ
         r13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729688143; x=1730292943;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k4j15xXtw/IxvlFguZh83A3GV2Fkq+2jKQaRzwUo0Kw=;
        b=KQq0qqFwMoxQLvQpmPHs3xlAi5Mvof9vJo9VbLnQe0lS1AwSKbtaQCZMembPU/fn4F
         uKrT/Tcm7QwW3gpe5cXwNRDzH3QZmu1QNsQSqhPYI9ofZKDILCM8eiVAHefDMAGybNsH
         8e4zVcf8WnK1JsUasyd33e4W52/KSJzpclfIB1PgsH8iaQhnOMXk1VNoGWkNYEpgbhrG
         1VNAm+oskLbhZmu7fE4gx6MME3yjhwGKC9pBYgJsVNcfpUQL+ZMvqTlg/hensehpkCaf
         uFywbVi6B028Sp4nip/qj3eg9SchV73FmCoGoae6OnE9UhtYEMCvG6f+GsdvYL2XhdMz
         jKJw==
X-Gm-Message-State: AOJu0Yzqt40YJJ64XDjWD7N7tMvfsZpsEXnHsP2SKcvLB/G1Z/1TT1Af
	bQ8DAX7WSw4rwH2afhnfidRaSwYjZ4r1QtvMuFhWIDNDTek8ZVutaR5vtwoTrppaAQiDOxDZyJE
	S19A=
X-Google-Smtp-Source: AGHT+IGLyjn44hSJMxPYPGlSawJJ4AlQXFD1EIjUOwZOkBrdxuzdyvuu5biRVt8ATndWvE3Fc2bvOg==
X-Received: by 2002:adf:e311:0:b0:37d:37b8:3778 with SMTP id ffacd0b85a97d-37efcf8460bmr1537992f8f.45.1729688142902;
        Wed, 23 Oct 2024 05:55:42 -0700 (PDT)
Received: from [192.168.8.141] ([88.178.180.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94066sm8860762f8f.71.2024.10.23.05.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 05:55:42 -0700 (PDT)
Message-ID: <ea3e4c27-c15c-4317-98a7-f0d64ae6784d@linaro.org>
Date: Wed, 23 Oct 2024 14:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: meson: Enabling full-range HDMI output
To: Francisco Ayala Le Brun <francisco@videowindow.eu>
Cc: linux-amlogic@lists.infradead.org
References: <CAN-StX2faaw60pUqRcDtHgrovWYFsM+PGDDAhU8wbT6aeDQKwg@mail.gmail.com>
 <40c07e23-0784-4bcd-8da6-485866e81425@linaro.org>
 <CAN-StX1D8-noDF5a_b08FX-7GAgw+o3UYryUXh3_zmG-MTWfZg@mail.gmail.com>
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
In-Reply-To: <CAN-StX1D8-noDF5a_b08FX-7GAgw+o3UYryUXh3_zmG-MTWfZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_055544_847453_8D32C154 
X-CRM114-Status: GOOD (  26.34  )
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

T24gMjMvMTAvMjAyNCAxNDoxMiwgRnJhbmNpc2NvIEF5YWxhIExlIEJydW4gd3JvdGU6Cj4gVGhh
bmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLiBJIGNhbiBjb25maXJtIHJldmVydGluZyB0aGUgY29t
bWl0IHNvbHZlcwo+IHRoZSBpc3N1ZS4gSG93ZXZlciwgaXQgb25seSBsZWF2ZXMgbWUgbW9yZSBj
b25mdXNlZCBhcyB0byB0aGUgcm9vdAo+IGNhdXNlLgo+IAo+IElmIGR3LWhkbWkgaXMgc2V0IHRv
IG91dHB1dCBSR0IsIGFuZCB5b3Ugc2V0IHRoZSBDU0MgbWF0cml4IHRvIHplcm9lcywKPiB0aGVu
IGl0IHdpbGwgc2hvdyBhIGNvcnJlY3RseSBjb21wbGV0ZWx5IGJsYWNrIG91dHB1dC4gSG93ZXZl
ciwgaWYgeW91Cj4gc2V0IHRoZSBmaXJzdCBjb2x1bW4gb2YgdGhlIFlVVi10by1SR0IgbWF0cml4
IHRvIG9uZXMsIGFuZCBzaG93IGEKPiBibGFjayBpbWFnZSB2aWEgRFJNLCB0aGVuIHRoZSB0b25l
IGlzIGluIHRoZSBsaW1pdGVkIHJhbmdlLiBUaGlzCj4gc2VlbWVkIHRvIGluZGljYXRlIGR3LWhk
bWkgY2FuIG91dHB1dCBmdWxsIHJhbmdlIFJHQiwgYW5kIHRoZSBwcm9ibGVtCj4gd2FzIGZhcnRo
ZXIgdXBzdHJlYW0uCj4gCj4gUGVyaGFwcyB0aGUgcHJvYmxlbSBpcyB0aGUgQ1NDIG1hdHJpY2Vz
PyBJIHdhcyB1bmRlciB0aGUgYXNzdW1wdGlvbgo+IDB4MjAwMCBjb3JyZXNwb25kZWQgdG8gMSwg
ZXZlbiB0aG91Z2ggaS5NWDYgbWFudWFsIGNoYXB0ZXIgMzMgc2VlbXMgdG8KPiBzdWdnZXN0IHdp
dGggYSBjc2Nfc2NhbGUgb2YgMSwgdGhlbiAweDgwMCB3b3VsZCBjb3JyZXNwb25kIHRvIDEuCj4g
U3RpbGwsIEkgd291bGQgZXhwZWN0IGF0IGxlYXN0IGZ1bGx5IGJsYWNrIHRvIGJlIGNvcnJlY3Qg
YXMgdGhhdCB3b3VsZAo+IGdpdmUgYSBtdWx0aXBsaWNhdGlvbiBieSB6ZXJvLgo+IAo+IE9yIHRo
ZSBzdGF0ZSBvZiBkd19oZG1pIGlzIGFmZmVjdGluZyB0aGUgVklVIGluIHNvbWUgd2F5PyBQZXJo
YXBzIHRoZQo+IFZJVSBoYXJkd2FyZSBpcyBtYWRlIHRvIGNsYW1wIGx1bWluYW5jZSB3aGVuIGR3
X2hkbWkgaXMgb3V0cHV0dGluZwo+IFJHQj8gSSBub3RpY2VkIGZvciB0aGUgQ1NDIHRoZXJlIGlz
IG9ubHkgYSBzcGVjaWFsIG1hdHJpeCBmb3IKPiBSR0ItdG8tbGltaXRlZC1SR0IsIGJ1dCBubyBz
cGVjaWFsIG1hdHJpeCBmb3IgWVVWLXRvLWxpbWl0ZWQtUkdCLiBUaGF0Cj4gc2VlbXMgdG8gc3Vn
Z2VzdCB0aGUgY2xhbXBpbmcgbWF5IGJlIGRvbmUgdXBzdHJlYW0gaW4gdGhvc2UgY2FzZXMuCgoK
Tm8gdGhlIGR3LWhkbWkgc2V0dXAgZG9lc24ndCBhZmZlY3QgVklVLCB0aGUgVklVIG91dHB1dCBp
cyBjb25maWd1cmVkCmluIG1lc29uX2VuY29kZXJfaGRtaSBpbiB0aGUgVlBVX0hETUlfRk1UX0NU
UkwgcmVnaXN0ZXIsIGl0J3Mgb25seQphZmZlY3RlZCBpZiB0aGUgWVVWNDIwIEhETU5JIG91dHB1
dCBpcyBzZWxlY3RlZC4KCkkgdGhpbmsgaXQncyBhIHByb2JsZW0gaW4gdGhlIENTQyBjb25maWd1
cmF0aW9uLgoKVGhlIGR3Y19oZG1pX3R4IGRhdGFib29vayBoYXMgc29tZWhvdyBsZWFrZWQgb24g
aW50ZXJuZXQsIGFuZCB5b3UKY2FuIGhhdmUgYSBsb29rIGF0IHRoZSBDb2xvciBTcGFjZSBDb252
ZXJ0ZXIgcmVnaXN0ZXJzIHNlY3Rpb24gdG8KdW5kZXJzdGFuZCBob3cgdGhlIG1hdHJpeCB3b3Jr
cy4KCk5laWwKCj4gCj4gRnJhbmNpc2NvCj4gCj4gCj4gT24gV2VkLCBPY3QgMjMsIDIwMjQgYXQg
ODozMOKAr0FNIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gSGksCj4+
Cj4+IE9uIDIzLzEwLzIwMjQgMTA6MDAsIEZyYW5jaXNjbyBBeWFsYSBMZSBCcnVuIHdyb3RlOgo+
Pj4gSGVsbG8sCj4+Pgo+Pj4gSSBhbSBzZWVraW5nIHNvbWUgZ3VpZGFuY2UgcmVnYXJkaW5nIGVu
YWJsaW5nIGZ1bGwtcmFuZ2UgSERNSSBvdXRwdXQuCj4+PiBTcGVjaWZpY2FsbHksIEkgYW0gd29u
ZGVyaW5nIHdoaWNoIGNvbXBvbmVudCBpbiB0aGUgdmlkZW8gcGlwZWxpbmUKPj4+IGNvdWxkIGJl
IGNsYW1waW5nIEhETUkgb3V0cHV0IHZhbHVlcyB0byAxNi0yMzU/IEZ1cnRoZXIgZGV0YWlscwo+
Pj4gZm9sbG93Ogo+Pj4KPj4+IEkgaGF2ZSBiZWVuIHRyeWluZyB0byBnZXQgZnVsbC1yYW5nZSBI
RE1JIG91dHB1dCBmcm9tIGEgTGUgUG90YXRvCj4+PiBzOTA1eCBTQkMuIEF0IHRoZSBtb21lbnQs
IEhETUkgb3V0cHV0IHNlZW1zIHRvIGJlIGhhcmQtY29kZWQgdG8gY29sb3IKPj4+IHF1YW50aXph
dGlvbiBsaW1pdGVkIHJhbmdlICgxNi0yMzUpLiBUaGlzIGdyZWF0bHkgZGltaW5pc2hlcyB0aGUK
Pj4+IGNvbnRyYXN0IGluIGZ1bGwgcmFuZ2UgZGlzcGxheXMuCj4+Pgo+Pj4gU28gZmFyIHNldHRp
bmcgdGhlIFZJVV9PU0QxLzJfRlVMTF9SQU5HRSBiaXQgaW4gdGhlCj4+PiBWSVVfT1NEMS8yX0NU
UkxfU1RBVDIgcmVnaXN0ZXIgZG9lcyBub3Qgc2VlbSB0byB3b3JrLiBJIGhhdmUgYWxzbwo+Pj4g
bG9va2VkIGF0IHRoZSBjb2xvciBzcGFjZSBjb252ZXJzaW9uIG1hdHJpeCBpbiBkd19oZG1pIGlu
IGNhc2UgdGhhdCBpcwo+Pj4gdGhlIGN1bHByaXQsIGJ1dCB0aGUgdmFsdWVzIHNlZW0gZmluZSBh
bmQgc2V0dGluZyB0aGF0IHRvIHplcm8gZG9lcwo+Pj4gcHJvZHVjZSBhIHNpZ25hbCBpbiB0aGUg
ZnVsbCByYW5nZSAoMCkuIFRoZSBidWZmZXIgZnJvbSB0aGUgVklVIGlzCj4+PiB1c2luZyBhIFlV
ViBmb3JtYXQgc28gZHdfaGRtaSBpcyBub3QgdXNpbmcgdGhlIGZ1bGwgdG8gbGltaXRlZCByYW5n
ZQo+Pj4gY29udmVyc2lvbiBtYXRyaXguCj4+Cj4+IEluZGVlZCB0aGUgaW50ZXJuYWwgVlBVIHBp
cGVsaW5lIGlzIGluIDEwYml0IFlVVjQ0NCwgc28gaXQgcmVxdWlyZXMgZW5hYmxpbmcKPj4gdGhl
IGR3LWhkbWkgQ1NDLCBzbyBwZXJoYXBzIHRob3NlIGFyZSBub3QgZGVzaWduZWQgdG8gb3V0cHV0
IGZ1bGwtcmFuZ2UgUkdCID8KPj4KPj4gQ291bGQgeW91IHJldmVydDoKPj4gZDNkNmIxYmY4NWFl
IGRybTogYnJpZGdlOiBkd19oZG1pOiBmaXggcHJlZmVyZW5jZSBvZiBSR0IgbW9kZXMgb3ZlciBZ
VVY0MjAKPj4KPj4gVGhpcyB3b3VsZCBnaXZlIHlvdSBkaXJlY3QgWVVWNDQ0IEhETUkgb3V0cHV0
IHdpdGhvdXQgQ1NDIGludm9sdmVkLCByZXZlcnRpbmcKPj4gaXMgbm90IGFuIG9wdGlvbnMgYmVj
YXVzZSBvZiBsb3ctY29zdCBIRE1JIHBhbmVscyBseWluZyBpbiB0aGVpciBFRElECj4+IGFuZCBu
b3QgcmVhbGx5IHN1cHBvcnRpbmcgWVVWIEhETUkuLi4KPj4KPj4gU28gaWYgdGhlIG9yaWdpbmFs
IFlVViBpcyBpbiBmdWxsIHJhbmdlLCB0aGUgY3VscHJpdCBpcyBpbiB0aGUgRFctSERNSSBDU0MK
Pj4gdGFibGUuCj4+Cj4+IE5laWwKPj4KPj4+Cj4+PiBUaGFuayB5b3UgaW4gYWR2YW5jZSwKPj4+
IEZyYW5jaXNjbwo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4gbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
Pj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
