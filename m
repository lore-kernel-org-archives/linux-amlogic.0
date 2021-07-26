Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1BEC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 07:54:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59C460F4C
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 07:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E59C460F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/7VPXYM/XLbiGkhJVM350djg6lQNPt+ct5FCUNpQwvI=; b=wrrGR2Z/gtuD8Bn2qqxLdWDO1M
	FcGibDWHyQNb5ukcILLv6By4U6EUNrBPPSWiMQjRVb/oGboiPfw6L0EdjWivhffg3Slucp41d+g+k
	fd+wbQM5r/LW8HBllbk8KvwoCHqaHijp6F8gUsuIUXpBrFYTyW0Dw9aONtOaIznEd0f/WkohidRqs
	4hIZEQyBEJB9cdTikMe+icENyvaXnf/e0h/29drEGHHSwB+d/IPlR7sFCTVRYByH+w1rrJUYpEdvM
	fAGz706bAO2rVqaFEtzpncvCxQUhd9de9W8+tvYW8o/gcfcs6bC/7j6isIAEsu20IUFna32nlvKG8
	C3nB616w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vRR-00A2Ij-1X; Mon, 26 Jul 2021 07:54:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vRN-00A2H9-S5
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 07:54:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r2so9964841wrl.1
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 00:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pKhVHDu/wxsZb9hfwzrX+BPsM6Pc/tx5jvSdD5Ou178=;
 b=ANPlYcRV2kk/5CYHZ4Ne+7nA183z38zwAGNTLmuMAGj3jTIeVjnyo7leLBIptGRQt4
 TZANRsqE/Iy6jtrbDMJWYpnCyGVt1PyBnHsirry07k+ye7ogzFXjddk1VepHqaGeYgRu
 F50G/NFRT34yCTPtgZaL3oxxFWysa5VI+/eny/+DanAbswvsjwn1lu0KSzo/4xPW7O36
 rrgg3ybVA1GJ0D7V4Ukyp+Y96Qn73CDx8rwBSljL/iXTe7w1pT0gtI38Z7QzwwwYK8UQ
 P1470HrugWB/qFUspwtnUgCqQLAzBk0jbzKCFEZnq6RBGVinz0qt3V7lpCFHvaZIiN6r
 XpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pKhVHDu/wxsZb9hfwzrX+BPsM6Pc/tx5jvSdD5Ou178=;
 b=mSfNidf30Di3FjMsVNU8uwcQ+Wn2JLQuOCvACw4uqjEf4zMkvbJ4zWwd+Ft5HbT3DI
 suiN0XLAqJ3yDIjW5WsVqfwAemlNc3TC4C5qO1XdglZL7+QRC9V4CKRcoGAqO7CQ4o0n
 g2ruELT3QMnzZRcNChhS2LjybZpNmKRcVlf9y0qpkx1NYnBtBCH1iDrkhfo8YJ3yqRq5
 2BqtffeIN+X0YHEgYbj1iZLzjbsfI7WuCLFdj5XcaT7fjyNNXI+v16EnR9MipIoUsQ3g
 KsfnI0hmS+lSa3GpLLHwZVaXn27Utg3p7ielcKwrM0Z+JB2EMCmkDx1S1vdGOq33NLIG
 nNPg==
X-Gm-Message-State: AOAM531xedw9v4PqD77+knWu36RWSxfiqc5/LRsaWfxRtN8ENkaznXxj
 tE8Sr+vNMaaMHDaBQS4aXtNaIw==
X-Google-Smtp-Source: ABdhPJzz/TOtR0DIJD0b2tu94btF0C0mBwibAfReAj8aLKhjI7Ep6VbhGi+x8lUWTDmht7GZH/moZw==
X-Received: by 2002:adf:f110:: with SMTP id r16mr17715304wro.358.1627286056007; 
 Mon, 26 Jul 2021 00:54:16 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:32b6:aa71:d2df:4f1d?
 ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id k186sm5180366wme.45.2021.07.26.00.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 00:54:15 -0700 (PDT)
Subject: Re: Random reboots on ODROID-N2+
To: Stefan Agner <stefan@agner.ch>, Robin Murphy <robin.murphy@arm.com>
Cc: Byron Stanoszek <gandalf@winds.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mike Rapoport <rppt@kernel.org>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
 <a0ef23c932d1a7412d620237d9acde0f@agner.ch>
 <alpine.LNX.2.23.451.2107221723060.2673@winds.org>
 <c2a16fbc-653f-5993-f9bb-9ee8c707515e@arm.com>
 <d1fefb1ec2e7ed1b40083426ed7102c6@agner.ch>
 <216a006d-6df0-4229-d2c1-32256853c857@arm.com>
 <0067ee4c-b9d2-1c92-2444-759ac9a56de0@arm.com>
 <50c6925775c207d0751e20fa9d45611a@agner.ch>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e0cd09ed-6c24-2bc6-c09a-0c0ccb7ae6c4@baylibre.com>
Date: Mon, 26 Jul 2021 09:54:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <50c6925775c207d0751e20fa9d45611a@agner.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_005421_942434_4CF06AAC 
X-CRM114-Status: GOOD (  19.40  )
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

SGksCgpPbiAyMy8wNy8yMDIxIDIxOjQ4LCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4gT24gMjAyMS0w
Ny0yMyAxOTo0NywgUm9iaW4gTXVycGh5IHdyb3RlOgo+PiBPbiAyMDIxLTA3LTIzIDE3OjE0LCBS
b2JpbiBNdXJwaHkgd3JvdGU6Cj4+PiBPbiAyMDIxLTA3LTIzIDE2OjU2LCBTdGVmYW4gQWduZXIg
d3JvdGU6Cj4gPHNuaXA+Cj4+Pj4+Cj4+Pj4+IEJvb3Rpbmcgd2l0aCAiZWZpPWRlYnVnIiBzaG91
bGQgKGFtb25nIG90aGVyIHRoaW5ncykgcHJpbnQgdGhlIG1lbW9yeQo+Pj4+PiBtYXAgYXQgYm9v
dCBpZiB5b3Ugd2FudCB0byBkb3VibGUtY2hlY2sgdGhhdCB0aGF0IGlzIHRoZSBzb3VyY2Ugb2Yg
dGhlCj4+Pj4+IG1pc21hdGNoLiBPdXIgRUZJIGNvZGUgc2hvdWxkIGJlIHBlcmZlY3RseSBjYXBh
YmxlIG9mIHNldHRpbmcgdGhlCj4+Pj4+IG1lbWJsb2NrIGZsYWcgaWYgdGhlIHJlZ2lvbiAqaXMq
IGRlc2NyaWJlZCBhcHByb3ByaWF0ZWx5LCBzZWUKPj4+Pj4gcmVzZXJ2ZV9yZWdpb25zKCkgaW4g
ZHJpdmVycy9maXJtd2FyZS9lZmkvZWZpLWluaXQuYy4KPj4+Pgo+Pj4+IEJvb3RpbmcgNS4xMi4x
MCB3aXRoICJlZmk9ZGVidWciIG9uIFUtQm9vdCAyMDIxLjA0IGdhdmUgdGhpczoKPj4+PiBbwqDC
oMKgIDAuMDAwMDAwXSBNYWNoaW5lIG1vZGVsOiBIYXJka2VybmVsIE9EUk9JRC1OMlBsdXMKPj4+
PiBbwqDCoMKgIDAuMDAwMDAwXSBlZmk6IEdldHRpbmcgVUVGSSBwYXJhbWV0ZXJzIGZyb20gL2No
b3NlbiBpbiBEVDoKPj4+PiBbwqDCoMKgIDAuMDAwMDAwXSBlZmk6IFVFRkkgbm90IGZvdW5kLgo+
Pj4+IFvCoMKgwqAgMC4wMDAwMDBdIE9GOiBmZHQ6IFJlc2VydmVkIG1lbW9yeTogZmFpbGVkIHRv
IHJlc2VydmUgbWVtb3J5IGZvcgo+Pj4+IG5vZGUgJ3NlY21vbkA1MDAwMDAwJzogYmFzZSAweDAw
MDAwMDAwMDUwMDAwMDAsIHNpemUgMyBNaUIKPj4+Pgo+Pj4+IFNvIGl0IHNlZW1zIFVFRkkgaXMg
bm90IGluIHRoZSBwbGF5IGhlcmU/Cj4+Pgo+Pj4gQWgsIE9LLCBpbiB0aGF0IGNhc2UgSSBndWVz
cyB0aGUgcXVlc3Rpb24gcmVtYWlucyB3aHkgZG9lcyBlYXJseV9pbml0X2R0X3Jlc2VydmVfbWVt
b3J5X2FyY2goKSB0aGluayB0aGUgcmVnaW9uIGlzIGFscmVhZHkgcmVzZXJ2ZWQ/IE15IGluc3Rp
bmN0aXZlIGFzc3VtcHRpb24gd2FzIGFuIEVGSSBtZW1vcnkgbWFwIGJlaW5nIHByZXNlbnQ7IHNl
ZWluZyB0aGF0IFUtQm9vdCBkb2VzIGluZGVlZCByZWZsZWN0IERUIHJlc2VydmF0aW9ucyB0aGVy
ZSAqYW5kKiBoYXMgaGFkIGEgbGlrZWx5LWxvb2tpbmcgYnVnIHJlY2VudGx5IHdhcyB0aGVuIGp1
c3Qgb3ZlcndoZWxtaW5nbHkgc3VnZ2VzdGl2ZSA6KQo+Pgo+PiBBY3R1YWxseSwgcG9raW5nIGF0
IFUtQm9vdCBhIGJpdCBtb3JlIEkgZmluZAo+PiBtZXNvbl9ib2FyZF9hZGRfcmVzZXJ2ZWRfbWVt
b3J5KCkgLSBjYW4geW91IGNoZWNrIC9zeXMvZmlybXdhcmUvZmR0Cj4+IGFuZCBzZWUgaWYgdGhl
IHJlZ2lvbiBlbmRzIHVwIGJlaW5nIHBhc3NlZCBhcyBhIC9tZW1yZXNlcnZlLyBhcyB3ZWxsCj4+
IGFzIGEgcHJvcGVyIHJlc2VydmVkLW1lbW9yeSBub2RlPwo+Pgo+PiBJSVJDIHRoZSBzZW1hbnRp
Y3Mgb2YgL21lbXJlc2VydmUvIGFyZW4ndCByZWFsbHkgd2VsbC1kZWZpbmVkIGVub3VnaAo+PiB0
byBiZSBzdWl0YWJsZSBmb3IgdGhlIGtpbmQgb2YgdGhpbmdzIHdoaWNoIHJlcXVpcmUgbm8tbWFw
LCBhbmQgbXkgbmV3Cj4+IGd1ZXNzIGlzIHRoYXQgdGhhdCdzIHdoYXQgZW5kcyB1cCBjb25mbGlj
dGluZyBoZXJlLgo+IAo+IFNlZW1zIHRvIGJlIHByZXNlbnQgaW4gYm9vdGg6CgpJbmRlZWQsIGlu
IG9yZGVyIHNvIHN1cHBvcnQgYW55IGNvbWJpbmF0aW9uOgotIHVwc3RyZWFtIHUtYm9vdAotIHZl
bmRvciB1LWJvb3QKLSB1cHN0cmVhbSBsaW51eAotIG90aGVyIE9TCgpUaGUgc2VjbW9uIGlzIGlu
IHRoZSB1cHN0cmVhbSBMaW51eCBEVCwgYW5kIHVwc3RyZWFtIHUtYm9vdCByZWFkcyB0aGUgc2Vj
dXJlIG1lbW9yeSByZWdpb25zCmZyb20gdGhlIGZpcnN0IHN0YWdlIGJvb3Rsb2FkZXJzIGFuZCBh
ZGRzIHRoZW0gaW50byB0aGUgRFQgbWVtcmVzZXJ2ZS4KCkl0IHdvcmtlZCBmaW5lIHNpbmNlIExp
bnV4IDQuMTAtaXNoLCB1bnRpbCA1LjEwLgoKTmVpbAoKPiAKPiBPbiB2NS4xMi4xMAo+ICMgZmR0
ZHVtcCAvc3lzL2Zpcm13YXJlL2ZkdAo+IC4uLgo+IC9tZW1yZXNlcnZlLyAweDUwMDAwMDAgMHgz
MDAwMDA7Cj4gLi4uCj4gICAgIHJlc2VydmVkLW1lbW9yeSB7Cj4gICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwweDAwMDAwMDAyPjsKPiAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDI+
Owo+ICAgICAgICAgcmFuZ2VzOwo+ICAgICAgICAgc2VjbW9uQDUwMDAwMDAgewo+ICAgICAgICAg
ICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDUwMDAwMDAgMHgwMDAwMDAwMCAweDAwMzAwMDAwPjsK
PiAgICAgICAgICAgICBuby1tYXA7Cj4gICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDY4
PjsKPiAgICAgICAgIH07Cj4gICAgICAgICBsaW51eCxjbWEgewo+ICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPiAgICAgICAgICAgICByZXVzYWJsZTsKPiAgICAg
ICAgICAgICBzaXplID0gPDB4MDAwMDAwMDAgMHgxMDAwMDAwMD47Cj4gICAgICAgICAgICAgYWxp
Z25tZW50ID0gPDB4MDAwMDAwMDAgMHgwMDQwMDAwMD47Cj4gICAgICAgICAgICAgbGludXgsY21h
LWRlZmF1bHQ7Cj4gICAgICAgICB9Owo+ICAgICB9Owo+IAo+IC0tCj4gU3RlZmFuCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
