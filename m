Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEC4C43217
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Nov 2022 19:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIqb7Yk7D2PgcYJtnp49yp+Ql/wcNhZTP/HcMJwHKQs=; b=mRNb/xhsUsmLYL
	0HZUByJayNi9w9pX0X+7NOb4D0J+oiHSYedB7eJ9yDYQcZg2MTaC1/J2WkwLt1s6PiuC0ISF9pDK2
	KIWtwjN0XUl9ve6W3JLv24cy5XV43iFQ24/QA6N93U313nTq3e3WAQS3+wBQV/8U3B+nzQ+oXAhpz
	Y+tVJRmB4uncNpPI3jT6zh75cGBiRu9E6LPN7RiHbO8FAH3keNHMsPd0+kHluyArrc8EpPuS+27JL
	As6fsYIJp3FI2EqtPQZTbL/dKfyfQrt5pT1NYIYhwKv7LjNKCaGyLatBW5Wx4e11Bnh1ExPK3x3+E
	qPHI699oHQ02xt6KRZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozMzw-00D9P0-Pl; Sun, 27 Nov 2022 19:07:28 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozMzg-00D9Jm-By
	for linux-amlogic@lists.infradead.org; Sun, 27 Nov 2022 19:07:18 +0000
Received: by mail-lf1-x129.google.com with SMTP id be13so14361172lfb.4
        for <linux-amlogic@lists.infradead.org>; Sun, 27 Nov 2022 11:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nu5ySqON0rKMTNPTMckDOx8RTb0i6RB2rj6jQlZbbl8=;
        b=BjEIwtO7TaFqjipp0K9U40VdBtWTI8vZNmptvif3XQUHoSqTZwP71CwW1asiDGVGGr
         6495u0di2UTD+xo4exFA5uT4vkLzcDZARFz4CquriYD3J0GRx4EWRJZNX72pDPQjUSQu
         Iodsr9WQy5MJ2g7qBX6sjeI+Qd5eA7reYh0jsqi247g9k5fQKTmeTfQJeODF7I3A9OBp
         3WbK5/BZ6Zjb6uKzjrxgEuQsuzeoCqurvXi5JYnWOZTaWBiqXxm/rnxTH8TgRP5xSNS8
         9xHk9EGobtqKTGax6I4aqSm1ZOuitEWcjLjvnYjYQs+5aXgGSFgvFIJ4FDxRVXqRRqsE
         ywDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nu5ySqON0rKMTNPTMckDOx8RTb0i6RB2rj6jQlZbbl8=;
        b=N5Qd+Wz+VTZPA/s/x+lN5Ti54ZyPc0u6ooFn4hoPrOese05fTpnODW6/1h1HoIytmT
         nI3tFzvQ/HJKi6BY4XxnmZWgc7P49tWWypGD0g3nQVPguSHmSuEsnITvDqoGM4slUOSi
         atG6EPuJrWirzPg9+rkhSwmHKjQnaSnjDU3EU2M+EtrbIYsl5Alx7binotOtiaWmgdAD
         j/cKOLuSRktmvw2mObA/oWBVhNLV1za5yeMs9sHL9GRXOfiVkq5KmOOgfQvJFT4TNahR
         AZzi/2LyzteNTuF/4ZYuTV4YlvVBiPpbGIaq3NzhCQxnnUeUKmel3crCNYXVr4Qq0B8i
         tqvQ==
X-Gm-Message-State: ANoB5pn1zfDOU5XonSe+wh6ehvTvVLWV54ttRydyb5ezAsCkU3Wx68SI
	2x7CNHgcWX080sCihNl1/xwqCw==
X-Google-Smtp-Source: AA0mqf6SFeRDdtfOQYAkuUnBJwpsyfH8mtxMG79UhEUc30L5Bvf42MbEWmn458FxgVTXO+zVfv9W3Q==
X-Received: by 2002:a05:6512:2203:b0:4aa:83e6:53e8 with SMTP id h3-20020a056512220300b004aa83e653e8mr7068272lfu.606.1669576029105;
        Sun, 27 Nov 2022 11:07:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p12-20020ac24ecc000000b0049a5a59aa68sm1390312lfr.10.2022.11.27.11.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 11:07:08 -0800 (PST)
Message-ID: <c89f9330-715f-4830-49fb-64c0b533ed39@linaro.org>
Date: Sun, 27 Nov 2022 20:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
 <3719828c-0ac5-34c9-a04b-251cbeb5f6ef@linaro.org>
 <a135f93a-235a-27b8-f649-69d62f6ebd30@linaro.org>
 <54f500cb-d7d0-8af1-eb58-99fbe71791a5@linaro.org>
 <CAB6niQ4808JEgdQEvRvaYqq8YmFCGo_YLnxXo+rjpSgxQxu+7g@mail.gmail.com>
 <615eb86b-a00a-56bc-ae1a-9f0e4e86f77c@linaro.org>
 <a3b7e1f0-16cb-4284-c740-5b5874612ea4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a3b7e1f0-16cb-4284-c740-5b5874612ea4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_110712_715901_1AE5C1B4 
X-CRM114-Status: GOOD (  14.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjcvMTEvMjAyMiAxNDozMywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gCj4gTGUgMjcvMTEv
MjAyMiDDoCAxMzoyNSwgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdMKgOgo+PiBPbiAyNi8x
MS8yMDIyIDE3OjAzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+Pj4+IFJldmlld2VkLWJ5OiBO
ZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPj4+Pj4gQXJlbid0IHlv
dSBtYWludGFpbmVyIG9mIHRoZSBwbGF0Zm9ybT8gVGhpcyBtZWFucyBJIHNob3VsZCB0YWtlIGNh
cmUgb2YKPj4+Pj4gdGhpcyBwYXRjaD8KPj4+PiBBaCwgdGhpcyB3aWxsIGJlIHBpY2tlZCB1cCBi
eSBLZXZpbiBvciBKZXJvbWU/IFNvIHRoaXMgdGFnIG1lYW5zIG9ubHkKPj4+PiBSZXZpZXdlcidz
IHN0YXRlbWVudCBvZiBvdmVyc2lnaHQsIHJpZ2h0Pwo+Pj4gT2YgY291cnNlIEknbGwgcGljayBp
dC4KPj4+Cj4+IFNvIHRoYXQncyBjb25mdXNpbmcgdG8gc2VlIFJldmlldyB3aGljaCBkb2VzIG5v
dCBtZWFuIHJldmlldywgYnV0Cj4+IG1haW50YWluZXIgcGljay4uLgo+IAo+IFJldmlld2VkLWJ5
IG1lYW5zIHJldmlld2VkLCB0aGVyZSdzIG5vIGNvbmZ1c2lvbiBoZXJlLCB0aGUgc2lnbmlmaWNh
bmNlCj4gaXMgY2xlYXJseSBkb2N1bWVudGVkIG9uIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3By
b2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwKPiAKPj4KPj4gUmV2aWV3ZWQtYnkgbWVhbnMs
IEkgc2hvdWxkIHRha2UgeW91ciB0YWcgYW5kIGFkZCB0byB2MiBvciB0aGUKPj4gbWFpbnRhaW5l
ciB3aWxsIGFkZCBpdCB3aGVuIHBpY2tpbmcgdXAuCj4gCj4gUmV2aWV3ZWQtYnkgbWVhbnMgcmV2
aWV3ZWQsIGZ1bGx5IHJldmlld2VkIHBhdGNoZXMgYXJlIHJlYWR5IHRvCj4gYmUgcGlja2VkIHVu
bGVzcyBhIGNoYW5nZSBpcyBhc2tlZCBieSBhIHJldmlld2VyLgo+IAo+IERlY2lzaW9uIHRvIHBp
Y2sgb3Igbm90IGEgcGF0Y2ggZG9lcyBub3QgZGVwZW5kIG9uIGFueSB0YWdzLCBidXQKPiBpcyB0
aGUgc29sZSBkZWNpc2lvbiBvZiB0aGUgbWFpbnRhaW5lciBhZGRpbmcgaXQncyBTaWduZWQtb2Zm
LWJ5LgoKVGhlbiB3aHkgZ2l2aW5nIHJldmlldyB0YWcgYW5kIG5vdCBub3RpZnlpbmcgYWJvdXQg
dGhlIHBpY2ssIHdoaWxlIHRoZQpwaWNrIGFjdHVhbGx5IGhhcHBlbnM/IFRoaXMgaXMgY29uZnVz
aW5nLiBXaGVuIHRoZSBtYWludGFpbmVyLCB3aGljaCBpcwpzdXBwb3NlZCB0byBwaWNrIHBhdGNo
LCBnaXZlcyByZXZpZXdlZCBpdCBtZWFucyBhbHdheXMgdGhlIHNhbWUgYXMKYWNrZWQsIHNvIHRo
ZSBwYXRjaCBpcyBleHBlY3RlZCB0byBnbyBvdGhlciB3YXkuIE5vdCB0aHJvdWdoIHRoYXQKbWFp
bnRhaW5lcidzIHRyZWUuCgpJZiB5b3UganVzdCBhcHBseSBpdCwgc2F5IHlvdSBhcHBseSBpdC4K
CkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
