Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0D7C3ABC9
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDg/ChRlPcYxf548Ft5l8gBotmaSdVr22ogZDtAyBtk=; b=X0ZJorZgCM7FfIjdKDMiXf4cPS
	QVMpCQAAdcTKqn22bkGKUPoPyCxflhjGi6aCNI2R9suLf3prfsn8xBa4TMwJhZpfbEW+z9ga9ZLyh
	4ya0RT9Ot3QazWwcADQzhP8Id8lGXE4yGxm7+fN9EVfm6NILF4N37eH/zw6sXleLobMXgZ8BeW0Hs
	hEIYkGMWdnyds6AIXKC7C8CmRZ19a6eNz8wfBwTueiosqQ4hsPmjLxvCHlH3NKMCFV4b7lwB36hV7
	yU1X/FZtKpqxMkNx7fBa9xcQD2vX754db+Rj/Cq75JujzNTJw/NTj9M2LWJgU2/u9litbnC2PicoA
	/DL3Opbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVJu-00000004y2L-0UVo;
	Fri, 09 May 2025 21:31:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSph-00000004cSM-0tA4
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 18:52:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1378482f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746816746; x=1747421546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=;
        b=xqtBRXQrXdW2YYeqRR3/5g4YcqJWbRq4Hg/crsbDK4sS9T5Mfx65jwyjL7Ela1AtLl
         /TRv/IDfVw+D1Uj1tgdk4JTYEy7n+eGsopjeUxkUFNqDyFdfo/aRhhFaGmQujwQ1XTXY
         sVUxNi2RipThjm0UaX/L+feLF2WNVAEzj2sEuryOjM31+f6mfCUGjhsgpepN59Tmwvyw
         ybTc9qa3TLY6vxKMGkufW795yobmJsF0UEz/FuedYKMHhM4Djqmmca2Uek+EVgpTE5PV
         9wXtzCBdMyc+kATqLlsy9uvoC3GiFykfS+NtgPyJI4HJhna1QsK/hgAVedq4aoV/PpNn
         mb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816746; x=1747421546;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=;
        b=GbxoO2dykeIajKMFovlETOlvYLUx5l8B0arD+86qmy7ABqiShLsMcStq71aeySnG48
         +daFtYdMaYvRhJLz0zkQEs4JsCztztvH2PS3TJyL+tJsdJ9oCz0LHsEZ2HsnYoVXObOS
         1lMeQgp86mw2J3lVpE7R6gpjhq5TbBg5Ct4tHZRdOywr04G18AU7uI7Woey7eac2PXuf
         5zPFJAcd6MilE1W4VKopQdKP7GIV+gkEuhaVvomD7OQkMXIUiuY7xUrbfrJqrmnT/fg/
         swZvKSbpEiGDDCf5zoQkQaheTID+Z8m9MLKjQsyWr9A7N0e2nqXF8RMRRU7RIKTtQqy6
         /96A==
X-Forwarded-Encrypted: i=1; AJvYcCUAwLEDVFoK88bEBVcU99C5T0eSBAPNRqQGiAu/fT78My/74mBETceb9ydT2Il/H4eZyMCbN9H2WgacDjMJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEAZSefab+5qxvobxPejdWVerVNP8JbsUtmy61SEnkKpqxpBoz
	BhCaLZPF32Jy3p5LcB0d09ggg9ZQb1/dSu6CLE+PhOcx9APOVXnYLaxvw6a5CWk=
X-Gm-Gg: ASbGncuijPQIXGEqb6Mcjvhko9yMj9Kv/oIhhxP/ZU5w3WhAb4RbJq+fKWR5vKdx3lN
	zfE3pK7foskXbOu/8RzpW3IpNWxDhCsNgRI4DSGw9/lkWp8HeQhXdUeQdQ+CQE43J3sYDVO2bwI
	27mrTff0GGTA3prw61Z4Gu0794TkaFesou6TAE+XsoxFe8D5crki+WAmXbOimEYpiDTGzExZNN1
	EEqajj8U+XqSBkm/a+Be/NBjwGTp+CKoL8xE+05tbAIssuNEIctvtgXfZpiaDotJBMLwNhiussV
	n4H4UeWV4qkI2YCoPN7I8TtMlrVipk+yhnVG0jQw0FGzNKo/o2Wx1ZJnI+z+CBk8wo5ZTRUri05
	AL7w8pOhujXCl1JbLry/WkjwIsYQ3
X-Google-Smtp-Source: AGHT+IEkES7QrrP7dWUS3r90TTqs9H9HF3Qrg1w8ITbxBVl4k60rc9jJMmKmLI9AOkx38FcFHuyvrw==
X-Received: by 2002:a05:6000:2088:b0:3a0:b448:e654 with SMTP id ffacd0b85a97d-3a1f64e7509mr3877389f8f.47.1746816746484;
        Fri, 09 May 2025 11:52:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5929:59ab:840a:b8f9? ([2a01:e0a:3d9:2080:5929:59ab:840a:b8f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2ffsm4085907f8f.66.2025.05.09.11.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 11:52:26 -0700 (PDT)
Message-ID: <8ebe2bc3-dec0-4879-a61c-630b96bc4bec@linaro.org>
Date: Fri, 9 May 2025 20:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: I Hsin Cheng <richard120310@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250505184338.678540-1-richard120310@gmail.com>
 <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
 <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
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
In-Reply-To: <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_115229_242865_ADA969C4 
X-CRM114-Status: GOOD (  10.46  )
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

T24gMDkvMDUvMjAyNSAyMDoyNywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBGcmks
IE1heSA5LCAyMDI1IGF0IDU6MzXigK9QTSA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4+Cj4+IE9uIDA1LzA1LzIwMjUgMjA6NDMsIEkgSHNpbiBDaGVuZyB3cm90ZToKPj4+IENv
dmVyaXR5IHNjYW4gcmVwb3J0ZWQgdGhlIHVzYWdlIG9mICJtb2RlLT5jbG9jayAqIDEwMDAiIG1h
eSBsZWFkIHRvCj4+PiBpbnRlZ2VyIG92ZXJmbG93LiBVc2UgIjEwMDBVTEwiIGluc3RlYWQgb2Yg
IjEwMDAiCj4+PiB3aGVuIHV0aWxpemluZyBpdCB0byBhdm9pZCBwb3RlbnRpYWwgaW50ZWdlciBv
dmVyZmxvdyBpc3N1ZS4KPj4+Cj4+PiBMaW5rOiBodHRwczovL3NjYW41LnNjYW4uY292ZXJpdHku
Y29tLyMvcHJvamVjdC12aWV3LzEwMDc0LzEwMDYzP3NlbGVjdGVkSXNzdWU9MTY0Njc1OQo+Pj4g
U2lnbmVkLW9mZi1ieTogSSBIc2luIENoZW5nIDxyaWNoYXJkMTIwMzEwQGdtYWlsLmNvbT4KPj4K
Pj4gQ291bGQgeW91IGFkZCBhIEZpeGVzIHRhZyA/Cj4gRml4ZXM6IDEwMTc1NjAxNjRiNiAoImRy
bS9tZXNvbjogdXNlIHVuc2lnbmVkIGxvbmcgbG9uZyAvIEh6IGZvcgo+IGZyZXF1ZW5jeSB0eXBl
cyIpCj4gCj4gTmVpbCwgY2FuIHlvdSBhZGQgdGhpcyB3aGlsZSBhcHBseWluZyBvciBkbyB3ZSBu
ZWVkIGEgdjM/CgpXaWxsIGFkZCB3aGlsZSBhcHBseWluZy4KClRoYW5rcywKTmVpbAoKPiAKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
