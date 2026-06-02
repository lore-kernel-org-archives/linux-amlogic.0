Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A966CCD6E61
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 07:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP4I1VYcpqpQdYEPoVz3wTuvSH2j7Van3Su63uS0uE8=; b=mAQqm7lWYnd+koDXmfhwSOuQfZ
	Kx5RTiUFR0gGQjwbxZNrJdfWtzfYAPmdhYaG93T263s4f1x4rSlsPfbB70I2VDrUT54hLoX2gjkE8
	PaZIzjLQa8W34NB223fd1Zn7OKOm7W+vBz9Xy7TMaUv8qhmdZv7DvbdFQS/dl1cXKOUVhPJxqLB7E
	STBFYE1L6W0wW1I5lYoxEnDOPDlMxs0V2DBDcxQZX6U85xn2FTA+xxwNrV00WYeJNxeRR2JX5ywLv
	J8436CHd3UqyRomu082RIGR9ril90FjRO3lIrsvirNZbwMRrQC/rA6KguclOopGZkElpPdmqYKHXp
	wIvHf+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJqO-0000000CVL6-1VbF;
	Tue, 02 Jun 2026 07:47:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJqL-0000000CVKC-1Ezr
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 07:47:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1672033f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780386439; x=1780991239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vh2zzywQb2LDD0ApyXrtv/dbmsJmDaoaJ1y3lBs52fU=;
        b=pZOOoOiYFFJrfjwgWJRhGyarE5jvFdMWD4whdTaDoXYKlGwwikruI2834+wjoFhVXk
         VOsENJGpEule43/L2PNYPDZF4HvcGnX3KNH7KMMloOS5dKx6nwSnhb6DJkG6FLyv1HKi
         V/jc3vY8i1Iad3XSoDMlzUujq1qQYi91KY19UQWhI0odD8k9xUncDdkEXTFEX8Keoh0s
         6CO6AiQSs/8K+dD3FKr52f2yBgUTXCw3zJ1Sp9LGhYW4pq6rCbam47sWFrVHQeDoohLd
         s4QeKcMH4nMAh0XG26y25U6CDSWiR0CV3i57FslJ6TPfvmHljOoFpCjdCnj1ZBAZhqWJ
         /t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780386439; x=1780991239;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh2zzywQb2LDD0ApyXrtv/dbmsJmDaoaJ1y3lBs52fU=;
        b=CIZl6sp1RW8NzyvbvrCb2hua8aMVPFTygrVh0y7ce6FLzkLJJVpdchjuWAiBPcpvC7
         MBWMs43w6yT4DZnwB5ZzG6NX6ru9u10Peo+mamDjJXMtBunRz1qvEH1/zL/eXB7li9Gd
         oHDuM8ZPqg92zKn12qWxlU9+xgQx5G1szJp8+GMoFARIt1okjrGVUyg2W6y2y8pAUoAq
         9S5SAyHWV7FgavQKhrHsqULOh1mfQl1RbWumHUQEQK3F/iinEGJKdnFrgdySF7qQrjkO
         47f/H8FVFH/ezpJGZx4kQF/N1/FcdX7MfDRpik9xLyF8LltO/f4fTceUBZ/iZQCBOJCj
         Lw2A==
X-Forwarded-Encrypted: i=1; AFNElJ/Q4DGokuLVeK6Hac/aJnV35dZvHoOXoKqeaCPViMdFCI5EQQhIccvYm8pmQA4bb/TN9MQ60WdPWxPUUrxv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0dc9wNldZgR+S+DfrcWuRJM12Ps01xDP25WxhvJBqNqQ3juaa
	RFOgwuM+Jyh8FzNRYVnbTcuIaUimEZO7beVZZcj9qLEhqGarnl77+5QqEtAG6rpgP8Q=
X-Gm-Gg: Acq92OER7Zl29EMKmJz69QcL/xT8DncnLGeRqaEtA1enDSmny2IN6sZRapy2XUyfSkL
	09r2DGZz2RPe2d89IZHMCceF/L4wovq9Ogc0E2wByopLIcJMy1EPFJi19o3ylaBnPzRdGq+9MKC
	OGESbG1P6wPSjEPOM6kSYZQYiwuQly9TebnaEVytsyahW/n/a3i3mOQqe/hPzbPgMQYqLrxtScf
	7uV0gXbxN0q6D994cWDKerpNGlQ6Pn120ZUY0+ABAqne4ch1Ciul9tEEAODLiwfkxMmRK7uO78s
	MEEVGjlZ7wrq3LLTpyE1wvvR8ppctfN0sQowU6OawxWKX90or3g1FHyJbHIbMYS/tZmi4Iljweb
	pLsoKgqto/byAUQN8dkvQ14mBIOPviUpKUmmiAD29GmtyvEylmRA22Y1qNpDdmCRGtJM+dgVsKM
	2Dm3s+iPE13Hs48kDv62xlOHFuR4FPjeNy7Uk2id6hwX/a+JFyfBy2piKgD8Bqw7fVXPDqVCwW1
	hlz4exdNgPJaF29TDlCYjm1gE83
X-Received: by 2002:a5d:674d:0:b0:454:a41f:d082 with SMTP id ffacd0b85a97d-45ef6aea78dmr20394102f8f.3.1780386438514;
        Tue, 02 Jun 2026 00:47:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:13a7:124b:487c:e2bc? ([2a01:e0a:106d:1080:13a7:124b:487c:e2bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm31159663f8f.11.2026.06.02.00.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 00:47:18 -0700 (PDT)
Message-ID: <9267eeb5-a221-4108-bc7a-57e88347e7a7@linaro.org>
Date: Tue, 2 Jun 2026 09:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
 <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
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
In-Reply-To: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_004721_403371_920AD81A 
X-CRM114-Status: GOOD (  14.25  )
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

SGksCgpPbiA2LzEvMjYgMjI6MDYsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gSGkgTmVpbCwKPiAK
PiB0aGFua3MgZm9yIHlvdXIgcHVsbCByZXF1ZXN0IQo+IAo+IE9uIFRodSwgTWF5IDIxLCAyMDI2
IGF0IDM6MTnigK9QTSBOZWlsIEFybXN0cm9uZwo+IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3Jn
PiB3cm90ZToKPiAKPj4gICAgICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiB0Nzoga2hhZGFzLXZp
bTQ6IFJlbW92ZSBpbnZhbGlkIHByb3BlcnR5Cj4gCj4gVGhpcyBjb21taXQgaGFzIGEgcHJvYmxl
bWF0aWMgRml4ZXM6Cj4gCj4gY29tbWl0IDZmMTRiYTNjM2ZhM2Q2N2I3MmUwNTJmNDMxZjY3NzY0
NzBlYjJjYmQKPiBBdXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVs
LmZyPgo+IERhdGU6ICAgTW9uIE1hciAzMCAxNDoxMToyMSAyMDI2ICswMjAwCj4gCj4gICAgICBh
cm02NDogZHRzOiBhbWxvZ2ljOiB0Nzoga2hhZGFzLXZpbTQ6IFJlbW92ZSBpbnZhbGlkIHByb3Bl
cnR5Cj4gCj4gICAgICBGaXggaW50cm9kdWNlZCBpbnZhbGlkIHByb3BlcnR5IGZvciBLaGFkYXMg
VklNNCBzZGNhcmQgcmVndWxhdG9yLgo+IAo+ICAgICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0YjoKPiByZWd1bGF0b3Itc2RjYXJk
LTN2MyAocmVndWxhdG9yLWZpeGVkKTogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90Cj4g
YWxsb3dlZCAoJ2VuYWJsZS1hY3RpdmUtbG93JyB3YXMgdW5leHBlY3RlZCkKPiAKPiAgICAgIFJl
cG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiAgICAgIENsb3Nl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDMyOTA4MjguNWd0
MzkzdDYtbGtwQGludGVsLmNvbS8KPiAgICAgIEZpeGVzOiA2MGVmZjc1YWM2N2IgKCJhcm02NDog
ZHRzOiBhbWxvZ2ljOiB0Nzoga2hhZGFzLXZpbTQ6IEFkZAo+IHBvd2VyIHJlZ3VsYXRvcnMiKQo+
ICAgICAgUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAb3NzLnF1YWxjb21tLmNvbT4KPiAgICAgIFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1
IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgo+ICAgICAgTGluazogaHR0cHM6Ly9wYXRjaC5t
c2dpZC5saW5rLzIwMjYwMzMwLWZpeC1pbnZhbGlkLXByb3BlcnR5LXYyLTEtMjI4YzUxYzhkZTkz
QGFsaWVsLmZyCj4gICAgICBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4KPiAKPiBDb21taXQgNjBlZmY3NWFjNjdiIGRvZXMgbm90IGV4aXN0
IGluIHRoZSBTb0MgdHJlZSBub3IgaW4gVG9ydmFsZHMnCj4gdHJlZS4KPiAKPiBXaGF0J3MgdXAg
aGVyZSwgaXQgbG9va3MgaW5jb3JyZWN0PwoKWWVhaCBzb3JyeSBpdCB3YXMgcHJvYmFibHkgYmFz
ZWQgb24gYW4gZWFybGllciBhcHBseSBmb3IgdGhlIHByZXZpb3VzIHJlamVjdGVkIFBSCgpUaGUg
cmlnaHQgY29tbWl0IGlzIDhmNGU0ZmJkNTA3MiBhcm02NDogZHRzOiBhbWxvZ2ljOiB0Nzoga2hh
ZGFzLXZpbTQ6IEFkZCBwb3dlciByZWd1bGF0b3JzCgpCdXQgc2luY2UgaXQncyBpbiB0aGUgc2Ft
ZSBQUiBJIHdpbGwganVzdCBzcXVhc2ggaXQuLi4KCkBhcm5kIEknbGwgcG9zdCBhIHYyIG9mIHRo
aXMgUFIgd2l0aCB0aGlzIGlzc3VlIGZpeGVkLgoKVGhhbmtzLApOZWlsCgo+IAo+IENhbiB5b3Ug
bG9vayBpbnRvIGl0Pwo+IAo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
