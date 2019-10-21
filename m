Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E81CA9EB0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 13:38:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C76C20679
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 13:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJPUZfX0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LB+tV9MY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C76C20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mH+3p1bRrCoqgxCq2Qytjq/7nYwD9Z33mAY3oNxVFNE=; b=jJPUZfX0EwXzHLlJFrcqioGXs
	5tgijqxXvpT4xZxTWiG1/eAcHiRSjAXox3EHBDpCu9whz7RtSChLaeWzDDO3FaaeAOqrm9syy4+eU
	5+Xfct1JvR9MQEmThMJSto0A5DeMadz211x+8yRXwU7GzBNlAChDyi8TSuvhdKd1idvAYV97zSrI5
	niHxtvvkI8FaVCcHcJNhrxqZotdnP7wVrF5l8o149hVOz6FxKh5xpy+KBdIzrvViHl/jlAIFOX+lK
	u/p26Q9lhc16U4DozEjrD3VMfpP/1fKe0kcJbVPEmDzyFF6s4rfCkc4qUpyXOGESHudDPegwmK6vN
	7snTT3XdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMXt0-00066T-Pf; Mon, 21 Oct 2019 13:38:14 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMXsp-0005ut-NU; Mon, 21 Oct 2019 13:38:05 +0000
Received: by mail-pf1-x443.google.com with SMTP id y72so8442615pfb.12;
 Mon, 21 Oct 2019 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b1PZ6SOJ7OdDQt8+lVytXILJGAVRFkgpcJ5+dAG12fw=;
 b=LB+tV9MYjiaR8vrVT25ivC09xXjhdonxNFWid2hDBLzWPHw3/GK/90NtR4BjlhHJxx
 DGa7cp7EM16xC3BDXNfXntsX2rMAAGvvjN3/e+U83apLVZDuDF/OzNXLLdaZoyehtx3H
 ckLQZbuyW37o5YO58jyRWIiQxLr6gil8Ea/E5NjS/W+SxICC2p7Mk+sVhzSdTyvM1h1y
 zTP9SxbdSvdtjwVAF1Yo+4wrGLf4j0bImlu1nLV6MxrJPuTYkRV9xrQUMnfmg6SW5W+Q
 Ajm+6jkPOjljf1SybFLdxWn1S7hzIzXMO0dWanbUnst1OAvPkRkIFdupDgeEm0ZhZ7TQ
 2OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b1PZ6SOJ7OdDQt8+lVytXILJGAVRFkgpcJ5+dAG12fw=;
 b=XVwZ1MWZmm1zy4bsCOsvDmHWp+ve/K0Xn4Lhuza6imP0dHw6QYo51IT+AQjSpdklTE
 tQTPisyLuVObUQlaZLw3/nzKAUslHv5U8HPi2T7WKtS5A37E8qCwL2VBkwAhYOuExAz/
 zZxq/UTrAWOysQpWjW1xho2qd+6VibaSpziQzsmB1DYOQ/f5m09p1Wh+2SQSn/KdWDKr
 bxalO13NpWeVTVOUBCtRsJYDQa9CVfwGanqi25nIHFF+9f4y7xWUQKP+kgpTs1YJ2fRt
 EL+J0Yq8h+m+axFvJPdboshJ5P3A5U3E1A85Xl32anYDDBG4jNV3/EISp1OftD4a8j3/
 gVkg==
X-Gm-Message-State: APjAAAVCJCdf/w9DLHF2u5PEhHjle9BOxLomGnEpP0swP0fAC7+W5MNV
 caC3cJ4GALXbOPyG1s7hXHU=
X-Google-Smtp-Source: APXvYqx6UmiUNJ8OsgobEge2zBLNBqpn+JDBOATMHXfa+4BF+S0SfCYz4R9XSX0QOoH8TvkXgpov4w==
X-Received: by 2002:a17:90a:8048:: with SMTP id
 e8mr30110326pjw.0.1571665083089; 
 Mon, 21 Oct 2019 06:38:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m12sm5595043pjk.13.2019.10.21.06.38.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 06:38:01 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] watchdog: add meson secure watchdog driver
To: Xingyu Chen <xingyu.chen@amlogic.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com>
 <1571387622-35132-4-git-send-email-xingyu.chen@amlogic.com>
 <7397f6db-1dc8-3abd-41ff-2e47323c7ffa@roeck-us.net>
 <bfc892af-1cd3-1437-75b2-5ba2b7913284@amlogic.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bd5ed275-4ae4-4163-b585-23fbead9833f@roeck-us.net>
Date: Mon, 21 Oct 2019 06:38:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bfc892af-1cd3-1437-75b2-5ba2b7913284@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_063803_762722_FDDC8A5F 
X-CRM114-Status: GOOD (  21.41  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, linux-watchdog@vger.kernel.org,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTAvMjEvMTkgMTowMyBBTSwgWGluZ3l1IENoZW4gd3JvdGU6Cj4gSGksIEd1ZW50ZXIKPiAK
PiBPbiAyMDE5LzEwLzIxIDA6NTYsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+IE9uIDEwLzE4LzE5
IDE6MzMgQU0sIFhpbmd5dSBDaGVuIHdyb3RlOgo+Pj4gVGhlIHdhdGNoZG9nIGNvbnRyb2xsZXIg
b24gdGhlIE1lc29uLUEvQyBzZXJpZXMgU29DcyBpcyBtb3ZlZCB0byBzZWN1cmUKPj4+IHdvcmxk
LCB3YXRjaGRvZyBvcGVyYXRpb24gbmVlZHMgdG8gYmUgZG9uZSBpbiBzZWN1cmUgRUwzIG1vZGUg
dmlhIEFURiwKPj4+IE5vbi1zZWN1cmUgd29ybGQgY2FuIGNhbGwgU01DIGluc3RydWN0aW9uIHRv
IHRyYXAgdG8gQUZUIGZvciB3YXRjaGRvZwo+Pj4gb3BlcmF0aW9uLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFhpbmd5dSBDaGVuIDx4aW5neXUuY2hlbkBhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4g
wqAgZHJpdmVycy93YXRjaGRvZy9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTcgKysrKwo+
Pj4gwqAgZHJpdmVycy93YXRjaGRvZy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+
Pj4gwqAgZHJpdmVycy93YXRjaGRvZy9tZXNvbl9zZWNfd2R0LmMgfCAxODcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDIwNSBp
bnNlcnRpb25zKCspCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy93YXRjaGRvZy9t
ZXNvbl9zZWNfd2R0LmMKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9LY29u
ZmlnIGIvZHJpdmVycy93YXRjaGRvZy9LY29uZmlnCj4+PiBpbmRleCA1OGU3YzEwLi5lODRiZTQy
IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9LY29uZmlnCj4+PiArKysgYi9kcml2
ZXJzL3dhdGNoZG9nL0tjb25maWcKPj4+IEBAIC04MjYsNiArODI2LDIzIEBAIGNvbmZpZyBNRVNP
Tl9HWEJCX1dBVENIRE9HCj4+PiDCoMKgwqDCoMKgwqDCoCBUbyBjb21waWxlIHRoaXMgZHJpdmVy
IGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUKPj4+IMKgwqDCoMKgwqDCoMKgIG1vZHVs
ZSB3aWxsIGJlIGNhbGxlZCBtZXNvbl9neGJiX3dkdC4KPj4+ICtjb25maWcgTUVTT05fU0VDX1dB
VENIRE9HCj4+PiArwqDCoMKgIHRyaXN0YXRlICJBbWxvZ2ljIE1lc29uIFNlY3VyZSB3YXRjaGRv
ZyBzdXBwb3J0Igo+Pj4gK8KgwqDCoCBkZXBlbmRzIG9uIE1FU09OX1NNCj4+PiArwqDCoMKgIGRl
cGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01QSUxFX1RFU1QKPj4KPj4gVGhpcyBkZXBlbmRlbmN5
IGlzIHBvaW50bGVzcy4gTUVTT05fU00gYWxyZWFkeSBkZXBlbmRzIG9uIEFSQ0hfTUVTT04sCj4+
IHRodXMgc3BlY2lmeWluZyAiQ09NUElMRV9URVNUIiBoZXJlIGFkZHMgbm8gdmFsdWUgYnV0IG9u
bHkKPj4gY3JlYXRlcyBjb25mdXNpb24uCj4gVGhhbmtzIGZvciB5b3VyIGFuYWx5c2lzLCBwZXJo
YXBzIGkgc2hvdWxkIHJlbW92ZSB0aGUgbGluZSBiZWxvdy4KPiAtIGRlcGVuZHMgb24gQVJDSF9N
RVNPTiB8fCBDT01QSUxFX1RFU1QKPiAKPiBJcyBpdCBvayB0byBtb2RpZnkgY29kZSBhYm92ZSBs
aWtlIHRoaXMgPwoKWWVzLgpbIC4uLiBdCgo+Pj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgbWVzb25f
c2VjX3dkdF9nZXRfdGltZWxlZnQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2R0X2RldikKPj4+
ICt7Cj4+PiArwqDCoMKgIGludCByZXQ7Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCB0aW1lbGVm
dDsKPj4+ICvCoMKgwqAgc3RydWN0IG1lc29uX3NlY193ZHQgKmRhdGEgPSB3YXRjaGRvZ19nZXRf
ZHJ2ZGF0YSh3ZHRfZGV2KTsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0ID0gbWVzb25fc21fY2FsbChk
YXRhLT5mdywgU01fV0FUQ0hET0dfT1BTLCAmdGltZWxlZnQsCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIE1FU09OX1NJUF9XRFRfR0VUVElNRUxFRlQsIDAsIDAsIDAsIDApOwo+
Pj4gKwo+Pj4gK8KgwqDCoCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7
Cj4+Cj4+IE1laCwgdGhhdCBkb2Vzbid0IHdvcmsuIEkganVzdCByZWFsaXplZCB0aGF0IHRoZSBy
ZXR1cm4gdHlwZSBpcyB1bnNpZ25lZCwKPj4gc28gcmV0dXJuaW5nIGEgbmVnYXRpdmUgZXJyb3Ig
Y29kZSBpcyBwb2ludGxlc3MuIEd1ZXNzIHdlJ2xsIGhhdmUgdG8KPj4gbGl2ZSB3aXRoIHJldHVy
bmluZyAwIGluIHRoaXMgY2FzZSBhZnRlciBhbGwuIEkgd29uZGVyIGlmIHdlIHNob3VsZAo+PiBm
aXggdGhlIEFQSSBhbmQgcmV0dXJuIGFuIGludGVnZXIgKHdpdGggbmVnYXRpdmUgZXJyb3IgY29k
ZSksIGJ1dCB0aGF0Cj4+IGlzIGEgZGlmZmVyZW50IHF1ZXN0aW9uLgo+IFRoYW5rcyBmb3IgeW91
ciByZXZpZXcuCj4gCj4gSU1PLCBpZiByZXR1cm5pbmcgYW4gaW50ZWdlciwgYW5kIHRoZSB2YWx1
ZSB3aGljaCBjb3B5IHRvIHVzZXIgYnVmIHNob3VsZCBiZSBmb3JtYXR0ZWQgd2l0aCAlZCBpbnN0
ZWFkIG9mICV1IChzZWUgdGltZWxlZnRfc2hvdyksIGl0IHdpbGwgY2F1c2UgdGhlIG1heCB2YWx1
ZSBvZiB0aW1lbGVmdCBpcyByZWR1Y2VkIGZyb20gNDI5NDk2NzI5NSB0byAyMTQ3NDgzNjQ3LiBi
dXQgaSdhbSBub3Qgc3VyZSB3aGV0aGVyIGl0IHdpbGwgYnJpbmcgcmlzay4KCk5vdCB0aGF0IGl0
IG1hdHRlcnMgcmlnaHQgbm93LCBidXQgSSBkb24ndCB0aGluayB0aGF0IGxpbWl0aW5nICd0aW1l
bGVmdCcKcmVwb3J0aW5nIHRvIDIxNDc0ODM2NDcgc2Vjb25kcywgb3IgfjY4IHllYXJzLCB3b3Vs
ZCBjYXVzZSBhbnkgcmlzay4KSXQgd291bGQganVzdCBiZSBhIGxhcmdlIHBhdGNoIGNoYW5naW5n
IHNldmVyYWwgZHJpdmVycyBhbGwgYXQgb25jZSwKdGhhdCBpcyBhbGwuCgo+IAo+IFNvIGkgYWxz
byB0aGluayByZXR1cm5pbmcgMCBtYXkgYmUgYmV0dGVyIGluIHRoaXMgY2FzZS4KClllcywgcGxl
YXNlIGRvIHRoYXQuCgpUaGFua3MsCkd1ZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
