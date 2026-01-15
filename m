Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F221BD44C48
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WYDzCFOkU4p99PYeenIpNl6c0TirX1sJ7phfT7dymg=; b=H7m020h3qpuW4oG6cLZTfV9Cny
	NxqRdMdtoXWrDOGYGrqD6ymfYajkWOAbxVG1XRnGUUwuC+ispl5WkMFR3j8yRnknYrifwLoz7UncR
	Oua/tFqcps4qse9UKZkW82T2ufyoemcXvJzuzKfsCR3+A8AL3BQJbtUADTmOYxwwG3XbaJAOFD5KU
	aWNctf5PwhK9S9lnmwY2daEu5ye/LC/5QAB1jMwbCFb9zPbl26epTxUOGIli0MK3jNPCIEJjJrZ8b
	HAPwgTDhDpvlno3G/5QBWkK3PMzUrkgVJ6a3WHSzYE4E0/uqo2eZuSBXt/TWv59FK7Y8aUzTU23i3
	dgaIbZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNyq-0000000CSH2-241v;
	Thu, 15 Jan 2026 14:05:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNyn-0000000CSG3-0ZRa
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jan 2026 14:05:42 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-432755545fcso576963f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jan 2026 06:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768485939; x=1769090739; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYvocclPNzuO2Xle2lrVn+hLTZXEdchNTRgU0mDAfI4=;
        b=fKucQr2lwFtEBefao2rT8YBf4ryAp0tDUFq/j6f+oioBy4avnaqjEYVAGpeHluzKOf
         rapwr9NG1laOlCMZtq6/NWnf3DITGFa3agLbJnUTPi+vp5Ep3SKluBwo4g3hAsHu3n9F
         jJiD4nba3mZ9AIFoobxxCN0FP5SRNJJMl86yNHUd4NK6tbYOX4nYOuqXdKQq65VjXcVy
         8VaaEyh5x1UdQt4rleRH//otB/KPVb3LFhfwVz7dZDAi0Ih0V9e9wNOyjOCvP6xckKW3
         JS9wowT3dlw7HJfe+Gxq1qikMLrNeflTCiYLI3grz8zg3ADxF3qL2+Tau4Wo5hCvHPRg
         TsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485939; x=1769090739;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYvocclPNzuO2Xle2lrVn+hLTZXEdchNTRgU0mDAfI4=;
        b=iQrQ/h9so0QIaDfSIDNlf/2OJFSEGZjGWUanWXQs6CPWYI8n01l+ETteMB0ByLjCPk
         LDriKpvzHT/gj2OpbwUwE7wGm/UfTak6FR9JHUugMykGweJPPQf0s/HeYtEYnY0nucsl
         91w0ukfFCH6mAxdCHXlk7Yhn/hqPUKqW/df5/rHbzDQVJ8GpXYhNZBnYCfY7C6lOkLZW
         loXjrJqK9dgtlSX42CRvjb/YZAkzq1E03PVnlipiiWoLKPR9yJ/TVEsH0VSMavGlV6nr
         U6cIlKcMNCVGvvELZHsLIchVvRlHh/gnV2pZOL52UzFmHTqM9w6l4oG75+BJy1/nlEGF
         R98Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmoHldkXrrw8YqfK85dNEWWLgkEkWEK/1bXaa1fi2hrjJdHcFJxIay5dKEhEjCNuQwBcHywa3dpRJkqr+t@lists.infradead.org
X-Gm-Message-State: AOJu0YxZy18jv6AD9u7LbAEiaqLWWnpKvxTSj0x434qoVBZkgufZmYTc
	59PEPb+ly1QuZAJT6mGzCpNURjwvNm6PW1nROuZnYRRhujSE7QCY3MBYrWrTcCBlBvU=
X-Gm-Gg: AY/fxX5n/33mCcHJBKDppWcfAE3mywP9ELxXtYwGBjUcMsiLzcCEryriyunWy6wC3Gf
	e72yiPj5tK4RjZnHwhVG4/njVQyGJCwifsRMl5SB7ObVKhwtSFe2PFBznplWgPw9Mrn4V9XIKoc
	sqUCCErTKVWlrilfV2lrRF+uwjYWFwYlZTjMX8GVXgOWpir4klnCFKzdHKQOM0mGQJJJThWMJo/
	LpsbXAAWl7aCeMBO8wuS6xy212vLdLWtoq0eb9Gl5Y5KSMp8WPS/je5GLtVL/8ZSgt/Bewq3hby
	ShGfxR82WvOIDxjHdXAA4SMik33svFq/JCeQjQ9nRLcyjOKKx9j+NulF+e2lsLjXid7qOE8XlDw
	OnovO4XcnQiWA1c7GJjz4txiugQ0cYfjZX8iirIv/fZ9hwoFVoofMGxMTspvH92iZkDOsY8XO8n
	4UQ0FuG6ffJVnyqMM+3C5jqPK6KltcyMEjmAYkxxAmDlzR9MNjh0IOGq3ouc+B3Eo=
X-Received: by 2002:a5d:5f52:0:b0:431:8f8:7f17 with SMTP id ffacd0b85a97d-4342d59bf78mr7749285f8f.10.1768485938970;
        Thu, 15 Jan 2026 06:05:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6fc8dcsm6215675f8f.40.2026.01.15.06.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 06:05:38 -0800 (PST)
Message-ID: <89634869-7858-45b7-bc2c-81436e028b83@linaro.org>
Date: Thu, 15 Jan 2026 15:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add the type-c controller on
 Radxa Zero 2
To: Ricardo Pardini <ricardo@pardini.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
 <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-2-8b5cdf328fde@pardini.net>
 <aeaee3b5-5f08-4abe-b646-a45ab79a35ab@linaro.org>
 <1f256bf2-2739-4785-88fd-25101df9dad9@pardini.net>
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
In-Reply-To: <1f256bf2-2739-4785-88fd-25101df9dad9@pardini.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_060541_214921_2811EA66 
X-CRM114-Status: GOOD (  16.69  )
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

T24gMS8xNS8yNiAxNDo1OSwgUmljYXJkbyBQYXJkaW5pIHdyb3RlOgo+IEhpIE5laWwsCj4gCj4g
T24gMTUvMDEvMjAyNiAxNDowMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gCj4+PiBUaGUgUmFk
eGEgWmVybzIgaGFzIGFuIEZVU0IzMDIgY29udHJvbGxlciBvbiBpMmMzIGF0IGFkZHJlc3MgMHgy
MiBhbmQKPj4+IElOVCMgd2lyZWQgdG8gR1BJT0EtMTMuCj4+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGludGVycnVwdHMgPSA8MTMgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPj4KPj4gT0sgaXQgc2VlbXMg
SSBkaWQgcmVhZCB0b28gZmFzdCwgdGhpcyBzaG91bGQgYmUgNzQgIQo+Pgo+PiBTOTIyWCBEYXRh
c2hlZXQgKHNhbWUgYXMgQTMxMUQgZm9yIHRoaXMpCj4+Cj4+IFRhYmxlIDYtMzIgR1BJTyBJbnRl
cnJ1cHQgU291cmNlcwo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPj4gfCBJbnB1dCBNdXggTG9jYXRpb27CoMKgwqAgfMKgwqDCoCBEZXNjcmlwdGlv
biB8Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiB8
IFs3Njo2MV3CoMKgwqDCoMKgwqDCoCB8wqDCoMKgIGdwaW9BWzE1OjBdIHwKPj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+IFNvIGdwaW9BMTMgPT0+
IDc0Cj4gCj4gSW5kZWVkLiBTb3JyeSBmb3IgdGhpcy4KPiAKPj4+ICsKPj4+ICvCoMKgwqDCoMKg
wqDCoCB2YnVzLXN1cHBseSA9IDwmYW9fNXY+Owo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0
YXR1cyA9ICJva2F5IjsKPj4KPj4gQW5kIEkgZ2V0Ogo+Pgo+PiDCoMKgIERUQyBbQ10gYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItcmFkeGEtemVybzIuZHRiCj4+IGFyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLXJhZHhhLXplcm8yLmR0YjogZnVzYjMw
MkAyMiAoZmNzLGZ1c2IzMDIpOiAnY29ubmVjdG9yJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4+
IMKgwqDCoMKgwqDCoMKgwqAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy91c2IvIGZjcyxmdXNiMzAyLnlhbWwjCj4+Cj4+IFBsZWFzZSBhZGQgYSBtaW5pbWFs
IGNvbm5lY3RvciwgbGlrZToKPj4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
bmVjdG9yIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbXBhdGlibGUgPSAidXNiLWMtY29ubmVjdG9yIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gIlVTQi1DIjsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEtcm9sZSA9ICJob3N0IjsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvd2VyLXJvbGUg
PSAic291cmNlIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNvdXJjZS1wZG9zID0gPFBET19GSVhFRCg1MDAwLCAyMDAwLCBQRE9fRklYRURfVVNCX0NP
TU0pPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4KPj4gSSdsbCBkcm9w
IHRoaXMgY2hhbmdlIGZyb20gbXkgdHJlZS4KPiAKPiBBZ2FpbiwgbXkgYmFkLiBNeSBpbnRlbnRp
b24gaGVyZSB3YXMgYSAibWluaW1hbCIgZGVzY3JpcHRpb24sIG1vc3RseSB0byByZXNlcnZlIDB4
MjIgc28gZW5kLXVzZXJzIGNhbiBydW4gYGkyY2RldGVjdGAgb3Igc3VjaCBvbiB0aGUgNDAtcGlu
IGV4cG9zZWQgaTJjMyBhbmQgbm90IGJlIHN1cnByaXNlZC4gR3Vlc3MgSSBkaWRuJ3QgcnVuIGR0
YnNfY2hlY2sgaGFyZCBlbm91Z2ggYW5kIG1pc3NlZCB0aGUgcmVxdWlyZWQgY29ubmVjdG9yLgo+
IAo+Pgo+PiBBbmQgeW91IG1heSBhbHNvIGFkZCBzdXBwb3J0IGZvciB0aGUgc3VwZXJzcGVlZCBt
dXggdG8gc3dpdGNoIHRoZSBVU0IzIHBvbGFyaXR5Lgo+Pgo+PiBJIGhhdmUgYSBwcm90b3R5cGUg
YXQgaHR0cHM6Ly9naXRsYWIuY29tL3N1cGVybmE5OTk5L2xpbnV4Ly0vdHJlZS90b3BpYy8gYW1s
b2dpYy9yYWR4YS16ZXJvMi9mdXNiMzAyP3JlZl90eXBlPWhlYWRzCj4gCj4gSSdsbCB0cnkgeW91
ciBwcm90b3R5cGUuIEkgaGFkIG5vIGlkZWEgaXQgYWN0dWFsbHkgaGFkIHRob3NlIGNhcGFiaWxp
dGllcy4KPiAKPiBEbyB5b3UgdGhpbmsgaXQgaXMgd29ydGggdG8gcmVzZW5kIHRoaXMgd2l0aCBq
dXN0IHRoZSBmaXhlZCA3NCBwaW4gJiB0aGUgbWluaW1hbCBjb25uZWN0b3IgYXMgeW91IHN1Z2dl
c3RlZD8gTm93IHRoYXQgSSd2ZSBzZWVuIHlvdXIgd29yaywgYSAiYWRkIEZVU0IzMDIiIHRoYXQg
ZG9lcyBub3RoaW5nICh3aGlsZSBiZWluZyBjYXBhYmxlKSBmZWVscyBmcml2b2xvdXMgYW5kIGNv
bmZ1c2luZy4KClllcyBwbGVhc2UgcmVzZW50IHdpdGggdGhlIGludGVycnVwdCBmaXggYW5kIG1p
bmltYWwgY29ubmVjdG9yLCBJJ2xsIHJlYmFzZSBteSB3b3JrIG9uIHRvcC4gSXQgc3RpbGwgbmVl
ZHMgc29tZSB0ZXN0aW5nLCBidXQgSSdsbCBiZSBoYXBweSBpZiB5b3UgdGVzdCBpdCBvbiB5b3Vy
IHNpZGUgYXN3ZWxsLgoKTmVpbAoKPiAKPiBUaGFua3MsCj4gUmljYXJkbwo+IAo+IAo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
