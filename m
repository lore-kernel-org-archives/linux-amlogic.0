Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB5AC27C53
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2024 14:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ai4f+HFmZoOIWQuDbkUbTW3vF9e6bjX5xrrIZvBhGVU=; b=n0sk7sF0zJzT0ZLsm2KYiYaZJL
	5GeR8fbFyS+HZCS8IDrs+yXMpn/9y8leiBWAgkPOF38tz1lYmowCXQzm1oT4vZllp27F20iiD3btr
	RqEYD6Dh72G9ZBKPRhCzTN3BhDosGMrBIH0t+ppKLJCSP/Bkb3wjLox3FDFe9bWtNNmEyuv3Xrw9r
	HoSEA05oecJW+blKET/5e+MuKLv/TZ2o3IjS4DwGUVv34/Rkbcja/z75Q3vmdp4mEdUlodeyJVzGy
	AgzJS4bbgQAHouhM3z0z4h8XUR172OaQzfJ37I+RAslN3WQfNsMRo50nkUBfBbeMjCr6qXpQUAvqJ
	qp7q3Phg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvxk-00000001QEn-12CC;
	Wed, 19 Jun 2024 14:07:00 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvxg-00000001QDs-4BY0
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Jun 2024 14:06:58 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52c32d934c2so7020388e87.2
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Jun 2024 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718806014; x=1719410814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOr4iu6teVpsHNPWQXbJiEP6o5tokwgekB7kWz6BuxI=;
        b=iUs77+2v2NY/FuH2YwfmNym+/NgxiIwwRk2dNCd4K6nwM2SKk9YzAxerDxx9se4coR
         7eeOGhaXFOzXZHiG54mNREdPM8iqmFwoAXbK3yuUq6lCcG+sqaMW7PuyLYEwTb6oSUOn
         OLogsjAS8kx75GZKyU326e2skQl4hc49oolLCRVUc6WiIekFOZLEX5e09PvQD67o8hYz
         CdbTz3yUKqDHJNBqJqZItmhGHF76N+coSxzyUlti/wV2MPw4yA+5mac2u53MkiGZHtug
         ms37l/btGoMkjrtRLVtrkDgCTojX8rK9tRzebCa6kpWHI+0rty7c7GyiztIaDoblI/b+
         8qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806014; x=1719410814;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QOr4iu6teVpsHNPWQXbJiEP6o5tokwgekB7kWz6BuxI=;
        b=k0hEhYcUW0hgCCc6NnIgJXeCyk+wNHtxfa/OfRUNb7IBvcntuiDnQOAoK5wmnb29w5
         11TduIjM4sjYO6xr7HVOv0p4FGVm8x2I3nEphMTi88Dx3X2TgPYJ0/RW1jDdnVwRbYUg
         y9fp3vLDL/zEBL3rgX1Xtp91gqqZh7iKKEiWL5IC3lDrWXQ2jkQZMhGbtJPAnrquO+v1
         WB8HUTUfk3uMYYztUSDsVhVK/yYlfz+q2ecNmN9anvnXwOX5iwf/ZsYWkTg7ORW8ozzq
         wigdpN5TKb7t7URdxlHEcjY6i2jpcWq29loElwpqGDwupuTsv36Rx+5UuSm1BiVihCuY
         hTWA==
X-Forwarded-Encrypted: i=1; AJvYcCV16u2EctUeFGlNiKjkerqcYDsTt1uKSVpA4qsdVvV5WfB4meCk22MUWj3vJGBZeSQrfkSG4gLYsf0GgliBZX2DTBlnCN57f90GKMHq2299x7k=
X-Gm-Message-State: AOJu0Ywj7Bxk+JNXJpilJKvd6uxrw7ux96mNp90OZeKYHt6siQfzS2aA
	/1u/gC19Xqjeha3j1jNSNopn75CLVrWfxUhR4NAunWS+tNZ+T8JF9huJY0PG/2I=
X-Google-Smtp-Source: AGHT+IGZzKxZqU0gSKtpTGhR7ZeeSkZb8RiSot2BWwH0rwzLtW6i8tLMVFpt5/T6tnzm3UjlTpvVAQ==
X-Received: by 2002:a19:f60b:0:b0:52c:dbc:643d with SMTP id 2adb3069b0e04-52ccaa343bbmr1485260e87.27.1718806013488;
        Wed, 19 Jun 2024 07:06:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed45:cb25:b4fd:b1fa? ([2a01:e0a:982:cbb0:ed45:cb25:b4fd:b1fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e73b1sm269729675e9.45.2024.06.19.07.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 07:06:52 -0700 (PDT)
Message-ID: <39d1c5e1-e27b-4736-87e0-ca42ccf8885a@linaro.org>
Date: Wed, 19 Jun 2024 16:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add initial support for Dreambox
 One/Two
To: Christian Hewitt <christianshewitt@gmail.com>,
 kernel test robot <lkp@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, AML
 <linux-amlogic@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 oe-kbuild-all@lists.linux.dev
References: <20240606094513.3949323-3-christianshewitt@gmail.com>
 <202406071527.fnfhnkUL-lkp@intel.com>
 <FB2C9481-FCA2-496D-B916-E429BB8C0C82@gmail.com>
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
In-Reply-To: <FB2C9481-FCA2-496D-B916-E429BB8C0C82@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_070657_110161_E76943F4 
X-CRM114-Status: GOOD (  15.63  )
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

T24gMDcvMDYvMjAyNCAxMDozMSwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPj4gT24gNyBKdW4g
MjAyNCwgYXQgMTI6MTDigK9QTSwga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+IHdy
b3RlOgo+Pgo+PiBIaSBDaHJpc3RpYW4sCj4+Cj4+IGtlcm5lbCB0ZXN0IHJvYm90IG5vdGljZWQg
dGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoKPj4KPj4gW2F1dG8gYnVpbGQgdGVzdCBXQVJO
SU5HIG9uIHJvYmgvZm9yLW5leHRdCj4+IFthbHNvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBrcnpr
L2Zvci1uZXh0IGxpbnVzL21hc3RlciB2Ni4xMC1yYzIgbmV4dC0yMDI0MDYwNl0KPj4gW2Nhbm5v
dCBhcHBseSB0byBrcnprLWR0L2Zvci1uZXh0IGtyemstbWVtLWN0cmwvZm9yLW5leHRdCj4+IFtJ
ZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJv
cCB1cyBhIG5vdGUuCj4+IEFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gsIHdlIHN1Z2dlc3QgdG8g
dXNlICctLWJhc2UnIGFzIGRvY3VtZW50ZWQgaW4KPj4gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2Nz
L2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0KPj4KPj4gdXJsOiAgICBo
dHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0NocmlzdGlhbi1I
ZXdpdHQvZHQtYmluZGluZ3MtYXJtLWFtbG9naWMtYWRkLXN1cHBvcnQtZm9yLURyZWFtYm94LU9u
ZS1Ud28vMjAyNDA2MDYtMTc1NDI3Cj4+IGJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcm9iaC9saW51eC5naXQgZm9yLW5leHQKPj4gcGF0Y2gg
bGluazogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDYwNjA5NDUxMy4zOTQ5MzIz
LTMtY2hyaXN0aWFuc2hld2l0dCU0MGdtYWlsLmNvbQo+PiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0gg
My8zXSBhcm02NDogZHRzOiBtZXNvbjogYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgRHJlYW1ib3gg
T25lL1R3bwo+PiBjb21waWxlcjogY2xhbmcgdmVyc2lvbiAxOS4wLjBnaXQgKGh0dHBzOi8vZ2l0
aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdCBkN2QyZDRmNTNmYzc5YjRiNThlOGQ4ZDA4MTUxYjU3
N2MzNjk5ZDRhKQo+PiBkdHNjaGVtYSB2ZXJzaW9uOiAyMDI0LjYuZGV2MStnODMzMDU0Zgo+PiBy
ZXByb2R1Y2U6IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNDA2
MDcvMjAyNDA2MDcxNTI3LmZuZmhua1VMLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQo+Pgo+PiBJ
ZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3Qg
anVzdCBhIG5ldyB2ZXJzaW9uIG9mCj4+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBh
ZGQgZm9sbG93aW5nIHRhZ3MKPj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+Cj4+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVp
bGQtYWxsLzIwMjQwNjA3MTUyNy5mbmZobmtVTC1sa3BAaW50ZWwuY29tLwo+Pgo+PiBkdGNoZWNr
IHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCj4+ICAgIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2k6MjY2LjMzLTE1NDAuNzogV2Fybmlu
ZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IC9zb2MvYnVzQGZmNjAwMDAwL2J1c0AzNDQwMC9waW5j
dHJsQDQwOiBub2RlIGhhcyBhIHVuaXQgbmFtZSwgYnV0IG5vIHJlZyBvciByYW5nZXMgcHJvcGVy
dHkKPj4gICAgICBhbHNvIGRlZmluZWQgYXQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLWcxMi1jb21tb24uZHRzaToyNjYuMzMtMTU0MC43Cj4+ICAgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2k6MjY2LjMzLTE1NDAuNzogV2FybmluZyAo
c2ltcGxlX2J1c19yZWcpOiAvc29jL2J1c0BmZjYwMDAwMC9idXNAMzQ0MDAvcGluY3RybEA0MDog
bWlzc2luZyBvciBlbXB0eSByZWcvcmFuZ2VzIHByb3BlcnR5Cj4+ICAgICAgYWxzbyBkZWZpbmVk
IGF0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2k6MjY2
LjMzLTE1NDAuNwo+PiAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNv
bW1vbi5kdHNpOjIyMjAuMjMtMjI2MC42OiBXYXJuaW5nIChhdm9pZF91bm5lY2Vzc2FyeV9hZGRy
X3NpemUpOiAvc29jL2J1c0BmZmQwMDAwMC9kc2lANzAwMDogdW5uZWNlc3NhcnkgI2FkZHJlc3Mt
Y2VsbHMvI3NpemUtY2VsbHMgd2l0aG91dCAicmFuZ2VzIiBvciBjaGlsZCAicmVnIiBwcm9wZXJ0
eQo+PiAgICAgIGFsc28gZGVmaW5lZCBhdCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tZzEyLWNvbW1vbi5kdHNpOjIyMjAuMjMtMjI2MC42Cj4+Pj4gYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWcxMmItZHJlYW1ib3gtb25lLmR0YjogL3NvYy9idXNAZmY2MDAwMDAv
YnVzQDQyMDAwL2Nsb2NrLWNvbnRyb2xsZXJAMDogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEg
d2l0aCBjb21wYXRpYmxlOiBbJ2FtbG9naWMsZzEyYS1hdWRpby1jbGtjJ10KPj4gICAgYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZHJlYW1ib3gtb25lLmR0YjogL3NvYy9i
dXNAZmY2MDAwMDAvYnVzQDQyMDAwL2F1ZGlvLWNvbnRyb2xsZXJANzQ0OiBmYWlsZWQgdG8gbWF0
Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYW1sb2dpYyxnMTJhLXRvaGRtaXR4J10K
Pj4+PiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1kcmVhbWJveC1vbmUu
ZHRiOiBzeXMtY3RybEAwOiAnI2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2VsbHMnLCAncmFuZ2Vz
JyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAncGluY3RybC1bMC05XSsnCj4+ICAg
ICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvYy9hbWxv
Z2ljL2FtbG9naWMsbWVzb24tZ3gtaGhpLXN5c2N0cmwueWFtbCMKPj4gLS0KPj4gICAgYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaToyNjYuMzMtMTU0MC43
OiBXYXJuaW5nICh1bml0X2FkZHJlc3NfdnNfcmVnKTogL3NvYy9idXNAZmY2MDAwMDAvYnVzQDM0
NDAwL3BpbmN0cmxANDA6IG5vZGUgaGFzIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVnIG9yIHJhbmdl
cyBwcm9wZXJ0eQo+PiAgICAgIGFsc28gZGVmaW5lZCBhdCBhcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpOjI2Ni4zMy0xNTQwLjcKPj4gICAgYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaToyNjYuMzMtMTU0MC43OiBX
YXJuaW5nIChzaW1wbGVfYnVzX3JlZyk6IC9zb2MvYnVzQGZmNjAwMDAwL2J1c0AzNDQwMC9waW5j
dHJsQDQwOiBtaXNzaW5nIG9yIGVtcHR5IHJlZy9yYW5nZXMgcHJvcGVydHkKPj4gICAgICBhbHNv
IGRlZmluZWQgYXQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24u
ZHRzaToyNjYuMzMtMTU0MC43Cj4+ICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1nMTItY29tbW9uLmR0c2k6MjIyMC4yMy0yMjYwLjY6IFdhcm5pbmcgKGF2b2lkX3VubmVjZXNz
YXJ5X2FkZHJfc2l6ZSk6IC9zb2MvYnVzQGZmZDAwMDAwL2RzaUA3MDAwOiB1bm5lY2Vzc2FyeSAj
YWRkcmVzcy1jZWxscy8jc2l6ZS1jZWxscyB3aXRob3V0ICJyYW5nZXMiIG9yIGNoaWxkICJyZWci
IHByb3BlcnR5Cj4+ICAgICAgYWxzbyBkZWZpbmVkIGF0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2k6MjIyMC4yMy0yMjYwLjYKPj4+PiBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1kcmVhbWJveC10d28uZHRiOiAvc29jL2J1c0Bm
ZjYwMDAwMC9idXNANDIwMDAvY2xvY2stY29udHJvbGxlckAwOiBmYWlsZWQgdG8gbWF0Y2ggYW55
IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYW1sb2dpYyxnMTJhLWF1ZGlvLWNsa2MnXQo+PiAg
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1kcmVhbWJveC10d28uZHRi
OiAvc29jL2J1c0BmZjYwMDAwMC9idXNANDIwMDAvYXVkaW8tY29udHJvbGxlckA3NDQ6IGZhaWxl
ZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydhbWxvZ2ljLGcxMmEtdG9o
ZG1pdHgnXQo+Pj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWRyZWFt
Ym94LXR3by5kdGI6IHN5cy1jdHJsQDA6ICcjYWRkcmVzcy1jZWxscycsICcjc2l6ZS1jZWxscycs
ICdyYW5nZXMnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLVswLTld
KycKPj4gICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
c29jL2FtbG9naWMvYW1sb2dpYyxtZXNvbi1neC1oaGktc3lzY3RybC55YW1sIwo+IAo+IE5vdGhp
bmcgdG8gZml4LiBUaGUgcGF0Y2gganVzdCBkZXBlbmRzIG9uIE5laWzigJlzIGJpbmRpbmcgZml4
ZXMgaGVyZToKPiAKPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
YW1sb2dpYy9jb3Zlci8yMDI0MDYwNi10b3BpYy1hbWxvZ2ljLXVwc3RyZWFtLWJpbmRpbmdzLWZp
eGVzLWR0cy12MS0wLTYyZTgxMjcyOTU0MUBsaW5hcm8ub3JnLwoKQ2FuIHlvdSByZXNlbnQgYnV0
IGtlZXBpbmcgdGhlIGFzc2lnbmVkLWNsb2NrcyBpbiB0aGUgc291bmQgY2FyZCBub2RlID8KCkJU
VyBrZWVwIHRoZSByZXZpZXdlZC1ieS4KClRoYW5rcywKTmVpbAoKPiAKPiBDaHJpc3RpYW4KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
