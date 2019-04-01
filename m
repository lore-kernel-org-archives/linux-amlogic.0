Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6E7C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 07:26:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC088213A2
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 07:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="luVTzxda";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PvAGkyf/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC088213A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pq0hDrdXgtCTe7yFPOp7Oth+R1DVXUUGjRmo3IbCwaU=; b=luVTzxda3OSUou
	8lMsAgV1x7UVrcohr5qlrAQj/CgbkNLRW9RbKALt+9vLU2QYIEOh/2ybLcgRfpSNsRrvZrWG4Orul
	NphE64awowxoMe50ntV0cyZTTTZJjH2KAzlU+JgTDw0J7inWnBL7W8CjKI6gh3xv88TsHDtuMrH6k
	J1xDgbTjXTfyssdOhNUzc3GTe+u8ZeR10p3eBWR6FO9c29LifHT4XiiRYxt2pUKcGJrGH18ulH3Wu
	VdwQa7ihmEJqcr2D1wnRnBon6UTW+xz9Qmpl3W/n9vhKXbRlFyY0Y5f3o7wLsHNhHKMjTMq8uOrHg
	wFzuyb1xclnt5yrF5gyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hArKL-00063k-Ss; Mon, 01 Apr 2019 07:25:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hArKC-0005v7-1Q
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 07:25:46 +0000
Received: by mail-wr1-x441.google.com with SMTP id q1so10511870wrp.0
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C3zeyacTUIM75PfS17F1GM1uexn2ZeAEk6WfGpXmlfM=;
 b=PvAGkyf/eE5bmgMNXxg/Xh/dHMKrI9nnt/kgiX1HQpe7E//YrkmooDfjUv8xmIIitS
 bTVtJzJrh1J3dBc9cZoUdCIl8s9DQaXaXOJqhca8ho9a3g2rr3e40Ub5kf5JcS8L5BSt
 vwicN7h3+1uFDpnCTDUoVhc7Z5T4GQu9YXEv+aeU8vjTGnU5SVa9/0dr48IWramZUh63
 noNefHoWUMCr5Ws++ZwwLyihCwqxFQG1pLSgRE0kqSCQxYrdhW36lxyBXYFlhgSmNRUI
 WEv2IPOGO2nEdwTsgX5PbzSZY5NBnXL21bFW5grYVduINTThcDQ4ySAaSs93zKlLgtQ5
 01Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C3zeyacTUIM75PfS17F1GM1uexn2ZeAEk6WfGpXmlfM=;
 b=aBl6eUNnXOO7t8imhyT1h75LcPBpfr04dOj4y/3QoY011ZXi7xNEVZwx8BiOuR4PgD
 hjpBslOs/AT9Eiyp7Ga8wEqgsiG7wMTDlPeB0ug4z3xs4NMyVY+jg72ebLKSP3IkSZrh
 cxprkzmcAb54/S599SgZzJ0ZG7Geaqp/pCptUU1QY683nVAmXGRFmrl784o8zFoFCgr8
 rO5ErbC6T80XtTHMDWZ4Mwzis+z3zPxaPJ9KMsT878xGZoWI4Zlzeu7htCjMs5aYbMhs
 anjyai1A29b9GKm957/G71h2UvV1bsvdPxhh41lWqzpmGr4PvIZzC4foyW3UA6rEwiT4
 Py+w==
X-Gm-Message-State: APjAAAUHEE3y8ml97ISC5/HoKaqXU8EX4TOuNCa98caNPUqtC0KJc1+F
 Xi6QHNacRlofqmYcPL+wuOrBEQ==
X-Google-Smtp-Source: APXvYqyujZM39rJ5POkm7/D4yTpFoaEC8iCRnjaH+RFx1MU8GLqI5XPjEnrTbnii2mROlFF6KtIdkA==
X-Received: by 2002:adf:dcce:: with SMTP id x14mr28929352wrm.315.1554103541660; 
 Mon, 01 Apr 2019 00:25:41 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 r30sm22068537wrr.46.2019.04.01.00.25.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 00:25:40 -0700 (PDT)
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
 <20190325084153.l44pzfewcqlkoaoe@pengutronix.de>
 <CAFBinCAn-9oETMKMfSXoJOMBrQyrCFN7AyHG02bQaoxG1px3YA@mail.gmail.com>
 <20190325200730.cx73jgxfexz6ybzq@pengutronix.de>
 <CAFBinCCGWsb+1WHFe6uwrpUYgH4iix0WT8_v_Nj5BhGKRyjiLQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1e6f9589-ff9a-f0fd-f12d-d680ffd58752@baylibre.com>
Date: Mon, 1 Apr 2019 09:25:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCCGWsb+1WHFe6uwrpUYgH4iix0WT8_v_Nj5BhGKRyjiLQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_002544_130612_E29BA5C7 
X-CRM114-Status: GOOD (  18.18  )
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
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMzAvMDMvMjAxOSAyMDoyOSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIZWxsbyBV
d2UsCj4gCj4gT24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgOTowNyBQTSBVd2UgS2xlaW5lLUvDtm5p
Zwo+IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+IFsuLi5dCj4+Pj4g
IC0gRG9lcyBzdG9wcGluZyB0aGUgUFdNIChpLmUuIGNsZWFyaW5nIE1JU0Nfe0EsQn1fRU4gaW4g
dGhlIE1JU0NfQUIKPj4+PiAgICByZWdpc3RlcikgZnJlZXplIHRoZSBvdXRwdXQsIG9yIGlzIHRo
ZSBjdXJyZW50bHkgcnVubmluZyBwZXJpb2QKPj4+PiAgICBjb21wbGV0ZWQgZmlyc3Q/IChUaGUg
bGF0dGVyIGlzIHRoZSByaWdodCBiZWhhdmlvdXIuKQo+Pj4gSSBkb24ndCBrbm93LCBJIHdvdWxk
IGhhdmUgdG8gbWVhc3VyZSB0aGlzIHdpdGggYSBsb2dpYyBhbmFseXplci4KPj4KPj4gSW4gcHJh
Y3Rpc2UgeW91IGNhbiBkbyB0aGlzIHdpdGggYSBtdWx0aW1ldGVyLCB0b28uIEp1c3QgZG8gc29t
ZXRoaW5nCj4+IGxpa2U6Cj4+Cj4+ICAgICAgICAgcHdtX2FwcGx5X3N0YXRlKHsgLmVuYWJsZWQg
PSB0cnVlLCAucGVyaW9kID0gNXMsIC5kdXR5X2N5Y2xlID0gNXMsIC5wb2xhcml0eSA9IFBXTV9Q
T0xBUklUWV9OT1JNQUwgfSk7Cj4+ICAgICAgICAgcHdtX2FwcGx5X3N0YXRlKHsgLmVuYWJsZWQg
PSBmYWxzZSwgLnBlcmlvZCA9IDVzLCAuZHV0eV9jeWNsZSA9IDVzLCAucG9sYXJpdHkgPSBQV01f
UE9MQVJJVFlfTk9STUFMIH0pOwo+Pgo+PiAoYXNzdW1pbmcgdGhlIFBXTSBzdXBwb3J0cyBwZXJp
b2RzIHRoYXQgbG9uZykuIFRoZSBleHBlY3RhdGlvbiBpcyB0aGF0Cj4+IHRoZSBsYXN0IGNvbW1h
bmQgdGFrZXMgbmVhcmx5IDUgcyB0byBjb21wbGV0ZSBhbmQgd2hpbGUgaXQgd2FpdHMgdGhlCj4+
IG91dHB1dCBpcyBoaWdoIGFuZCBvbiByZXR1cm4gaXQncyBsb3cuIElmIHRoYXQgaXNuJ3QgdGhl
IGNhc2UsIHRoZXJlIGlzCj4+IGEgYnVnIHNvbWV3aGVyZS4KPiB0aGUgbG9uZ2VzdCBzdXBwb3J0
ZWQgcGVyaW9kICh1c2luZyB0aGUgMjRNSHogY3J5c3RhbCBhcyBpbnB1dCwgd2hpY2gKPiBpcyB0
aGUgc2xvd2VzdCBpbnB1dCBjbG9jayBhbmQgdGh1cyBnaXZlcyB0aGUgbG9uZ2VzdCBwb3NzaWJs
ZQo+IGR1cmF0aW9uKSBpcyAzNDk1MTQ0MDducyAodGhhdCdzIGFwcHJveC4gMC4zNSBzZWNvbmRz
KS4gbXkgbXVsdGltZXRlcgo+IGlzbid0IGZhc3QgZW5vdWdoIHRvIG1lYXN1cmUgdGhpcyBzbyBJ
J20gdXNpbmcgbXkgbG9naWMgYW5hbHl6ZXIgd2l0aAo+IHB1bGVzZXZpZXcgaW5zdGVhZDogWzBd
Cj4gCj4gSSBhZGRlZCB0aGUgZm9sbG93aW5nIGNvZGUgdG8gbWVzb25fcHdtX3JlcXVlc3Q6Cj4g
ICBzdHJ1Y3QgcHdtX3N0YXRlIGVuYWJsZSA9IHsKPiAgICAgICAgIC5lbmFibGVkID0gdHJ1ZSwK
PiAgICAgICAgIC5wZXJpb2QgPSAzNDk1MTQ0MDdVLAo+ICAgICAgICAgLmR1dHlfY3ljbGUgPSAz
NDk1MTQ0MDdVLAo+ICAgICAgICAgLnBvbGFyaXR5ID0gUFdNX1BPTEFSSVRZX05PUk1BTCB9Owo+
ICAgc3RydWN0IHB3bV9zdGF0ZSBkaXNhYmxlID0gewo+ICAgICAgICAgLmVuYWJsZWQgPSBmYWxz
ZSwKPiAgICAgICAgIC5wZXJpb2QgPSAzNDk1MTQ0MDdVLAo+ICAgICAgICAgLmR1dHlfY3ljbGUg
PSAzNDk1MTQ0MDdVLAo+ICAgICAgICAgLnBvbGFyaXR5ID0gUFdNX1BPTEFSSVRZX05PUk1BTCB9
Owo+ICAgcHdtX2FwcGx5X3N0YXRlKHB3bSwgJmVuYWJsZSk7Cj4gICBwd21fYXBwbHlfc3RhdGUo
cHdtLCAmZGlzYWJsZSk7Cj4gCj4gdGhpcyByZXR1cm5zIGltbWVkaWF0ZWx5LiBteSBsb2dpYyBh
bmFseXplciBkb2Vzbid0IHNlZSBzaWduYWwgY2hhbmdlCj4gKEknbSBzYW1wbGluZyBhdCAxTUh6
KS4KPiAKPiBjYW4geW91IHBsZWFzZSBjb25maXJtIHRoYXQgbXkgdGVzdCBjb2RlIGFuZCBtZWFz
dXJlbWVudCBwcm9jZWR1cmUgaXMgY29ycmVjdD8KPiBpZiBpdCBpcyB0aGVuIG15IG9ic2VydmF0
aW9uIGlzIHRoYXQgZGlzYWJsaW5nIHRoZSBQV00gZG9lcyBzbwo+IGltbWVkaWF0ZWx5LCB3aXRo
b3V0IHdhaXRpbmcgZm9yIHRoZSBjdXJyZW50IHBlcmlvZCB0byBjb21wbGV0ZQoKSSdtIHByZXR0
eSAxMDAsMDAwMDAwMDAwMDAwMDAlIHN1cmUgdGhlIEhXIGRvZXNuJ3QgcGVybWl0IHdhaXRpbmcg
Zm9yIGEgcGVyaW9kIHRvIGZpbmlzaC4KCkZvciBkaXNhYmxlIHN0YXRlcywgd2UgY2FuIGVpdGhl
ciBwbGF5IG9uIHRoZSBwZXJpb2QgKGhpZ2ggcGVyaW9kIGF0IDB4ZmZmZiBmb3IgZGlzYWJsZQph
dCBQV01fUE9MQVJJVFlfSU5WRVJTRUQgYW5kIGhpZ2ggcGVyaW9kIGF0IDAgZm9yIFBXTV9QT0xB
UklUWV9OT1JNQUwsIGlmIHRoZSBIVyBiZWhhdmVzCmNvcnJlY3RseSkgb3IgYnkgYWRkaW5nIHNv
bWUgcGluY3RybCBzdGF0ZXMgc3dpdGNoaW5nIHRvIEdQSU8gbW9kZXMgYW5kIGFkZGluZyB0aGUK
ZW5hYmxlIG91dHB1dCBoaWdoIGFuZCBvdXRwdXQgbG93IHByb3BlcnR5LgoKTmVpbAoKCj4gCj4g
Cj4gUmVnYXJkcwo+IE1hcnRpbgo+IAo+IAo+IFswXSBodHRwczovL3NpZ3Jvay5vcmcvd2lraS9M
Y3NvZnRfTWluaV9Cb2FyZAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
