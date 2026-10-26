Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65DD60A2603
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s6VbRDtN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FYU8Okee
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SM8V+woVVCld3T79tDjkHaQdDmG0leKDvkzsoLH5U9Y=; b=s6VbRDtNnr3sK5xa+9WV+xA/dF
	76PaIFuOI5zVbo8g058MDEbl8N0Q62X06tiEFG6fhqwyIlXOKTguooBcStAN3E+IKa/QQN5xJEF54
	UEelDBUZaB/FJZybnnBksmv5lSopi2JTUs6yrq20z3zb+zKdgRVnXKAvMRjoETSZCvYTn+E0a1Zft
	f3DAASAFC30cCjIhOD6sZgKJi8IoeJ9qIlTIPts2dapbqbwNDYl4+AGugF6X/AEdBNGv+KQmOFS6f
	fGLWFD3HBnUFW7dAGzla/S6rQJ5cDrbhcNEmtajf+UyDpZbzrdTml0gCFBFXIFM0Tr7FfBYW3sJTz
	3J/h725w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGMz-00000001zBr-38P7;
	Mon, 26 Oct 2026 08:47:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGMx-00000001zBD-0X4u
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 08:47:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso11460775e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793004469; x=1793609269; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNFCSReGDddi8uPRrxfpuCwFDb4KWoAVuKYCjqBpfo8=;
        b=FYU8OkeeiPHs8ivg6O634fU8YwPbrBOC7qM1mhLTs/I/7mZrTdjdc2jMGE+mQuR3rX
         qoNOpIEMLUN+cJvG9SJAec/J/UV5S/6Dqcp8cS/gBMqtgaNk4OXNQKLPHopQwPpmdUgX
         SQR4tPmLw4MFi0jCMrc3aLCeVqniCjvljU4b0mA1LlAeuuH6uKw1OxapwHm1ZWqpo558
         WluU+vPh+ddUkxJmW4T55tmnnOukGGCJdd+aOPB7ENXydM10J196Yl3KC+38EQOuzXgd
         qcBf3sDQmmknwQJoBHFcFKWlU2QAT9IwMhSdjsPfbiXE5yVhVJGUsk07rT5sHXknO3oQ
         g4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004469; x=1793609269;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNFCSReGDddi8uPRrxfpuCwFDb4KWoAVuKYCjqBpfo8=;
        b=YpLRKahf5VqZ6tb/P9zZ75v/7qf3xzXQJ0WtY2SUg8Q/5slfJi0j3qsTgMVZl+NGKx
         hHy8TGb5yc0NoWJh+tPCUOI5Bg/Qs7h/Xc8c7zyDozQILBr+jQdX6ZSnhh5J/UtKT0SJ
         5s9Z2Wu+wrQ7dJ2ExO9LzX/y75L4UTbKqTXzUc8Z9ctJEJGFdxkDJHPHnSHI/dY+9E0w
         nRdrNWoebvaZ9q55UzgoF65ltcSWHkRSiQs4NC0vTd8/3t6NE9CK0+kHRgRMLp8Ugy6W
         oOSCsjYen01SsqMOLQu7Mvu9ID21/wSPUweC6unhUsKboTOnmPUP/W5vGfu41zW4mn6W
         H8sw==
X-Forwarded-Encrypted: i=1; AKwUvBydwtq5YTjCOfOavIP2fRd+VnKn28ZIpwnpC8nAHzhkK5aSu4RTYh6iDY90SheR59Z8SBco4ezvdrMX4b75@lists.infradead.org
X-Gm-Message-State: AFq9FYIa6B2t9I1LbW32qP+KZqyZ2V7eKOeJsCURMcug7kLJWjdrU89R
	MzBvWu8jx2Brh0n0+eLl/Zbj70GIqvmxKLSLTjCYFXIgQFGhZNmCFEDTCwzd2eBlr0k=
X-Gm-Gg: AYBFou1Pjq952y3DUg5P4w+IO3Zw3TmdxrD7d61ekYwGYylo5FJqAZRgeJzldse3Iqm
	BY3PBFmbh1kYa1gSFCGnrwbOAkWhO3cFL4ComQGkE6Hd5f+we3+P0S1ojIn/Ab+Wv5QlTTO6avh
	QWtu+h5/DwzJ3JS70lYQOfvqjE/wkMqcLjvNwD7bC4z14hSeSW/c1IRgk0ZiKAK5ckfj4n3Ieu0
	XKnB6SOTsVrjMkmxIW2wBqZ/zeeIpAqNPGqqwlOHb3X1Ed1R1jUn9BNthZa4GUGGEJb9fcW3Pzm
	rjDUy39gAfo34K0oNPc3H5eA1Re9bME6eBnzoa9ZRUW0gNPL6GPo01ql8fId9BjbcER1qSv9pDs
	c1/hQIhPUQP5Jh1qNjTU1xYM2P1RZazdpacBZiu+pLM8b0kgcTSFufo8RUDQdJOO9/MfUliwCnF
	43Xyi9pqt96alkK2lbSSg2OorrYj/xFNsOcbsev5K63it/W28mxi8I2VfHW3oAfCDH8NzFucuS0
	iwyPzIxdzJSYBVTgGnHT018rTbynmW7dxEy4SR8TW9Jwisfq2nz2KNfUcmmmKzOjTH6hWbGvG9k
	7lkC5BdwyXW2zg8UC/+jAE9yWNBLnjRcnw1N
X-Received: by 2002:a05:600c:3b2a:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4a35ac99d0dmr99335295e9.10.1793004468879;
        Mon, 26 Oct 2026 01:47:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:d07e:c128:5c21:78f2? ([2a01:e0a:106d:1080:d07e:c128:5c21:78f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm197353145e9.3.2026.10.26.01.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:47:48 -0700 (PDT)
Message-ID: <7eddacd6-a394-4bd1-9d33-38e70e75e3b1@linaro.org>
Date: Mon, 26 Oct 2026 09:47:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] thermal/drivers/amlogic: do not log the secure
 monitor deferral as an error
To: christian.koever-draxl@student.uibk.ac.at, glaroque@baylibre.com,
 rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192244.209256-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192244.209256-4-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192244.209256-4-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_014751_216436_9C2BD93F 
X-CRM114-Status: GOOD (  15.58  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjUvMjYgMjA6MjIsIGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFj
LmF0IHdyb3RlOgo+IEZyb206IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZl
ckBvdXRsb29rLmRlPgo+IAo+IFRoZSB0aGVybWFsIHNlbnNvciB1c3VhbGx5IHByb2JlcyBiZWZv
cmUgdGhlIHNlY3VyZSBtb25pdG9yLCBzbyB0aGUKPiBmaXJzdCBhdHRlbXB0IGFsd2F5cyBkZWZl
cnMgYW5kIGxvZ3MgIkZhaWxlZCB0byBnZXQgc2VjdXJlIG1vbml0b3IKPiBmaXJtd2FyZSIgYXMg
YW4gZXJyb3Igb24gZXZlcnkgYm9vdCwgYWx0aG91Z2ggdGhlIHNlY29uZCBhdHRlbXB0Cj4gc3Vj
Y2VlZHMuIFVzZSBkZXZfZXJyX3Byb2JlKCksIHdoaWNoIHJlY29yZHMgdGhlIHJlYXNvbiBmb3Ig
dGhlCj4gZGVmZXJyYWwgaW5zdGVhZCBvZiBsb2dnaW5nIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgo+IC0t
LQo+ICAgZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jIHwgNyArKystLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMgYi9kcml2ZXJzL3RoZXJt
YWwvYW1sb2dpY190aGVybWFsLmMKPiBpbmRleCBjNThiYWM2MzNiZWQuLjU0ZTU5ZjQ0NGQ0NiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiArKysgYi9k
cml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKPiBAQCAtMTk2LDEwICsxOTYsOSBAQCBz
dGF0aWMgaW50IGFtbG9naWNfdGhlcm1hbF9wcm9iZV9zbShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2LAo+ICAgCj4gICAJcGRhdGEtPnNtX2Z3ID0gbWVzb25fc21fZ2V0KHBoX2FyZ3MubnAp
Owo+ICAgCW9mX25vZGVfcHV0KHBoX2FyZ3MubnApOwo+IC0JaWYgKCFwZGF0YS0+c21fZncpIHsK
PiAtCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgc2VjdXJlIG1vbml0b3IgZmlybXdhcmVc
biIpOwo+IC0JCXJldHVybiAtRVBST0JFX0RFRkVSOwo+IC0JfQo+ICsJaWYgKCFwZGF0YS0+c21f
ZncpCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRVBST0JFX0RFRkVSLAo+ICsJCQkJ
ICAgICAiRmFpbGVkIHRvIGdldCBzZWN1cmUgbW9uaXRvciBmaXJtd2FyZVxuIik7Cj4gICAKPiAg
IAlwZGF0YS0+dHNlbnNvcl9pZCA9IHBoX2FyZ3MuYXJnc1swXTsKPiAgIAoKUmV2aWV3ZWQtYnk6
IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgoKVGhhbmtzLApOZWls
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
