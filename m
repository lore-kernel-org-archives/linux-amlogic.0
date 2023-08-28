Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C84C71153
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 08:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+xBeHJgazHjoffF+sfObTnaT4nf6FpIo93KJmyuiDc=; b=BGrCZBXUaSLyoleT8taUELHeX2
	QTpBTbczbISqZx2gqoiLZ/KgmC4PxqIprVJEfFfxlQZVMm9zcz9zUqSNoC+XmcVsHPUnu4v9TfVYS
	LRFTLJF5n6Qpsi67n1rTcLj0Ay9szhc/NjcT67sWL6Pfc6N0372Ga4Y2BzY2O4tairvqhz6TILp4g
	VqRu+5UJN2YN2BnCbCDGkYf7kxzH6w1h95AS+nTafDBDc1r1aHQi3HzerWEgnTZ7yKGUZMsKROPnn
	3N+UyRURagi8xpVXXKmFrq5q5rcEXoYio1uy8oRtR/aJxKx9jeHEpAbx5w5SNXxOUs9A/7+NHgxoH
	eYXGHJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXXL-0098go-0W;
	Mon, 28 Aug 2023 08:23:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXXI-0098fi-0a
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Aug 2023 08:23:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4018af1038cso28133575e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Aug 2023 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693211026; x=1693815826;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLLA/RmlQ5dfWWOneWVbwaDTQxGK1OaSwXDEB5yYU24=;
        b=xSjoT0xEs8WHbd1ccKeYkQZF4Piwwb/3IYTjIeDbn/idm3TO3MI9SPhqs+87I9I2dh
         nzJD40E3ICAf1Q4LQzlPiJfphzR2FgDgEfcxe0Mxoa6xWGhnqZGtzsmJPmKmtieaeVzT
         7BjmLIxf/4xltN1eD+fz1FrI9RPyGZG6lYT7k6C+cCtJL319qkuxdE1AjUzx1PjU8G4R
         +NQuZy29nVn+l2DuoqQFyf7odPhqqzXggmt/IJ8yxnVGFyjF5MI1YzmMaEEGRpgHZ/ay
         1M+gMq3Qw3YEqietJYC+eGqvwLENJUIS61m8rKuWLpL3LNKcsHBSveCBAx3N7odwSoc8
         RaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693211026; x=1693815826;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tLLA/RmlQ5dfWWOneWVbwaDTQxGK1OaSwXDEB5yYU24=;
        b=l1HOxxlh8pi+FYO2HqJiHxggSvWsFJ06/+6spVGUpL0tE93L3JKNYwiDc+Mpfm6IkV
         w/UcH41Jj9xwDlRzsRmaNAJHm1HdJ35BYxNRWkmm51N0yvKNGK5Qf2u1Ty+Rm82P4HcM
         BD+pOsC59BEYmLNzwdfkDA+YOAnOzoBV6u1879KjA3yPlh5vXa8LZGeAsigjm42wpAjg
         bb3ourPXtehm/mpWyXJ6l6D85cjFDxNUuQORMS3HfxLLsMHVK99SoiHWwh0klejXlStC
         pj2FG5F1QiVau5SJyN8mJcbrtpZAvjhT1Z1kPmWJdSDbjG6IxjrWVvWXG0g7ulspVmpt
         JyCg==
X-Gm-Message-State: AOJu0YzCuFe448rOqa0JpvRMJWRDi4+2rk0uu4KZ+EdNk4QqC+7fFbN0
	iDck2H0zeHvA9lms4pOa+1A0rQ==
X-Google-Smtp-Source: AGHT+IEYN+ttXM+q/7NxPz54iIGGuwHDyAk+HSdey3so7/prKGEnX1QOkB3RejwDO5x0aA+bIU+BOQ==
X-Received: by 2002:a05:600c:22c8:b0:401:b504:b698 with SMTP id 8-20020a05600c22c800b00401b504b698mr6042555wmg.17.1693211025716;
        Mon, 28 Aug 2023 01:23:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5e59:c27b:747a:3f52? ([2a01:e0a:982:cbb0:5e59:c27b:747a:3f52])
        by smtp.gmail.com with ESMTPSA id q20-20020a7bce94000000b003fedcd02e2asm9993248wmj.35.2023.08.28.01.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 01:23:45 -0700 (PDT)
Message-ID: <e070f432-28bd-465f-ad66-53add8b61907@linaro.org>
Date: Mon, 28 Aug 2023 10:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Content-Language: en-US, fr
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, Lucas Tanure <tanure@linux.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230827082944.5100-1-tanure@linux.com>
 <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
 <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
 <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
 <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com>
 <20230828082009.kehgwi4fxtj3bfze@CAB-WSD-L081021>
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
Organization: Linaro Developer Services
In-Reply-To: <20230828082009.kehgwi4fxtj3bfze@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_012348_273352_F7D565C1 
X-CRM114-Status: GOOD (  20.55  )
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

SGksCgpPbiAyOC8wOC8yMDIzIDEwOjIwLCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPiBPbiBTdW4s
IEF1ZyAyNywgMjAyMyBhdCAxMTozMTozNUFNICswMTAwLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4+
IE9uIDI3LTA4LTIwMjMgMTE6MjMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4gSGkgTHVjYXMs
Cj4+Pgo+Pj4gTGUgMjcvMDgvMjAyMyDDoCAxMjowNCwgTHVjYXMgVGFudXJlIGEgw6ljcml0wqA6
Cj4+Pj4gT24gMjctMDgtMjAyMyAxMDo0OCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+IEhp
IEx1Y2FzLAo+Pj4+Pgo+Pj4+PiBMZSAyNy8wOC8yMDIzIMOgIDEwOjI5LCBMdWNhcyBUYW51cmUg
YSDDqWNyaXTCoDoKPj4+Pj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNmE0MTk3Zjk3NjMzMjUwNDNh
YmY3NjkwYTIxMTI0YTlmYWNiZjUyZS4KPj4+Pj4+IE5ldyBTb0Mgd2lsbCB1c2UgdHR5UzAgaW5z
dGVhZCBvZiB0dHlBTUwsIHNvIFQ3IFNvQyBkb2Vzbid0Cj4+Pj4+PiBuZWVkIGEgT0ZfRUFSTFlD
T05fREVDTEFSRS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBUYW51cmUgPHRh
bnVyZUBsaW51eC5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IFNpbmNlIFYxOgo+Pj4+Pj4gLSBhZGQg
U2lnbmVkLW9mZi1ieToKPj4+Pj4+Cj4+Pj4+PiAgwqAgZHJpdmVycy90dHkvc2VyaWFsL21lc29u
X3VhcnQuYyB8IDIgLS0KPj4+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
Pj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQu
Ywo+Pj4+Pj4gYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+Pj4+PiBpbmRleCBj
NGY2MWQ4MmZiNzI3Li43OTBkOTEwZGFmYTVkIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy90
dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL21l
c29uX3VhcnQuYwo+Pj4+Pj4gQEAgLTY0OCw4ICs2NDgsNiBAQCBtZXNvbl9zZXJpYWxfZWFybHlf
Y29uc29sZV9zZXR1cChzdHJ1Y3QKPj4+Pj4+IGVhcmx5Y29uX2RldmljZSAqZGV2aWNlLCBjb25z
dCBjaGFyICpvcHQKPj4+Pj4+ICDCoCBPRl9FQVJMWUNPTl9ERUNMQVJFKG1lc29uLCAiYW1sb2dp
YyxtZXNvbi1hby11YXJ0IiwKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXNv
bl9zZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cCk7Cj4+Pj4+PiAtT0ZfRUFSTFlDT05fREVDTEFS
RShtZXNvbiwgImFtbG9naWMsdDctdWFydCIsCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBtZXNvbl9zZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cCk7Cj4+Pj4+PiAgwqAgI2RlZmluZSBN
RVNPTl9TRVJJQUxfQ09OU09MRV9QVFIoX2Rldm5hbWUpCj4+Pj4+PiAoJm1lc29uX3NlcmlhbF9j
b25zb2xlXyMjX2Rldm5hbWUpCj4+Pj4+PiAgwqAgI2Vsc2UKPj4+Pj4KPj4+Pj4gSG93IGRvIHlv
dSB1c2UgZWFybHljb24gd2l0aCB0aGlzIHJlbW92ZWQgPwo+Pj4+Pgo+Pj4+PiBOZWlsCj4+Pj4g
VGhpcyBpcyBteSBrZXJuZWwgY21kbGluZToKPj4+PiBjb25zb2xlPXR0eVMwLDkyMTYwMCBub19j
b25zb2xlX3N1c3BlbmQgZWFybHljb249dHR5UzAsMHhmZTA3ODAwMAo+Pj4+Cj4+Pj4gQW5kIEkg
Y2FuIHNlZSBteSBsb2c6Cj4+Pj4gYm9vdCA2NGJpdCBrZXJuZWwKPj4+PiBbwqDCoMKgIDAuMDAw
MDAwXSBCb290aW5nIExpbnV4IG9uIHBoeXNpY2FsIENQVSAweDAwMDAwMDAwMDAgWzB4NDEwZmQw
OTJdCj4+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA2LjUuMC1yYzctbmV4dC0y
MDIzMDgyNSsKPj4+PiAodGFudXJlYWxAcnl6ZW4pIChhYXJjaDY0LW5vbmUtbGludXgtZ251LWdj
YyAoR05VIFRvb2xjaGFpbiBmb3IgdGhlCj4+Pj4gQS1wcm9maWxlIEFyY2hpdGVjdHVyZSAxMC4z
LTIwMjEuMDcgKGFybS0xMC4yOSkpIDEwLjMuMSAyMDIxMDYyMSwKPj4+PiBHTlUgbGQgKEdOVSBU
b29sY2hhaW4gZm8zCj4+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gS0FTTFIgZGlzYWJsZWQgZHVlIHRv
IGxhY2sgb2Ygc2VlZAo+Pj4+IFvCoMKgwqAgMC4wMDAwMDBdIE1hY2hpbmUgbW9kZWw6IEtoYWRh
cyB2aW00Cj4+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gT0Y6IHJlc2VydmVkIG1lbToKPj4+PiAweDAw
MDAwMDAwMDUwMDAwMDAuLjB4MDAwMDAwMDAwNTJmZmZmZiAoMzA3MiBLaUIpIG5vbWFwIG5vbi1y
ZXVzYWJsZQo+Pj4+IHNlY21vbkA1MDAwMDAwCj4+Pj4gW8KgwqDCoCAwLjAwMDAwMF0gT0Y6IHJl
c2VydmVkIG1lbToKPj4+PiAweDAwMDAwMDAwMDUzMDAwMDAuLjB4MDAwMDAwMDAwNzJmZmZmZiAo
MzI3NjggS2lCKSBub21hcAo+Pj4+IG5vbi1yZXVzYWJsZSBzZWNtb25ANTMwMDAwMAo+Pj4+IC4u
Lgo+Pj4+IFvCoMKgwqAgMC4wNzkzNjhdIGlvIHNjaGVkdWxlciBtcS1kZWFkbGluZSByZWdpc3Rl
cmVkCj4+Pj4gW8KgwqDCoCAwLjA3OTM3NF0gaW8gc2NoZWR1bGVyIGt5YmVyIHJlZ2lzdGVyZWQK
Pj4+PiBbwqDCoMKgIDAuMDc5NTQ5XSBpbyBzY2hlZHVsZXIgYmZxIHJlZ2lzdGVyZWQKPj4+PiBb
wqDCoMKgIDAuMDgzMzczXSBmZTA3ODAwMC5zZXJpYWw6IHR0eVMwIGF0IE1NSU8gMHhmZTA3ODAw
MCAoaXJxID0gMTQsCj4+Pj4gYmFzZV9iYXVkID0gMTUwMDAwMCkgaXMgYSBtZXNvbl91YXJ0Cj4+
Pj4gW8KgwqDCoCAwLjA4MzQwM10gcHJpbnRrOiBjb25zb2xlIFt0dHlTMF0gZW5hYmxlZAo+Pj4+
Cj4+Pj4gQXMgdGhlIGxvZyBpcyBPSywgYW5kIFQ3IGZvciBub3cgaXMgYmluZGluZyBhZ2FpbnN0
IFM0IGNvZGUgd2UKPj4+PiBzaG91bGQgZHJvcCB0aGlzIHBhdGNoIGFuZCBhZGQgYSBTNCBvbmUg
aWYgbmVlZGVkLgo+Pj4+Cj4+Pj4gQnV0IGp1c3QgaGF2aW5nIHRoaXMgbG9nIGlzIG5vdCBlbm91
Z2ggZm9yIHRlc3RpbmcgZWFybHljb24/Cj4+Pj4gSSBhbSBhc3N1bWluZyB0aGF0IGJ5IGp1c3Qg
aGF2aW5nIHRoZSBsb2cgc2luY2UgMC4wMDAwIGlzIGEgZ29vZAo+Pj4+IHNpZ24gdGhhdCBlYXJs
eWNvbiBpcyB3b3JraW5nLgo+Pj4+IENvdWxkIHlvdSBnaXZlIGZ1cnRoZXIgZ3VpZGFuY2U/Cj4+
Pgo+Pj4gRmlyc3QgdGhlIGtlcm5lbCBhcmd1bWVudCBpcyBzaW1wbHkgImVhcmx5Y29uIiB3aXRo
IG5vIG90aGVyIG9wdGlvbnMsCj4+PiB0aGUgZWFybHljb24gY29kZSB3aWxsIGZldGNoIHRoZSBm
aXJzdCB1YXJ0IHVzaW5nIHRoZSBEVAo+Pj4gL2Nob3Nlbi9zdGRvdXQtcGF0aCBwcm9wZXJ0eS4K
Pj4+Cj4+PiBUaGVuIHlvdSBzaG91bGQgc2VlIHNvbWV0aGluZyBsaWtlIHJpZ2h0IGFmdGVyICJN
YWNoaW5lIG1vZGVsIjoKPj4+IFvCoMKgwqAgMC4wMDAwMDBdIGVhcmx5Y29uOiBtZXNvbjAgYXQg
TU1JTyAweDAwMDAwMDAwZmY4MDMwMDAgKG9wdGlvbnMKPj4+ICcxMTUyMDBuOCcpCj4+Pgo+Pj4g
VGhlIGJvb3QgbG9nIHlvdSBzaGFyZSBkb2Vzbid0IHVzZSBlYXJseWNvbiwgaXQgd2FpdHMgdW50
aWwgYWxsCj4+PiBkZXBlZGVuY3kgb2YgdGhlIFVBUlQKPj4+IGhhcyBiZWVuIHByb2JlZCBiZWZv
cmUgcHJvYmluZyB0aGUgVUFSVCBkcml2ZXIgYW5kIHByaW50cyB0aGUgd2hvbGUgYm9vdAo+Pj4g
bG9nLgo+Pj4KPj4+IEVhcmx5Y29uIGlzIGEgbWVjaGFuaXNtIHRvIHVzZSB0aGUgVUFSVCBIVyBh
cyBjb25maWd1cmVkIGJ5IHRoZQo+Pj4gYm9vdGxvYWRlciBpbgo+Pj4gYSBtaW5pbWFsIHdheSB2
ZXJ5IGVhcmx5IGluIHRoZSBib290IGluIG9yZGVyIHRvIGRldGVjdCB2ZXJ5IGVhcmx5IGxvY2t1
cHMuCj4+Pgo+Pj4gS2VlcGluZyBPRl9FQVJMWUNPTl9ERUNMQVJFIGZvciB0NyB3b3VsZCBlbmFi
bGUgdGhpcy4KPj4+Cj4+PiBOZWlsCj4+Pgo+Pj4+Cj4+Pj4gTHVjYXMgVGFudXJlCj4+Pj4KPj4+
Cj4+IEJ1dCB0aGVuIHdlIHdvdWxkIG5lZWQgdG8gYWRkIEVhcmx5Y29uIGZvciBTNCB0b28uCj4+
IEhvdyBjYW4gd2UgYWRkIG9uZSBFYXJseWNvbiBmb3IgYWxsIGZ1dHVyZSBTb0NzLCBsaWtlIFM0
IGFuZCBUNz8KPj4KPiAKPiBQZXIgbXkgdW5kZXJzdGFuZGluZywgeW91IGp1c3QgbmVlZCB0byBk
ZWNsYXJlIFVBUlQgZHRzIG5vZGUgd2l0aCB0aGUKPiBmb2xsb3dpbmcgY29tcGF0aWJsZSBzdHJp
bmc6ICJhbWxvZ2ljLG1lc29uLWFvLXVhcnQiLiBJdCB3aWxsIGVuYWJsZWQKPiBlYXJseWNvbi4g
VGhlcmUgaXMgbm8gbmVjY2Vzc2FyeSB0byBkZWNsYXJlIHNlcGFyYXRlCj4gT0ZfRUFSTFlDT05f
REVDTEFSRSgpLiBJdCdzIHdvcmtpbmcgb2theSBmb3IgQTEgZHRzOgoKVGhpcyB3b3JrcyBvbiBB
MSBiZWNhdXNlIHVhcnRfQU9fQiBpcyBhbiBBbHdheXMtT24gVUFSVCwgYW5kIHVzaW5nIGFtbG9n
aWMsbWVzb24tYW8tdWFydAppcyBjb3JyZW50LgpCdXQgZm9yIFM0ICYgVDcsIEFtbG9naWMgZHJv
cHBlZCB0aGUgQWx3YXlzLU9uIHBvd2VyIGRvbWFpbiwgc28gdGhlcmUncyBubyBtb3JlIEFPIHVh
cnRzLApzbyB1c2luZyBhbWxvZ2ljLG1lc29uLWFvLXVhcnQgb24gdGhvc2UgaXMgYWJ1c2luZyB0
aGUgRFQgdG8gZW5hYmxlIGEgZHJpdmVyIGZ1bmN0aW9uYWxpdHkuCgpTbyB0aGUgc29sdXRpb24g
aXMgdG8gYWRkIHRob3NlIE9GX0VBUkxZQ09OX0RFQ0xBUkUgYW5kIG9ubHkgdXNlIHRoZSBjb3Jy
ZWN0Ci9jaG9zZW4vc3Rkb3V0LXBhdGggcHJvcGVydHkuCgpOZWlsCgoKPiAKPiBtZXNvbi1hMS5k
dHNpIHVhcnQgZGVjbGFyYXRpb246Cj4gCXVhcnRfQU9fQjogc2VyaWFsQDIwMDAgewo+IAkJY29t
cGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWExLXVhcnQiLAo+IAkJCSAgICAgImFtbG9naWMsbWVz
b24tYW8tdWFydCI7Cj4gCQlyZWcgPSA8MHgwIDB4MjAwMCAweDAgMHgxOD47Cj4gCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMjYgSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+IAkJY2xvY2tzID0gPCZ4
dGFsPiwgPCZ4dGFsPiwgPCZ4dGFsPjsKPiAJCWNsb2NrLW5hbWVzID0gInh0YWwiLCAicGNsayIs
ICJiYXVkIjsKPiAJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gCX07Cj4gCj4gZWFybHljb24gZGVj
bGFyYXRpb24gZnJvbSBkdHM6Cj4gCWFsaWFzZXMgewo+IAkJc2VyaWFsMCA9ICZ1YXJ0X0FPX0I7
Cj4gCX07Cj4gCj4gCWNob3NlbiB7Cj4gCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44
IjsKPiAJfTsKPiAKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPj4gbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
