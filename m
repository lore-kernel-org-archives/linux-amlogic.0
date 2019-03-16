Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF034C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:32:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB68218D0
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hkIcRoc1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h9uX+Bdx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB68218D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVcVRetnDNYvGLm8AtU6yZjZo5/CbxPIaSHLzGUxl08=; b=hkIcRoc1yigkSB
	PHl3X7SkKB3KMQ8UXaTwhljpUgJAVjvoV2p6QrqX0EdlS6QxGGVxpniXUNaQ+fRJNrDH7LwcJqd/q
	dLbrUBb04akE/0Dj/0nNsJYMVhE0NKh/EfCSNIPQ5qKo+TiX4xw3tH9rIFHu//g/VRxVfbjL+Vxi9
	c/hX9q4vQckh5Fp9ySJoaS+dJAe3c6UPKuSM5CqVV6MV3f1uMTfWVfIWA2G51p0aimJCZJv50R/JQ
	v4WT/5DyM7S/dUyfajqqV/h+4fhwn7zrqkDLSEpFwNOVjtwiG3TYMJy3Go94dwo385EPuK3B1vwNV
	tR/8DC46bsYVybKG0RxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5AM2-0006QB-8v; Sat, 16 Mar 2019 14:32:06 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5ALz-0006PO-Gz
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 14:32:04 +0000
Received: by mail-wm1-x344.google.com with SMTP id t124so8566133wma.4
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=uM5tAop2OPme9hYP9yOk1ThL7VG9jv/gw/8ehbY3v+0=;
 b=h9uX+BdxjoBkxFziaWqySYh6fRZsJlA852PPY82irYq7hzjQnIyK9wWa+Qj2krbUa+
 HZ4lTCsBaSFRUdZYj8LUArrvAVMEgIEjWnwJWsXiWUMFlSg8H3qZHQhfrpddO8kzpGWn
 poh/6KjTH2rQEFJguqhkvQLSDQWt3sBda14JdIJPOS/cQI6fIe1YadTf4MaiiUuWAcRf
 9CQbJ/ZRZ/bD7f+rwtXe1mXKfBJE7alzAm4nChIL9UEvSK4mT7V0bkFBRiETMWJ+racq
 P+GhBSIB52rHENgQv7bSpizHjLF8gOAORk2MnkAfB4Vu8DOO4jSR6VcPoiT4fQJheJOq
 lncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=uM5tAop2OPme9hYP9yOk1ThL7VG9jv/gw/8ehbY3v+0=;
 b=OrgO0xfe+b0n/j2vaygI9ZZaEXzgBaaZDaVmL0QD58vma3hKMbnv2bD/uXgZzbR/km
 JEnhR3g3iQZ/ygmPzd9zJpQsSJDziOR84wqPRYwqAICjZkxT028xN1nmP2cYYW30foyD
 Dx9DO9jyzRL3T6z9HtTVGKmsqC7GCTfk1A59HWJjRuUL/f2KDMNivVmNZVZ55O2d5m9C
 CLfdtZmyRZ0bQvSj1kaTzKAQl7DRKz64onWrwKOWrYVy6L4pRhPoR12qV3FNXtBKO64O
 IKVAe4DTiOojnpnuYEnFussj3Tsh7u1pbStcBrGJElsnexDCKm7Ja+n8zdQk/euFiSZO
 Ne3g==
X-Gm-Message-State: APjAAAVqPGK2nCNCYuX9RNge0HK2h+AoPicP1mI21EdOIK0SxvOV1r+6
 sVU9rNOrFx2XwgfuY6NkvhTxYQ==
X-Google-Smtp-Source: APXvYqwugntDU0EKeDzg2jT28P8NnpFuKq84eqFRZtXH3UBU07CUE71aHZrqRywZIttnXkpvk3AVqA==
X-Received: by 2002:a1c:7a1a:: with SMTP id v26mr5261549wmc.129.1552746719636; 
 Sat, 16 Mar 2019 07:31:59 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 f10sm3245827wml.23.2019.03.16.07.31.58
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 16 Mar 2019 07:31:58 -0700 (PDT)
Message-ID: <5C8D08DE.7070203@baylibre.com>
Date: Sat, 16 Mar 2019 15:31:58 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/9] arm64: dts: meson: g12a: add reset controller
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-6-narmstrong@baylibre.com>
 <CAFBinCBt290Qabw98SpiON3xG0ihMEDNzwDDTrBo6QYbA5QjMQ@mail.gmail.com>
In-Reply-To: <CAFBinCBt290Qabw98SpiON3xG0ihMEDNzwDDTrBo6QYbA5QjMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_073203_568727_113DF6CB 
X-CRM114-Status: GOOD (  18.86  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAxNS8wMy8yMDE5IDIyOjMxLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiBI
aSBOZWlsIGFuZCBKZXJvbWUsCj4gCj4gT24gVGh1LCBNYXIgNywgMjAxOSBhdCA0OjE0IFBNIE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4+Cj4+IEZyb206
IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+Pgo+PiBBZGQgdGhlIHJlc2V0
IGNvbnRyb2xsZXIgZGV2aWNlIG9mIGcxMmEgU29DIGZhbWlseQo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTog
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+PiAtLS0KPj4gIGFyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLmR0c2kgfCA3ICsrKysrKysKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tZzEyYS5kdHNpCj4+IGluZGV4IGY4ZjA1NWM0OWY5YS4uMmE3MDBiYjQ1
ZDA0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEy
YS5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLmR0
c2kKPj4gQEAgLTI0NSw2ICsyNDUsMTMgQEAKPj4gICAgICAgICAgICAgICAgICAgICAgICAgI3Np
emUtY2VsbHMgPSA8Mj47Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJhbmdlcyA9IDwweDAg
MHgwIDB4MCAweGZmZDAwMDAwIDB4MCAweDEwMDAwMD47Cj4+Cj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJlc2V0OiByZXNldC1jb250cm9sbGVyQDEwMDQgewo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1nMTJhLXJlc2V0IiwK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImFtbG9naWMs
bWVzb24tYXhnLXJlc2V0IjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHgwIDB4MTAwNCAweDAgMHg5Yz47Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgI3Jlc2V0LWNlbGxzID0gPDE+Owo+PiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+IEkg
dHJpZWQgdG8gY29tcGFyZSB0aGlzIHdpdGggd2hhdCBpcyBwdWJsaWNseSBhdmFpbGFibGUgaW4K
PiBidWlsZHJvb3Rfb3BlbmxpbnV4X2tlcm5lbF80LjlfZmJkZXZfMjAxODA3MDYgLSB1bmZvcnR1
bmF0ZWx5IHRoaXMgaXMKPiBoYXJkZXIgdGhhbiBJIHRob3VnaHQ6Cj4gdGhlIGJ1aWxkcm9vdCBr
ZXJuZWwgZG9lc24ndCBkZWZpbmUgdGhlIHJlc2V0IGNvbnRyb2xsZXIgaW4gbWVzb25nMTJhLmR0
c2kKPiAKPiBzbyBJIHRyaWVkIHRvIGZvbGxvdyB0aGUgY29kZSBpbiB0aGUgSERNSVRYIGRyaXZl
ciBpbnN0ZWFkOgo+IGtlcm5lbC9hbWwtNC45L2RyaXZlcnMvYW1sb2dpYy9tZWRpYS92b3V0L2hk
bWl0eC9oZG1pX3R4XzIwL2h3L2h3X3R4bHguYwo+IHVzZXMgUF9SRVNFVDBfUkVHSVNURVIgYW5k
IFBfUkVTRVQyX1JFR0lTVEVSCj4gdGhlc2UgYXJlIGRlZmluZWQgaW4KPiBrZXJuZWwvYW1sLTQu
OS9kcml2ZXJzL2FtbG9naWMvbWVkaWEvdm91dC9oZG1pdHgvaGRtaV90eF8yMC9ody90eGx4X3Jl
Zy5oCj4gdXNpbmc6Cj4+ICNkZWZpbmUgUkVTRVRfQ0JVU19SRUdfSURYIDUKPj4gI2RlZmluZSBC
QVNFX1JFR19PRkZTRVQgMjQKPj4gI2RlZmluZSBSRVNFVF9DQlVTX1JFR19BRERSKHJlZykgXAo+
PiAgICAoKFJFU0VUX0NCVVNfUkVHX0lEWCA8PCBCQVNFX1JFR19PRkZTRVQpICsgKHJlZyA8PCAy
KSkKPj4KPj4gI2RlZmluZSBSRVNFVDBfUkVHSVNURVIgMHgwMQo+PiAjZGVmaW5lIFBfUkVTRVQw
X1JFR0lTVEVSIFJFU0VUX0NCVVNfUkVHX0FERFIoUkVTRVQwX1JFR0lTVEVSKQo+IAo+IHdoZW4g
SSBkbyB0aGUgbWF0aHM6Cj4gKDUgPDwgMjQpICsgKDB4MDEgPDwgMikgPSAweDUwMDAwMDQKPiAK
PiBUaGUgR1ggU29DcyBoYXZlIHRoZSByZXNldCBjb250cm9sbGVyIGF0IGNidXMgKyAweDQ0MDQK
PiBob3dldmVyLCB0aGUgb2Zmc2V0IG1heSBoYXZlIGNoYW5nZWQgaW4gRzEyQSBiZWNhdXNlIHRo
ZSBTQVIgQURDCj4gb2Zmc2V0IGFsc28gY2hhbmdlZCAoanVzdCBvbmUgZXhhbXBsZSkuCj4gCj4g
RG8geW91IGhhdmUgYW55IGhpbnQgaG93IHRvIHZlcmlmeSB0aGUgQ0JVUyBvZmZzZXQgKDB4MTAw
NCkgb2YgdGhlCj4gcmVzZXQgY29udHJvbGxlcj8KCllvdSBjYW4gZmluZCBiYXNlIHRoZSBhZGRy
ZXNzIGZvdW5kIGluIHRoZSBHMTJBIERUIGZvciB0aGUgdXNiMiBwaHkgOgpodHRwczovL2dpdGh1
Yi5jb20vaGFyZGtlcm5lbC9saW51eC9ibG9iL29kcm9pZG4yLTQuOS55L2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbmcxMmEuZHRzaSNMMzc5CgpOZWlsCgo+IAo+IAo+IFJlZ2FyZHMK
PiBNYXJ0aW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
