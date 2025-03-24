Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA2C36002
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Mar 2025 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoWif3tXGDac+mQ6ofyDLi4pLbzvSPLDDu0ne5Vo87E=; b=0BuN3AgLyq5TtYHAMZrZNsV/C1
	5ZIuDk+EiRuuZVLAZhAuhCNu91GP8of6+hvK4/gonLGybV+rRH2rnAqZeRCASN7yW5Rw981UGcX/l
	IKFyoG/jOleO92rE+5Ulg07j75EUQZYGdmjVRo+hdnDTxKtmkZZw1NaZVnfxiG2gE3Sfe2dqB3adK
	GoK97bRIlhPXUerCQIUScv3a3PA6EVXKgQiNJpH5Y0uRk6t1rceSatY641fZs8YSfQPUmhFtqEImi
	0LKzd/KJK9BXAVyQnkCAiYc4FJdyL5FMMD+OhsbG3x+9bEsY0GBAQHZO/82Ujc69T4ehRrnLT8oKI
	o6XAgrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbuP-00000002Owh-3asu;
	Mon, 24 Mar 2025 07:07:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbqg-00000002OUo-4Bmh
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Mar 2025 07:03:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2240866f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Mar 2025 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742799829; x=1743404629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evKoye4qr3e2esDEjAClgjzYt25iik3YDkZA93sVcVQ=;
        b=LFjACb8lwZysxSb74+RiPxPmvXFF9ToLsa5jqCyOUXHFNstt+mXZ7udDGYU2UObfiy
         VrNpVTkPgNzRVAND2Is3PuUHDaaYELwqQA2xxEbxYd1N/v1oztDDPgeTfoi7GrNHh/FG
         vSc5NumEIqr/JZ7JlSai+VHUZqxpDcCdR78ElzXCRuXokGGRcpNccKeD/peakiXjcIdq
         xzvLCZjEMZpaUPPKOiURY+zYOy+dgqlE9RBrjP969p232TEvij8otcvrmTBdy+O3/vHb
         VPh+9AJsfhjYnGew5LNOiL7S/Id9RgZAM+4U2PstW3Sl9gDOuea4GjcbJjn0bidM3mNh
         XY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742799829; x=1743404629;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=evKoye4qr3e2esDEjAClgjzYt25iik3YDkZA93sVcVQ=;
        b=lBOXtGXpSOV0vvvWroFjDecqzWyWavHeQbk9LtG/ik7+GWd9/JGJ6xQS9ISUkxFkey
         +XadBUuO2mazBj6GCt//mhD99fsoTLEOdMIO4Ti5g4VVyPNeKTFgonfILRtIyQYaXKxm
         UkuL6Era2XMoBzE1VB4wl9IF171A9KpoJRjwLeYgaoA4BjCReGG3kGYXoVs5Nowbm6A2
         HXd6kKr6d4GRQEQztiJeHMnOcN5ATClZJs2qzMLt64Pkvw5lUEmzunkUYPo+pSHJAxHd
         G3wcoLV9OAHYRJAkdGkMJwP6NsXhmmtizJ17NzT+Jmgiq+oPzslrZMqbugcvW8FfH92m
         5Hkw==
X-Forwarded-Encrypted: i=1; AJvYcCXOOIO0poGo0FtRWP6dc8CMvmQIdEq4ajpLjMve9XibMge2WmL8By6iF/tRZLDt2TpBj0mLE4YwZQul4Tbu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo2Sk9aLv6GpGADbLB/5nwgVI38FUoR7JpFcq98L6TIMG6MGcO
	PGX/CFvCnzlqc2ubiuDcGW92wMGKxfUvUb+zB9d6LgUd8HymVby3DwST9/8oWj4=
X-Gm-Gg: ASbGncs7WNi86mBB8Sksi6bqvzaEHnNhmvY9dFa0O5PrTt6wusOG3On/MQV8pJt4L5u
	8ZHlz8bW45tMN1WHzunZI/hJTW/qnlUFCT3Xv7CYsw0tbfL0i4aUj0e+MsVH376/0THrHru2tv2
	ityCeTzKD9T+TpK6xxtLvsyUJutKNPky4NFUXEbL3F8p394y9juNhkL3WUAbqJnOiBnGPmpjBFW
	j65vy27XiROH9+zBTx7KHia15fulpN/LyE55XYJFIj5/Dw2Vw/cn/Jm89gO9MtvA/yeybfaRa7X
	BQzDfxJD6kdXHxDp1CmqKKXoiLWxotTCjaUslmLt1cZmv0q6sHXuWdgAXeQ2O8lGZVpjQg3Na9d
	EfenCCtZi122OljSo
X-Google-Smtp-Source: AGHT+IFrItb54fv7OtyWO3JUfvqB/p+6ybKUl5+PzXmwRlD5DkQF8OviAn1ax7qXq3VcP+u5iINy8A==
X-Received: by 2002:a5d:5f96:0:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-3997f91072amr9832062f8f.14.1742799829315;
        Mon, 24 Mar 2025 00:03:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f? ([2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5939sm10243311f8f.60.2025.03.24.00.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 00:03:48 -0700 (PDT)
Message-ID: <88dbbf6e-7886-4261-ac46-55738156a5fb@linaro.org>
Date: Mon, 24 Mar 2025 08:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
 <20250319190150.31529-4-funderscore@postmarketos.org>
 <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
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
In-Reply-To: <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_000351_033918_A75FA8A1 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Artur Weber <aweber.kernel@gmail.com>, devicetree@vger.kernel.org, Karl Chan <exxxxkc@getgoogleoff.me>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTkvMDMvMjAyNSAyMzozNiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIZWxsbywK
PiAKPiB0aGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIGFuZCBzb3JyeSBmb3IgdGhlIGxhdGUg
cmVwbHkhCj4gCj4gT24gV2VkLCBNYXIgMTksIDIwMjUgYXQgODowMuKAr1BNIEZlcmFzcyBFbCBI
YWZpZGkKPiA8ZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZz4gd3JvdGU6Cj4gWy4uLl0KPj4g
KyAgICAgICBhdTI6IGFuYWxvZy1hbXBsaWZpZXIgewo+PiArICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJzaW1wbGUtYXVkaW8tYW1wbGlmaWVyIjsKPj4gKyAgICAgICAgICAgICAgIHNvdW5k
LW5hbWUtcHJlZml4ID0gIkFVMiI7Cj4+ICsgICAgICAgICAgICAgICBWQ0Mtc3VwcGx5ID0gPCZ2
Y2NfNXY+Owo+PiArICAgICAgICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZncGlvIEdQSU9IXzUg
R1BJT19BQ1RJVkVfSElHSD47Cj4+ICsgICAgICAgfTsKPiBJIGNvdWxkbid0IGZpbmQgYW55IHBp
Y3R1cmVzIG9ubGluZSB0aGF0IHNob3cgYW4gYW5hbG9nIGF1ZGlvIG91dHB1dAo+ICh0eXBpY2Fs
bHkgYSAzLjVtbSBzb2NrZXQpLgo+IENhbiB5b3UgY29uZmlybSB0aGF0IHRoaXMgaXMgcmVhbGx5
IHByZXNlbnQ/Cj4gCj4gWy4uLl0KPj4gKyAgICAgICBzb3VuZCB7Cj4+ICsgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gImFtbG9naWMsZ3gtc291bmQtY2FyZCI7Cj4+ICsgICAgICAgICAgICAg
ICBtb2RlbCA9ICJYSUFPTUktQVFVQU1BTiI7Cj4+ICsgICAgICAgICAgICAgICBhdWRpby1hdXgt
ZGV2cyA9IDwmYXUyPjsKPj4gKyAgICAgICAgICAgICAgIGF1ZGlvLXdpZGdldHMgPSAiTGluZSIs
ICJMaW5lb3V0IjsKPj4gKyAgICAgICAgICAgICAgIGF1ZGlvLXJvdXRpbmcgPSAiQVUyIElOTCIs
ICJBQ09ERUMgTE9MTiIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkFVMiBJ
TlIiLCAiQUNPREVDIExPUk4iLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJM
aW5lb3V0IiwgIkFVMiBPVVRMIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
TGluZW91dCIsICJBVTIgT1VUUiI7Cj4gSWYgdGhlcmUncyBubyBhbmFsb2cgYXVkaW8gaW4vb3V0
IHRoZW4gdGhpcyBzZWN0aW9uIGNhbiBiZSBjbGVhbmVkIHVwCj4gYXMgd2VsbCAtIHRvZ2V0aGVy
IHdpdGggdGhlIHJlZmVyZW5jZXMgdG8gYWNvZGVjIGluIHRoZSBkYWktbGlua3MKPiBiZWxvdy4K
PiAKPiBbLi4uXQo+PiArLyogV2lyZWxlc3MgU0RJTyBNb2R1bGUgKEFtbG9naWMgVzE1NVMxIC8g
UmVhbHRlayBSVEw4ODIxQ1MpICovCj4+ICsmc2RfZW1tY19iIHsKPiBxdWVzdGlvbiB0byBOZWls
OiBzaW5jZSB3ZSBrbm93IHRoYXQgdGhlcmUncyB0d28gYm9hcmQgdmFyaWFudHMgb3V0Cj4gdGhl
cmUgKHdpdGggZGlmZmVyZW50IHdpZmkgY2hpcHNldHMpIC0gYXJlIGR0IG92ZXJsYXlzIGRvd24g
dGhlIHJvYWQKPiBlbm91Z2ggKHRvIGVuYWJsZSBCbHVldG9vdGggLyB3aWZpIC0gZGVwZW5kaW5n
IG9uIHRoZSBjaGlwc2V0IG9yIGJvYXJkCj4gcmV2aXNpb24pIG9yIGRvIHdlIG5lZWQgdG8gc3Bs
aXQgdGhlIHdob2xlIC5kdHM/CgpQZXJoYXBzIHllcwoKTmVpbAoKPiAKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gTWFydGluCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
