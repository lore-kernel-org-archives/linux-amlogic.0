Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9110BC88E5C
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fieC+x02dGLK+Rw6VgFS2oj6t1Ns90UCKQgBuG3ER7c=; b=PagHy0k1W+BXOGAldLba1caRpw
	7LP88k60VkQlNN+ZuTt6fXgK0YAZu1bogV9H29HKQnmxXMGKx5l1EbJppwHwexHWZw7DvHWc28/FK
	eMywXImxgVNTuLRtk4lUY/lKR2QUpXKP3si0HdUx8ZjyKgU9sgZzND2hW6gA4QSwv015HolA4u2Z3
	GnnijA6Md7e+IuhTdNYvqHuKTwJlu9lentqLv7vE7NyOjUJ9UPLb3zlj/dsPGrzJoW3K/v6mk6uUk
	siZiXAbSNlEh+3jYGAU+LLh1nM+9bb2sxHPRofWvpWuqLobSZNTWnnEdyQax8/qcDBR3fHNlwkwTJ
	DikaCDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mI5-00000008tiy-3PVQ;
	Wed, 16 Sep 2026 09:50:57 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mHz-00000008tgJ-02uo
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 09:50:56 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350faaso322262f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2026 02:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789552249; x=1790157049; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNrtt7QAjnKfCZfemi/DOxqaTqOYXDgqMMH9wuegbsE=;
        b=Ufhr+JWf5aHXYYsMsQfoYc2+m/2DDPY01TXXratjAqqjMTCKP0bv0LjZmw8WKQhJj8
         SjlWYfPWq/fLjkRVrY3tNolJsfHv7XF5OvP322tGZcdZvq7aBr37b6j1hRRhXMkBjb/A
         rRBkb9ZyxBch0x6RcqGL1al4mLQoWzYriNDCLt3wb4C09/dE+SaXItMoYgECq5HfMZyL
         wTeO5inxoreqjIbUeLll4t6s5n4HsC8VkiVH0NVd9bpzMUrcjwaR+C6hJZEbAQByBrWh
         imAoV4qyCY+Jd6qV070CWHtUvJFIPNZLkI2Jq19xbVFljJAF1oouYKJA5nwe1Rm3pDl6
         EjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552249; x=1790157049;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNrtt7QAjnKfCZfemi/DOxqaTqOYXDgqMMH9wuegbsE=;
        b=Zd3DSRMESc4ellWiM7teW0Bzf/687EESuim5TC2eE02JS+OjgEIZWH/r1WUu2CYYEv
         KCFWF+qQacIb4QXyjyN/wvy62gwIjM7od+B0qrruKKfVxRlpL2thh68uJqQa65zHJ2O3
         MoK1fjHICp1xQ0TAgOceeVWbRQZ64Eq3pxJ8/3kVi8+M/G5G+qcSKeWFL8gw8e/rqniE
         a/fKa2rA8bThpt/yApGGF6ctgIu0Vi50dec+oUkXzu/ekbc40qE5cBnKmWKSq9v+7esy
         9PPIBUPMRXh7kp0cbrKLVpcCufmGHWi4us11P6FHJanJbqm0Rq9IKxoxq078J+iK+C5L
         Sw5A==
X-Forwarded-Encrypted: i=1; AKwUvBzlEz89VhRcR2M1TdPHS63A8T9KJK971qz3SqXc15U6ZS604DRsC157WecbnooWuTDMz7h7g5gPTpugnPOK@lists.infradead.org
X-Gm-Message-State: AFuF++mgQiDjAH9+B4fHvWKHfWi2kDvjqvilz6zECBXrkkxdQrsiktrD
	L2j9+OQSB+o0lW4uHPJ4yqkU3wbveGJBzqhbKZzpwKOBzbJIZoXj4G8vXSHbxiYNju5eAbg6+z3
	rEiLU
X-Gm-Gg: AYBFou14LNTtjILk5wQOidXFcV2FX/v9el0wI7c9CzL8/iuc8Jx4kx72SIrgnfeBt+K
	CdXIy5Gwg3ltV1m/1C682fQp0w+PZDceL2SLzwL8FEPBP1qaI4DxRDH61fWmQBKwG9So3lduARt
	Pu+DC5qq7kKhrs5jLzaXB73DHfBHx/dNYtjOE1xTaQyS1Sd0DreLpRELt9O4lOXCFeZIGNj7PUa
	0VTcSptKDl2C4JJch/LMBZ/lAGIm68oimMEbgWxJbaduOpBt1xkkmhr2JOZ/NkOQoP3WnYLKgt0
	0LRvabuOjmwY/mjVp/08KDTyNNoWpRM5L5Zet4TY63Qy29QbpeQZZtPnyINpxo6GhmbgrhdInND
	FFUgaH+znFti+URb3Z+XsUktkbCswlPqkK22uCtZOHXpxBDFDCJ3qGmldh6Ic4ueIccXxAK0qnq
	TmI6NOBkWQlErWBinoZESX4HKP5dDX3LYOsKCQKAxEVEyk2rzkNtTxEi8bIs0S6y90X1n3HIf4t
	8tSEcaUqnX4e98zSly3W/fWl5YwTeJFFNpD1rHcjw9fvMOLs4UAdA==
X-Received: by 2002:a5d:64e2:0:b0:487:ae0:6459 with SMTP id ffacd0b85a97d-4870d169884mr2405331f8f.40.1789552248673;
        Wed, 16 Sep 2026 02:50:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e? ([2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7642sm5657003f8f.5.2026.09.16.02.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:50:48 -0700 (PDT)
Message-ID: <af593f11-9334-4206-8006-cadd9d5c15c2@linaro.org>
Date: Wed, 16 Sep 2026 11:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real
 consumers
To: Lucas Tanure <tanure@linux.com>,
 Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
 <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
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
In-Reply-To: <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_025051_088531_53BE0F8F 
X-CRM114-Status: GOOD (  14.13  )
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

T24gOS8xNS8yNiAxNzo1NSwgTHVjYXMgVGFudXJlIHdyb3RlOgo+IE9uIDExLzA5LzIwMjYgMTY6
NDAsIFVsZiBIYW5zc29uIHdyb3RlOgo+PiBPbiBTYXQsIFNlcCA1LCAyMDI2IGF0IDU6MzLigK9Q
TSBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+IHdyb3RlOgo+Pj4KPj4+IFRoZSBwcmV2
aW91cyBzZXJpZXMgZm9yIHRoZSBpbnRlcm1pdHRlbnQgYm9vdCBoYW5ncyBvbiB0aGUgVklNNAo+
Pj4gbWFya2VkIHN5c19hbXBpcGVfbmFuZCBhcyBjcml0aWNhbC4gQnV0IGFzIENodWFuIExpdSBm
cm9tIEFtbG9naWMKPj4+IGV4cGxhaW5lZCwgc3lzX2FtcGlwZV9uYW5kIGNsb2NrcyBhIHBpcGVs
aW5lIHN0YWdlIHRoYXQgdGhlCj4+PiBoYXJkd2FyZSBkZXNpZ24gaW5zZXJ0cyBpbiB0aGUgYnVz
IHBhdGggYmV0d2VlbiB0aGUgU0QvZU1NQwo+Pj4gY29udHJvbGxlcnMgYW5kIHRoZSBOSUNfTUFU
UklYIGZhYnJpYyB0byBoZWxwIHRpbWluZyBjbG9zdXJlLgo+Pj4KPj4+IFNvIHRoZSBjbG9jayBo
YXMgcmVhbCBjb25zdW1lcnM6IHJlZmVyZW5jZSBpdCBmcm9tIHRoZSB0aHJlZSBNTUMKPj4+IGNv
bnRyb2xsZXIgbm9kZXMgYW5kIGRyb3AgQ0xLX0lTX0NSSVRJQ0FMIGluc3RlYWQuCj4+Pgo+Pj4g
VGhlIHNlcmllcyBjcm9zc2VzIHRocmVlIHRyZWVzOyBwYXRjaCA0IChjbGspIG11c3Qgb25seSBs
YW5kIGFmdGVyCj4+PiBwYXRjaGVzIDEtMywgb3RoZXJ3aXNlIHRoZSBETUEgaGFuZ3MgZml4ZWQg
YnkgNDNlMTcwNWVjYWI5IGNvbWUgYmFjay4KPj4+Cj4+PiBDaGFuZ2VzIHNpbmNlIHYxIFszXToK
Pj4+IMKgIC0gRHJvcHBlZCB0aGUgRml4ZXM6IHRhZzsgdGhpcyBzZXJpZXMgaXMgYW4gaW1wcm92
ZW1lbnQgYW5kIHNob3VsZCBub3QKPj4+IMKgwqDCoCBiZSBwaWNrZWQgdXAgYnkgc3RhYmxlIChK
ZXJvbWUgQnJ1bmV0KQo+Pj4gwqAgLSBNb3ZlZCB0aGUgcGF0Y2ggNCBkZXBlbmRlbmN5IG5vdGUg
YmVsb3cgdGhlIC0tLSBzbyBpdCBpcyBub3Qga2VwdAo+Pj4gwqDCoMKgIGZvciBwb3N0ZXJpdHkg
KEplcm9tZSBCcnVuZXQpCj4+PiDCoCAtIERyb3BwZWQgdGhlIGUtbWFpbCBhZGRyZXNzIGZyb20g
dGhlIEFzc2lzdGVkLWJ5IHRyYWlsZXIsIHNlZQo+Pj4gwqDCoMKgIERvY3VtZW50YXRpb24vcHJv
Y2Vzcy9jb2RpbmctYXNzaXN0YW50cy5yc3QgKEplcm9tZSBCcnVuZXQpCj4+PiDCoCAtIEZpeGVk
IHRoZSBzcGFjZS1pbmRlbnRlZCBlcnJvciBwYXRoIGFkZGVkIHRvIG1lc29uX21tY19wcm9iZSgp
IGluCj4+PiDCoMKgwqAgcGF0Y2ggMiwgaXQgZGlkIG5vdCBwYXNzIGNoZWNrcGF0Y2gKPj4+IMKg
IC0gRHJvcHBlZCB0aGUgQ0xLX1BJUEVMSU5FKCkgbWFjcm8gZnJvbSBwYXRjaCAyOyBoYXNfcGlw
ZWxpbmVfY2xrIGlzIGEKPj4+IMKgwqDCoCBjYXBhYmlsaXR5IGZsYWcsIG5vdCBhbiBTRF9FTU1D
X0NMT0NLIHJlZ2lzdGVyIGZpZWxkCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gTHVjYXMKPj4+Cj4+PiBM
dWNhcyBUYW51cmUgKDQpOgo+Pj4gwqDCoCBkdC1iaW5kaW5nczogbW1jOiBhbWxvZ2ljLG1lc29u
LWd4LW1tYzogZG9jdW1lbnQgdGhlIFQ3IHBpcGVsaW5lIGNsb2NrCj4+PiDCoMKgIG1tYzogbWVz
b24tZ3g6IGVuYWJsZSB0aGUgYnVzIHBpcGVsaW5lIGNsb2NrIG9uIFQ3Cj4+PiDCoMKgIGFybTY0
OiBkdHM6IGFtbG9naWM6IHQ3OiBhZGQgdGhlIHBpcGVsaW5lIGNsb2NrIHRvIHRoZSBNTUMgY29u
dHJvbGxlcnMKPj4+IMKgwqAgY2xrOiBtZXNvbjogdDc6IGRvbid0IG1hcmsgc3lzX2FtcGlwZV9u
YW5kIGFzIGNyaXRpY2FsCj4+Pgo+Pj4gwqAgLi4uL2JpbmRpbmdzL21tYy9hbWxvZ2ljLG1lc29u
LWd4LW1tYy55YW1swqDCoMKgIHwgMjkgKysrKysrKysrKysrKysrKysrLQo+Pj4gwqAgYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzacKgwqAgfCAxNSArKysrKystLS0t
Cj4+PiDCoCBkcml2ZXJzL2Nsay9tZXNvbi90Ny1wZXJpcGhlcmFscy5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDEwICsrKy0tLS0KPj4+IMKgIGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1j
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjAgKysrKysrKysrKysrKwo+Pj4gwqAg
NCBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4+Cj4+
PiAtLSAKPj4+IDIuNTUuMAo+Pj4KPj4KPj4gUGF0Y2ggMSBhbmQgcGF0Y2gyIGFwcGxpZWQgZm9y
IG5leHQsIHRoYW5rcyEKPj4KPj4gS2luZCByZWdhcmRzCj4+IFVmZmUKPiBIaSBOZWlsLAo+IAo+
IEFueSBjaGFuY2UgeW91IGNvdWxkIHF1ZXVlIHBhdGNoIDMgZm9yIHRoaXMgY3ljbGU/IFBhdGNo
IDIgaXMgYWxyZWFkeSBpbgo+IG5leHQsIGFuZCB1bnRpbCB0aGUgRFRTIGxhbmRzIHRoZSBNTUMg
cHJvYmUgZmFpbHMgb24gVDcgd2l0aCAibWlzc2luZwo+IHBpcGVsaW5lIGNsb2NrIi4KCkRvbmUg
IQoKVGhhbmtzLApOZWlsCgo+IAo+IFRoYW5rcwo+IEx1Y2FzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
