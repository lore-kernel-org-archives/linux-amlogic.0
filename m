Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE84EBFD10
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2026 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MfBlRqd6W4x00euCBpaWnRUZ4I+O5MlihDiB6SuNbk=; b=X6GqnV3T6QKFvjGE9/qko16rt+
	4ZkPV+sNOKEFAvxGSfXTmxmTXKvxMBSlTJUaLkA7KcHD5nyybRopi51XlzB8VGsZvBMLv2vgBWymd
	eUjzB1iaetvI4J0vs+TNtPwXcBCmH0g6149eT2r0uXD6VSyvkjPt8JzTfE+Ir15pZ/l6Eu8EMWt3z
	bNd0hmjY3cwDy/kQcS4rX2G83mZv6r8CXSdtSuunvwUa5/H40IAuy/bbBMr5pFDfe2V1NN647uvwP
	1PdO1ZDM7Dxm6fL2Yg9rWZOdToepCPACwp20f+M1cdZ/cnO3ULUL9rnMnLKUJmzheLkAPh3vxLD2L
	XtDMMwMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBzE-0000000FB7j-1Ar0;
	Mon, 13 Apr 2026 07:45:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBzC-0000000FB5M-1WVo
	for linux-amlogic@bombadil.infradead.org;
	Mon, 13 Apr 2026 07:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=; b=i7oSkCuH196utwCkQwy+3S+aWb
	ddQFpggLmjVA7gMt2CZqmIEWx6Kyj3wbSBjCgwYkmwi4G4ahGXRvNNeX4DypSwFkZ/yKdtkzCaLCf
	PGBJvNYWvLSNoZg1aqZfpTWrUPqAFyEMmt542GVCziWIWxRce7lqU0B+cKBiX+0XpgQdakknTd5Hu
	NwDglUqLaoqWGEYNhqTkFEK+cA6uzSwNWBYTLy4ua2zNMA0oXvD8gjYM8rYLJn/oW/ghsLrkNKS6D
	f3RcUER62sb7IqHWBDmjzjM6M2kWe8UAX2K0yeL8OJPpMDmigagUWw82NC6MXPCHiB6XI/QW87PiR
	AKKdXgxw==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBz1-0000000GJCY-1dDr
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Apr 2026 07:45:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso50183825e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Apr 2026 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776066321; x=1776671121; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=;
        b=tLx3Uz2EwQZIqo2M3Lz8eMw5CqIozbMpASkaiisZ2UG1jKkj5m4D6BmuVUl07NnFkO
         DLCTWEg7ge2w2+K+IdGPo8EFUxjTmMShz9UEClWs6EQIUjG4n3pDVjDpJJEoJjR9t82O
         DCvItlAMbJKZ6F9RSGjcFgF46lJe+KVdtAFj3JLlplZaYtlKoi9njSu5E+9yuUNyOW6L
         uuKcwXMAhsRewn8j4HBoEy2FRSEZ0VEOGbAZgUzFhdffbXmi/5qO1U1iWt9J4z4jdPFB
         3G9OisQ6WDS93kGo3pfju8i+hA02LCZme77sKbhXp/WJd4jr53hP50o/32xGZjk1rOXp
         L4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066321; x=1776671121;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXpz2O0o7IAOiW0wpCsudNdz58SNhf9Y+6JQ1Zpf05w=;
        b=jbvyYH5L1rzddLql5mZpeMwVTFHy4dQChPRWI/ZnFgyhbw73Clh7lZ2Lv368RDztF4
         ZZk2xoyByTWw2F78UhdecfyFln+Ju0O+Z+4cpWcI1DvTYivXBbG9luCZ6KK4ywPoJE6i
         6a/n+d/EsYq1K8H8Yf7uqcYvI7ChclfXBNBtP8A8tt0xptmNFLorellarCqnaPdEg1/H
         fcDHGZJGkyiYCn/ijd2fMhQtGm90UAz/sOK/D1MvBLwnCx1jZawheBQrJ/LC1ymnhTpg
         8ibYa/zR9r96XR5DsinipBlAO9BgYp0uYXzKlhIIbsYmgM72quCiB+krFHzUupquJkfk
         uAtg==
X-Forwarded-Encrypted: i=1; AFNElJ8s53es6uNGzIYxi30xuP2LwSi1rm7okwDYwJxLuww+Xdw8LirBbd4ooKTNRcSe2O0G/pzJF1sud31InoUm@lists.infradead.org
X-Gm-Message-State: AOJu0YxOy8wYgBs02Lt1stG7HQMk46w25ny+bG0XOoMzffC4KNnTgEDK
	mnaAMazXW55ekgVVdHtxwpVs6PrNmVJ9ac1f1o0JbZcsDNuFnae1JwpK2IvTnjjYQ/o=
X-Gm-Gg: AeBDievsXlFTd2fLg6aCn2feeYRncpQ+Cq7HzcCCZatNB6eKfFUk1R1PV5irgQcDcJ6
	1/plEEoCza/8WsW1kp/Xa4dmgajtBTDQ3jvmMzPWZB2RKEIn2JuZHgL6MhCNJjxIfD+BGOtvt/5
	HWpRiZ+2qqNrceiqK+FCqjC3NrRCQ6aGvFRY8MoMGfmZ+93ReGWTTrRyFxnPIJDm+jERc+8ZwC3
	eSWtpCY1fhueo2+U6qdl4WbBzp3VVAs+lZRYfkkBPQUl+U6lQsbqyiVlrdhNssQPKeLvLzLWWhu
	/SsxkO1v7xwm2LAluLQbVtGZOu7BNAmzyb1pr8xPKxOIsm+U+5e8zSUMCnMnzOnjOODuQ5N0C3J
	Ww/Te5fvEJLUkCIOhZHgQdKNv2mpx0SfqdWkVvvo3P4Scl1nzSaYah4UzKCFMkXdf2W+znw8Sus
	iCTB/DwX5eqAWMlIlaTCXvduLjPHIfMAAs+DgrWDaeqnlAUo3krAvJ/NVbM3j5XP36eg4r7smBi
	4l0gUNz
X-Received: by 2002:a05:600c:4215:b0:488:d9ea:3da7 with SMTP id 5b1f17b1804b1-488d9ea3e0cmr86555425e9.10.1776066321406;
        Mon, 13 Apr 2026 00:45:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d684b55fsm92669805e9.26.2026.04.13.00.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:45:20 -0700 (PDT)
Message-ID: <6adde3fe-7eea-46e7-a6f7-de536f054c06@linaro.org>
Date: Mon, 13 Apr 2026 09:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
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
In-Reply-To: <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084530_524156_824CE479 
X-CRM114-Status: GOOD (  20.86  )
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

T24gNC8xMy8yNiAwOTozMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMy8wNC8y
MDI2IDA5OjE3LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBPbiAxMy8wNC8yMDI2IDA5
OjEwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+IE9uIDQvMTEvMjYgMTE6MzIsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6Cj4+Pj4gT24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgMTA6NTA6NThB
TSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBIZXJl
J3MgdGhlIEFtbG9naWMgQVJNNjQgRFQgY2hhbmdlcyBmb3IgdjcuMSwgaW5jbHVkaW5nIGEgYnVu
Y2ggb2YgZml4ZXMKPj4+Pj4gYW5kIGltcHJvdmVtZW50cyBmb3IgdGhlIEtoYWRhcyBWSU00IGFu
ZCBWSU0xcyBTQkNzLCBwbHVzIHNvbWUgYWRkaXRpb25zCj4+Pj4+IGZvciB0aGUgUGhpY29tbSBO
MSBhbmQgYSBjb3VwbGUgb2YgbG93IHByaW9yaXR5IGZpeGVzLgo+Pj4+Pgo+Pj4+PiBUaGFua3Ms
Cj4+Pj4+IE5laWwKPj4+Pj4KPj4+Pj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCA2ZGUyM2Y4MWE1ZTA4YmU4ZmJmNWU4ZDdlOWZlYmM3MmE1YjVmMjdmOgo+Pj4+Pgo+Pj4+PiAg
ICAgTGludXggNy4wLXJjMSAoMjAyNi0wMi0yMiAxMzoxODo1OSAtMDgwMCkKPj4+Pj4KPj4+Pj4g
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4+Pj4+Cj4+Pj4+ICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hbWxvZ2ljL2xp
bnV4LmdpdCB0YWdzL2FtbG9naWMtYXJtNjQtZHQtZm9yLXY3LjEKPj4+Pj4KPj4+Pj4gZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDQwMWU1YzczZWVkZGU4MjI1ZTg3YmQxMWM3OTRiODQw
OTI0OGZmNDE6Cj4+Pj4+Cj4+Pj4+ICAgICBhcm02NDogZHRzOiBtZXNvbi1neGwtcDIzMDogZml4
IGV0aGVybmV0IFBIWSBpbnRlcnJ1cHQgbnVtYmVyICgyMDI2LTA0LTA4IDE0OjI3OjIwICswMjAw
KQo+Pj4+Cj4+Pj4gRGF5cyBpbiBsaW51eC1uZXh0Ogo+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiAgICAxIHwgKysrKysrKysgKDgpCj4+Pj4gICAgLi4u
Cj4+Pj4KPj4+PiBTbyBhIGZldyB0aGluZ3Mgd2VyZSBqdXN0IGFwcGxpZWQsIHVubGVzcyB0aGlz
IHdhcyByZWJhc2VkPwo+Pj4KPj4+IFRoaXMgb25lIGhhcyBiZWVuIGFwcGxpZWQgbGF0ZWx5LCBi
dXQgdGhpcyBpcyBuZXdzIGZvciBtZSwgSSBhbHdheXMgdG9vawo+Pj4gaW4gYWNjb3VudCB0aGUg
dGltZSBzcGVudCBpbiB0aGUgbGlzdHMsIG5vdCBpbiBsaW51eC1uZXh0Lgo+Pj4gSSBtYWRlIHN1
cmUgdGhpcyBvbmUgbGFuZGVkIGF0IGxlYXN0IG9uY2UgaW4gLW5leHQgdG8gdHJpZ2dlciBDSXMu
Cj4+Pgo+Pj4gU28gaWYgdGhlcmXigJlzIG5ldyBydWxlcywgd2Ugc2hvdWxkIGJlIG1hZGUgYXdh
cmUgb2YgdGhvc2UuCj4+Cj4+IEhvdyBpcyBpdCBhIG5ldyBydWxlPyBMaW51cyBwb3N0aW5nIGZy
b20gMjAyMzoKPj4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBSGstPXdnWERUZldG
Ym4tNDgxPWl0NldfQjBLVFFzT2hkZ1hMNm13ZVZtNmV3dFN2QUBtYWlsLmdtYWlsLmNvbS8KPj4K
Pj4gUGx1cyB0aGlzIGlzIHNpbXBseSBsb2dpYyAtIHdoeSBzb2MgdHJlZSBzaG91bGQgYmUgdGhl
IGZpcnN0IHRyZWUKPj4gZXhwb3NlZCB0byBpbnRlZ3JhdGlvbiBpc3N1ZXMgYW5kIHJvYm90IHJl
cG9ydHM/IElmIHNvYyB0cmVlIG1lcmdlcwo+PiBzdHVmZiB3aGljaCB3YXMgbm90IG9uIG5leHQs
IGFsbCBzdWNoIHJlcG9ydHMgd2lsbCBiZSBhcHBsaWNhYmxlIHRvIHNvYwo+PiB0cmVlIGFzIHdl
bGwuIFRoYXQncyBub3RoaW5nIG5ldyBhYm91dCB0aGlzLgo+Pgo+Pj4KPj4+Pgo+Pj4+IEkgd2ls
bCB3YWl0IHdpdGggdGhpcy4gSXQgbWlnaHQgbWlzcyB0aGUgbWVyZ2Ugd2luZG93IGlmIHY3LjAg
aXMKPj4+PiByZWxlYXNlZCB0aGlzIHdlZWtlbmQuCj4+Pgo+Pj4gT2sgd293LCBqdXN0IGxpa2Ug
dGhhdC4uLiBJIG1lYW4gdGhlIGFtbG9naWMgRFQgaXMgc3RhYmxlLCBhbGwgcGF0Y2hlcwo+Pj4g
cGF0Y2hlcyBiaW5kaW5ncyBjaGVja3MgYW5kIG5vbmUgaXMgY3JpdGljYWwgc2luY2UgaXQgbWFp
bmx5IHRvdWNoZXMKPj4KPj4gWW91IHNlbnQgeW91ciBwdWxsIHZlcnkgbGF0ZSwganVzdCBiZWZv
cmUgdjcuMSwgYW5kIHNraXBwaW5nIGxhdGUKPj4gcG9zdGluZyBpcyBub3QgYSBuZXcgcnVsZS4g
SXQgd2FzIGFsd2F5cyBnb2luZyBsYXRlIHB1bGxzLCB3aGljaCBtaWdodAo+PiBtYWtlIGl0IG9y
IG1pZ2h0IG5vdCBtYWtlIGl0Lgo+Pgo+Pj4gbmV3IHBsYXRmb3JtcyBhbmQgdGhlIGluY3JpbWlu
YXRlZCBjb21taXQgaXMgYSBsb3cgcHJpb3JpdHkgZml4IGZvcgo+Pj4gMTB5IG9sZCBkZXZlbG9w
bWVudCBib2FyZHMuLi4KPj4KPj4gSSBkaWQgbm90IGNoZWNrIHdoaWNoIGNvbW1pdCB3YXMgbm90
IGluIG5leHQuIFlvdSBjYW4gcHJvdmlkZSBmZWVkYmFjawo+PiB0byBteSByZXBseSB3aXRoIGFj
dHVhbCBhcmd1bWVudCwgYmVjYXVzZSBzdWNoIGV4cGxhbmF0aW9uIHdhcyBtaXNzaW5nCj4+IGlu
IHRhZy4gSW5zdGVhZCB5b3UgZGVjaWRlZCB0byBiZSBzdXJwcmlzZWQgdGhhdCBwYXRjaGVzIG5l
ZWRzIHRvIGJlIGluCj4+IG5leHQuLi4KPj4KPiAKPiBBbmQgdG8gY2xhcmlmeSwgSSBkaWQgbm90
IHNheSB0aGF0IHB1bGwgd2lsbCBub3QgbWFrZSBpdC4gQ29uc2lkZXJpbmcKPiB0aGUgdGltZWxp
bmU6Cj4gMS4gWW91IHNlbnQgdGhlIHB1bGwgb24gMTB0aCBBcHJpbCwgRnJpZGF5Cj4gMi4gdjcu
MSBpcyByZWxlYXNlZCBvbiAxM3RoIEFwcmlsLCBTdW5kYXkKClN0b3AgdGhpcyBub25zZW5zZSwg
dGhlcmUncyBhIHZlcnkgaGlnaCBwcm9iYWJpbGl0eSByZWxlYXNlIGFyZSBkb25lIGFmdGVyIHJj
NywKYnV0IGl0J3Mgbm90IGEgc3RyaWN0IHJ1bGUgYXQgYWxsLgoKPiAKPiBhbmQgdGhhdCBwZW9w
bGUgYXJlIGFsbG93ZWQgdG8gdGFrZSB3ZWVrZW5kcyBvZmYsIHRoZW4gdGhlcmUgaXMgc2ltcGx5
Cj4gYWxtb3N0IG5vIHdheSB0aGF0IHB1bGwgY2FuIGJlIG1lcmdlZCBiZWZvcmUgdjcuMSBpcyBy
ZWxlYXNlZCwgc28gYnkKPiBkZWZpbml0aW9uIGl0IGlzIGEgKmxhdGUgcHVsbCouIFRoZSBwb2xp
Y3kgZm9yIGxhdGUgcHVsbHMsIGxpa2UgdGhhdCwKPiBkaWQgbm90IGNoYW5nZS4KPiAKPiBMYWNr
IG9mIGV4cG9zdXJlIG9mIGEgZmV3IGNvbW1pdHMgdG8gbGludXgtbmV4dCBpcyBvbmx5IHRoZSBl
eHBsYW5hdGlvbgo+IHdoeSBJIGRpZCBub3QgcHVsbCBpdCB3aGlsZSBkb2luZyBsYXN0IHJvdW5k
IG9mIHB1bGxzLgo+IAo+IEZlZWwgZnJlZSB0byBpZ25vcmUgdGhhdCBleHBsYW5hdGlvbiBhbmQg
dGFrZSBvdGhlciBvbmU6IGF2b2lkIHNlbmRpbmcKPiBwdWxscyBhIG9uZSB3b3JraW5nIGRheSBi
ZWZvcmUgbmV3IHJlbGVhc2UsIGJlY2F1c2UgaXQgaXMgY29uc2lkZXJlZCBhCj4gbGF0ZSBwdWxs
LgoKSSB1bmRlcnN0b29kIHlvdXIgZXhwbGFuYXRpb24sIGNyeXN0YWwgY2xlYXIuCgpOZWlsCgo+
IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
