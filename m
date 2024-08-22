Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610E5C5320E
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2024 08:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHnBbkfkgS083wy0cwks7h0FF65qL8ElvOpKB3P1JsQ=; b=Cj97233FsGb019/A4mF6G4AXh4
	k2jgu7micqIxDn7sgPv556kacj9cjDNT1jTBkgzb7drkIpci5UpDth05hJC7OsyrZrJugFWyqNyEj
	A+8hjX5gmlmuZTkWcelik8nqMbOVBnQ/X1SWdSZj8RniAUGp+r+9iaml+gHHA+a3zLdNmOaJaXq/b
	J3pvNRE5f0VmN/py0rEIcDSE4inO5FW9r8EzLTvsybCBT1QscvgrraO4eoPbR9ftBIZBbiRpnpDSK
	GzfbAD6y8+C3mZC02GoT1pCawlogCpGldDF5yGTnRBbMPDebjD75UV276eSwCSGyXn+92bBvxxPIE
	23uyAu5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh36f-0000000C1Ln-0tRX;
	Thu, 22 Aug 2024 08:23:45 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh36c-0000000C1Kw-01yV
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Aug 2024 08:23:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37193ef72a4so274234f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2024 01:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724315020; x=1724919820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm8vzd887oqGFzqEf2cTeZxCy6SkvbO/ScnKSE37Sz0=;
        b=LnmshcGund3kMafoG/E9TDwfDB+EbHoDgY9b91/zeQ5bIwZcx4hqMUGx0rVTOtqU7p
         yP+su90SfNVHZW8HQkwhSl7dbhAAiP7+MMPk4Y52xbvYXnqEjhGOcFE0sFguu141JPlk
         owpxjkhbuj7phnk790zzk85SoED+i4KzY1xJMfYddmIt1dWH2kildS4n49+yScC4YpAF
         Dfm935CQav2pd2VnsN9iWCsExoag+42Gcm6tiHMEqntT/+VlJkYIRpbpJcIxKmpe676o
         Qe7ro5D68EUEpV+IHcP5n6ck0F7Y4jnaS7iebjwZOaTucGXXQ9Nuntw3HA3OtvZEPEOr
         akkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724315020; x=1724919820;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hm8vzd887oqGFzqEf2cTeZxCy6SkvbO/ScnKSE37Sz0=;
        b=iQVKF1Jit+4yCw+jylNMdFYS2j8mM1IJKT+xe7bUEuHfNnbMa0NCfmC3Nlg3ND4wJw
         GWaFNp8WfwmCy6AY36l0vwMaA3vJoyG4J8hXgkrdx6IpCspJ/jAwWiY8dbCfkkcY7HeP
         3zUUvEuC3Y+YJ8iGS6RcWQ6xmguXFwGgyrLgspa4WQufUGomi8p1h7I7ECrXckOreHY1
         qdOOkuPs4ij56cUq6dn7vDwbhOsipvdxoHLE9S722+ZFEl6bm7bGyZrsvdBx9/A8HR31
         +hYU4hhHiN6yZYMHiS3iapspX9yRUUKxbD/XAvg2Yg7cosySE3pyN5SYEEs7Aal1Bi4t
         HUnA==
X-Forwarded-Encrypted: i=1; AJvYcCUzJrH7Z2e3Nx+FA7VQtd+gtCCwPCvHHhqsbQWikQEom6XbzkOwXW0aISpEvRGVN2toOBIGw3YlT2/kNKVZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzUnFLO7cb/b9MxvCfryBA8vr7ysepqir7+2ElyP5G08Qr54NX8
	WOBnPegWnTWWBf7VO3rW4UWpvnvqCVYizsNwZDJ8t4itkEXUSz2y3eM/oIOUPlQ=
X-Google-Smtp-Source: AGHT+IGfMkFqr8dd4SFMyP7YuztiueUF/9X0hfxHnIitOQYxglVZkOJ1xKPs6TAabZG06kZjnigDoQ==
X-Received: by 2002:adf:fd51:0:b0:371:6fc7:d9d9 with SMTP id ffacd0b85a97d-372fd599635mr3318592f8f.23.1724315019168;
        Thu, 22 Aug 2024 01:23:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f06:7793:d95e:24b? ([2a01:e0a:982:cbb0:f06:7793:d95e:24b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm1061406f8f.53.2024.08.22.01.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 01:23:38 -0700 (PDT)
Message-ID: <eacafb4c-ace9-429a-9359-1e2e602e5d7e@linaro.org>
Date: Thu, 22 Aug 2024 10:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for Radxa
 ZERO 2 Pro
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20240712215111.687478-1-naoki@radxa.com>
 <172416784208.3050902.355272849812987526.b4-ty@linaro.org>
 <0D8F14444C69EB08+cfb9ef39-4243-4dd6-859f-98ca34e00e98@radxa.com>
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
In-Reply-To: <0D8F14444C69EB08+cfb9ef39-4243-4dd6-859f-98ca34e00e98@radxa.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_012342_099123_0CC7AE95 
X-CRM114-Status: GOOD (  15.01  )
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

T24gMjIvMDgvMjAyNCAwNToxMSwgRlVLQVVNSSBOYW9raSB3cm90ZToKPiBIaSwKPiAKPiBJJ20g
c29ycnksIGNvdWxkIHlvdSBkcm9wIHRoZXNlIHBhdGNoZXMgZnJvbSBhbWxvZ2ljL2xpbnV4Lmdp
dD8KPiAKPiBJIGNoYW5nZWQgbXkgbWluZCB0aGF0IGFkZGluZyBuZXcgZHRzIGp1c3QgZm9yIHJl
bmFtaW5nIHByb2R1Y3QgaXMgd3JvbmcuCgpBY2ssIHdpbGwgZHJvcCB0aGUgcGF0Y2hlcy4KCk5l
aWwKCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IC0tIAo+IEZVS0FVTUkgTmFva2kKPiBSYWR4YSBD
b21wdXRlciAoU2hlbnpoZW4pIENvLiwgTHRkLgo+IAo+IE9uIDgvMjEvMjQgMDA6MzAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gU2F0LCAxMyBKdWwgMjAyNCAwNjo1MTox
MCArMDkwMCwgRlVLQVVNSSBOYW9raSB3cm90ZToKPj4+IFJhZHhhIFpFUk8gMiBQcm8gaXMgYSB1
bHRyYSB0aW55IGhpZ2ggcGVyZm9ybWFuY2UgU0JDWzFdIHVzaW5nIHRoZQo+Pj4gQW1sb2dpYyBB
MzExRCBjaGlwLgo+Pj4KPj4+IFsxXSBodHRwczovL3JhZHhhLmNvbS9wcm9kdWN0cy96ZXJvcy96
ZXJvMnBybwo+Pj4KPj4+Cj4+Cj4+IFRoYW5rcywgQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hbWxvZ2ljL2xpbnV4LmdpdCAodjYuMTIv
YXJtNjQtZHQpCj4+Cj4+IFsxLzJdIGR0LWJpbmRpbmdzOiBhcm06IGFtbG9naWM6IGFkZCBzdXBw
b3J0IGZvciBSYWR4YSBaRVJPIDIgUHJvCj4+IMKgwqDCoMKgwqDCoCBodHRwczovL2dpdC5rZXJu
ZWwub3JnL2FtbG9naWMvYy84Zjk3ZWUwYzlmNWM2ZmMyNTA4NDdkNzQ5Mjg3NWE2ZDcxNTJiYTY4
Cj4+IFsyLzJdIGFybTY0OiBkdHM6IGFtbG9naWM6IGFkZCBzdXBwb3J0IGZvciBSYWR4YSBaRVJP
IDIgUHJvCj4+IMKgwqDCoMKgwqDCoCBodHRwczovL2dpdC5rZXJuZWwub3JnL2FtbG9naWMvYy82
OTU5MTc5NmM1ZDU4NTgxNmEzMDYxMzRmNmQ1NjVjZjE5ZGE1NzVlCj4+Cj4+IFRoZXNlIGNoYW5n
ZXMgaGFzIGJlZW4gYXBwbGllZCBvbiB0aGUgaW50ZXJtZWRpYXRlIGdpdCB0cmVlIFsxXS4KPj4K
Pj4gVGhlIHY2LjEyL2FybTY0LWR0IGJyYW5jaCB3aWxsIHRoZW4gYmUgc2VudCB2aWEgYSBmb3Jt
YWwgUHVsbCBSZXF1ZXN0IHRvIHRoZSBMaW51eCBTb0MgbWFpbnRhaW5lcnMKPj4gZm9yIGluY2x1
c2lvbiBpbiB0aGVpciBpbnRlcm1lZGlhdGUgZ2l0IGJyYW5jaGVzIGluIG9yZGVyIHRvIGJlIHNl
bnQgdG8gTGludXMgZHVyaW5nCj4+IHRoZSBuZXh0IG1lcmdlIHdpbmRvdywgb3Igc29vbmVyIGlm
IGl0J3MgYSBzZXQgb2YgZml4ZXMuCj4+Cj4+IEluIHRoZSBjYXNlcyBvZiBmaXhlcywgdGhvc2Ug
d2lsbCBiZSBtZXJnZWQgaW4gdGhlIGN1cnJlbnQgcmVsZWFzZSBjYW5kaWRhdGUKPj4ga2VybmVs
IGFuZCBhcyBzb29uIHRoZXkgYXBwZWFyIG9uIHRoZSBMaW51eCBtYXN0ZXIgYnJhbmNoIHRoZXkg
d2lsbCBiZQo+PiBiYWNrcG9ydGVkIHRvIHRoZSBwcmV2aW91cyBTdGFibGUgYW5kIExvbmctU3Rh
YmxlIGtlcm5lbHMgWzJdLgo+Pgo+PiBUaGUgaW50ZXJtZWRpYXRlIGdpdCBicmFuY2hlcyBhcmUg
bWVyZ2VkIGRhaWx5IGluIHRoZSBsaW51eC1uZXh0IHRyZWUgWzNdLAo+PiBwZW9wbGUgYXJlIGVu
Y291cmFnZWQgdGVzdGluZyB0aGVzZSBwcmUtcmVsZWFzZSBrZXJuZWxzIGFuZCByZXBvcnQgaXNz
dWVzIG9uIHRoZQo+PiByZWxldmFudCBtYWlsaW5nLWxpc3RzLgo+Pgo+PiBJZiBwcm9ibGVtcyBh
cmUgZGlzY292ZXJlZCBvbiB0aG9zZSBjaGFuZ2VzLCBwbGVhc2Ugc3VibWl0IGEgc2lnbmVkLW9m
Zi1ieSByZXZlcnQKPj4gcGF0Y2ggZm9sbG93ZWQgYnkgYSBjb3JyZWN0aXZlIGNoYW5nZXNldC4K
Pj4KPj4gWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2FtbG9naWMvbGludXguZ2l0Cj4+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0Cj4+IFszXSBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0Cj4+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
