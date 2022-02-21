Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCCFC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 20:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t83uZeJMpkoQc65iy5vq49VMrLDI+UopDt/oqeN6yJk=; b=NoSr6fWw0pltvO
	2qh47VT/7hbEs5URmUtSiXw3XziYhUHJlwadPVZzPxRqr4Fp9avayqgk9TMWe3qg1JYnq7Ev5rZnw
	3S5OJfWcFOI1w+YO7uiPUscKlGwUppegoU3VrLeGo+8+/8jUtyr6b0sJM9w8fmhSH2ycbzlWsDvAO
	8wd8Pd6Fq2NGOByae0fgGptvbvv0jwIvi9Omy1+qqLgrgesaWuuZYEyJbUmXlKrgVOdcXUrI/VH71
	yliytGlbF8GLFW1KMWaDacd7eK0SzmqqeBBIwM5WYqlrrN2IwVQicyV/g3RYR7PDwoH53hKnXEGil
	KC/DlVMMiClZqdCfIUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMF9k-0079rv-UA; Mon, 21 Feb 2022 20:19:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMF9Z-0079pn-0y; Mon, 21 Feb 2022 20:19:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cm8so22096069edb.3;
 Mon, 21 Feb 2022 12:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:cc:content-language
 :subject:content-transfer-encoding;
 bh=uzQB996Y6w229dzKjEpHtyaZ7eebPm32v5je8cXlqR4=;
 b=jVNl55HnQFSHL8r2zu48hDsc9I9R9lGA7ty4tBY0aCiODO0x2JBnfif39D/IPKhWXJ
 IeN0lLb6IxqKOeWIcVo85V096xgnBb7+RKdFBJLyVQYeg2WP6cQDBWvtoygheTEdrQSQ
 LbG6/5bqj2mo1gXAhzEmYpMZejCMfUh8/D0RINOB+klffi+dG6c7g5g5v0IkxEU3PDE6
 fNYj9fBSrp44ZaxcWDCwFpDTvrjU4SQ1y5o8ytkmwq2r1ImNHVs+Ntp09ZIYS67+ak5z
 HI3PA4fTJdQw7UgvFh0unwn3HjfxJH9aju9Oy5hECnN8atFsAOyxI8qqvKF43vNl43mU
 +sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :cc:content-language:subject:content-transfer-encoding;
 bh=uzQB996Y6w229dzKjEpHtyaZ7eebPm32v5je8cXlqR4=;
 b=LxwZi700/U5MRYUp+EPrZVx9peAPilMPnKCrqZFCd3G/7Exe3pmnnXofyxJquRs41G
 tKRE4lzyevlFfFKh4zsG8s2CJtrNzJ9o9tTijZVqryD8b/n4zGmj/6hAgwzd07tq44Mw
 Zk4RiY+IY6yGuPiyjdn9/AomFqZV/J7notCTnlPSEMQquzzy1asrNFvKPs8FT01Y2EZW
 x0Jtq4+6WQft8YPjfphqfLuV+FPDIUBp9FyfH4JqVEwqplwwUu2RaP4Q8lGx5jwiw3MC
 r1cqovJel61LCZTkoWZz3CbAmbLDN7aq8TnYHKX4sGHv9ZOawrh1crRehsW/rDxuRqH6
 SUzw==
X-Gm-Message-State: AOAM530xYk3uII7tSEI9NDk3AY8jZjC9KrjFizsGWlyrO9yjdmhQWmrH
 AlDvjTGZYTOHGb0epvfpa+Q=
X-Google-Smtp-Source: ABdhPJzSq41NOGFPIVddi9Ip9Vo0oSHcoCBoG7JmEJiUUAk3c9bVD79HtxuyXJdRc9xFd3VfjuPrJQ==
X-Received: by 2002:a05:6402:c10:b0:40f:33cd:a39 with SMTP id
 co16-20020a0564020c1000b0040f33cd0a39mr23038572edb.234.1645474763115; 
 Mon, 21 Feb 2022 12:19:23 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:b141:a0d:4aad:2a06?
 (p200300ea8f4d2b00b1410a0d4aad2a06.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:b141:a0d:4aad:2a06])
 by smtp.googlemail.com with ESMTPSA id 23sm5681807ejf.175.2022.02.21.12.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:19:22 -0800 (PST)
Message-ID: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
Date: Mon, 21 Feb 2022 21:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
Subject: [PATCH v2 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_121925_101417_1D973C99 
X-CRM114-Status: GOOD (  15.04  )
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

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgVGl0YW5tZWMgVE0xNjI4IDcgc2VnbWVu
dCBkaXNwbGF5CmNvbnRyb2xsZXIuIEl0J3MgYmFzZWQgb24gcHJldmlvdXMgUkZDIHdvcmsgZnJv
bSBBbmRyZWFzIEbDpHJiZXIuClRoZSBSRkMgdmVyc2lvbiBwbGFjZWQgdGhlIGRyaXZlciBpbiB0
aGUgTEVEIHN1YnN5c3RlbSwgYnV0IHRoaXMgd2FzCk5BSydlZCBieSB0aGUgTEVEIG1haW50YWlu
ZXIuIFRoZXJlZm9yZSBJIG1vdmVkIHRoZSBkcml2ZXIgdG8KL2RyaXZlcnMvYXV4ZGlzcGxheSB3
aGF0IHNlZW1zIG1vc3QgcmVhc29uYWJsZSB0byBtZS4KClRvIGJlIGRlY2lkZWQgaXMgdGhyb3Vn
aCB3aGljaCB0cmVlIHRoaXMgc2VyaWVzIHNob3VsZCBnby4KSSdkIHRoaW5rIFNQSSB3b3VsZCBi
ZSBtb3N0IHN1aXRlZCwgYnV0IHRoYXQncyBhIGRlY2lzaW9uIEkKbGVhdmUgdXAgdG8gdGhlIHJl
c3BlY3RpdmUgbWFpbnRhaW5lcnMuCgpGdXJ0aGVyIGNoYW5nZXMgdG8gdGhlIFJGQyB2ZXJzaW9u
OgotIERyaXZlciBjYW4gYmUgYnVpbHQgYWxzbyB3L28gTEVEIGNsYXNzIHN1cHBvcnQsIGZvciBk
aXNwbGF5cyB0aGF0CiAgZG9uJ3QgaGF2ZSBhbnkgc3ltYm9scyB0byBiZSBleHBvc2VkIGFzIExF
RCdzLgotIFNpbXBsaWZpZWQgdGhlIGNvZGUgYW5kIHJld3JvdGUgYSBsb3Qgb2YgaXQuCi0gRHJp
dmVyIGlzIG5vdyBraW5kIG9mIGEgTVZQLCBidXQgZnVuY3Rpb25hbGl0eSBzaG91bGQgYmUgc3Vm
ZmljaWVudAogIGZvciBtb3N0IHVzZSBjYXNlcy4KLSBVc2UgdGhlIGV4aXN0aW5nIDcgc2VnbWVu
dCBzdXBwb3J0IGluIHVhcGkvbGludXgvbWFwX3RvXzdzZWdtZW50LmgKICBhcyBzdWdnZXN0ZWQg
YnkgR2VlcnQgVXl0dGVyaG9ldmVuLgoKTm90ZTogVGhlcmUncyBhIG51bWJlciBvZiBjaGlwcyBm
cm9tIG90aGVyIG1hbnVmYWN0dXJlcnMgdGhhdCBhcmUKICAgICAgYWxtb3N0IGlkZW50aWNhbCwg
ZS5nLiBGRDYyOCwgU00xNjI4LiBPbmx5IGRpZmZlcmVuY2UgSSBzYXcgc28KICAgICAgZmFyIGlz
IHRoYXQgdGhleSBwYXJ0aWFsbHkgc3VwcG9ydCBvdGhlciBkaXNwbGF5IG1vZGVzLgogICAgICBU
TTE2Mjg6IDZ4MTIsIDd4MTEKICAgICAgU00xNjI4QzogNHgxMywgNXgxMiwgNngxMSwgN3gxMAog
ICAgICBGb3IgdHlwaWNhbCBkaXNwbGF5cyBvbiBkZXZpY2VzIHVzaW5nIHRoZXNlIGNoaXBzIHRo
aXMKICAgICAgZGlmZmVyZW5jZSBzaG91bGRuJ3QgbWF0dGVyLgoKU3VjY2Vzc2Z1bGx5IHRlc3Rl
ZCBvbiBhIFRYMyBNaW5pIFRWIGJveCB0aGF0IGhhcyBhbiBTTTE2MjhDIGFuZCBhCmRpc3BsYXkg
d2l0aCA0IGRpZ2l0cyBhbmQgNyBzeW1ib2xzLgoKdjI6Ci0gKHJlLSlhZGQgQW5kcmVhcycgU29C
IHRvIHR3byBwYXRjaGVzCi0gZml4IFlBTUwgaXNzdWVzCi0gaW5jbHVkZSBjdHlwZS5oIGV4cGxp
Y2l0bHkKLSBhZGQgaW5mbyBtZXNzYWdlIGluIHByb2JlKCkKCkFuZHJlYXMgRsOkcmJlciAoMik6
CiAgc3BpOiBncGlvOiBJbXBsZW1lbnQgTFNCIEZpcnN0IGJpdGJhbmcgc3VwcG9ydAogIGR0LWJp
bmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IEFkZCBUaXRhbiBNaWNybyBFbGVjdHJvbmljcwoKSGVp
bmVyIEthbGx3ZWl0ICg0KToKICBkdC1iaW5kaW5nczogYXV4ZGlzcGxheTogQWRkIFRpdGFuIE1p
Y3JvIEVsZWN0cm9uaWNzIFRNMTYyOAogIGRvY3M6IEFCSTogZG9jdW1lbnQgdG0xNjI4IGF0dHJp
YnV0ZSBkaXNwbGF5LXRleHQKICBhdXhkaXNwbGF5OiBhZGQgc3VwcG9ydCBmb3IgVGl0YW5tZWMg
VE0xNjI4IDcgc2VnbWVudCBkaXNwbGF5CiAgICBjb250cm9sbGVyCiAgYXJtNjQ6IGR0czogbWVz
b24tZ3hsLXM5MDV3LXR4My1taW5pOiBhZGQgc3VwcG9ydCBmb3IgdGhlIDcgc2VnbWVudAogICAg
ZGlzcGxheQoKIC4uLi90ZXN0aW5nL3N5c2ZzLWRldmljZXMtYXV4ZGlzcGxheS10bTE2MjggICB8
ICAgNyArCiAuLi4vYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbCAgfCAg
ODggKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwg
ICAyICsKIC4uLi9kdHMvYW1sb2dpYy9tZXNvbi1neGwtczkwNXctdHgzLW1pbmkuZHRzICB8ICA1
OSArKysKIGRyaXZlcnMvYXV4ZGlzcGxheS9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAx
MCArCiBkcml2ZXJzL2F1eGRpc3BsYXkvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDEg
KwogZHJpdmVycy9hdXhkaXNwbGF5L3RtMTYyOC5jICAgICAgICAgICAgICAgICAgIHwgMzc2ICsr
KysrKysrKysrKysrKysrKwogZHJpdmVycy9zcGkvc3BpLWJpdGJhbmctdHhyeC5oICAgICAgICAg
ICAgICAgIHwgIDY2ICsrKwogZHJpdmVycy9zcGkvc3BpLWdwaW8uYyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDQyICstCiA5IGZpbGVzIGNoYW5nZWQsIDY0MiBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcv
c3lzZnMtZGV2aWNlcy1hdXhkaXNwbGF5LXRtMTYyOAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55
YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9hdXhkaXNwbGF5L3RtMTYyOC5jCgotLSAK
Mi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
