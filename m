Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F7CD0BB72
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Oct 2024 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6G54OZ+d07hKNlo/gCm3G/i26R0Fmd2gTWAstXvg0Hk=; b=q1+MeJBG7mbQzDFZ5jcBEWN69s
	eTIqjecMFR90YJJg2SrBAPS95YuIwbGrNwLgCAdmcaL2r3nHr22aaX1i8U2YtLN2WY/abu9/vVRO6
	6RMvB/51x09O1j6x+C/uCP+qvBbmoj7r4xM6sBkD236YnDHMZN2IHLi5kqOV17TuWeqt+NKanVwCA
	7OXQjvi/WR+zXv0Pv5MVwACSwwj5pKf5P75ogINXIySy6YjL9jcP1ImEs+k/UrvLnvPmK0e+Y0Fny
	CvkNxAAbtMNrvL+FEjTBaTQg/kl2+RmWK3iqPWptI565CNy1VNbBp0quWlKho3j8QFQCCoNhPKrmB
	jUAXD7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tW3-0000000HLmx-0SKH;
	Thu, 24 Oct 2024 08:48:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tMk-0000000HK6Z-3Wsy
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Oct 2024 08:38:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so540251f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Oct 2024 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729759125; x=1730363925; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a92Jo5kZPv7pfZIAIBdhRTNf6bthyTMmD5pU2YlKQX0=;
        b=uWUeDri8F4nqqlhY2CkY+KkwjGaV2YJfnTkHLiZNTp0m5Cf40rkIJzd7dYdc8D+4EH
         CLhqZ7RnC38QlfjTOn7ZfEJDiuDpuAqxQrNiyv2O3VvlFi4HxDF0e6jCYHcgPu7e5YUG
         4CLijbVuEPujM5wFCXVnvwxYtu+1Aw87l7Uk/pLfLqh3QXRJKmQjM1xM/9d7PQFEUXHv
         uljABmzokmwkrl2FZCNCNG4ZDFgpQGzDtReceMTLCGF8c6uEoaDHrYKjX2xEd6vYJeHY
         cbdtt+arI2QFLvLeE+MBbRIN6wHHUOyy1FrISzHbpKOHsqaQ5gepjnWkMJwXAG/vz9GA
         4bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729759125; x=1730363925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a92Jo5kZPv7pfZIAIBdhRTNf6bthyTMmD5pU2YlKQX0=;
        b=KWDWW6HRoKblAi1JoziQ/tQ7rFrUrVg4BR0nHNZA5te9fiMVl0WXcpxRLkPCBKkps8
         q/lZq+ptacS1WGJPx/RapCtkqjucR+FKvXY882yCB7oXo/Z/o0FkfvbdixJjvT/RpBrk
         YNmirJlbWVHriQZVylNCQjFn3GIxCxlFuuraz4vOCw4rbEIYeDcFuQma0RUK1G5MlGkl
         oCW4x6o27AgKbc4+E1g4qde6hL9v5RXGvhfgeQVwfmhg2a6Q8ZqhlvJbgJMWR/O19u9x
         Mh4bqtx1TazgThj1Fu25F5CYCC+agDZ8LF/B651zF4I8TjANUKXwODECfm5OKKbuws1l
         qfww==
X-Gm-Message-State: AOJu0YwaN0j8nqelSyVzM9nEYlZBd96QaRK5lvCsaDqM3T6Y2tc5fFkW
	wL7SdIm0XIykaXYTUHcdZ9PbTfgkF/KuNMyp66HjAeIJZ3fLNP5QblL7+ku+BXU=
X-Google-Smtp-Source: AGHT+IEXdJmFaVyP7CAd6mikqICFqMj5uIaCJWJwKI8j8Lk/j8NpMKmE74zWPsoLtIr7zn2O/U7aMQ==
X-Received: by 2002:adf:f507:0:b0:37d:612c:5e43 with SMTP id ffacd0b85a97d-37efcc5d8dfmr4659461f8f.0.1729759124619;
        Thu, 24 Oct 2024 01:38:44 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:137f:ece6:fb3d:24cb:df87:1352? ([2a0d:e487:137f:ece6:fb3d:24cb:df87:1352])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186be509dsm38361325e9.16.2024.10.24.01.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 01:38:44 -0700 (PDT)
Message-ID: <0dea0c5d-62e8-4671-abd2-63790dcfb237@linaro.org>
Date: Thu, 24 Oct 2024 10:38:42 +0200
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
X-CRM114-CacheID: sfid-20241024_013846_938535_9C4A464D 
X-CRM114-Status: GOOD (  28.57  )
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
Z2VzdCB0aGUgY2xhbXBpbmcgbWF5IGJlIGRvbmUgdXBzdHJlYW0gaW4gdGhvc2UgY2FzZXMuCj4g
Cj4gRnJhbmNpc2NvCj4gCj4gCj4gT24gV2VkLCBPY3QgMjMsIDIwMjQgYXQgODozMOKAr0FNIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gSGksCj4+Cj4+IE9uIDIzLzEw
LzIwMjQgMTA6MDAsIEZyYW5jaXNjbyBBeWFsYSBMZSBCcnVuIHdyb3RlOgo+Pj4gSGVsbG8sCj4+
Pgo+Pj4gSSBhbSBzZWVraW5nIHNvbWUgZ3VpZGFuY2UgcmVnYXJkaW5nIGVuYWJsaW5nIGZ1bGwt
cmFuZ2UgSERNSSBvdXRwdXQuCj4+PiBTcGVjaWZpY2FsbHksIEkgYW0gd29uZGVyaW5nIHdoaWNo
IGNvbXBvbmVudCBpbiB0aGUgdmlkZW8gcGlwZWxpbmUKPj4+IGNvdWxkIGJlIGNsYW1waW5nIEhE
TUkgb3V0cHV0IHZhbHVlcyB0byAxNi0yMzU/IEZ1cnRoZXIgZGV0YWlscwo+Pj4gZm9sbG93Ogo+
Pj4KPj4+IEkgaGF2ZSBiZWVuIHRyeWluZyB0byBnZXQgZnVsbC1yYW5nZSBIRE1JIG91dHB1dCBm
cm9tIGEgTGUgUG90YXRvCj4+PiBzOTA1eCBTQkMuIEF0IHRoZSBtb21lbnQsIEhETUkgb3V0cHV0
IHNlZW1zIHRvIGJlIGhhcmQtY29kZWQgdG8gY29sb3IKPj4+IHF1YW50aXphdGlvbiBsaW1pdGVk
IHJhbmdlICgxNi0yMzUpLiBUaGlzIGdyZWF0bHkgZGltaW5pc2hlcyB0aGUKPj4+IGNvbnRyYXN0
IGluIGZ1bGwgcmFuZ2UgZGlzcGxheXMuCj4+Pgo+Pj4gU28gZmFyIHNldHRpbmcgdGhlIFZJVV9P
U0QxLzJfRlVMTF9SQU5HRSBiaXQgaW4gdGhlCj4+PiBWSVVfT1NEMS8yX0NUUkxfU1RBVDIgcmVn
aXN0ZXIgZG9lcyBub3Qgc2VlbSB0byB3b3JrLiBJIGhhdmUgYWxzbwo+Pj4gbG9va2VkIGF0IHRo
ZSBjb2xvciBzcGFjZSBjb252ZXJzaW9uIG1hdHJpeCBpbiBkd19oZG1pIGluIGNhc2UgdGhhdCBp
cwo+Pj4gdGhlIGN1bHByaXQsIGJ1dCB0aGUgdmFsdWVzIHNlZW0gZmluZSBhbmQgc2V0dGluZyB0
aGF0IHRvIHplcm8gZG9lcwo+Pj4gcHJvZHVjZSBhIHNpZ25hbCBpbiB0aGUgZnVsbCByYW5nZSAo
MCkuIFRoZSBidWZmZXIgZnJvbSB0aGUgVklVIGlzCj4+PiB1c2luZyBhIFlVViBmb3JtYXQgc28g
ZHdfaGRtaSBpcyBub3QgdXNpbmcgdGhlIGZ1bGwgdG8gbGltaXRlZCByYW5nZQo+Pj4gY29udmVy
c2lvbiBtYXRyaXguCj4+Cj4+IEluZGVlZCB0aGUgaW50ZXJuYWwgVlBVIHBpcGVsaW5lIGlzIGlu
IDEwYml0IFlVVjQ0NCwgc28gaXQgcmVxdWlyZXMgZW5hYmxpbmcKPj4gdGhlIGR3LWhkbWkgQ1ND
LCBzbyBwZXJoYXBzIHRob3NlIGFyZSBub3QgZGVzaWduZWQgdG8gb3V0cHV0IGZ1bGwtcmFuZ2Ug
UkdCID8KPj4KPj4gQ291bGQgeW91IHJldmVydDoKPj4gZDNkNmIxYmY4NWFlIGRybTogYnJpZGdl
OiBkd19oZG1pOiBmaXggcHJlZmVyZW5jZSBvZiBSR0IgbW9kZXMgb3ZlciBZVVY0MjAKPj4KPj4g
VGhpcyB3b3VsZCBnaXZlIHlvdSBkaXJlY3QgWVVWNDQ0IEhETUkgb3V0cHV0IHdpdGhvdXQgQ1ND
IGludm9sdmVkLCByZXZlcnRpbmcKPj4gaXMgbm90IGFuIG9wdGlvbnMgYmVjYXVzZSBvZiBsb3ct
Y29zdCBIRE1JIHBhbmVscyBseWluZyBpbiB0aGVpciBFRElECj4+IGFuZCBub3QgcmVhbGx5IHN1
cHBvcnRpbmcgWVVWIEhETUkuLi4KPj4KPj4gU28gaWYgdGhlIG9yaWdpbmFsIFlVViBpcyBpbiBm
dWxsIHJhbmdlLCB0aGUgY3VscHJpdCBpcyBpbiB0aGUgRFctSERNSSBDU0MKPj4gdGFibGUuCgpT
byBzZWVtcyB0aGUgY3VycmVudCBDU0MgdGFibGVzIG91dHB1dHMgbGltaXRlZCByYW5nZSBmcm9t
IFlVViwgY291bGQgeW91IHRyeToKCj09PT09PT09PT09PT09PT09Pjw9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCmluZGV4IDAwMzFmM2M1NDg4Mi4uOWUxY2I5YmU0NjIyIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMTc2OSw4ICsxNzY5LDExIEBAIHN0YXRpYyB2
b2lkIGhkbWlfY29uZmlnX0FWSShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwKICAgICAgICAgZHJtX2hk
bWlfYXZpX2luZm9mcmFtZV9mcm9tX2Rpc3BsYXlfbW9kZSgmZnJhbWUsIGNvbm5lY3RvciwgbW9k
ZSk7CgogICAgICAgICBpZiAoaGRtaV9idXNfZm10X2lzX3JnYihoZG1pLT5oZG1pX2RhdGEuZW5j
X291dF9idXNfZm9ybWF0KSkgeworICAgICAgICAgICAgICAgYm9vbCBpc19pbnB1dF9yZ2IgPSBo
ZG1pX2J1c19mbXRfaXNfcmdiKGhkbWktPmhkbWlfZGF0YS5lbmNfaW5fYnVzX2Zvcm1hdCk7Cisg
ICAgICAgICAgICAgICBib29sIGlzX2xpbWl0ZWRfcmFuZ2UgPSBoZG1pLT5oZG1pX2RhdGEucmdi
X2xpbWl0ZWRfcmFuZ2UgfCFpc19pbnB1dF9yZ2I7CisKICAgICAgICAgICAgICAgICBkcm1faGRt
aV9hdmlfaW5mb2ZyYW1lX3F1YW50X3JhbmdlKCZmcmFtZSwgY29ubmVjdG9yLCBtb2RlLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZG1pLT5oZG1p
X2RhdGEucmdiX2xpbWl0ZWRfcmFuZ2UgPworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpc19saW1pdGVkX3JhbmdlID8KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEhETUlfUVVBTlRJWkFUSU9OX1JBTkdF
X0xJTUlURUQgOgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgSERNSV9RVUFOVElaQVRJT05fUkFOR0VfRlVMTCk7CiAgICAgICAgIH0gZWxzZSB7Cj09
PT09PT09PT09PT09PT09Pjw9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpJdCB3
b24ndCBvdXRwdXQgZnVsbCByYW5nZSwgYnV0IGF0IGxlYXN0IHRoZSBtb25pdG9yIHdpbGwga25v
dyB0aGUgcmVhbApzaWduYWwgcXVhbnQgcmFuZ2UuCgpUaGUgcmVhbCBmaXggd291bGQgYmUgdG8g
Y2FsY3VsYXRlIHNvbWUgbmV3IHBhcmFtZXRlcnMgZm9yIGZ1bGwgcmFuZ2UsCmJ1dCBJJ20gbm90
IGFibGUgdG8gZG8gdGhhdCBwZXJzb25hbGx5LgoKTmVpbAoKPj4KPj4gTmVpbAo+Pgo+Pj4KPj4+
IFRoYW5rIHlvdSBpbiBhZHZhbmNlLAo+Pj4gRnJhbmNpc2NvCj4+Pgo+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0Cj4+PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+Pgo+
Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBs
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
