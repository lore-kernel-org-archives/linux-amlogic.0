Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7511DC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 09:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BFF120823
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 09:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LtPTiXcx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G62gHBXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BFF120823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AF64PNT2Oi7f1rc8wpZH1ua65iwNGealQoHH0z1N2fw=; b=LtPTiXcxGz9uj0
	KaHfozwO5xZZwPD7yITdl7L6uJtkA5YSnXvv3VPKpbc8gBtVio2nMRuvGjmfXsA+TtrtFGOVcfsAm
	bgmRE6Zz5FPPRW1DYyq0l5jof/XuxVMARlQdJo4+ewnq7ol2bipGdClRchUni1ELZE5iM2mOdXBLT
	EGO3OIyRmTASLRbDLmrXQPxSpIwrlxX7v4EhjamPv033hbMZNjOq+61A8JpW0DfifMiJNSPl93+RM
	HvOHL4+1n6/zfR3B8zREXRrlUqmejV1YHKYI1gOdESbjnJYGPL9Z/dD/AtT9WFkBGT9DYQx6EK7Zm
	z2lzbKmON/4/G3iY94Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkQdT-0003C4-OA; Fri, 18 Jan 2019 09:40:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkQdQ-0003BZ-Gw
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 09:40:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id m1so3841326wml.2
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 01:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2g01vzvh25Lt4673ekLv7gDNOBuQNnSj4waDHEZZ+4E=;
 b=G62gHBXQS6LgipwQEHkiVZnzsia9Tq/AdBFsnVmv0WBXI3sQiWBT+w1OzQzPGo50AP
 9u+/boTk8TNLgEhfIngu+ReH7xn816PUHrWzoB+EruTvifKGjIXMpB6AjCbrcaFoUun7
 XQ6R34olJ2REUdqpIjNVWt4NZDWRRalDayLJ1h5zG2G8uHhTI7PKe19xFuGvFPJVEn1k
 tPZf/DjWhkH+25QEnwK+Vvwp9ugWMC20PFVzERi6mQmP7qTsIMJ74KjmtZut3G2XAKe7
 r/luwg86Qw/zrlc2iU5w6pzA2j4vT8cmCBpcS/lJMYfq/plQEP6UGGTwmgqVsECowsCT
 DvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2g01vzvh25Lt4673ekLv7gDNOBuQNnSj4waDHEZZ+4E=;
 b=HcOhQLd4Kmnq1ipGox2baOKI+sm+5WkXXw4BIk/Q8ohDb74u4dBw8lcvsRCW2tdw80
 SuH+oYeZxoJCody6vRw9hw0codwOiPOkwWROp8i4pfBI7LEr7VXNMhGXceRrM2Sb0r3r
 bdGm9a4nW4qkXYjcnkhiBrLWyjzDKWPiRFBqKBZe/ZO+c4btYq8T7C2rRJA5vrZwgOUQ
 WGsY51jJAYcaiANid/rLYRVaz27IWL/ZE6L9BfR6QX3dizv6Go+GV0FLq4uqOMANHAjr
 Fw2nIr6XsCgRFzKSEi34x7tLe3XhnQuF5iZx9tycEvSfWLFR4HwoINkb92BMLffOBYdJ
 QwTg==
X-Gm-Message-State: AJcUukdPbo6xbrQI7MtsOwWv8Slps+Q5Ewm+TrTlPxW4VudsW64XozEe
 tD45rLFmFTczkyapijuBzcdMWA==
X-Google-Smtp-Source: ALg8bN6gZ7c4HUb174a/I5Cmy6psqBOkt4sH/AbCY44cke7XVzwl7zkfGmNzu8H5rb9UrGRxCJVLvQ==
X-Received: by 2002:a1c:1d81:: with SMTP id
 d123mr14597568wmd.112.1547804418438; 
 Fri, 18 Jan 2019 01:40:18 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t12sm86309396wrr.65.2019.01.18.01.40.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 01:40:17 -0800 (PST)
Subject: Re: [PATCH 2/8] drm/meson: add HDMI div40 TMDS mode
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent.pinchart@ideasonboard.com
References: <20190115123315.11069-1-narmstrong@baylibre.com>
 <CGME20190115123329epcas2p238b0b8a9f449f96991e02b34c54741ca@epcas2p2.samsung.com>
 <20190115123315.11069-3-narmstrong@baylibre.com>
 <5103b2e8-2f73-da18-a043-fa45d6e2c139@samsung.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <bdd3ec10-1f9f-324c-aed0-6eab30fe518b@baylibre.com>
Date: Fri, 18 Jan 2019 10:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <5103b2e8-2f73-da18-a043-fa45d6e2c139@samsung.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_014020_635624_82143504 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQW5kcnplaiwKCk9uIDE4LzAxLzIwMTkgMTA6MTMsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4g
T24gMTUuMDEuMjAxOSAxMzozMywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IEFkZCBzdXBwb3J0
IGZvciBUTURTIENsb2NrID4gMy40R0h6IGZvciBIRE1JMi4wIGRpc3BsYXkgbW9kZXMuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4K
Pj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIHwgMjMgKysr
KysrKysrKysrKysrKysrKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMK
Pj4gaW5kZXggODA3MTExZWJmZGQ5Li4zZDhkZWNiNzcwMTkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X2hkbWkuYwo+PiBAQCAtMzY1LDcgKzM2NSw4IEBAIHN0YXRpYyBpbnQg
ZHdfaGRtaV9waHlfaW5pdChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdm9pZCAqZGF0YSwKPj4gIAl1
bnNpZ25lZCBpbnQgd3JfY2xrID0KPj4gIAkJcmVhZGxfcmVsYXhlZChwcml2LT5pb19iYXNlICsg
X1JFRyhWUFVfSERNSV9TRVRUSU5HKSk7Cj4+ICAKPj4gLQlEUk1fREVCVUdfRFJJVkVSKCIlZDpc
IiVzXCJcbiIsIG1vZGUtPmJhc2UuaWQsIG1vZGUtPm5hbWUpOwo+PiArCURSTV9ERUJVR19EUklW
RVIoIiVkOlwiJXNcIiBkaXYlZFxuIiwgbW9kZS0+YmFzZS5pZCwgbW9kZS0+bmFtZSwKPj4gKwkJ
CSBtb2RlLT5jbG9jayA+IDM0MDAwMCA/IDQwIDogMTApOwo+PiAgCj4+ICAJLyogRW5hYmxlIGNs
b2NrcyAqLwo+PiAgCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5oaGksIEhISV9IRE1JX0NMS19D
TlRMLCAweGZmZmYsIDB4MTAwKTsKPj4gQEAgLTM4NSw5ICszODYsMTcgQEAgc3RhdGljIGludCBk
d19oZG1pX3BoeV9pbml0KHN0cnVjdCBkd19oZG1pICpoZG1pLCB2b2lkICpkYXRhLAo+PiAgCS8q
IEVuYWJsZSBub3JtYWwgb3V0cHV0IHRvIFBIWSAqLwo+PiAgCWR3X2hkbWlfdG9wX3dyaXRlKGR3
X2hkbWksIEhETUlUWF9UT1BfQklTVF9DTlRMLCBCSVQoMTIpKTsKPj4gIAo+PiAtCS8qIFRNRFMg
cGF0dGVybiBzZXR1cCAoVE9GSVggcGF0dGVybiBmb3IgNGsyayBzY3JhbWJsaW5nKSAqLwo+PiAt
CWR3X2hkbWlfdG9wX3dyaXRlKGR3X2hkbWksIEhETUlUWF9UT1BfVE1EU19DTEtfUFRUTl8wMSwg
MHgwMDFmMDAxZik7Cj4+IC0JZHdfaGRtaV90b3Bfd3JpdGUoZHdfaGRtaSwgSERNSVRYX1RPUF9U
TURTX0NMS19QVFROXzIzLCAweDAwMWYwMDFmKTsKPj4gKwkvKiBUTURTIHBhdHRlcm4gc2V0dXAg
KFRPRklYIEhhbmRsZSB0aGUgWVVWNDIwIGNhc2UpICovCj4+ICsJaWYgKG1vZGUtPmNsb2NrID4g
MzQwMDAwKSB7Cj4+ICsJCWR3X2hkbWlfdG9wX3dyaXRlKGR3X2hkbWksIEhETUlUWF9UT1BfVE1E
U19DTEtfUFRUTl8wMSwgMCk7Cj4+ICsJCWR3X2hkbWlfdG9wX3dyaXRlKGR3X2hkbWksIEhETUlU
WF9UT1BfVE1EU19DTEtfUFRUTl8yMywKPj4gKwkJCQkgIDB4MDNmZjAzZmYpOwo+PiArCX0gZWxz
ZSB7Cj4+ICsJCWR3X2hkbWlfdG9wX3dyaXRlKGR3X2hkbWksIEhETUlUWF9UT1BfVE1EU19DTEtf
UFRUTl8wMSwKPj4gKwkJCQkgIDB4MDAxZjAwMWYpOwo+PiArCQlkd19oZG1pX3RvcF93cml0ZShk
d19oZG1pLCBIRE1JVFhfVE9QX1RNRFNfQ0xLX1BUVE5fMjMsCj4+ICsJCQkJICAweDAwMWYwMDFm
KTsKPj4gKwl9Cj4gCj4gCj4gwqDCoMKgIHZhbCA9IG1vZGUtPmNsb2NrID4gMzQwMDAwID8gMHgw
M2ZmMDNmZiA6IDB4MDAxZjAwMWY7Cj4gwqDCoMKgIGR3X2hkbWlfdG9wX3dyaXRlKGR3X2hkbWks
IEhETUlUWF9UT1BfVE1EU19DTEtfUFRUTl8wMSwgdmFsKTsKPiAKPiDCoMKgwqAgZHdfaGRtaV90
b3Bfd3JpdGUoZHdfaGRtaSwgSERNSVRYX1RPUF9UTURTX0NMS19QVFROXzIzLCB2YWwpOwo+IAo+
IAo+IFRoZSBiZXN0IHdvdWxkIGJlIHRvIHJlcGxhY2UgdGhlc2UgbWFnaWMgdmFsdWVzIHdpdGgg
ZGVzY3JpcHRpdmUgbWFjcm9zLgoKSW4gZmFjdCwgdGhlc2UgYXJlIHBhdHRlcm5zLCBub3Qgc3Vy
ZSBob3cgdG8gZGVzY3JpYmUgdGhlbSA/IGl0J3MgbGlrZSBhIHBsYWluIG51bWJlciwgdGhlIHZh
bHVlIGhhcyBpdCdzIG93biBtZWFuaW5nLgoKCk5laWwKPiAKPiAKPiBSZWdhcmRzCj4gCj4gQW5k
cnplago+IAo+IAo+PiAgCj4+ICAJLyogTG9hZCBUTURTIHBhdHRlcm4gKi8KPj4gIAlkd19oZG1p
X3RvcF93cml0ZShkd19oZG1pLCBIRE1JVFhfVE9QX1RNRFNfQ0xLX1BUVE5fQ05UTCwgMHgxKTsK
Pj4gQEAgLTQxMyw2ICs0MjIsOCBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcGh5X2luaXQoc3RydWN0
IGR3X2hkbWkgKmhkbWksIHZvaWQgKmRhdGEsCj4+ICAJLyogRGlzYWJsZSBjbG9jaywgZmlmbywg
Zmlmb193ciAqLwo+PiAgCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5oaGksIEhISV9IRE1JX1BI
WV9DTlRMMSwgMHhmLCAwKTsKPj4gIAo+PiArCWR3X2hkbWlfc2V0X2hpZ2hfdG1kc19jbG9ja19y
YXRpbyhoZG1pKTsKPj4gKwo+PiAgCW1zbGVlcCgxMDApOwo+PiAgCj4+ICAJLyogUmVzZXQgUEhZ
IDMgdGltZXMgaW4gYSByb3cgKi8KPj4gQEAgLTU2Miw2ICs1NzMsMTAgQEAgZHdfaGRtaV9tb2Rl
X3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4+ICAJCW1vZGUtPnZkaXNw
bGF5LCBtb2RlLT52c3luY19zdGFydCwKPj4gIAkJbW9kZS0+dnN5bmNfZW5kLCBtb2RlLT52dG90
YWwsIG1vZGUtPnR5cGUsIG1vZGUtPmZsYWdzKTsKPj4gIAo+PiArCS8qIElmIHNpbmsgbWF4IFRN
RFMgY2xvY2ssIHdlIHJlamVjdCB0aGUgbW9kZSAqLwo+PiArCWlmIChtb2RlLT5jbG9jayA+IGNv
bm5lY3Rvci0+ZGlzcGxheV9pbmZvLm1heF90bWRzX2Nsb2NrKQo+PiArCQlyZXR1cm4gTU9ERV9C
QUQ7Cj4+ICsKPj4gIAkvKiBDaGVjayBhZ2FpbnN0IG5vbi1WSUMgc3VwcG9ydGVkIG1vZGVzICov
Cj4+ICAJaWYgKCF2aWMpIHsKPj4gIAkJc3RhdHVzID0gbWVzb25fdmVuY19oZG1pX3N1cHBvcnRl
ZF9tb2RlKG1vZGUpOwo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
