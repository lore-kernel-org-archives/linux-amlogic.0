Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBF9D0BB73
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Oct 2024 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUg5LHzEIXpHlzJdxLmyJfnlSQORLqGa48vDelUkf/0=; b=jyrL6J3fKmHz+8
	yieASfMpV8RVs4Kh+qsjnCj4/0FTL9LrK1k03lgbv9fyvGokG8dbaTqYL9I8XydStg/CKCwBwCV4r
	2YInUKb6O6yuVjKWGGVo1sF38LUOWvPVHv5oc65KI4ja4RqiLJK3+ouJza1CTEJYvAGV9VyIlbIxk
	aDijD/YgBMzX3UpYQJKI4PVoJ7ZUGfaQkG1f2wXpTW2s4+fg7taqa6UjI4wAUCy/1LorY+Aihq6Gm
	IgKM4ljcXsi57kE886uGeUbKgfFIWz0DmvI1xz19TXB7ysXrTiG8Vh8AioOGnqVsyxtuJpK4F+Y2L
	VMhVyeL4fZFqjribpV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tZ3-0000000HM7z-20tk;
	Thu, 24 Oct 2024 08:51:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tYn-0000000HM6V-1UPb
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Oct 2024 08:51:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37d49a7207cso452788f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Oct 2024 01:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729759871; x=1730364671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:reply-to:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xe6tJq2jkFro+BdD3kKfxBOa5m/pXrleL11HLgEWvrY=;
        b=JkrpcbA7n/bZWb30/PqkuIppqjKQqf0g4k/77Uuimzlf+odw3B47PzJxr4LYS8P/rO
         9IsJS53wAhAXXjMDMJcMSRW5ZSH3XKq8Nogpsvn4uS4U6e7uw8k+fHCB0WMDET9S3dOz
         vCULX3roSF7EfSCfbMaWdH91BssEGLpCmJlDDT1+VXwnhhrGXvEBW1IT5uj/Za6FTriW
         qGk1rBK88lpItiFGvxMh57kbOInC0U4sSfGOZS2bi0ozbVuFQhfVfUDqzjcZrmSQPDvD
         EAF2xt92k69YxwNA71PLLHWuZ2GkGaDAVtGrm8+xqGGund/hPUIe5z/Kf1aNd2ub9Xng
         cu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729759871; x=1730364671;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:reply-to:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xe6tJq2jkFro+BdD3kKfxBOa5m/pXrleL11HLgEWvrY=;
        b=NnHJEwipfM9YafnTl+QMGGv0lBbEk5vzaEaRONjQYF3qcGxudv6v+YVUliKkpPZAdU
         dn7kgmy0gqKTht8POQa+NM2XOfkcTg08oWwGzjJU4LZNW1oaUatmo4yLlzf1sKHWjXS1
         4FoLrvgj1CmuOMYEN3T3WTipx+w4zl8XG5J9vu9z749UGtHyqBwnWTQm2rcva4kHXvzF
         wc1pknp6bYrskuLjmW3B3inZFG3rtB2jvR9rsWKGFfDggCQIbCQ0Q14rcTyJrxfSHW/I
         EDwwurLl6KIFbb5YEFgzrFxlY/IIcnr2eHPXwacHnr9XUWWQa1K0wN/aW8nBhc/sz5r1
         4WJw==
X-Gm-Message-State: AOJu0Yyish3uFpKx0oCqUK1328y0GkAD0tPjV3gDhnLTy4h/zabiiB7M
	gZaEG6fHcJX/tO8C//DNnBy1xBTis46oBUle0SxBXUmNq3HAXrNIKec72u4+dPY=
X-Google-Smtp-Source: AGHT+IH7kcTAn2GEXLnpnGuN3jomRtJa8fM4D9izkxIBek8tZTrk4d5p15JVN3wG95qyHZlpB0BDlg==
X-Received: by 2002:adf:f7cb:0:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-37efcf898d0mr3352616f8f.48.1729759871540;
        Thu, 24 Oct 2024 01:51:11 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:137f:ece6:fb3d:24cb:df87:1352? ([2a0d:e487:137f:ece6:fb3d:24cb:df87:1352])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9b186sm10779213f8f.91.2024.10.24.01.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 01:51:11 -0700 (PDT)
Message-ID: <e3224c02-3b5d-48af-828a-f01017fd0fd9@linaro.org>
Date: Thu, 24 Oct 2024 10:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: meson: Enabling full-range HDMI output
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Francisco Ayala Le Brun <francisco@videowindow.eu>
Cc: linux-amlogic@lists.infradead.org
References: <CAN-StX2faaw60pUqRcDtHgrovWYFsM+PGDDAhU8wbT6aeDQKwg@mail.gmail.com>
 <40c07e23-0784-4bcd-8da6-485866e81425@linaro.org>
 <CAN-StX1D8-noDF5a_b08FX-7GAgw+o3UYryUXh3_zmG-MTWfZg@mail.gmail.com>
 <0dea0c5d-62e8-4671-abd2-63790dcfb237@linaro.org>
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
In-Reply-To: <0dea0c5d-62e8-4671-abd2-63790dcfb237@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_015113_432428_420A0257 
X-CRM114-Status: GOOD (  30.03  )
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

T24gMjQvMTAvMjAyNCAxMDozOCwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBP
biAyMy8xMC8yMDI0IDE0OjEyLCBGcmFuY2lzY28gQXlhbGEgTGUgQnJ1biB3cm90ZToKPj4gVGhh
bmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLiBJIGNhbiBjb25maXJtIHJldmVydGluZyB0aGUgY29t
bWl0IHNvbHZlcwo+PiB0aGUgaXNzdWUuIEhvd2V2ZXIsIGl0IG9ubHkgbGVhdmVzIG1lIG1vcmUg
Y29uZnVzZWQgYXMgdG8gdGhlIHJvb3QKPj4gY2F1c2UuCj4+Cj4+IElmIGR3LWhkbWkgaXMgc2V0
IHRvIG91dHB1dCBSR0IsIGFuZCB5b3Ugc2V0IHRoZSBDU0MgbWF0cml4IHRvIHplcm9lcywKPj4g
dGhlbiBpdCB3aWxsIHNob3cgYSBjb3JyZWN0bHkgY29tcGxldGVseSBibGFjayBvdXRwdXQuIEhv
d2V2ZXIsIGlmIHlvdQo+PiBzZXQgdGhlIGZpcnN0IGNvbHVtbiBvZiB0aGUgWVVWLXRvLVJHQiBt
YXRyaXggdG8gb25lcywgYW5kIHNob3cgYQo+PiBibGFjayBpbWFnZSB2aWEgRFJNLCB0aGVuIHRo
ZSB0b25lIGlzIGluIHRoZSBsaW1pdGVkIHJhbmdlLiBUaGlzCj4+IHNlZW1lZCB0byBpbmRpY2F0
ZSBkdy1oZG1pIGNhbiBvdXRwdXQgZnVsbCByYW5nZSBSR0IsIGFuZCB0aGUgcHJvYmxlbQo+PiB3
YXMgZmFydGhlciB1cHN0cmVhbS4KPj4KPj4gUGVyaGFwcyB0aGUgcHJvYmxlbSBpcyB0aGUgQ1ND
IG1hdHJpY2VzPyBJIHdhcyB1bmRlciB0aGUgYXNzdW1wdGlvbgo+PiAweDIwMDAgY29ycmVzcG9u
ZGVkIHRvIDEsIGV2ZW4gdGhvdWdoIGkuTVg2IG1hbnVhbCBjaGFwdGVyIDMzIHNlZW1zIHRvCj4+
IHN1Z2dlc3Qgd2l0aCBhIGNzY19zY2FsZSBvZiAxLCB0aGVuIDB4ODAwIHdvdWxkIGNvcnJlc3Bv
bmQgdG8gMS4KPj4gU3RpbGwsIEkgd291bGQgZXhwZWN0IGF0IGxlYXN0IGZ1bGx5IGJsYWNrIHRv
IGJlIGNvcnJlY3QgYXMgdGhhdCB3b3VsZAo+PiBnaXZlIGEgbXVsdGlwbGljYXRpb24gYnkgemVy
by4KPj4KPj4gT3IgdGhlIHN0YXRlIG9mIGR3X2hkbWkgaXMgYWZmZWN0aW5nIHRoZSBWSVUgaW4g
c29tZSB3YXk/IFBlcmhhcHMgdGhlCj4+IFZJVSBoYXJkd2FyZSBpcyBtYWRlIHRvIGNsYW1wIGx1
bWluYW5jZSB3aGVuIGR3X2hkbWkgaXMgb3V0cHV0dGluZwo+PiBSR0I/IEkgbm90aWNlZCBmb3Ig
dGhlIENTQyB0aGVyZSBpcyBvbmx5IGEgc3BlY2lhbCBtYXRyaXggZm9yCj4+IFJHQi10by1saW1p
dGVkLVJHQiwgYnV0IG5vIHNwZWNpYWwgbWF0cml4IGZvciBZVVYtdG8tbGltaXRlZC1SR0IuIFRo
YXQKPj4gc2VlbXMgdG8gc3VnZ2VzdCB0aGUgY2xhbXBpbmcgbWF5IGJlIGRvbmUgdXBzdHJlYW0g
aW4gdGhvc2UgY2FzZXMuCj4+Cj4+IEZyYW5jaXNjbwo+Pgo+Pgo+PiBPbiBXZWQsIE9jdCAyMywg
MjAyNCBhdCA4OjMw4oCvQU0gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4K
Pj4+IEhpLAo+Pj4KPj4+IE9uIDIzLzEwLzIwMjQgMTA6MDAsIEZyYW5jaXNjbyBBeWFsYSBMZSBC
cnVuIHdyb3RlOgo+Pj4+IEhlbGxvLAo+Pj4+Cj4+Pj4gSSBhbSBzZWVraW5nIHNvbWUgZ3VpZGFu
Y2UgcmVnYXJkaW5nIGVuYWJsaW5nIGZ1bGwtcmFuZ2UgSERNSSBvdXRwdXQuCj4+Pj4gU3BlY2lm
aWNhbGx5LCBJIGFtIHdvbmRlcmluZyB3aGljaCBjb21wb25lbnQgaW4gdGhlIHZpZGVvIHBpcGVs
aW5lCj4+Pj4gY291bGQgYmUgY2xhbXBpbmcgSERNSSBvdXRwdXQgdmFsdWVzIHRvIDE2LTIzNT8g
RnVydGhlciBkZXRhaWxzCj4+Pj4gZm9sbG93Ogo+Pj4+Cj4+Pj4gSSBoYXZlIGJlZW4gdHJ5aW5n
IHRvIGdldCBmdWxsLXJhbmdlIEhETUkgb3V0cHV0IGZyb20gYSBMZSBQb3RhdG8KPj4+PiBzOTA1
eCBTQkMuIEF0IHRoZSBtb21lbnQsIEhETUkgb3V0cHV0IHNlZW1zIHRvIGJlIGhhcmQtY29kZWQg
dG8gY29sb3IKPj4+PiBxdWFudGl6YXRpb24gbGltaXRlZCByYW5nZSAoMTYtMjM1KS4gVGhpcyBn
cmVhdGx5IGRpbWluaXNoZXMgdGhlCj4+Pj4gY29udHJhc3QgaW4gZnVsbCByYW5nZSBkaXNwbGF5
cy4KPj4+Pgo+Pj4+IFNvIGZhciBzZXR0aW5nIHRoZSBWSVVfT1NEMS8yX0ZVTExfUkFOR0UgYml0
IGluIHRoZQo+Pj4+IFZJVV9PU0QxLzJfQ1RSTF9TVEFUMiByZWdpc3RlciBkb2VzIG5vdCBzZWVt
IHRvIHdvcmsuIEkgaGF2ZSBhbHNvCj4+Pj4gbG9va2VkIGF0IHRoZSBjb2xvciBzcGFjZSBjb252
ZXJzaW9uIG1hdHJpeCBpbiBkd19oZG1pIGluIGNhc2UgdGhhdCBpcwo+Pj4+IHRoZSBjdWxwcml0
LCBidXQgdGhlIHZhbHVlcyBzZWVtIGZpbmUgYW5kIHNldHRpbmcgdGhhdCB0byB6ZXJvIGRvZXMK
Pj4+PiBwcm9kdWNlIGEgc2lnbmFsIGluIHRoZSBmdWxsIHJhbmdlICgwKS4gVGhlIGJ1ZmZlciBm
cm9tIHRoZSBWSVUgaXMKPj4+PiB1c2luZyBhIFlVViBmb3JtYXQgc28gZHdfaGRtaSBpcyBub3Qg
dXNpbmcgdGhlIGZ1bGwgdG8gbGltaXRlZCByYW5nZQo+Pj4+IGNvbnZlcnNpb24gbWF0cml4Lgo+
Pj4KPj4+IEluZGVlZCB0aGUgaW50ZXJuYWwgVlBVIHBpcGVsaW5lIGlzIGluIDEwYml0IFlVVjQ0
NCwgc28gaXQgcmVxdWlyZXMgZW5hYmxpbmcKPj4+IHRoZSBkdy1oZG1pIENTQywgc28gcGVyaGFw
cyB0aG9zZSBhcmUgbm90IGRlc2lnbmVkIHRvIG91dHB1dCBmdWxsLXJhbmdlIFJHQiA/Cj4+Pgo+
Pj4gQ291bGQgeW91IHJldmVydDoKPj4+IGQzZDZiMWJmODVhZSBkcm06IGJyaWRnZTogZHdfaGRt
aTogZml4IHByZWZlcmVuY2Ugb2YgUkdCIG1vZGVzIG92ZXIgWVVWNDIwCj4+Pgo+Pj4gVGhpcyB3
b3VsZCBnaXZlIHlvdSBkaXJlY3QgWVVWNDQ0IEhETUkgb3V0cHV0IHdpdGhvdXQgQ1NDIGludm9s
dmVkLCByZXZlcnRpbmcKPj4+IGlzIG5vdCBhbiBvcHRpb25zIGJlY2F1c2Ugb2YgbG93LWNvc3Qg
SERNSSBwYW5lbHMgbHlpbmcgaW4gdGhlaXIgRURJRAo+Pj4gYW5kIG5vdCByZWFsbHkgc3VwcG9y
dGluZyBZVVYgSERNSS4uLgo+Pj4KPj4+IFNvIGlmIHRoZSBvcmlnaW5hbCBZVVYgaXMgaW4gZnVs
bCByYW5nZSwgdGhlIGN1bHByaXQgaXMgaW4gdGhlIERXLUhETUkgQ1NDCj4+PiB0YWJsZS4KPiAK
PiBTbyBzZWVtcyB0aGUgY3VycmVudCBDU0MgdGFibGVzIG91dHB1dHMgbGltaXRlZCByYW5nZSBm
cm9tIFlVViwgY291bGQgeW91IHRyeToKPiAKPiA9PT09PT09PT09PT09PT09PT48PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jCj4gaW5kZXggMDAzMWYzYzU0ODgyLi45ZTFjYjliZTQ2MjIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0xNzY5LDggKzE3
NjksMTEgQEAgc3RhdGljIHZvaWQgaGRtaV9jb25maWdfQVZJKHN0cnVjdCBkd19oZG1pICpoZG1p
LAo+ICDCoMKgwqDCoMKgwqDCoCBkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9t
b2RlKCZmcmFtZSwgY29ubmVjdG9yLCBtb2RlKTsKPiAKPiAgwqDCoMKgwqDCoMKgwqAgaWYgKGhk
bWlfYnVzX2ZtdF9pc19yZ2IoaGRtaS0+aGRtaV9kYXRhLmVuY19vdXRfYnVzX2Zvcm1hdCkpIHsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGlzX2lucHV0X3JnYiA9IGhkbWlf
YnVzX2ZtdF9pc19yZ2IoaGRtaS0+aGRtaV9kYXRhLmVuY19pbl9idXNfZm9ybWF0KTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGlzX2xpbWl0ZWRfcmFuZ2UgPSBoZG1pLT5o
ZG1pX2RhdGEucmdiX2xpbWl0ZWRfcmFuZ2UgfCFpc19pbnB1dF9yZ2I7CgpPZiBjb3Vyc2U6Cgog
ICAgICAgICAgICAgIGJvb2wgaXNfbGltaXRlZF9yYW5nZSA9IGhkbWktPmhkbWlfZGF0YS5yZ2Jf
bGltaXRlZF9yYW5nZSB8fCAhaXNfaW5wdXRfcmdiOwoKU29ycnkgZm9yIHRoZSB0eXBvLgoKPiAr
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1faGRtaV9hdmlfaW5mb2ZyYW1l
X3F1YW50X3JhbmdlKCZmcmFtZSwgY29ubmVjdG9yLCBtb2RlLAo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZG1pLT5oZG1pX2RhdGEucmdiX2xpbWl0ZWRfcmFu
Z2UgPwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpc19saW1p
dGVkX3JhbmdlID8KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBIRE1JX1FVQU5USVpBVElPTl9SQU5HRV9MSU1JVEVEIDoKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBIRE1JX1FVQU5USVpBVElPTl9SQU5HRV9GVUxMKTsK
PiAgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPiA9PT09PT09PT09PT09PT09PT48PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+IAo+IEl0IHdvbid0IG91dHB1dCBmdWxsIHJhbmdl
LCBidXQgYXQgbGVhc3QgdGhlIG1vbml0b3Igd2lsbCBrbm93IHRoZSByZWFsCj4gc2lnbmFsIHF1
YW50IHJhbmdlLgo+IAo+IFRoZSByZWFsIGZpeCB3b3VsZCBiZSB0byBjYWxjdWxhdGUgc29tZSBu
ZXcgcGFyYW1ldGVycyBmb3IgZnVsbCByYW5nZSwKPiBidXQgSSdtIG5vdCBhYmxlIHRvIGRvIHRo
YXQgcGVyc29uYWxseS4KPiAKPiBOZWlsCj4gCj4+Pgo+Pj4gTmVpbAo+Pj4KPj4+Pgo+Pj4+IFRo
YW5rIHlvdSBpbiBhZHZhbmNlLAo+Pj4+IEZyYW5jaXNjbwo+Pj4+Cj4+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdAo+Pj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+
Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
