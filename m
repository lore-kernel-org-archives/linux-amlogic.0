Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAC4EBFD22
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2026 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDtcXkmIlQS5fDP1I8voclANyrfkM2YILn8vQEvis7g=; b=le4gXn3avWNnc4wM2omkNxwXoy
	fVLFgKgC42cneoK/XdkFRBamIS4hRymLBCVivVILdTfpY4GtiYwRrt2tyIIQm+iBIUGz/mknm9QfP
	GXPzzrSWz9vL0+nuGCXZZ6LyHhSo6Sw+7OF0h0NkyeBVzzMK6sOyEQmQzkgoix5tzrF2723pyutLo
	1F4VBoRA/OGUsMPNQd6/nTyi6qUc021n2GRG+90XhsZlM5Nz5NZ3yP/CkquY2ySjhMIXhgV7U2v9r
	os97r/MT1hTSTKfgPZUeWqGJ/ubLSwD2pyxds/ZAplh6NBesiRMj3ys9IZr7bFODboBg/Scp8aSsV
	/EcHFUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDXI-0000000FMjW-052U;
	Mon, 13 Apr 2026 09:24:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDXE-0000000FMie-2PP8
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Apr 2026 09:24:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso39488645e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Apr 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776072287; x=1776677087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++gWQ1SwhCFjmBGRgz/y7dJIShpHiYWMcQltdeeVLx4=;
        b=pNxykhnCzeV0c/bparxk0Dn6/Q4UGcCfs+iE+U2lpnhZpvHRw71+YJgJ3Whoo+XfUb
         kj9K3wGc+gF3ta1TPH9Z30drb3yDpwS79AoXVDjQwih0hiTY0yZLNin8t81H5ATscys+
         dzP+H+qAJAtRokq7i+WwJoQJdIaTXpLVZRmh3EOLssPB+qDKtg0wY+4gqv6Wr10+u3QI
         3ZibqNHVEHBO6Ik/+f3AatV2lIG4EeiRTlxIovGKrwxc/yRmUMurCbQA9rEWCGyR6Q5j
         fIYDusyciEU2Yy1ma+eYFM2Zx2Hl+SlBYPF2d9nIxFz3AKClduqasPStZAomNbSfFOUs
         TkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072287; x=1776677087;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++gWQ1SwhCFjmBGRgz/y7dJIShpHiYWMcQltdeeVLx4=;
        b=hfayBNfxJkZSvEmpgZuml8GMNuCXp+rvEBaxVg59hsD9Ekr0w3gMJrnwwcVi2HwWzs
         WP+T/FtCZcJEk+GStyvkM6y0l+cNR2/tAbPY6ge3awp67gIabi2P+rhrurgB3lrZYBMD
         OWOEebWyMHYmRUZSCB1OdZpC1J3bMddAnoRM/rrjikKJIfEJN8SVwyNvj8/wTqHjpN/0
         spQ40Xrxa/Q7NhwiQCjsI94rckcl4Equ8U2UYZtuEwdkTtj4B/+7iVXA1Xkhhn443FOT
         wNAiB9zvDDktjkcEHOEjhNJGiXhGiqip1twXlRein4sxObeIy2F8i7fm1fK5+xbAfW4E
         enaA==
X-Forwarded-Encrypted: i=1; AFNElJ/DobcSISnesI/9Dee1DWOxXQbOlD2bZCBkGz3cEWcQQvXCbeMr9oIxFbUr4nYV23sj+th3Xmrl053H2bcg@lists.infradead.org
X-Gm-Message-State: AOJu0YxmmhSLE5GTjQN2zHRDOZwAt4K+1v4MaH4cmRhi6KDSaL6p5VJV
	+S8/xlZq60rOmIWrVg8w4StIsFCxVoMBC3G8PmCH3rpGaojg+sQyRs2UbYJ56zbzKHk=
X-Gm-Gg: AeBDietRPMOqumSAObzDzMTCECxuxEci1XySEH7khYOq54NdWH+MsWGUshnWdJUW+J8
	RQNRibDylQnRtMrcOH58AOd/eJxtOuQ3rqqcRkdbqoVw6ZFC4TEQkeh8N3q9/cNK2/fssmTpBqY
	2LcdC0BvZjoyIeqAGkvPGR8DKnS/Vqen/89hW3qr/5nMsOz7p8bJHXmejqz22X6vfHFmrIblMTb
	DeBTuX+S/CWWVsNkPobH6XD3yFeuB9vnSavxIPokNxmW/3Nd7XvDFe1nEwsjHmPdo9Kxh/ANhRJ
	kBu3xymZbWQgPM8p6jYCzYx3+rSA2ZyGvH+xnBuAVbrM2DnfcbB7GZh4Dxb76Jf+3632rJSIMEW
	TTMqpPJj3DuzuTWrfo/U9YiSfbOf8eTOpMIKOj0w95FPMIKPhcXxEm7ANKKz1nQr1aainuCcrKJ
	U8elsjCWhz/AFA4y8QRiNYJUf1YMsUZnANYGi5zJyE29O+g8QzdxJEcZ3w3Ky0yugTVCQf364BY
	l1fXsHs
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488d67fa48emr177471465e9.9.1776072286480;
        Mon, 13 Apr 2026 02:24:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm373689155e9.3.2026.04.13.02.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:24:46 -0700 (PDT)
Message-ID: <3a08bb84-b313-4b3b-bb61-1b686226e902@linaro.org>
Date: Mon, 13 Apr 2026 11:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] soc: amlogic: clk-measure: Add A1 and T7 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260410100329.3167482-1-jian.hu@amlogic.com>
 <20260410100329.3167482-3-jian.hu@amlogic.com>
 <9a4f69e7-838a-4992-af1d-46324e14eb48@kernel.org>
 <274d2abd-05b9-4dbd-b962-ff70044b8d07@amlogic.com>
 <b0d81181-d4a4-4c03-8c26-c7f6e8cde70f@kernel.org>
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
In-Reply-To: <b0d81181-d4a4-4c03-8c26-c7f6e8cde70f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_022448_685298_53141843 
X-CRM114-Status: GOOD (  15.38  )
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

T24gNC8xMy8yNiAxMToxMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMy8wNC8y
MDI2IDEwOjIxLCBKaWFuIEh1IHdyb3RlOgo+Pgo+PiBPbiA0LzEyLzIwMjYgNTo1NSBQTSwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9u
IDEwLzA0LzIwMjYgMTI6MDMsIEppYW4gSHUgd3JvdGU6Cj4+Pj4gQWRkIHN1cHBvcnQgZm9yIHRo
ZSBBMSBhbmQgVDcgU29DIGZhbWlseSBpbiBhbWxvZ2ljIGNsayBtZWFzdXJlLgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4KPj4+PiAtLS0KPj4+
PiAgICBkcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJlLmMgfCAyNzIgKysrKysr
KysrKysrKysrKysrKysrKysrCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDI3MiBpbnNlcnRpb25z
KCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1jbGst
bWVhc3VyZS5jIGIvZHJpdmVycy9zb2MvYW1sb2dpYy9tZXNvbi1jbGstbWVhc3VyZS5jCj4+Pj4g
aW5kZXggZDg2MmUzMGEyNDRlLi4wODM1MjQ2NzFiNzYgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVy
cy9zb2MvYW1sb2dpYy9tZXNvbi1jbGstbWVhc3VyZS5jCj4+Pj4gKysrIGIvZHJpdmVycy9zb2Mv
YW1sb2dpYy9tZXNvbi1jbGstbWVhc3VyZS5jCj4+Pj4gQEAgLTc4Nyw2ICs3ODcsMjU4IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fbXNyX2lkIGNsa19tc3JfczRbXSA9IHsKPj4+Pgo+Pj4+
ICAgIH07Cj4+Pj4KPj4+PiArc3RhdGljIHN0cnVjdCBtZXNvbl9tc3JfaWQgY2xrX21zcl9hMVtd
ID0gewo+Pj4gQW5kIGV4aXN0aW5nIGNvZGUgdXNlcyB3aGF0IHNvcnQgb2YgYXJyYXk/IFNlZW1z
IHlvdSBzZW5kIHVzIG9ic29sZXRlIG9yCj4+PiBkb3duc3RyZWFtIGNvZGUuCj4+Cj4+Cj4+IFRo
YW5rcyBmb3IgeW91ciByZXZpZXcuCj4+Cj4+Cj4+IEkgaGF2ZSBjaGVja2VkIHRoZSBwcmV2aW91
cyBBbWxvZ2ljIFNvQydzIGNvbW1pdHMuwqBTdWNoIGFzIEFtbG9naWMgQVhHLAo+PiBHMTJBLCBD
MywgUzQuCj4+Cj4+IFRoZSBjbGtfbXNyX3h4IGVudHJ5IGlzIGFkZGVkIGFmdGVyIGxhc3QgU29D
J3MgYXJyYXksIHNvcnRlZCBieQo+PiBzdWJtaXNzaW4gZGF0ZSByYXRoZXIgdGhhbiBhbHBoYWJl
dGljYWwgb3JkZXIuCj4+Cj4+IFNvIEkgcGxhY2UgQTEgYW5kIFQ3IGFmdGVyIFM0IGFjY29yZGlu
Z2x5Lgo+Pgo+Pgo+PiBUaGUgQTEgY2xvY2sgY29udHJvbGxlciBkcml2ZXIgd2FzIGFscmVhZHkg
c3VwcG9ydGVkIGluCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDUyMzEzNTM1
MS4xOTEzMy03LWRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydS8KPj4KPj4gSXQgaXMgYWxzbyBwcmVz
ZW50IGluIHRoZSBtYWlubGluZSBrZXJuZWw6Cj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvY2xr
L21lc29uL0tjb25maWcjbjExMwo+Pgo+Pgo+PiBUaGlzIGNsb2NrIG1lYXN1cmUgSVAgaXMgdXNl
ZCB0byBtZWFzdXJlIHRoZSBpbnRlcm5hbCBjbG9jayBwYXRocwo+PiBmcmVxdWVuY2llcyzCoCBh
bmQgQTEgY2xvY2sgY29udHJvbGxlciBkcml2ZXIgd2FzIHN1cHBvcnRlZC4KPj4KPj4gU2luY2Ug
dGhlIGNvcnJlc3BvbmRpbmcgY2xvY2sgbWVhc3VyZSBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBB
MSB5ZXQsIFNvCj4+IGFkZCBBMSBjbGsgbXNyIGhlcmUuCj4gCj4gTm8sIHdoYXQgcXVhbGlmaWVy
cyBvciBrZXl3b3JkcyBhcmUgdXNlZCBmb3IgZXhpc3RpbmcgYXJyYXlzPyBJT1csCj4gcGxlYXNl
IGludmVzdGlnYXRlIGFuZCB1bmRlcnN0YW5kIHdoeSB5b3UgYXJlIGRvaW5nIHRoaXMgdmVyeSBk
aWZmZXJlbnQKPiB0aGFuIGV4aXN0aW5nIGNvZGUuIE1heWJlIGJlY2F1c2UgeW91IHNlbnQgdXMg
ZG93bnN0cmVhbSwgc28geW91Cj4gcmVwbGljYXRlZCBhbGwgb3RoZXIgZG93bnN0cmVhbSBpc3N1
ZXMuCgpJIHNlZSwgdGhlIGV4aXN0aW5nIHVzZXMgInN0YXRpYyBjb25zdCBzdHJ1Y3QiLgoKSmlh
biwgY291bGQgdG8gc3dpdGNoIHRvIHRoYXQgcGxlYXNlID8KCk5laWwKCj4gCj4gQmVzdCByZWdh
cmRzLAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
