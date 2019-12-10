Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08700C2D0C7
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 08:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFEA020663
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 08:56:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UsljBP1B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bmag2R2m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFEA020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+a/1ZQgkc9dagjHYsOhIn8Z8/sTAXuvAX3fC2WPbLjw=; b=UsljBP1BogH9Jd
	pZAwo6Y9fL/iocBleNW6b3Dl4XErKCWEGRyCvKmx3sFP80pUCbBwRPF/75Ghc/atK8MPX77WXBLu7
	Y6bYnxoAgnrhkuZ7hvVVAXoJlqhOe3aYZY5OTE1pXcJFzHCOB5BKFmtjFVjEQ//zQLvvJ8e+Pk6oG
	bUIIhlBiDNCkFmdUeCSdEkmm8PayzA9Tw4wXoGfZAUYQ8SJoZnwCtw1vfP00ldcl5dbnvZiEuO9NM
	KTCPee+54d8PIEUXUsRAihfOTxufNLitTbkRLqN4LpcE5LzMrKe9jp00WJxNbkLOPkjpd2UrpyyoN
	35lSCbLoL9dWbpg302Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iebJG-0007nf-Qi; Tue, 10 Dec 2019 08:55:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iebJB-0007kt-R6
 for linux-amlogic@lists.infradead.org; Tue, 10 Dec 2019 08:55:57 +0000
Received: by mail-wr1-x444.google.com with SMTP id j42so19002947wrj.12
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Dec 2019 00:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WJMZcMT5U6/PxyRWHHDkiisysRfnrUDp7BQ62iDzKRI=;
 b=bmag2R2m7kYpRwCp4ityG/nO7FGl8CBWYymJGOH5S73fBCk920O7X5a4ssyafDzpjd
 OXKnrHEE/4EXXcLdPYWVyM6j5avsJJLjlwO8Fs5Sf9hakNAemu9tAzJA+wB5o865ssWf
 DqQzL9Qbw+OPgDUDoQIRFGGUXoPxrxmillZhpFlfXQj6UHFzz8qBbC1zj1lU228Lu86m
 xx4/LrPzQ3+HrdxdX/Z7w8rdJXwL0bcx8tWHwUPJqQvMKzavnxyn4Q6Alat5WfwbgCpV
 Gmg+TyfhiNaPZXyDQdu0suXrDw82d53HTKovkvR7AoekMWwNkjbNsfvgAlofQUBQlqYT
 XgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WJMZcMT5U6/PxyRWHHDkiisysRfnrUDp7BQ62iDzKRI=;
 b=RqluqkvYbKHFUhq8IELiCWLyS75VUgjCDjMcocCdd8tTHFbrK1KCTCdPPqCKXgLeNT
 xKATVY0OGiVBPEiqI5DjCdRU9FptLmzST3T5AkUOGcsrEN3X07v6/bqEkc7osGqFss08
 PDVaNeWaPU/a+SBzfFKhYja/3ehOVhPHUYDwJusKjY+rWQ1FOMokEt+cPGMyqKwZ1jzk
 A0GUIJk2GILgglmqyvKDvITJoPW6Rc55iGQd+LxypnlIwh/wnRHExw9H5nYNlS5lNEHt
 88Fm2sUz//8QnZ6ToyMAqFGf+qYQAc2rXbsFs6FimcY7nhp+vqxNTOBPBgOiVu+eFIw2
 DJgQ==
X-Gm-Message-State: APjAAAWr9gRln4ZiR7hNz6tmjf1zhq/9E+euMUHdsWkAt5NYmZxblDYs
 2l4lTMxtY0D49JlkEMfjWAoH9Q==
X-Google-Smtp-Source: APXvYqwX9k1zWkayKQA7gpWyntCDmmjP6qoXQ9E/JUxy1pTJr/Wr5HqyiAJkqqKKk+mjmEpNxWF9kQ==
X-Received: by 2002:a5d:5091:: with SMTP id a17mr1837211wrt.362.1575968151891; 
 Tue, 10 Dec 2019 00:55:51 -0800 (PST)
Received: from [10.2.4.229] (lfbn-1-7161-157.w90-116.abo.wanadoo.fr.
 [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x18sm2461907wrr.75.2019.12.10.00.55.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Dec 2019 00:55:51 -0800 (PST)
Subject: Re: [PATCH 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Jun Li <lijun.kernel@gmail.com>
References: <20191014141718.22603-1-narmstrong@baylibre.com>
 <20191014141718.22603-2-narmstrong@baylibre.com>
 <20191023201141.GA21235@bogus>
 <CA+3zgmsJPsvXgsjDQKKrSG+UNdY3SK+hKCTD2X3hGG+OXejHig@mail.gmail.com>
 <CAKgpwJWU3jB0DWEKE09TOV+YLceBFJ75ZirAXQbuhj8v3FwjXg@mail.gmail.com>
 <c32007f5-88b9-45c5-b542-b1dc4dbc76ea@baylibre.com>
 <CAKgpwJVHF6Ytdt9kq5SwiixFDLym_UPG51aXag1nVVay0pzofQ@mail.gmail.com>
 <45212db9-e366-2669-5c0a-3c5bd06287f6@synopsys.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <ce35b6d2-7ed1-be2d-6e38-4c6e89340a40@baylibre.com>
Date: Tue, 10 Dec 2019 09:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <45212db9-e366-2669-5c0a-3c5bd06287f6@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_005554_695414_E2015286 
X-CRM114-Status: GOOD (  21.64  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <balbi@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tim <elatllat@gmail.com>, Dongjin Kim <tobetter@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Rob Herring <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxMi8xMS8yMDE5IDIxOjAzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6Cj4gSGksCj4gCj4g
SnVuIExpIHdyb3RlOgo+PiBUaGlzIGJ1ZyBleGlzdHMgb24gYWxsIGN1cnJlbnQgdmVyc2lvbnMg
cGVyIGluZm9ybWF0aW9uIEkgZ290IGZyb20gU3lub3BzeXMuCj4+ICsgVGhpbmggTmd1eWVuIDx0
aGluaG5Ac3lub3BzeXMuY29tPi4KPj4KPj4gTGkgSnVuCj4gCj4gVGhlIEdVQ1RMMS5QQVJLTU9E
RV9ESVNBQkxFX1NTIGlzIG9ubHkgYXZhaWxhYmxlIGluIGR3Y191c2IzIGNvbnRyb2xsZXIgCj4g
cnVubmluZyBpbiBob3N0IG1vZGUuIFRoaXMgc2hvdWxkIG5vdCBiZSBzZXQgZm9yIG90aGVyIElQ
cy4KPiAKPiBUaGlzIGNhbiBiZSBkaXNhYmxlZCBieSBkZWZhdWx0IGJhc2VkIG9uIElQLCBidXQg
SSByZWNvbW1lbmQgdG8gaGF2ZSBhIAo+IHByb3BlcnR5IHRvIGVuYWJsZSB0aGlzIGZlYXR1cmUg
Zm9yIGRldmljZXMgdGhhdCBuZWVkIHRoaXMuCgpUaGFua3MsIHNvIHRoaXMgcGF0Y2hzZXQgaXMg
dGhlIHJpZ2h0IHdheSB0byBzb2x2ZSB0aGlzLgoKRmVsaXBlLCB3b3VsZCBpdCBiZSBwb3NzaWJs
ZSB0byBoYXZlIGl0IG1lcmdlZCBmb3IgbmV4dCByZWxlYXNlID8KU2hvdWxkIEkgcmVzZW5kIGl0
ID8KClRoYW5rcywKTmVpbAoKPiAKPiAKPj4KPj4gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPiDkuo4yMDE55bm0MTHmnIgxMuaXpeWRqOS6jCDkuIvljYg1OjAw5YaZ6YGT
77yaCj4+PiBIaSBMaSwKPj4+Cj4+PiBPbiAxMS8xMS8yMDE5IDAyOjU4LCBKdW4gTGkgd3JvdGU6
Cj4+Pj4gSGkgTmVpbAo+Pj4+Cj4+Pj4gQXMgSSBnb3QgdGhlIGluZm9ybWF0aW9uIGZyb20gU3lu
b3BzeXMsIHRoaXMgYnVnIGV4aXN0cyBvbiBjdXJyZW50IElQIHZlcnNpb25zLAo+Pj4+IGFuZCBw
ZXIgbXkgdGVzdHMgd2l0aCBleHRlcm5hbCBVU0IzIGh1YiArIDIgU3VwZXIgc3BlZWQgdWRpc2tz
IG9uIGRhdGEKPj4+PiByZWFkIGJ5IGRkLCBJIGNhbiByZXByb2R1Y2UgdGhpcyBpc3N1ZSB3aXRo
IGRpZmZlcmVudCBrZXJuZWwgdmVyc2lvbnMsIGFsc28gSQo+Pj4+IGRpZG4ndCBzZWUgb2J2aW91
cyBwZXJmb3JtYW5jZSBkcm9wIGJ5IGRkIHRlc3RzIGFmdGVyIGRpc2FibGUgcGFyayBtb2RlIGZv
cgo+Pj4+IHN1cGVyIHNwZWVkLCBzbyBzaG91bGQgd2UganVzdCBkaXNhYmxlIGl0IGJ5IGRlZmF1
bHQgc28gbm8gbmVlZCBhIHF1aXJrPwo+Pj4gSSBkb24ndCBoYXZlIGFueSBvcGluaW9uIG9uIHRo
aXMsIEkgdGhpbmsgdGhlIFVTQiAmIERXQzMgbWFpbnRhaW5lcnMgc2hvdWxkIGRlY2lkZQo+Pj4g
aG93IHRvIGhhbmRsZSB0aGlzLgo+Pj4KPj4+IERpZCBTeW5vcHN5cyBzcGVjaWZpZWQgYSByYW5n
ZSBvZiBhZmZlY3RlZCBJUCB2ZXJzaW9uID8KPj4+Cj4+PiBOZWlsCj4+Pgo+Pj4+IExpIEp1bgo+
Pj4+Cj4+Pj4gVGltIDxlbGF0bGxhdEBnbWFpbC5jb20+IOS6jjIwMTnlubQxMeaciDEx5pel5ZGo
5LiAIOS4iuWNiDg6NDLlhpnpgZPvvJoKPj4+Pj4gVGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMg
TmVpbCwKPj4+Pj4gSXMgdGhlcmUgc29tZXRoaW5nIHRoYXQgbmVlZHMgZG9pbmcgZm9yIHRoaXMg
cGF0Y2ggdG8gbWFrZSBpdCBpbnRvIDUuMyBvciA1LjQ/Cj4+Pj4+IEFzIHByZXZpb3VzbHkgbWVu
dGlvbmVkIHRoZSBwYXRjaCBzZXQgZml4ZXMgdGhlIGlzc3VlIG9uIGFmZmVjdGVkIGhhcmR3YXJl
Owo+Pj4+PiAgICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1o
dHRwcy0zQV9fcGF0Y2h3b3JrLmtlcm5lbC5vcmdfcGF0Y2hfMTExNjQ1MTVfJmQ9RHdJRmFRJmM9
RFBMNl9YXzZKa1hGeDdBWFdxQjB0ZyZyPXU5RllveEt0eWhqckdGY3lpeEZZcVRqdzFaWDBWc0cy
ZDhGQ216a1RZLXcmbT1CQ2ZSSE05ZTg2MDM5U3UwLVF2S195VWpObllybmxfQmN2eFR0Vml5cFQ4
JnM9YVY1dTd1eE5YNm9UTEIzXy1xTnV6ck52eWlxeF9yUEM2UDlUTXFHLUxORSZlPQo+Pj4+Pgo+
Pj4+Pgo+Pj4+Pgo+Pj4+PiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCA0OjExIFBNIFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4gT24gTW9uLCBPY3QgMTQsIDIwMTkg
YXQgMDQ6MTc6MTZQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+Pj4gVGhpcyBw
YXRjaCB1cGRhdGVzIHRoZSBkb2N1bWVudGF0aW9uIHdpdGggdGhlIGluZm9ybWF0aW9uIHJlbGF0
ZWQKPj4+Pj4+PiB0byB0aGUgcXVpcmtzIHRoYXQgbmVlZHMgdG8gYmUgYWRkZWQgZm9yIGRpc2Fi
bGluZyBhbGwgU3VwZXJTcGVlZCBYSENpCj4+Pj4+Pj4gaW5zdGFuY2VzIGluIHBhcmsgbW9kZS4K
Pj4+Pj4+Pgo+Pj4+Pj4+IENDOiBEb25namluIEtpbSA8dG9iZXR0ZXJAZ21haWwuY29tPgo+Pj4+
Pj4+IENjOiBKaWFueGluIFBhbiA8amlhbnhpbi5wYW5AYW1sb2dpYy5jb20+Cj4+Pj4+Pj4gUmVw
b3J0ZWQtYnk6IFRpbSA8ZWxhdGxsYXRAZ21haWwuY29tPgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPj4+Pj4+PiAtLS0KPj4+
Pj4+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQgfCAy
ICsrCj4+Pj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Pj4+PiBTaWdo
LCB3aGF0J3Mgb25lIG1vcmUgdG8gdGhlIG5ldmVyIGVuZGluZyBsaXN0IG9mIHF1aXJrcy4uLgo+
Pj4+Pj4KPj4+Pj4+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IAo+
IEJSLAo+IFRoaW5oCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
