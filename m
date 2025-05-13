Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1B4C3ABC3
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 May 2025 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ic55jUgr7SvJ34AznUTLvKJSmi/qyyIay60vsafBZk4=; b=RovkDdD+D1m+xMcjzZRIRm0V8A
	Rfb6SkvN7lxcuXVipUR2wTwVq2Av+No9WUVElWSEfisqVYaQAdBA1O/QeNv/o7ZenfTcQ6gDGnSmF
	Y4wfrGzT0tPUKQ/9CVVNCYtiSwd9MvLl3zV2vroIxYIcR5qOE1I06zO+ojPyRXuHzasIJJrwAxbNx
	0oY5c7WGHEtrOtVB43BeZKoy9ctM7Z/SKJseVO68HCKiMmMAM6BCmSflWPGXEw1dXxBDfG9QDwRrr
	4Qt0iOy32ANesafOPhrOR4IOzZ91W32A71D/LgfwjH5CX4ucr1SyhDHIUVxk23ve9jRchYA2Epf0J
	Y6dDgDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmMQ-0000000BzQA-2Vqn;
	Tue, 13 May 2025 09:55:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmMN-0000000BzPT-28WQ
	for linux-amlogic@lists.infradead.org;
	Tue, 13 May 2025 09:55:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso36073375e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 May 2025 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130137; x=1747734937; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2a2UHdYAk58d8k4bpqZnst1+U78+dixXgzNfhERVMo=;
        b=vSn8cF8CO4WlloJPyX/SvL0A+4W97amU9uM1AJ7TGD1D6BBpRmDYhNR2SGbCssY5So
         V9ByjuAdrg9bTSmuNeSbm0CY0nurlQ+tTSOB5RL+99hv0utiIrKySQRIzm+Rlm3tTO26
         S3muQAfmM0I34aQmSxmPq0QJX08Abfz2B7U8i0ViDKb80JYi8Aw3h9bBagf0KRBdKS4+
         dY+vC7IeRlmUUzVLDz4A58ptqjak9gkzYk6Ta/QFiV9O+Mj39LhEefXdttQ4Z6tpJQGy
         ezbt50ITq0Bif66fr8KsrvRk863NQ92Ul/oGDyAjfHh9CnerOTKaEsVxQNCmZzf4MUPJ
         psqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130137; x=1747734937;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B2a2UHdYAk58d8k4bpqZnst1+U78+dixXgzNfhERVMo=;
        b=LOZsF1IytXSpJgOjzlxCbIzmMwFSL8/Q2a00iFatKtIh6M3Uj7xopyL161xeyXAkXj
         c7x5ouQD0OCEzI/oE5I2T4PI8CXoKBGtxMLIdDflEIO1A7cpfIUWx3hRSpdODO9iENYJ
         14XkpDfCKDMww1svn0xC8rRjveTyq/uKK1Xr521ua7QqO3YYZMQRHXYGvq9jUM5aE/in
         tAX1NrrXRIl1tJYQe/xGeQ+aBuhr+tpHQ93+/BTO2jPBTJb2sMxweLiybrNTMtqaxzsl
         RWJXqbfZnll2taxaSxu1tqXcy8E0NX9ZdY3ljHdCIUIY90Zkuj2e0WGQX3LTUNYB+prf
         +fsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX68UZ0trVXQGeKYgyu1IDJ5YkbvVaUNYNBuAFQwsnjB7Idt9FFSsCTKkpq1/xyctURft2Vr7VrBX3AdLDr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq7K28DXzwIVI667EYof2G0cMUCiWpbuWh0C3tLvXe751KnYHA
	exSz5Y86hLSXD8AqfC6WiyYyA9k5aUS1fe/zYnQqrMPS7CH3eUzwWncfjRM5Q68=
X-Gm-Gg: ASbGncuOQFvgclOO0QwHYlcog/82LtnLFpsrKjUE3p4FEiKcfpqN5alM6jXMdOFJHBd
	GKKR6gcBTwgBx0YWJ3+87siKQvZS8PeJa0RmtTctOWF/ucf3IKUOGilsQOaAmTivj3NwFebYuKQ
	OHwqPZ/J3FYOPqgT2R7YdNEjAh/2RZMz0yOH7LMiSMZNsCMP/ieVorMrCBup4gZEGO/eJUchNjc
	1AIIfFmh73YjwtyFgYLMMAORtpQ8DFOuS12DGBq8hr1YY5YDok3VRIC5ZlWWSKmM89TFMFBugq0
	iqhYnjUEz8nkguH5LvCaUIjnpuCULZmTMWMqZPDrZFYhKQufXK6rJxw+sDm+gZyKow9j1zQ27Go
	XfN6lH5kCbHH0
X-Google-Smtp-Source: AGHT+IHLCcNUV1+oQboYgA3SkbfN85gAOCapDtK/POQGga3hETjWJtXjQgemjr2/TZaqn6DWWyppTA==
X-Received: by 2002:a05:600c:6090:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-442d6d18bfamr148650455e9.5.1747130137461;
        Tue, 13 May 2025 02:55:37 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32835dsm205893815e9.6.2025.05.13.02.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:55:37 -0700 (PDT)
Message-ID: <b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
Date: Tue, 13 May 2025 11:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: amlogic: Synchronous Abort with v6.15-rc6
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, sboyd@kernel.org,
 daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 lumag@kernel.org, robdclark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
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
In-Reply-To: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_025539_566021_B4AAE055 
X-CRM114-Status: GOOD (  11.45  )
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

SGksCgpPbiAxMy8wNS8yMDI1IDExOjQxLCBWaWduZXNoIFJhbWFuIHdyb3RlOgo+IEhpLAo+IAo+
IFRoZSBBbWxvZ2ljIE1lc29uIEcxMkIgKEEzMTFEKSBTb0MgYm9hcmQgKG1lc29uLWcxMmItYTMx
MWQta2hhZGFzLXZpbTMpIGZhaWxzIHRvIGJvb3Qgd2l0aCB0aGUgZm9sbG93aW5nIGxvZ3MsCj4g
Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpZ25lc2hyYW1hbi9saW51eC8tL2pv
YnMvNzYyMTAyMDAKPiAKPiAwMjo1ODoyNy44MTk6IFN0YXJ0aW5nIGtlcm5lbCAuLi4KPiAwMjo1
ODoyNy44MTk6ICJTeW5jaHJvbm91cyBBYm9ydCIgaGFuZGxlciwgZXNyIDB4OTYwMDAwMTAsIGZh
ciAweDUxMDAwZDgKPiAwMjo1ODoyNy44MTk6ICJTeW5jaHJvbm91cyBBYm9ydCIgaGFuZGxlciwg
ZXNyIDB4OTYwMDAwMTAsIGZhciAweDUxMDAwYzgKPiAwMjo1ODoyNy44MTk6IGVscjogMDAwMDAw
MDAwMTAwMmE0OCBsciA6IDAwMDAwMDAwMDEwMDJjODggKHJlbG9jKQo+IDAyOjU4OjI3LjgxOTog
ZWxyOiAwMDAwMDAwMGYyZjI2YTQ4IGxyIDogMDAwMDAwMDBmMmYyNmM4OAo+IDAyOjU4OjI3Ljgx
OTogeDAgOiAwMDAwMDAwMDA1MGZmZmMwIHgxIDogMDAwMDAwMDAwMTAwNDM4Mwo+IDAyOjU4OjI3
LjgxOTogeDIgOiAwMDAwMDAwMGYyZjZhMzU4IHgzIDogMDAwMDAwMDAwMDAwMDAzZgo+IDAyOjU4
OjI3LjgxOTogeDQgOiAwMDAwMDAwMGY0ZmVmZmZjIHg1IDogMDAwMDAwMDAwMDAwMDAxMAo+IDAy
OjU4OjI3LjgxOTogeDYgOiAwMDAwMDAwMGY0ZTViMDAwIHg3IDogMDAwMDAwMDAwNTBmZmZhMAo+
IDAyOjU4OjI3LjgxOTogeDggOiAwMDAwMDAwMDAwMDAwMDA4IHg5IDogMDAwMDAwMDAwMDAwMDAw
MQo+IDAyOjU4OjI3LjgyMDogeDEwOiAwMDAwMDAwMDAwMDAwMDEwIHgxMTogMDAwMDAwMDAwMDAw
MDAwNAo+IDAyOjU4OjI3LjgyMDogeDEyOiAwMDAwMDAwMGY0ZmVmYzAwIHgxMzogMDAwMDAwMDAw
MDAwMDAwMAo+IDAyOjU4OjI3LjgyMDogeDE0OiAwMDAwMDAwMGY0ZmVmYzAwIHgxNTogMDAwMDAw
MDAwMDAwMDAwMAo+IDAyOjU4OjI3LjgyMDogeDE2OiAwMDAwMDAwMGYyZjZkMGUwIHgxNzogMDAw
MDAwMDAwMGMwYzBjMAo+IDAyOjU4OjI3LjgyMDogeDE4OiAwMDAwMDAwMGYwZjIxZDkwIHgxOTog
MDAwMDAwMDAwNTBmZmZjMAo+IDAyOjU4OjI3LjgyMDogeDIwOiAwMDAwMDAwMDAwMDAwMDAwIHgy
MTogMDAwMDAwMDA3ZmZlOTAwMAo+IDAyOjU4OjI3LjgyMDogeDIyOiAwMDAwMDAwMDAwMDAxNzEw
IHgyMzogMDAwMDAwMDBmMGYwZThjMAo+IDAyOjU4OjI3LjgyMDogeDI0OiAwMDAwMDAwMDAwMDAw
MDAwIHgyNTogMDAwMDAwMDAwMDAwMDAwMAo+IDAyOjU4OjI3LjgyMDogeDI2OiAwMDAwMDAwMDAw
MDAwMDAwIHgyNzogMDAwMDAwMDAwMDAwMDAwMAo+IDAyOjU4OjI3LjgyMDogeDI4OiAwMDAwMDAw
MGYwZjRmNzkwIHgyOTogMDAwMDAwMDAwNTBmZmY2MAo+IDAyOjU4OjI3LjgyMDogQ29kZTogYTkw
MjViZjUgZjkwMDFiZjcgZjk0MDA2NDEgMzYwMDAxNDEgKGY5NDA4NjYzKQo+IDAyOjU4OjI3Ljgy
MDogUmVzZXR0aW5nIENQVSAuLi4KPiAKCkNvdWxkIHlvdSBib290IHdpdGggZWFybHljb24gZW5h
YmxlZCB0byBhdCBsZWFzdCBoYXZlIGEgY2x1ZSBvZiB3aGF0J3MgaGFwcGVuaW5nID8KCkJQSS1N
MlMgKEEzMTFEKSBpcyBib290aW5nIGZpbmUgb24gdjYuMTUtcmMsIHNlZSBodHRwczovL2dpdGxh
Yi5jb20vYW1sb2dpYy1mb3NzL2FiY2QtbGludXgtdGVzdC8tL2pvYnMvMTAwMDQ5OTcwMzIKCkJ1
dCBwZXJoYXBzIHNvbWV0aGluZyBzcGVjaWZpYyB0byB0aGUgVklNMyBpcyBicmVha2luZywgZG8g
eW91IGNoYW5nZSB0aGUga2VybmVsIGNvbmZpZyBmb3IgdGhlIERSTSA/CgpOZWlsCgoKPiBUaGUg
Ym9hcmQgYm9vdHMgc3VjY2Vzc2Z1bGx5IGluIHY2LjE0LXJjNywgYnV0IHRoZSBpc3N1ZSBhcHBl
YXJzIHN0YXJ0aW5nIGZyb20gdjYuMTUtcmMxLiBUaGVzZSB0ZXN0cyB3ZXJlIHJ1biBpbiBkcm0t
Y2kuCj4gCj4gT24gYmlzZWN0aW5nIHRoZSBrZXJuZWwsIHRoZSBmaXJzdCBiYWQgY29tbWl0IGlk
ZW50aWZpZWQgYnkgZ2l0IGJpc2NldCBpcywKPiAKPiA1OWMzNTQxNmY0MjQ2YWVlNjZiNWY1NTIz
ZmRjOTUwYjgzMzI1ZDgyIGlzIHRoZSBmaXJzdCBiYWQgY29tbWl0Cj4gY29tbWl0IDU5YzM1NDE2
ZjQyNDZhZWU2NmI1ZjU1MjNmZGM5NTBiODMzMjVkODIKPiBNZXJnZTogNDcyODYzYWIyYWNhIGU5
ODhhZGNiNWRlZQo+IEF1dGhvcjogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgo+IERhdGU6wqDCoCBTYXQgTWFyIDI5IDE3OjIzOjM0IDIwMjUgLTA3MDAKPiAK
PiAgwqDCoMKgIE1lcmdlIHRhZyAnY2xrLWZvci1saW51cycgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Nsay9saW51eAo+IAo+IFBsZWFzZSBjb3VsZCB5
b3UgbG9vayBpbnRvIHRoaXMgaXNzdWUuIFRoYW5rIHlvdS4KPiAKPiBSZWdhcmRzLAo+IFZpZ25l
c2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
