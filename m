Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1EAEBFD0B
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2026 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbbRr5UyUHRg4VMjLO55bdh6R9FDMfoyigEGZSqvnk0=; b=gVx7j1M+uZugUOeVgH129EBnKp
	j4wmCGMO2Jo5X6I30soqSSOtGTDzzpx9Gs4PP5E844eO6f7rfKaD3n/iV6cNbGEFB7Zl7Du1c0A1V
	MNbx5CLU6psVgviGw/y8JacUWrnSURIgDXCCdli+RREmsVSAlrHeO2qFFRyflQ8DTLewZz4OPch98
	76moNLzu+EYnUnmwWoMa7xtOsQpxtZ0IkHt2Ts+ZQks/8FrmK9wNtNTrrdzWBVzrkolo0Qcnoi/O1
	46/RV+urQLpGnri31w7hjo2bg0chKULxaGgAaV1LgT8iKlaWQrePpPEhUsVUUGiDq5CRBBWEY6u+p
	E5N0wvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBiN-0000000F9KX-2MIY;
	Mon, 13 Apr 2026 07:28:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBiM-0000000F9Jo-26BO
	for linux-amlogic@bombadil.infradead.org;
	Mon, 13 Apr 2026 07:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=Cx2a1IZxvXHDsI/lPp8GVBpoyU8uNZ4jofzPVCpCBPc=; b=jW52R2rdkkcDSIvECX9ZdgvGzN
	FSOfesiy4/QBW8SLE3s7G+NU117uyaGk9auHG52wsDroQ2tEokLX2sGe6HHqzpwctGDvivuUoPxW/
	QckoZfrlPgiKV8CqBuMkKOQr9/EFOs3cel3KB8j5+/S0iJdiflODA593a3Hy6xFXhCWxgx1u2B27Z
	8ulnog2LRR4Mau6QphnsxP4LVO/v+3OvsOVCjotfP9QnuQTHLPp3Qmrd04I+2JzXFqKogQYKThaOd
	ROw717aljKlFLavL47O64gkm+VcXGueLCZgOMqXTXAyPzUlB5wMry6TS6+dIkXdQ+AZZOgGJgc8TL
	ln7m8owQ==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBiG-0000000GHJN-0aAU
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Apr 2026 07:28:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488b150559bso31883075e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Apr 2026 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776065282; x=1776670082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx2a1IZxvXHDsI/lPp8GVBpoyU8uNZ4jofzPVCpCBPc=;
        b=ec5Gs+mCvXUI7ydtJsoWH3Q2gc4VshJG6LZf1XTigjN6Rr1EmW1UZvPd3vH2MMedcu
         9ReYJ4S8d7SSxzGsa7SFzicXvYZR9nf5Ax6vFFNsnYD2dQcMnIIHd+LXw9uRON5q0L22
         Y9A7B692R4ojFzVUDS0ZhYOd60e+gbwxXUoeUwxXsEYGVHr8FodKHlwpTHCGogrhXaYD
         iXR0ip1AzR/ZWKIfupVfs5S44etX2TZpmekNC8G7m3061NwRrdN5feJs88lzkc96526t
         iXiQ+CRxkhNIi90PnEvj/X6UVk+fxpWsggXcvZaTvklSZ3F7W6yPo6pKm5UHgrDtpy9k
         Lk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065282; x=1776670082;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx2a1IZxvXHDsI/lPp8GVBpoyU8uNZ4jofzPVCpCBPc=;
        b=f6JbGaW3zYEr2eFRF8X5Yhp5uD+DMru7QA8yYAJBGC+T8mf68HBXS51FySLUI+UGW7
         RmBAWhQ1zulWMqI68Ufps6BdmMJXErd+nxAWLMSjqVdSKimPhFpt5+bnrzmoBc5ppRP0
         LrEvQXXtcgOaPI8BNTqZrOqJhRrUAMOS+kPN9m6vsM6EBvgbiI2dph/1fBvywLtHFVpN
         DPhAY/Ymjb1ZMLODL4G/l4UsZTxt3EZoYUlxf77pWOHU2Qk1PwAVOfDPV/4bHSpKjxFu
         tXPm9YSg8st0/lx4XAGsEAAyv0E2aiAvHBineX6ud+1OurPc1ZG7UKwY1GXkp/V9o7FG
         NnkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+R0uc3p7vc4mVgCudaLBDYo0apCCEeM56T9tVUOAoagXFPicIlplxRvIOvfwaRcofBhsWc2aYU+oTsVR0p@lists.infradead.org
X-Gm-Message-State: AOJu0YxL5oF5OWlK1IBbvhxZ/sSQ3Kpi8kQBPL6xZmsm+dJKADJVZcV6
	+wfqc8PX/O0kVMpRuOg/zQhWLOUdTtoK/lX5H0MxmbNPqOA3XgZXPgF/TbgLgrG0w2Q=
X-Gm-Gg: AeBDieuf4koCjPOjaulrK8FVPvGIHO5Wz8o9Hwqu/zRcMK8v9I3Icnpt+TCojkpqyym
	nTUBJ1oDuUS/XDn2JRxqRMQaOCVO6Qp6ybQcDhS+8UFAIxqx68D9QfLazKeodkLV0I6FKS3Pvzf
	y0B5WlNwHnFrBZXFtkPCnKHSybHA0V+JWLe7sJKpOKKmjkbkr/8zLgi5knXrGClQGRAGqyEPaop
	MzCYrukCMAyL7xvGMDmSEaf9grhniB1EF2b1i/DVXxHZq9p5dMUOOBuukb8hDZW4c1F8Ttz5vXf
	3aW13zE1eV0tPxin6IMtsqSd81o8ziV1ivbjh/VSngPPWatYq22jhnaRjpv6WA1Uqx9Bm+JvA+D
	Y8fyLSdOIqTb8anOmVlxbBcZdiwLZJmfcuDP/fkIAt/jdUPLqqiC/Gu34Kc6yudWlTFpUBEJJfc
	IMTDR3UJkrF4RIhuKb/0KUnHYXlWpoJIElOx3sAlD1a3tvEuBqNWXfuECLGcrlWWDUIhN5qCrme
	/Idx8jIfsRsbkBxk8I=
X-Received: by 2002:a05:6000:2888:b0:43b:3d44:6624 with SMTP id ffacd0b85a97d-43d6427bad1mr17588580f8f.2.1776065281560;
        Mon, 13 Apr 2026 00:28:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm32927373f8f.2.2026.04.13.00.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:28:00 -0700 (PDT)
Message-ID: <96c11b9a-9494-40ae-97c4-af27a721df0c@linaro.org>
Date: Mon, 13 Apr 2026 09:27:59 +0200
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
In-Reply-To: <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_082804_604902_D5FD8167 
X-CRM114-Status: GOOD (  21.67  )
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

T24gNC8xMy8yNiAwOToxNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMy8wNC8y
MDI2IDA5OjEwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gT24gNC8xMS8yNiAxMTozMiwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIEZyaSwgQXByIDEwLCAyMDI2IGF0IDEwOjUw
OjU4QU0gKzAyMDAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gSGVy
ZSdzIHRoZSBBbWxvZ2ljIEFSTTY0IERUIGNoYW5nZXMgZm9yIHY3LjEsIGluY2x1ZGluZyBhIGJ1
bmNoIG9mIGZpeGVzCj4+Pj4gYW5kIGltcHJvdmVtZW50cyBmb3IgdGhlIEtoYWRhcyBWSU00IGFu
ZCBWSU0xcyBTQkNzLCBwbHVzIHNvbWUgYWRkaXRpb25zCj4+Pj4gZm9yIHRoZSBQaGljb21tIE4x
IGFuZCBhIGNvdXBsZSBvZiBsb3cgcHJpb3JpdHkgZml4ZXMuCj4+Pj4KPj4+PiBUaGFua3MsCj4+
Pj4gTmVpbAo+Pj4+Cj4+Pj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2ZGUy
M2Y4MWE1ZTA4YmU4ZmJmNWU4ZDdlOWZlYmM3MmE1YjVmMjdmOgo+Pj4+Cj4+Pj4gICAgIExpbnV4
IDcuMC1yYzEgKDIwMjYtMDItMjIgMTM6MTg6NTkgLTA4MDApCj4+Pj4KPj4+PiBhcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPj4+Pgo+Pj4+ICAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hbWxvZ2ljL2xpbnV4LmdpdCB0YWdz
L2FtbG9naWMtYXJtNjQtZHQtZm9yLXY3LjEKPj4+Pgo+Pj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byA0MDFlNWM3M2VlZGRlODIyNWU4N2JkMTFjNzk0Yjg0MDkyNDhmZjQxOgo+Pj4+
Cj4+Pj4gICAgIGFybTY0OiBkdHM6IG1lc29uLWd4bC1wMjMwOiBmaXggZXRoZXJuZXQgUEhZIGlu
dGVycnVwdCBudW1iZXIgKDIwMjYtMDQtMDggMTQ6Mjc6MjAgKzAyMDApCj4+Pgo+Pj4gRGF5cyBp
biBsaW51eC1uZXh0Ogo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+Pj4gICAgMSB8ICsrKysrKysrICg4KQo+Pj4gICAgLi4uCj4+Pgo+Pj4gU28gYSBmZXcgdGhp
bmdzIHdlcmUganVzdCBhcHBsaWVkLCB1bmxlc3MgdGhpcyB3YXMgcmViYXNlZD8KPj4KPj4gVGhp
cyBvbmUgaGFzIGJlZW4gYXBwbGllZCBsYXRlbHksIGJ1dCB0aGlzIGlzIG5ld3MgZm9yIG1lLCBJ
IGFsd2F5cyB0b29rCj4+IGluIGFjY291bnQgdGhlIHRpbWUgc3BlbnQgaW4gdGhlIGxpc3RzLCBu
b3QgaW4gbGludXgtbmV4dC4KPj4gSSBtYWRlIHN1cmUgdGhpcyBvbmUgbGFuZGVkIGF0IGxlYXN0
IG9uY2UgaW4gLW5leHQgdG8gdHJpZ2dlciBDSXMuCj4+Cj4+IFNvIGlmIHRoZXJl4oCZcyBuZXcg
cnVsZXMsIHdlIHNob3VsZCBiZSBtYWRlIGF3YXJlIG9mIHRob3NlLgo+IAo+IEhvdyBpcyBpdCBh
IG5ldyBydWxlPyBMaW51cyBwb3N0aW5nIGZyb20gMjAyMzoKPiAKPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvQ0FIay09d2dYRFRmV0Zibi00ODE9aXQ2V19CMEtUUXNPaGRnWEw2bXdlVm02
ZXd0U3ZBQG1haWwuZ21haWwuY29tLwo+IAo+IFBsdXMgdGhpcyBpcyBzaW1wbHkgbG9naWMgLSB3
aHkgc29jIHRyZWUgc2hvdWxkIGJlIHRoZSBmaXJzdCB0cmVlCj4gZXhwb3NlZCB0byBpbnRlZ3Jh
dGlvbiBpc3N1ZXMgYW5kIHJvYm90IHJlcG9ydHM/IElmIHNvYyB0cmVlIG1lcmdlcwo+IHN0dWZm
IHdoaWNoIHdhcyBub3Qgb24gbmV4dCwgYWxsIHN1Y2ggcmVwb3J0cyB3aWxsIGJlIGFwcGxpY2Fi
bGUgdG8gc29jCj4gdHJlZSBhcyB3ZWxsLiBUaGF0J3Mgbm90aGluZyBuZXcgYWJvdXQgdGhpcy4K
CjEpIEl0IHdhcyBpbiBuZXh0CjIpIE15IHRyZWUgaXMgY2xlYW4sIHJldmlldyBhbmQgYmluZGlu
Z3MgYXJlIHRlc3RlZAozKSBNeSBQUiBpcyBhIG1pbm9yIFBSLCBsb3cgcHJpb3JpdHkgY2hhbmdl
LCBsb3cgaW1wYWN0LCBubyByaXNrCgpUaGVyZSdzIHN0aWxsIHBlb3BsZSBzZW5kaW5nIGNvbW1p
dHMgdG8gTGludXggd2hpY2ggZGlkbid0IGV2ZW4gZ28gdG8gdGhlIGxpc3RzLApzbyBpdCdzIGly
cmVsZXZhbnQgdG8gYXBwbHkgdGhpcyB2YWd1ZSBydWxlIHRvIG1lIGluIGEgc3RyaWN0IHdheSB3
aXRoIG5vdCByZWFzb25pbmcuCgo+IAo+Pgo+Pj4KPj4+IEkgd2lsbCB3YWl0IHdpdGggdGhpcy4g
SXQgbWlnaHQgbWlzcyB0aGUgbWVyZ2Ugd2luZG93IGlmIHY3LjAgaXMKPj4+IHJlbGVhc2VkIHRo
aXMgd2Vla2VuZC4KPj4KPj4gT2sgd293LCBqdXN0IGxpa2UgdGhhdC4uLiBJIG1lYW4gdGhlIGFt
bG9naWMgRFQgaXMgc3RhYmxlLCBhbGwgcGF0Y2hlcwo+PiBwYXRjaGVzIGJpbmRpbmdzIGNoZWNr
cyBhbmQgbm9uZSBpcyBjcml0aWNhbCBzaW5jZSBpdCBtYWlubHkgdG91Y2hlcwo+IAo+IFlvdSBz
ZW50IHlvdXIgcHVsbCB2ZXJ5IGxhdGUsIGp1c3QgYmVmb3JlIHY3LjEsIGFuZCBza2lwcGluZyBs
YXRlCj4gcG9zdGluZyBpcyBub3QgYSBuZXcgcnVsZS4gSXQgd2FzIGFsd2F5cyBnb2luZyBsYXRl
IHB1bGxzLCB3aGljaCBtaWdodAo+IG1ha2UgaXQgb3IgbWlnaHQgbm90IG1ha2UgaXQuCgpZZXMg
SSd2ZSBiZWVuIGxhdGUsIG15IGJhZCwgbm90IHRoZSBmaXJzdCB0aW1lLCBuZXZlciBiZWVuIHJl
amVjdGVkIGJlZm9yZSBmb3IgdGhhdC4KCj4gCj4+IG5ldyBwbGF0Zm9ybXMgYW5kIHRoZSBpbmNy
aW1pbmF0ZWQgY29tbWl0IGlzIGEgbG93IHByaW9yaXR5IGZpeCBmb3IKPj4gMTB5IG9sZCBkZXZl
bG9wbWVudCBib2FyZHMuLi4KPiAKPiBJIGRpZCBub3QgY2hlY2sgd2hpY2ggY29tbWl0IHdhcyBu
b3QgaW4gbmV4dC4gWW91IGNhbiBwcm92aWRlIGZlZWRiYWNrCj4gdG8gbXkgcmVwbHkgd2l0aCBh
Y3R1YWwgYXJndW1lbnQsIGJlY2F1c2Ugc3VjaCBleHBsYW5hdGlvbiB3YXMgbWlzc2luZwo+IGlu
IHRhZy4gSW5zdGVhZCB5b3UgZGVjaWRlZCB0byBiZSBzdXJwcmlzZWQgdGhhdCBwYXRjaGVzIG5l
ZWRzIHRvIGJlIGluCj4gbmV4dC4uLgoKTm8sIEknbSBzdXJwcmlzZWQgYmVjYXVzZSB0aGVyZSdz
IHN0aWxsIGEgbG90IG9mIHN1YnN5c3RlbXMgbm90IGluIC1uZXh0CmFuZCBJJ3ZlIGFsd2F5cyBt
YWRlIHN1cmUgbXkgdHJlZSB3ZXJlIGluIG5leHQgYmVmb3JlIHNlbmRpbmcgUFJzLCB3ZXJlCmJ1
aWxkaW5nIHByb3Blcmx5IHdpdGggbm8gd2FybmluZyBhbmQgYmluZGluZ3MgY2hlY2tlZC4KCk5l
aWwKCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
