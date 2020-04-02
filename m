Return-Path: <SRS0=4XKY=5S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6DEC43331
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Apr 2020 15:36:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE252206F6
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Apr 2020 15:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dcq/3xvW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hIzMlAza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE252206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GsnQMijvQNvQfvUMYyKc4H5xSwtBmhTC0nhxri3yuY=; b=Dcq/3xvWGT/K42
	jKvSUj5YOg95n489V8fk84rpcfmUsy2gZuziqFRUmTjNBS/cekE5yUoJBZr2uVH5W1SrAkr9EWEVR
	Ma3K/nznP4mJJl2rNVs6pYMIe+uTRtl1xB3kL2Ix/ZVOT0fZ4XqCTM0SBvOpaeStH2YfWYwdDiUpP
	cW0sGD3xsEPWWmI6mRygwvx4AkFryerrNk8bjmnaou96XfUwpBcALVD38c6k2lsF2sBt5eS8RlDAO
	h+p6+Sebv65LrhyLAk3h5ZONolQ/plIw4u+bSgLFP74NLoefw8lpUpgrLmhznPSIJOQ/+Wkk3ZUzR
	igYuvAy4nZoBDxEIGCNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK1sl-0000LS-8r; Thu, 02 Apr 2020 15:35:51 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK1sh-0008V0-4b
 for linux-amlogic@lists.infradead.org; Thu, 02 Apr 2020 15:35:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id h9so4745198wrc.8
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Apr 2020 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n0G8PgKT6N4LycPsn3YPbg8CmY7AYCMmAC0zQVOGL0M=;
 b=hIzMlAzaySo3rTxfU67BAMFqDRt8Q6tAsfuKShRe0AA1rwasEPYNcL+NCR+UYLfLCn
 dhAv7a9Q56lSxPJLPSCHKICJJUPPqnlrxuYNZjgl7hOAsqhFnEsxNFT146zv5euKKcCO
 ySZ9Rsl+5MkjTLJto8AnE0NrTgRG1uuzufERGffV/1FnFG8ALwCQimgaNuZHaCQiG2Ky
 q8TwXSQIr6k1zeZrUsP0u4vBXk71ONKKciGQtnO5+Ud3JU6IBcCUGGi54qH/bA1hMxbW
 uCKvDVwSEgRfZBze2NLpE/Z+krqKCWhN3yBNhfDNG5AXLny4k9NfHL5yx3qeMOPZKkql
 QMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=n0G8PgKT6N4LycPsn3YPbg8CmY7AYCMmAC0zQVOGL0M=;
 b=BsKUDBTvMZ19r1XQFy80JuXdaP4Hr3vLm9sNcFsYoyF1/4DFTNDrIDVd64dFSIJ/T3
 c5pCpngkspBfWhyT92qjVv2+JVBkcmXh/CUhlLBu54QjlAKmI2gqujpbb0wJPWmDZoBK
 44rh9bx7U3kJeH0O5vUi2nT86TyncLJnmD9GAqpyJQjhRbX2Nzb4lI6OJmiXMHFToati
 DGWrOFz7pRlksi741VaCzmn9QbOHiaeK0oOaAdtR6qmyyaKurt1GLgKaK2fTbjJJN8YS
 zUlSb0+A9t4NHAl2VbKudYLhUpR55R7ljJiXtz3XK3e9wMPEmdV0bCx6DrKuMrsWaI8K
 k9Fw==
X-Gm-Message-State: AGi0PuYBb11O0T6d5+8OSdMNFJIZr7f8R3FYFJG0ALTCPjjzYOBDaTwU
 2bW+4M9+aHCFLz6o1ULmTvKFbw==
X-Google-Smtp-Source: APiQypJ1XGUq/Qik2b9mDHCOvXzdSe550uTteLiXSgdV9eZoITWe9rl43BG//I3FD2EzT9gwi6PZlA==
X-Received: by 2002:adf:bb06:: with SMTP id r6mr4194796wrg.324.1585841744387; 
 Thu, 02 Apr 2020 08:35:44 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2?
 ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id c18sm7853918wrx.5.2020.04.02.08.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 08:35:43 -0700 (PDT)
Subject: Re: [PATCH] crypto:amlogic - use platform_get_irq_optional()
To: "tangbin@cmss.chinamobile.com" <tangbin@cmss.chinamobile.com>,
 clabbe <clabbe@baylibre.com>, herbert <herbert@gondor.apana.org.au>,
 davem <davem@davemloft.net>
References: <20200402113344.16772-1-tangbin@cmss.chinamobile.com>
 <c43b85f8-2bc9-7b19-6b86-953246c88d2c@baylibre.com>
 <202004022329105659148@cmss.chinamobile.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <f4cb309e-a873-5529-5be2-6992f7d89a96@baylibre.com>
Date: Thu, 2 Apr 2020 17:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <202004022329105659148@cmss.chinamobile.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_083547_246010_A3BED57C 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksDQoNCk9uIDAyLzA0LzIwMjAgMTc6MjksIHRhbmdiaW5AY21zcy5jaGluYW1vYmlsZS5jb20g
d3JvdGU6DQo+IERlYXIgTmVpbO+8mg0KPiDCoCDCoCDCoCDCoCBUaGFuayB5b3UgZm9yIHlvdXIg
cmVwbGF577yMbWF5YmUgbXkgZGVzY3JpcHRpb24gaXMgbm90IHNvIGNsZWFy44CCV2hhdCBJIHdh
bnQgdG8gc2F5IGlz77yaSW4gdGhpcyBwbGFjZSwgd2hlbiBzb21ldGhpbmcgZ29lcyB3cm9uZywg
cGxhdGZvcm1fZ2V0X2lycSgpIHdpbGwgcHJpbnQgYW4gZXJyb3IgbWVzc2FnZSwgYW5kIHRoaXMg
ZnVuY3Rpb24gd2lsbCBwcmludCBib3Ro77yMc28gaWYgd2Ugd2FudCB0byBhdm9pZCB0aGUgc2l0
dWF0aW9uIG9mIHJlcGVhdCBvdXRwdXTvvIx3ZSBjYW4gcmVtb3ZlIGRldl9lcnIoKSBoZXJlIG9y
IHVzZSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgwqBpbnN0ZWFkIG9mIHBsYXRmb3JtX2dl
dF9pcnEoKeOAglRoYW5rIHlvdSB2ZXJ5IG11Y2jjgIINCg0KUGxlYXNlIGRvIG5vdCB0b3AtcG9z
dC4NCg0KU2luY2UgdGhlIGlycSBpcyBub3Qgb3B0aW9uYWwsIHJlbW92aW5nIHRoZSBkZXZfZXJy
KCkgaXMgdGhlIHJpZ2h0IHdheSB0byBnby4NCg0KTmVpbA0KDQo+IA0KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gDQo+ICAgICDCoA0KPiAgICAgKkZyb206KsKgTmVpbCBBcm1zdHJvbmcgPG1h
aWx0bzpuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4NCj4gICAgICpEYXRlOirCoDIwMjAtMDQtMDLC
oDIxOjI2DQo+ICAgICAqVG86KsKgVGFuZyBCaW4gPG1haWx0bzp0YW5nYmluQGNtc3MuY2hpbmFt
b2JpbGUuY29tPjsgY2xhYmJlIDxtYWlsdG86Y2xhYmJlQGJheWxpYnJlLmNvbT47IGhlcmJlcnQg
PG1haWx0bzpoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+OyBkYXZlbSA8bWFpbHRvOmRhdmVt
QGRhdmVtbG9mdC5uZXQ+DQo+ICAgICAqQ0M6KsKgbGludXgtYW1sb2dpYyA8bWFpbHRvOmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWNyeXB0byA8bWFpbHRvOmxpbnV4
LWNyeXB0b0B2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1rZXJuZWwgPG1haWx0bzpsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPg0KPiAgICAgKlN1YmplY3Q6KsKgUmU6IFtQQVRDSF0gY3J5cHRv
OmFtbG9naWMgLSB1c2UgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpDQo+ICAgICBIaSwNCj4g
ICAgIMKgDQo+ICAgICBPbiAwMi8wNC8yMDIwIDEzOjMzLCBUYW5nIEJpbiB3cm90ZToNCj4gICAg
ID4gSW4gb3JkZXIgdG8gc2ltcGx5IGNvZGUsYmVjYXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxy
ZWFkeSBoYXMNCj4gICAgID4gZGV2X2VycigpIG1lc3NhZ2UuDQo+ICAgICA+DQo+ICAgICA+IFNp
Z25lZC1vZmYtYnk6IFRhbmcgQmluIDx0YW5nYmluQGNtc3MuY2hpbmFtb2JpbGUuY29tPg0KPiAg
ICAgPiAtLS0NCj4gICAgID7CoCBkcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNv
cmUuYyB8IDIgKy0NCj4gICAgID7CoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gICAgID4NCj4gICAgID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRv
L2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jIGIvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxv
Z2ljLWd4bC1jb3JlLmMNCj4gICAgID4gaW5kZXggOWQ0ZWFkMmY3Li4zNzkwMWJkODEgMTAwNjQ0
DQo+ICAgICA+IC0tLSBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5j
DQo+ICAgICA+ICsrKyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5j
DQo+ICAgICA+IEBAIC0yNTIsNyArMjUyLDcgQEAgc3RhdGljIGludCBtZXNvbl9jcnlwdG9fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgID7CoA0KPiAgICAgPsKgIG1j
LT5pcnFzID0gZGV2bV9rY2FsbG9jKG1jLT5kZXYsIE1BWEZMT1csIHNpemVvZihpbnQpLCBHRlBf
S0VSTkVMKTsNCj4gICAgID7CoCBmb3IgKGkgPSAwOyBpIDwgTUFYRkxPVzsgaSsrKSB7DQo+ICAg
ICA+IC0gbWMtPmlycXNbaV0gPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIGkpOw0KPiAgICAgPiAr
IG1jLT5pcnFzW2ldID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbChwZGV2LCBpKTsNCj4gICAg
ID7CoCBpZiAobWMtPmlycXNbaV0gPCAwKSB7DQo+ICAgICA+wqAgZGV2X2VycihtYy0+ZGV2LCAi
Q2Fubm90IGdldCBJUlEgZm9yIGZsb3cgJWRcbiIsIGkpOw0KPiAgICAgPsKgIHJldHVybiBtYy0+
aXJxc1tpXTsNCj4gICAgID4NCj4gICAgIMKgDQo+ICAgICBOQUNLLCB0aGUgaXJxIGlzIG5vdCBv
cHRpb25hbCwgSSBkb24ndCBzZWUgd2h5IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKSBzaG91
bGQgYmUgdXNlZCBoZXJlDQo+ICAgICBhbmQgaG93IGl0IGNvdWxkICJzaW1wbHkgY29kZSIuDQo+
ICAgICDCoA0KPiAgICAgTmVpbA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
