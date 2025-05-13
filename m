Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07D9C3ABCC
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 May 2025 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAcK+BtYJQdAZWfoC/A/7WMYEZx7JVOu3r5KC5wiBXg=; b=aN3Qx4M/WAJjXNEDiOCRhs7Dwo
	C1a4UamWhEBWXmC2iVR/S+qYezOqcKPth547IueJXpoeVmdyV/aHj+sv7UmmstCoEzq0xblLRg6q7
	yWnXitnCqxWnK7TlYA2jr0KCfbIedDcUDmttx/t0Mk2BI4v87NyQ4IQJ6tJssX2t0RcK4JhCdJ+9o
	dy7uTarXFchrolxk3LGhQInAqK7UfD1OMhpT5uUlxft4fP5SzZZXEeGutTeaH6hdEeXt92hVRKXQa
	fbzMQX4mp26RBZsBvr0SpXAPD2Bj915ce3m35JlsPDt0ZMIyqQakmPNqxy33+clW/PlYAjm45RDzr
	MbVN1tPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEryr-0000000CrH9-3c0q;
	Tue, 13 May 2025 15:55:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEryo-0000000CrFj-2phL
	for linux-amlogic@lists.infradead.org;
	Tue, 13 May 2025 15:55:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so33696005e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 May 2025 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747151741; x=1747756541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hraPAlVA6BtCdVBhxio5JSA2L2Pxes4RZggz7DCbmcA=;
        b=aTa9+wvdx/oNoE7iXi/LFFZEzmQ9AbQ5/Sx+B+8eDS2SQmX9Vn07xBe7Xeygbhl60T
         LIcTeDNz4c4Tpz8CmD5f3odzHlyJvo6QjceMiRQyDIQAPG7R8vcHAIvgRdSwph4j6vNH
         Feb5OROOg0Oa7d7rP+DaSn9OD6ZPyXX5RFn0YqwXuVzxRgNyUIQ+M8PG+NyDTCSMZIwv
         NKy7VE5dx8fOSw4rjumCM3eNJc+EjMP2963LIkS7sHhsJfPYeOByXyLiCjFPvX36SVqC
         QeozI2nD08NB3YsnTcHsUShB9P+9ihhw3MIpWD4QFxwTokCTBevoKKp0BuQlVujB2l12
         10Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151741; x=1747756541;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hraPAlVA6BtCdVBhxio5JSA2L2Pxes4RZggz7DCbmcA=;
        b=ToNJS9/p3FWdFShL1cPhWHAiHNKn/BFf4kUUutb8sGwXDoemZStJHyzLnTEGC/ceVo
         5fXVCOUvjkav+Kq9UsMOgXQg+5StBCR5Xpot+6agNshC7n9rnSRY1kNGvDl3rNzkrv+b
         F8rxU9k30w8Idy6N3zzrEy1uphk4zv03X0gShn5LFBiBrCXOueRpSBg4aSvVnlPvplqn
         44qxC8MZVbz4JJAsu63gwSk9pzbShHMediQfjZl0u2Gvh6k11tcJCpWmhe0H/WwOH7Hf
         wFpA8c1PlRY8Z5aCVNt6KOP/W+BDRzBBE//BMU8nDO/iJTaQAJO8atAsYWD6UwN0GQs5
         +VvA==
X-Forwarded-Encrypted: i=1; AJvYcCXxT7R0Fpil2et+HaE/iysnXqoYn/C0CGL04Z772Mtr8rPtAzc62t68OjeiVabLytFSdTmE3tidV34PfR3R@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7cA744GVFJGZANzOzQS9efLJdU8ms8thNIICa1rsksbduI8Go
	7C4+0R+lOOld+WyhhlgL7BHySxHFedi+/W8s2uTpY/4t/B+UI2awCgOyTRrQlQA=
X-Gm-Gg: ASbGncuRbBqhX4iQ4yOAdaVxiuXK2eTFyzHVPzsPtk1Li/qbfgdw6vpBoXeOfFun7gP
	X30k/hFfewatITX6rutFYJwDycAhIQ4XWxSuAc52JRlxp8XnVwLV1G0H2qO/BE3odlwUvgh0QhG
	pdbs7uYx49Q/UbheGvI28GXOa1slfDceGA3Z9nmJkHLxAbPV4KHy28uMT9/2k2cv9SRKzUR07DN
	Hyw7VqS8opLYiWqJ4nknQnjU7Fm4dMIoNAzGm1rdK9Vw4zYSPygfAhfY4nDCaFBsNiTc3B4HEMu
	sMe4Ket/OwUzfWngZ/i6+5nNyb8AriWMpGEKfqhZWpWOZwJoredKMHcT3JWajqy4Muiop7sdbay
	YLEnoWq8uGR4rBS/rYirpqGA=
X-Google-Smtp-Source: AGHT+IEsyluhpdUeyif3Ngd/ehW9ch6ZNKiHvT0522EK1VSzg20AmctXdpF2lUykleTEOTSKiVXBbw==
X-Received: by 2002:a05:600c:4e48:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-442d6ddd1e1mr154860845e9.29.1747151737648;
        Tue, 13 May 2025 08:55:37 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32835dsm217742585e9.6.2025.05.13.08.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:55:37 -0700 (PDT)
Message-ID: <919fa7f1-d198-429b-8f31-70f085a4c79f@linaro.org>
Date: Tue, 13 May 2025 17:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: amlogic: Synchronous Abort with v6.15-rc6
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, sboyd@kernel.org,
 daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 lumag@kernel.org, robdclark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
 <b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
 <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
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
In-Reply-To: <714a719a-9e56-4158-a8ce-118b7ddb97b3@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_085542_724112_E70967DE 
X-CRM114-Status: GOOD (  16.10  )
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

T24gMTMvMDUvMjAyNSAxNjoyNiwgVmlnbmVzaCBSYW1hbiB3cm90ZToKPiBIaSBOZWlsLAo+IAo+
IE9uIDEzLzA1LzI1IDE1OjI1LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+PiBI
aSwKPj4KPj4gT24gMTMvMDUvMjAyNSAxMTo0MSwgVmlnbmVzaCBSYW1hbiB3cm90ZToKPj4+IEhp
LAo+Pj4KPj4+IFRoZSBBbWxvZ2ljIE1lc29uIEcxMkIgKEEzMTFEKSBTb0MgYm9hcmQgKG1lc29u
LWcxMmItYTMxMWQta2hhZGFzLSB2aW0zKSBmYWlscyB0byBib290IHdpdGggdGhlIGZvbGxvd2lu
ZyBsb2dzLAo+Pj4KPj4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aWduZXNocmFt
YW4vbGludXgvLS9qb2JzLzc2MjEwMjAwCj4+Pgo+Pj4gMDI6NTg6MjcuODE5OiBTdGFydGluZyBr
ZXJuZWwgLi4uCj4+PiAwMjo1ODoyNy44MTk6ICJTeW5jaHJvbm91cyBBYm9ydCIgaGFuZGxlciwg
ZXNyIDB4OTYwMDAwMTAsIGZhciAweDUxMDAwZDgKPj4+IDAyOjU4OjI3LjgxOTogIlN5bmNocm9u
b3VzIEFib3J0IiBoYW5kbGVyLCBlc3IgMHg5NjAwMDAxMCwgZmFyIDB4NTEwMDBjOAo+Pj4gMDI6
NTg6MjcuODE5OiBlbHI6IDAwMDAwMDAwMDEwMDJhNDggbHIgOiAwMDAwMDAwMDAxMDAyYzg4IChy
ZWxvYykKPj4+IDAyOjU4OjI3LjgxOTogZWxyOiAwMDAwMDAwMGYyZjI2YTQ4IGxyIDogMDAwMDAw
MDBmMmYyNmM4OAo+Pj4gMDI6NTg6MjcuODE5OiB4MCA6IDAwMDAwMDAwMDUwZmZmYzAgeDEgOiAw
MDAwMDAwMDAxMDA0MzgzCj4+PiAwMjo1ODoyNy44MTk6IHgyIDogMDAwMDAwMDBmMmY2YTM1OCB4
MyA6IDAwMDAwMDAwMDAwMDAwM2YKPj4+IDAyOjU4OjI3LjgxOTogeDQgOiAwMDAwMDAwMGY0ZmVm
ZmZjIHg1IDogMDAwMDAwMDAwMDAwMDAxMAo+Pj4gMDI6NTg6MjcuODE5OiB4NiA6IDAwMDAwMDAw
ZjRlNWIwMDAgeDcgOiAwMDAwMDAwMDA1MGZmZmEwCj4+PiAwMjo1ODoyNy44MTk6IHg4IDogMDAw
MDAwMDAwMDAwMDAwOCB4OSA6IDAwMDAwMDAwMDAwMDAwMDEKPj4+IDAyOjU4OjI3LjgyMDogeDEw
OiAwMDAwMDAwMDAwMDAwMDEwIHgxMTogMDAwMDAwMDAwMDAwMDAwNAo+Pj4gMDI6NTg6MjcuODIw
OiB4MTI6IDAwMDAwMDAwZjRmZWZjMDAgeDEzOiAwMDAwMDAwMDAwMDAwMDAwCj4+PiAwMjo1ODoy
Ny44MjA6IHgxNDogMDAwMDAwMDBmNGZlZmMwMCB4MTU6IDAwMDAwMDAwMDAwMDAwMDAKPj4+IDAy
OjU4OjI3LjgyMDogeDE2OiAwMDAwMDAwMGYyZjZkMGUwIHgxNzogMDAwMDAwMDAwMGMwYzBjMAo+
Pj4gMDI6NTg6MjcuODIwOiB4MTg6IDAwMDAwMDAwZjBmMjFkOTAgeDE5OiAwMDAwMDAwMDA1MGZm
ZmMwCj4+PiAwMjo1ODoyNy44MjA6IHgyMDogMDAwMDAwMDAwMDAwMDAwMCB4MjE6IDAwMDAwMDAw
N2ZmZTkwMDAKPj4+IDAyOjU4OjI3LjgyMDogeDIyOiAwMDAwMDAwMDAwMDAxNzEwIHgyMzogMDAw
MDAwMDBmMGYwZThjMAo+Pj4gMDI6NTg6MjcuODIwOiB4MjQ6IDAwMDAwMDAwMDAwMDAwMDAgeDI1
OiAwMDAwMDAwMDAwMDAwMDAwCj4+PiAwMjo1ODoyNy44MjA6IHgyNjogMDAwMDAwMDAwMDAwMDAw
MCB4Mjc6IDAwMDAwMDAwMDAwMDAwMDAKPj4+IDAyOjU4OjI3LjgyMDogeDI4OiAwMDAwMDAwMGYw
ZjRmNzkwIHgyOTogMDAwMDAwMDAwNTBmZmY2MAo+Pj4gMDI6NTg6MjcuODIwOiBDb2RlOiBhOTAy
NWJmNSBmOTAwMWJmNyBmOTQwMDY0MSAzNjAwMDE0MSAoZjk0MDg2NjMpCj4+PiAwMjo1ODoyNy44
MjA6IFJlc2V0dGluZyBDUFUgLi4uCj4+Pgo+Pgo+PiBDb3VsZCB5b3UgYm9vdCB3aXRoIGVhcmx5
Y29uIGVuYWJsZWQgdG8gYXQgbGVhc3QgaGF2ZSBhIGNsdWUgb2Ygd2hhdCdzIGhhcHBlbmluZyA/
Cj4gCj4gVGhlcmUgaXMgYSBzeW5jaHJvbm91cyBhYm9ydCByaWdodCBhZnRlciAnU3RhcnRpbmcg
a2VybmVsLi4uJy4gTWF5YmUgdGhpcyBwcmV2ZW50cyBhbnkgZWFybHkgY29uc29sZSBsb2dzIGZy
b20gYXBwZWFyaW5nLgo+IAo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aWduZXNo
cmFtYW4vbGludXgvLS9qb2JzLzc2MjQzNDU1Cj4gCj4gMTM6NTQ6MDIuMDEzOiA9PiBzZXRlbnYg
Ym9vdGFyZ3MgJ2NvbnNvbGU9dHR5QU1MMCwxMTUyMDBuOCByb290PS9kZXYvbmZzIHJ3IG5mc3Jv
b3Q9MTkyLjE2OC4yMDEuMTovdmFyL2xpYi9sYXZhL2Rpc3BhdGNoZXIvdG1wLzE4NjQxNjY1L2V4
dHJhY3QtbmZzcm9vdGZzLWgyZmpzbWRjLHRjcCxoYXJkLHYzIGluaXQ9L2luaXQgcm9vdHdhaXQg
dXNiY29yZS5xdWlya3M9MGJkYTo4MTUzOmsgZWFybHljb249bWVzb24sMHhmZjgwMzAwMCBrZWVw
X2Jvb3Rjb27CoCBpcD1kaGNwJwo+IDEzOjU0OjAyLjAxNDogJCBib290aSAweDEwODAwMDAgLSAw
eDEwMDAwMDAKPiAxMzo1NDowMi4wMTQ6ID0+IGJvb3RpIDB4MTA4MDAwMCAtIDB4MTAwMDAwMAo+
IDEzOjU0OjAyLjAxNDogTW92aW5nIEltYWdlIGZyb20gMHgxMDgwMDAwIHRvIDB4MTIwMDAwMCwg
ZW5kPTUxNjAwMDAKPiAxMzo1NDowMi4wMTQ6ICMjIEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9i
IGF0IDAxMDAwMDAwCj4gMTM6NTQ6MDIuMDE0OsKgwqDCoCBCb290aW5nIHVzaW5nIHRoZSBmZHQg
YmxvYiBhdCAweDEwMDAwMDAKPiAxMzo1NDowMi4wMTQ6IFdvcmtpbmcgRkRUIHNldCB0byAxMDAw
MDAwCj4gMTM6NTQ6MDIuMDE0OiBFUlJPUjogcmVzZXJ2aW5nIGZkdCBtZW1vcnkgcmVnaW9uIGZh
aWxlZCAoYWRkcj01MDAwMDAwIHNpemU9MzAwMDAwIGZsYWdzPTQpCj4gMTM6NTQ6MDIuMDE0OsKg
wqDCoCBMb2FkaW5nIERldmljZSBUcmVlIHRvIDAwMDAwMDAwN2ZmZTkwMDAsIGVuZCAwMDAwMDAw
MDdmZmZmNTdjIC4uLiBPSwo+IDEzOjU0OjAyLjAxNDogV29ya2luZyBGRFQgc2V0IHRvIDdmZmU5
MDAwCj4gMTM6NTQ6MDIuMDE0OiBTdGFydGluZyBrZXJuZWwgLi4uCj4gMTM6NTQ6MDIuMDE0OiAi
U3luY2hyb25vdXMgQWJvcnQiIGhhbmRsZXIsIGVzciAweDk2MDAwMDEwLCBmYXIgMHg1MTAwMGQ4
Cj4gMTM6NTQ6MDIuMDE0OiAiU3luY2hyb25vdXMgQWJvcnQiIGhhbmRsZXIsIGVzciAweDk2MDAw
MDEwLCBmYXIgMHg1MTAwMGM4Cj4gMTM6NTQ6MDIuMDE0OiBlbHI6IDAwMDAwMDAwMDEwMDJhNDgg
bHIgOiAwMDAwMDAwMDAxMDAyYzg4IChyZWxvYykKPiAxMzo1NDowMi4wMTQ6IGVscjogMDAwMDAw
MDBmMmYyNmE0OCBsciA6IDAwMDAwMDAwZjJmMjZjODgKPiAxMzo1NDowMi4wMTQ6IHgwIDogMDAw
MDAwMDAwNTBmZmZjMCB4MSA6IDAwMDAwMDAwMDEwMDQzODMKPiAxMzo1NDowMi4wMTQ6IHgyIDog
MDAwMDAwMDBmMmY2YTM1OCB4MyA6IDAwMDAwMDAwMDAwMDAwM2YKPiAxMzo1NDowMi4wMTQ6IHg0
IDogMDAwMDAwMDBmNGZlZmZmYyB4NSA6IDAwMDAwMDAwMDAwMDAwMTAKPiAxMzo1NDowMi4wMTQ6
IHg2IDogMDAwMDAwMDBmNGU1YjAwMCB4NyA6IDAwMDAwMDAwMDUwZmZmYTAKPiAxMzo1NDowMi4w
MTQ6IHg4IDogMDAwMDAwMDAwMDAwMDAwOCB4OSA6IDAwMDAwMDAwMDAwMDAwMDEKPiAxMzo1NDow
Mi4wMTQ6IHgxMDogMDAwMDAwMDAwMDAwMDAxMCB4MTE6IDAwMDAwMDAwMDAwMDAwMDQKPiAxMzo1
NDowMi4wMTQ6IHgxMjogMDAwMDAwMDBmNGZlZmMwMCB4MTM6IDAwMDAwMDAwMDAwMDAwMDAKPiAx
Mzo1NDowMi4wMTQ6IHgxNDogMDAwMDAwMDBmNGZlZmMwMCB4MTU6IDAwMDAwMDAwMDAwMDAwMDAK
PiAxMzo1NDowMi4wMTQ6IHgxNjogMDAwMDAwMDBmMmY2ZDBlMCB4MTc6IDAwMDAwMDAwMDBjMGMw
YzAKPiAxMzo1NDowMi4wMTQ6IHgxODogMDAwMDAwMDBmMGYyMWQ5MCB4MTk6IDAwMDAwMDAwMDUw
ZmZmYzAKPiAxMzo1NDowMi4wMTQ6IHgyMDogMDAwMDAwMDAwMDAwMDAwMCB4MjE6IDAwMDAwMDAw
N2ZmZTkwMDAKPiAxMzo1NDowMi4wMTQ6IHgyMjogMDAwMDAwMDAwMDAwMTcxMCB4MjM6IDAwMDAw
MDAwZjBmMGU4YzAKPiAxMzo1NDowMi4wMTQ6IHgyNDogMDAwMDAwMDAwMDAwMDAwMCB4MjU6IDAw
MDAwMDAwMDAwMDAwMDAKPiAxMzo1NDowMi4wMTQ6IHgyNjogMDAwMDAwMDAwMDAwMDAwMCB4Mjc6
IDAwMDAwMDAwMDAwMDAwMDAKPiAxMzo1NDowMi4wMTQ6IHgyODogMDAwMDAwMDBmMGY1NjZhMCB4
Mjk6IDAwMDAwMDAwMDUwZmZmNjAKPiAxMzo1NDowMi4wMTQ6IENvZGU6IGE5MDI1YmY1IGY5MDAx
YmY3IGY5NDAwNjQxIDM2MDAwMTQxIChmOTQwODY2MykKPiAxMzo1NDowMi4wMTQ6IFJlc2V0dGlu
ZyBDUFUgLi4uCgpJbiBmYWN0LCB0aGlzIGlzIGFuIFUtYm9vdCBmYXVsdCwgbm90IExpbnV4LiBJ
IGd1ZXNzIHBlcmhhcHMgdGhlIExpbnV4IGtlcm5lbCBpcyB0b28gYmlnLCBjYW4geW91IGNoZWNr
IHRoZSBzaXplIGRpZmZlcmVuY2Ugc2luY2UgdjYuMTQgPwoKPiAKPiBTdWNjZXNzZnVsIGxvZ3Mg
d2l0aCB2Ni4xNC1yYzcsCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpZ25lc2hy
YW1hbi9saW51eC8tL2pvYnMvNzYyNDgxNDMKPiAKPj4KPj4gQlBJLU0yUyAoQTMxMUQpIGlzIGJv
b3RpbmcgZmluZSBvbiB2Ni4xNS1yYywgc2VlIGh0dHBzOi8vZ2l0bGFiLmNvbS8gYW1sb2dpYy1m
b3NzL2FiY2QtbGludXgtdGVzdC8tL2pvYnMvMTAwMDQ5OTcwMzIKPj4KPj4gQnV0IHBlcmhhcHMg
c29tZXRoaW5nIHNwZWNpZmljIHRvIHRoZSBWSU0zIGlzIGJyZWFraW5nLCBkbyB5b3UgY2hhbmdl
IHRoZSBrZXJuZWwgY29uZmlnIGZvciB0aGUgRFJNID8KPiAKPiBZZXMsIHdlIGNoYW5nZSB0aGUg
Y29uZmlnLiBQbGVhc2Ugc2VlIHRoZSBjb25maWcgdXNlZCB0byBidWlsZCB0aGUga2VybmVsLAo+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aWduZXNocmFtYW4vbGludXgvLS9qb2Jz
Lzc2MjQzNDM5L2FydGlmYWN0cy9maWxlL2FydGlmYWN0cy90ZXN0aW5nOmFybTY0X2NvbmZpZwo+
IAo+IFJlZ2FyZHMsCj4gVmlnbmVzaAo+IAo+Pgo+PiBOZWlsCj4+Cj4+Cj4+PiBUaGUgYm9hcmQg
Ym9vdHMgc3VjY2Vzc2Z1bGx5IGluIHY2LjE0LXJjNywgYnV0IHRoZSBpc3N1ZSBhcHBlYXJzIHN0
YXJ0aW5nIGZyb20gdjYuMTUtcmMxLiBUaGVzZSB0ZXN0cyB3ZXJlIHJ1biBpbiBkcm0tY2kuCj4+
Pgo+Pj4gT24gYmlzZWN0aW5nIHRoZSBrZXJuZWwsIHRoZSBmaXJzdCBiYWQgY29tbWl0IGlkZW50
aWZpZWQgYnkgZ2l0IGJpc2NldCBpcywKPj4+Cj4+PiA1OWMzNTQxNmY0MjQ2YWVlNjZiNWY1NTIz
ZmRjOTUwYjgzMzI1ZDgyIGlzIHRoZSBmaXJzdCBiYWQgY29tbWl0Cj4+PiBjb21taXQgNTljMzU0
MTZmNDI0NmFlZTY2YjVmNTUyM2ZkYzk1MGI4MzMyNWQ4Mgo+Pj4gTWVyZ2U6IDQ3Mjg2M2FiMmFj
YSBlOTg4YWRjYjVkZWUKPj4+IEF1dGhvcjogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4
LWZvdW5kYXRpb24ub3JnPgo+Pj4gRGF0ZTrCoMKgIFNhdCBNYXIgMjkgMTc6MjM6MzQgMjAyNSAt
MDcwMAo+Pj4KPj4+IMKgwqDCoMKgIE1lcmdlIHRhZyAnY2xrLWZvci1saW51cycgb2YgZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC8ga2VybmVsL2dpdC9jbGsvbGludXgKPj4+Cj4+
PiBQbGVhc2UgY291bGQgeW91IGxvb2sgaW50byB0aGlzIGlzc3VlLiBUaGFuayB5b3UuCj4+Pgo+
Pj4gUmVnYXJkcywKPj4+IFZpZ25lc2gKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
