Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F97C61DC2
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2026 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJXf589QqdSBgWEV/7Mi27y7EBd91mGjDb6t0NuYrJw=; b=u7ZD1BnpnwPPgDQ0P1imFtVhkk
	hWdIulCyzXk/2b9TKz1A1IHoGreXdmX+EyUnJlgAgVc4qCbbtcXyKORvzTkZ4Ir7Z3JRt3Xd59x0p
	HgMatpn8q8rlxRX1ouXxlOrOHI/o0es2lIdyCa2tTlIlYnm75qPQ5L1FF61nXEfgw2pAXeuGsOtDa
	C0XKYrM6R1IM0wX+tJdEPfKt1QT7Z70qOXBxRWvjEWdY/9r2eAzTrhXOwNzrudujwjaWDwny6KYuu
	ohFFqvyhPicOmqjqeTLP14ReuG1WLx5rLjy+SZc4KZqCL+ZKcKuFIx/NGFzysFL1+FdlU6DutWOUk
	BPnddliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9X2-000000028ZM-2rU3;
	Wed, 26 Aug 2026 09:02:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9Wx-000000028UG-08AQ
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Aug 2026 09:02:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-499b0eefa61so3420935e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Aug 2026 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787734964; x=1788339764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stp9PLONuG5ZO5VWMIxZEJbXb8VtweiqjlFaBczDy5M=;
        b=qxY+qysyK+vu8UyTwNMQiG6m6Vip6GOnRvDkVvzo9AR722L1q/G5nJYOc/LmbW0GBd
         hfVSWmjK3Omx7fiFYdIO5j0aJQ1FpJzh0oToe+n3bhKj9TNCHxgf8lr/6JvWKcUdXl2N
         UKqQetyAvfF4nXYoOdIoYFykJQXjGt4jRGvOSL9l17wc8/U0qJiw92VBPfszvcrQDEcF
         IEnsILjU1bcpzVeIRxaG34JVNzEx8Zk8hPHIi+C0cdwmK7pdb4NqYR4SWqdrq1sF1NkP
         zHGqeKeHkrkv5QztDGPTl/xhK2OoX2+wicpWUOydijLWUY338fvu7yTXtMiji1+BjIez
         HP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734964; x=1788339764;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stp9PLONuG5ZO5VWMIxZEJbXb8VtweiqjlFaBczDy5M=;
        b=r0nWfHNtveYUYeEepeB8+lAu7IusXWYpCpkx3Jzge3N2+rN4VzUZZzvLTAR4vbPXZe
         rKk/zgXV18N8zZLTmCJpcYRg86VpZLA7D3d2+DgYRVpKWAsnAKzsBmfEB8VeWfHygYEn
         QbsCYX9mqA0iFDlbmFzJmBGyD3Ockug3/3h4z05HIcmzCEmDp0X1PvY+vvg6U2M3d3Gd
         OvSzVLhyCQzxerVUYRTYUOH0tJn7aWzODlK4WHLK2HXS4UmVX0nxQwBgEHwNL4u6lbG6
         Bo072CNSUUgl12z0ycttIURZgtTODvA/c05+edYvQrwgaln2XieLelWkhZ28RZ75tn3L
         O0jA==
X-Forwarded-Encrypted: i=1; AHgh+Ro26rU3p5fPLKc1O6rYU24PQPX6+6/UfERuPcRvrl/60YpRtNuTNxo4C9jtK7YEALZ3yoSe+NIiY9gQ3Ndm@lists.infradead.org
X-Gm-Message-State: AFuF++m7VhnudJ6lm065h4iZVNyubZ/hdkyk1nlYEHJFIvQEdR8s07tR
	ZGmLAtAsWfOeMLmbGWjpwj4VHRJSEX/aT5FAGzbV1/btU3gzImMPhZuKBZuyNJU/bIo=
X-Gm-Gg: AR+sD10b50CCJNYEnfdS2pbc/B/sW0H9FwJ/jvGRFTAYTc5fUMU1PZiiwMJP7qs53I0
	iy2z8McbSV+qDf2h55882JnJtC/Embcy63aVWHX3pAGwzyajWpHcccV6Yqg2DKZlf3mIN5GoepA
	JFjB3ZYJ5rSEEUsCGQbrWdKNohC8PU5ycwHYlJoa/NouRclcXeJp+Q2xuu3+Oqjqj+BbgNBrf/N
	gLM5k0x/cr+M2Sp8BQ53AZ/ghz46361Oaalk+P522DktgTHHudSYudejmOIAFw1VNKBTBCFkDDU
	NypKNuqdK0scR8W2olTpx+qRBLO8XtwTSHP7pMuZBdOvnx0c2u6WHuv7ks40jIwYWM+yZBSV/fM
	VzxyqrP43+u4IpLrT09NCx5vt4lQ51oc7xA0gvZ63rhnIFTLTIXNEDmpRHDe3vVmD3uPeAkCpOW
	GtWk6uND+eTzzqV5Anvd9ykdqB8lohBgvpjSyrVthavaKUyoSTyztmoH9MeYNtK9zLfNo7UAYhc
	orFuTBHsN8u5Ydv4VHeNqfgR1LksUdCkED8aysxus5ELg==
X-Received: by 2002:a05:600c:3b8b:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-499dc722993mr44636675e9.11.1787734963958;
        Wed, 26 Aug 2026 02:02:43 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:84f0:a520:10fa:2386:b410? ([2a0d:e487:135f:84f0:a520:10fa:2386:b410])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm19644365e9.2.2026.08.26.02.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:02:43 -0700 (PDT)
Message-ID: <048697c8-8331-42aa-accf-d114774ac5fd@linaro.org>
Date: Wed, 26 Aug 2026 11:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
To: Lucas Tanure <tanure@linux.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jian Hu <jian.hu@amlogic.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
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
In-Reply-To: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020247_129840_F293B6CD 
X-CRM114-Status: GOOD (  15.27  )
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

T24gOC8yMy8yNiAxNzo0MCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+IEhpLAo+IAo+IFdoaWxlIHRl
c3RpbmcgbWFpbmxpbmUgTGludXggb24gdGhlIEtoYWRhcyBWSU00IChBbWxvZ2ljIEEzMTFEMiAv
IFQ3KSwgSSBhbSBoaXR0aW5nIGludGVybWl0dGVudCBzeXN0ZW0gaW5zdGFiaWxpdHksIHN0b3Jh
Z2UgbG9zcywgYW5kIG1lbW9yeSBjb3JydXB0aW9uIGR1cmluZyBib290LCB1bmxlc3MgSSBhcHBl
bmQgY2xrX2lnbm9yZV91bnVzZWQgdG8gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUuCj4gCj4gQmVj
YXVzZSB0aGUgZmFpbHVyZSBpcyBpbnRlcm1pdHRlbnQsIEkgYW0gcnVubmluZyAxMDAtcmVib290
IHRlc3QgY2FtcGFpZ25zIHRvIGJpc2VjdCB0aGUgcmVtYWluaW5nIGNsb2NrcyBhbmQgaXNvbGF0
ZSB3aGljaCBjbG9ja3MgYXJlIGNyaXRpY2FsIGFuZCBjYW5ub3QgYmUgc2FmZWx5IGRpc2FibGVk
Lgo+IAo+IEFzIHRlc3RpbmcgdGFrZXMgc2lnbmlmaWNhbnQgdGltZSBvdmVyIHNlcmlhbCBjb25z
b2xlLCBJIHdhbnRlZCB0byBjaGVjayBpZiBBbWxvZ2ljIG9yIHRoZSBtYWludGFpbmVycyBjb3Vs
ZCBzaGVkIGxpZ2h0IG9uIHRoaXM6Cj4gCj4gQXJlIHRoZXJlIHNwZWNpZmljIFQ3IGNsb2NrcyBv
ciBoYXJkd2FyZSBkb21haW5zIHRoYXQgbXVzdCByZW1haW4gY3JpdGljYWwvcHJvdGVjdGVkIGV2
ZW4gd2l0aG91dCBhbiBleHBsaWNpdCBpbi1rZXJuZWwgY29uc3VtZXI/Cj4gCj4gQ3VycmVudCBj
bG9ja3MgYmVpbmcgZGlzYWJsZWQgdGhhdCBkb24ndCBraWxsIHRoZSBib2FyZCBvbiBhIHRlc3Qg
cnVuOgo+IAo+IFvCoMKgwqAgMC4zODAzMTNdIGNsazogRGlzYWJsaW5nIHVudXNlZCBjbG9ja3MK
PiBbwqDCoMKgIDAuMzgwNDEzXSBjbGs6IERpc2FibGVkIHVudXNlZCBjbG9jazogcnRjX2R1YWxk
aXYKPiBbwqDCoMKgIDAuMzgwNzE4XSBjbGs6IERpc2FibGVkIHVudXNlZCBjbG9jazogcnRjX2R1
YW5kaXZfaW4KClRob3NlIGNvdWxkIGJlIHVzZWQgYnkgbG93IHBvd2VyIHN0dWZmIGFzd2VsbCwg
bm90IG9ubHkgUlRDCgo+IFvCoMKgwqAgMC4zODEzNzddIGNsazogVW5wcmVwYXJlZCB1bnVzZWQg
Y2xvY2s6IGE3M19kaXYxNgo+IFvCoMKgwqAgMC4zODE5NzJdIGNsazogVW5wcmVwYXJlZCB1bnVz
ZWQgY2xvY2s6IGNwdV9kaXYxNgoKVGhvc2Ugc2hvdWxkIHByb2JhYmx5IGJlIGxlZnQgZW5hYmxl
ZCBpZiB0aGV5J3JlIHVzZWQgYnkgdGhlIERWRlMgY29kZQoKPiBbwqDCoMKgIDAuMzgyNjA1XSBj
bGs6IFVucHJlcGFyZWQgdW51c2VkIGNsb2NrOiBmNTBtCj4gW8KgwqDCoCAwLjM4MzE3NF0gY2xr
OiBVbnByZXBhcmVkIHVudXNlZCBjbG9jazogZml4ZWRfcGxsX2Rjbwo+IFvCoMKgwqAgMC4zODM3
ODZdIGNsazogVW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IGhkbWlfcGxsX29zYwo+IFvCoMKgwqAg
MC4zODQ0MTZdIGNsazogVW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IHN5czFfcGxsX29zYwo+IFvC
oMKgwqAgMC4zODUwNTZdIGNsazogVW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IGVhcmNfb3NjCj4g
W8KgwqDCoCAwLjM4NTY1Ml0gY2xrOiBVbnByZXBhcmVkIHVudXNlZCBjbG9jazogcGNpZV9yZWZj
bGtfb3NjCj4gW8KgwqDCoCAwLjM4NjMyM10gY2xrOiBVbnByZXBhcmVkIHVudXNlZCBjbG9jazog
ZXRoX3BsbF9vc2MKPiBbwqDCoMKgIDAuMzg2OTYxXSBjbGs6IFVucHJlcGFyZWQgdW51c2VkIGNs
b2NrOiBwY2llX29zYwo+IFvCoMKgwqAgMC4zODc1NDhdIGNsazogVW5wcmVwYXJlZCB1bnVzZWQg
Y2xvY2s6IG1jbGtfcGxsX29zYwo+IFvCoMKgwqAgMC4zODgxODddIGNsazogVW5wcmVwYXJlZCB1
bnVzZWQgY2xvY2s6IHVzYl9wbGwxX29zYwo+IFvCoMKgwqAgMC4zODg4MjZdIGNsazogVW5wcmVw
YXJlZCB1bnVzZWQgY2xvY2s6IHVzYl9wbGwwX29zYwo+IFvCoMKgwqAgMC4zODk0NjVdIGNsazog
VW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IHRjb25fcGxsX29zYwo+IFvCoMKgwqAgMC4zOTAxMDVd
IGNsazogVW5wcmVwYXJlZCB1bnVzZWQgY2xvY2s6IHRvcF9wbGxfb3NjCj4gW8KgwqDCoCAwLjM5
MDczOF0gY2xrOiBVbnByZXBhcmVkIHVudXNlZCBjbG9jazogYXVkX3BsbF9vc2MKPiBbwqDCoMKg
IDAuMzkxMzYxXSBjbGs6IFVucHJlcGFyZWQgdW51c2VkIGNsb2NrOiBkZHJfcGxsX29zYwo+IAo+
IEkgYW0gbm90IGZvcmNpbmcgYW55IGNsb2NrIHRvIGJlIGRpc2FibGVkOyBJIGFtIGZvcmNpbmcg
YWxsIGNsb2NrcyB0byBzdGF5IG9uIGFuZCBsZXR0aW5nIHRoZW0gYmUgZGlzYWJsZWQgaWYgdW51
c2VkIG9uZSBieSBvbmUuCj4gCj4gQW55IGd1aWRhbmNlIG9yIGhpbnRzIG9uIHJlcXVpcmVkIHBs
YXRmb3JtIGNsb2NrcyB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLgoKSXQncyBoYXJkIHRv
IHNheSwgdGhpcyBpcyBkZXBlbmRlbnQgb24gZWFjaCBmYW1pbHksIEFtbG9naWMgc2hvdWxkIGJl
IGFibGUgdG8gaGVscCBoZXJlLgoKWW91IGxpc3Qgc29tZSBjbG9ja3MsIGJ1dCBJIGRvbid0IHVu
ZGVyc3RhbmQgeW91IHNheSB0aGF0IGl0J3Mgc3RhYmxlIG9ubHkgaWYgeW91IGhhdmUgY2xrX2ln
bm9yZV91bnVzZWQsIHNvIGhvdyBkaWQgeW91IGdldCB0aGlzIGNsb2NrIGxpc3QgPwoKTmVpbAoK
PiAKPiBUaGFua3MsCj4gTHVjYXMgVGFudXJlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
