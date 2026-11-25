Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E7606A326
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FaP/ZIlQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=amRkfW6m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DLv1H2QaQdmFbqdbZkvoOxF2MkuWFLnTkkk0LYr9fz0=; b=FaP/ZIlQCXM1tv6CLhWFs2HEih
	3RKLwyKVxxhFKjPcOjpZogXm1FibOuwSCFBCxF2g5Hd4aYYENWACdXVoNnuCIMNsoq3p5T5//3KMF
	fFA6FYyzzvNb+BK1q0fc3fdBEiJszRiqYldbm4Ey7E18jY6HNLvRLOB+BDVgbP31k+d0UrLHM2Yud
	VRd66Gmq2mtLQg4bNFDeUyjFIXxwjL/tPF0alJig/D6doGvAz0Vt5k4XLwJVC9ibYo47bT+JhHhIc
	FTn2b7cDTdbzFixNYA43zioDqf8wsJd5lMchQQNvKVoEGPctGcDx+7WhKDhO1Fwx0HsV9L9hNS9hy
	ex+fHaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89x-000000091Fn-2UlP;
	Wed, 25 Nov 2026 08:15:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW89Y-0000000913Y-3UOT
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Nov 2026 08:14:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso51814375e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2026 00:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795594495; x=1796199295; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc4aqCyzYBjWOigmv1O5fiE2Ptnz+1fYVaVELpdQ2fQ=;
        b=amRkfW6mBhHowcM1XSnCqpAiOuudZRpQEOtJQ/e13mrKu8Ijl1dp7fqAL+5OyJ0fm0
         +Cp554gxiryPNUX33Ac202vcuit8OSifP7VxdJGipAjnfam6H7pyggtaZ2tW05pk54XZ
         5XesgzkIBNmC2V1PhqYXaPVZb2Xah1f42avHZRZLGaYLp47WuR61IwzrCt4bABlinCa4
         lRfnqc/sDtvS9PQ7RhRF1NeiyDVnyiSi1SEdtqMpnr/sC6m2e85N2z33TKAtj2vV2SV/
         aHs5azNfS7OhQ6burN6SOC9VN6Fsg65Fj/2OE3dfGEt3oTmr/FrFIkDAEFeoqh574Zqs
         LVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594495; x=1796199295;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rc4aqCyzYBjWOigmv1O5fiE2Ptnz+1fYVaVELpdQ2fQ=;
        b=YEO1W63/GJJIMGeSKAZOcKeVf6ya3F42tDpUvcraVzGxFDn6d5JtxtoCJFWBlRPCWd
         4Z425VNz1HcKM2tXEFOnfBtWTTPalEb5YTOaifVWWj3E42wEOfmRC5HLZ8DjH10GyGF0
         nyIGVZYHkYWvjpsPYnwsf164CV6rrVTLJL9xOtclminxysiSFy09+9f226JlxO/Rwimi
         FFaiAUbEIt9LqSSG1waIOxk+LdzRcRs5dsUM9upOHCh48HLYLrNORDlsmylGgYWGbwlE
         OMUO53ESKCNyM0HvqAzAXR8zCs1wdQy6jt3SKm5m06B2+K3qo/GNlr1abQeHTpMDyHEi
         F/Aw==
X-Forwarded-Encrypted: i=1; AL+hErHBnt0ZoSU2vakRLVQCXLrrsQ4KdAcH9ew3512/VwYJUQLzTys2YM79jDuFUWTFVhjZ+BNWTeEIEyfdsJ0D@lists.infradead.org
X-Gm-Message-State: APuU4Z/M6ERtaXmGNFKn7of8q4N1teWRcFywHZvW931uT9wkg3frIO7n
	HnCAqbaqpCJYUfj3+8ZO8Xvu25fZF8C5iPow/8A3xjNq9DHXE9KBP7hWzQonS8NX+sY=
X-Gm-Gg: AZFdTZdXvgw7OFWkPyj5t81IbCrEF/NwXkTlTPlud2zdrsjc7joEDW/3cB3KzjvbEqB
	YeNx3qXd4jqtWXd/63TGfyg0lYGnQGJD9iVexO9vPzn4ThFrpVyhIcwl7tlQp5OdclpuvjxSQh0
	jZ2l+7hYTLWZsoxOlkTAv8gD8lnMtPz8KH7QKcylFLp6H2YkRzyW2rjuaHSUWlkaUvF3wSTqj3E
	r14rp/mOOd4k4HMU25wt0G+oXgr5v36fzavfG7UpBRBE4CskPvA8RvsQKcTRpwW3kPtMWXDHt0P
	vv+8VmUcNqWo6zGesb/O2jLpswtOpUENmpjQYOtVSVGEoFBS6q2y7n2uGoX8H9FRdgV+Qc2c8uA
	pNwucZpP0ou38l3EQN1NVNEm5DuwFVZGZNkJJbSvqUQxU9FZKiORmVW6eGa54gUHrXqJQXLFtuz
	7htIeoDn1kofBy2MBNsOvNEiZuu5bExoWS/BT3uUJnV25VwIDP60m71uPsnW4N9L7YquaTxEZZP
	Xscua7Vf6efSNhIzsLLVqdzf75Df/M+fA1t3ZWCOcFxtfwTwNO9YHudsLXap+UYKws2dJ1j9ba2
	V3j93Me41RJAPwUbqQFurDTGAHmPY7g9e09BR6ungC06i4Ic1/Cz+y6xl+pRrORnbofi+FVmptO
	U3ttd6PXu
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr372318965e9.7.1795594494562;
        Wed, 25 Nov 2026 00:14:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba3d3679bsm26993885e9.2.2026.11.25.00.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:14:54 -0800 (PST)
Message-ID: <6e408f48-17ca-4927-ae09-c4153e294371@linaro.org>
Date: Wed, 25 Nov 2026 09:14:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel-dev@aliel.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
 <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
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
In-Reply-To: <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_001456_915138_0895236B 
X-CRM114-Status: GOOD (  18.55  )
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMjQvMjYgMjM6MDUsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gSGkgUm9uYWxk
LCBIaSBOZWlsLAo+IAo+IGZpcnN0IG9mIGFsbDogdGhhbmtzIFJvbmFsZCBmb3IgcGlja2luZyB0
aGlzIHVwIQo+IEkgbGlrZSB0aGUgb3ZlcmFsbCBhcHByb2FjaC4gQmVmb3JlIEkgZGl2ZSBkZWVw
IGludG8gdGhpcyBzZXJpZXMgSQo+IHdpbGwgZmluaXNoIHRoZSBjb2RlLXJldmlldyBvZiBWYWxl
cmlvJ3MgQVVESU4gc2VyaWVzLgo+IAo+IFR3byBxdWljayBub3RlcyBiZWxvdy4KPiAKPiBPbiBN
b24sIE5vdiAyMywgMjAyNiBhdCA4OjM44oCvUE0gUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5
Cj4gPGRldm51bGwrbGludXgta2VybmVsLWRldi5hbGllbC5mckBrZXJuZWwub3JnPiB3cm90ZToK
PiBbLi4uXQo+PiBPdmVydmlldyBvZiB0aGUgc2VyaWVzOgo+PiAtIFBhdGNoZXMgMS0zOiBGaXgg
Y29tcGF0aWJsZSBtYXRjaGluZyBpbiBtZXNvbi1neC1oaGktc3lzY3RybCBiaW5kaW5ncywKPj4g
ICAgYWRkIHRoZSBuZXcgYW1sb2dpYyxtZXNvbi1oZG1pLXR4LXBoeSBEVCBzY2hlbWEsIGFuZCBh
bGxvdyB0aGUKPj4gICAgImhkbWktcGh5IiBjaGlsZCBub2RlIHVuZGVyIHRoZSBISEkgc3lzY29u
Lgo+IEl0J3MgYmVlbiBhIGxvbmcgdGltZSwgYnV0IEkgdGhpbmsgd2UndmUgYmVlbiBhc2tlZCBi
eSB0aGUgZGV2aWNldHJlZQo+IG1haW50YWluZXJzIHRvIGhhdmUgcmVnIHByb3BlcnRpZXMgZm9y
IHRoZSBub2RlcyB3aXRoaW4gJmhoaQo+IEJ1dCBJIGNhbid0IGZpbmQgdGhlIG1lc3NhZ2UgYXQg
dGhlIG1vbWVudC4KClRoZSBoaGkgc3lzY29uIG5vZGVzIGRvZXNuJ3QgaGF2ZSAjW2FkZHJlc3N8
c2l6ZV0tY2VsbHMgYW5kIHNvIGZhciBpdAp3YXNuJ3QgcmVxdWlyZWQsIGxldCdzIHdhaXQgZm9y
IGEgcmV2aWV3IGZyb20gRFQgbWFpbnRhaW5lcnMsIEknbSBmaW5lCndpdGggdGhlIGN1cnJlbnQg
ZGVzaWduCgo+IAo+PiAtIFBhdGNoIDQ6IEFkZCB0aGUgbmV3IE1lc29uIEhETUkgVFggUEhZIGRy
aXZlciBpbXBsZW1lbnRpbmcgdGhlIEhETUkKPj4gICAgUEhZIGNvbmZpZ3VyYXRpb24gb3BzLCBh
bG9uZyB3aXRoIHRoZSB0ZW1wb3JhcnkgbGVnYWN5IGNyZWF0aW9uCj4+ICAgIGhlbHBlci4KPiBB
dCBxdWljayBnbGFuY2UgeW91ciBQSFkgYXBwcm9hY2ggd291bGQgYWxzbyBmaXQgcGh5LW1lc29u
OC1oZG1pLXR4LmMKPiBUaGVyZSBzZWVtIHRvIGJlIG1pbm9yIGRpZmZlcmVuY2VzOgo+IC0gdHdv
IGFkZGl0aW9uYWwgZW5hYmxlIGJpdHMgaW4gSEhJX0hETUlfUEhZX0NOVEwxIG9uIEdYQkIgYW5k
IG5ld2VyOgo+IEhETUlfRklGT19FTkFCTEU9QklUKDIpIGFuZCAgSERNSV9GSUZPX1dSX0VOQUxC
RT1CSVQoMykKPiAtIG5ld2VyIFNvQ3Mgc2VlbSB0byBoYXZlIEhISV9IRE1JX1BIWV9DTlRMMy4u
NQo+IAo+IE1lc29uOC84Yi84bTIgSERNSSBzdXBwb3J0IGlzIG5vdCB1cHN0cmVhbSB5ZXQuIFRo
YXQncyB3aHkgdGhvc2UgU29DJ3MKPiB3b24ndCBuZWVkIHRoZSBiYWNrd2FyZHMgY29tcGF0aWJp
bGl0eSBjb2RlLiBTbyBpZiB5b3UgbmVlZCB0byB0d2Vhawo+IHRoZSBkcml2ZXI6IGZlZWwgZnJl
ZSwgdGhlcmUncyBub3QgbXVjaCB5b3UgY2FuIGJyZWFrIQo+IAo+IAo+IEJlc3QgcmVnYXJkcywK
PiBNYXJ0aW4KClRoYW5rcywKTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
