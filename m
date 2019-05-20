Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244A6C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:28:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027B22173E
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rbvN6hkr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MKO23OSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027B22173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGhVrWGqOGTO9EsoXgaLf195j9K1QMY/NyMPmFuN0RE=; b=rbvN6hkr7HPaMe
	9k1oC8M+wwvEZVds5xwSc6io+hCjk+cLgZOt6wqy2PDQmEaWgKXqKwlHhELesIs/I8HBh5Be5PcBs
	0xvcOugRTsFcjXfBwTZ8r92expVdDhov6VA09Ray/FiqUnX9efYf/1jNOjOd4XOJXLhr6JTXA8XZO
	XUNfWNsG4f+VEr7doAurhYzF20k8+wXPDmOPdiYMmByUog967nU6eaTPufJnS8MQsbVXuJXSdOCx/
	GB1ZG3PZjeDkRaSlnMGCc2nXtFwLzb4X7sPc/TOEBHVux1R7mTwx2zSrmcplOEWvkaBNo7WjzGC9u
	Tb6q8xt1Fjx6FjxHNYVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSn1m-0008ER-A6; Mon, 20 May 2019 18:28:50 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSn1k-0008Dl-5C
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 18:28:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id w8so15718205wrl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=1FK2DXKOFB3m2S1KpmmuQv43CteVea0a4jQ56pD1zGU=;
 b=MKO23OSaVzWu2iXq1D/NoheHxvM//TR5El/kkQWNWAzfwY7e7J8R+enPDRvIUbcqyZ
 NGjqLknvjtxjieY11283DVblu86q3rTCxZdPRE6GthHzIt14xZqzra6jDX8IfVhEOK1/
 /dEo62OMajZdNoyVKHqPkx+lHxc1FV3t3UhJnYKtkjDl2Y8it0vSpPJvUDkDMsMGfn6a
 gA0PWm0KnRhdrdWs3nwI8OEBx+LXru7EBryVdEbd4vsoerDD76wUxbeTHeNylKy0aBbA
 muSMpvm/t3fHZZPRMZ/auAhltKn3kuz76uRjZVNj2P8gpjWuBFOPvKqhGhAug5LKeXrZ
 v5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=1FK2DXKOFB3m2S1KpmmuQv43CteVea0a4jQ56pD1zGU=;
 b=pomXdXjeBW5OX3edkLhj835eh2ClPgwj3+f+jNiGpk1V46yOQph9eeq5rE4wf4kahc
 Ft0AWGl/v6fJ1+iJ34YW99A2UJstXghV4SimouD1z1tC6pyAYdmKQOsBWweom8KWbNcu
 bfni1zZCtirdcVwTTL3AdbunMHQl9NLdFu0X4ORsd5iJj9ysTFUpRWCpwvQfzIqDdnBX
 LoRmFxVWXtKVCkp685BnlhXuz5MG9z6gx0mJpHZaIWebJBszcQa75X+ce+BOZE0y0vEL
 xZqNb6jQD0FLksloFMbPMmDMcKIAGnswmxY2YrXVFx8Gg9CJD6jajRyjVCHFMqatjEXo
 PHMw==
X-Gm-Message-State: APjAAAWbHjNRw5F2Jm0OmZojClH8ED83FJshdXuCBdQk3AodF3E4MuIf
 nM1FVYrTdKdhPuJ6SatDalkD3g==
X-Google-Smtp-Source: APXvYqz1r9onPeVavfsoGIY5wwRXwdggSKOmpXExBfHgCEti4JqdGoRECSwavjBIMt+Lt5YrV3VNfg==
X-Received: by 2002:a5d:51d0:: with SMTP id n16mr34573876wrv.167.1558376926448; 
 Mon, 20 May 2019 11:28:46 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id a62sm600078wmh.11.2019.05.20.11.28.45
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 11:28:45 -0700 (PDT)
Message-ID: <5CE2F1DD.4070700@baylibre.com>
Date: Mon, 20 May 2019 20:28:45 +0200
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] iio: adc: meson_saradc: update with SPDX Licence
 identifier
References: <20190520140228.29325-1-narmstrong@baylibre.com>
 <CAFBinCD8Gkb0aRXWPb1uuezSHuS9DxQmnhuuSttspDzWHNAV1w@mail.gmail.com>
In-Reply-To: <CAFBinCD8Gkb0aRXWPb1uuezSHuS9DxQmnhuuSttspDzWHNAV1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_112848_198420_CAAD34D8 
X-CRM114-Status: GOOD (  12.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 linux-amlogic@lists.infradead.org, jic23@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTGUgMjAvMDUvMjAxOSAxOTo1NSwgTWFydGluIEJsdW1lbnN0aW5nbCBhIMOp
Y3JpdCA6Cj4gSGkgTmVpbCwKPiAKPiBPbiBNb24sIE1heSAyMCwgMjAxOSBhdCA0OjAyIFBNIE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPj4gLS0t
Cj4+ICBkcml2ZXJzL2lpby9hZGMvbWVzb25fc2FyYWRjLmMgfCA4ICstLS0tLS0tCj4+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lpby9hZGMvbWVzb25fc2FyYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvbWVz
b25fc2FyYWRjLmMKPj4gaW5kZXggNTEwZDhiN2VmM2EwLi5lMzlkOTU3MzQ0OTYgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvaWlvL2FkYy9tZXNvbl9zYXJhZGMuYwo+PiArKysgYi9kcml2ZXJzL2lp
by9hZGMvbWVzb25fc2FyYWRjLmMKPj4gQEAgLTEsMTQgKzEsOCBAQAo+PiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCj4gdGhlIG9yaWdpbmFsIGxpY2Vuc2UgdGV4dCBkaWRu
J3QgbWVudGlvbiAiLi4uIG9yIGxhdGVyIgo+IHBlcnNvbmFsbHkgSSdtIGhhcHB5IHdpdGggZWl0
aGVyIEdQTC0yLjAgb3IgR1BMLTIuMCsKPiAKCkknbGwgZml4IGFuZCByZS1zcGluLCB0aGFua3Mg
Zm9yIHJldmlld2luZy4KCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
