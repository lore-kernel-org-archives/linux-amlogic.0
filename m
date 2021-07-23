Return-Path: <SRS0=pDvI=MP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9343C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jul 2021 19:49:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF8F60E8F
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jul 2021 19:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BF8F60E8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwefAkShZX1VLoaJpYlmvk1pqep4OJIAMB6HyVhDUBI=; b=w6DQEzLBCKcP+E
	8qna8l2BQTf5b0HEnLDOBfP57suD2OqSS5b/aDZicFUD0CvZbTz7CjdG3OypNbqZgEw0sgV2auUbl
	jHQd7ePhEgmusW/lpeFo0grr1I9Z17RJYHFFUqxgCZDjn/hMuMi0rNY5GRvsB0tIIN0rF6+YDWyBg
	nvithnzvCdpaGBlG78gAmV+eG54sabw2c/B7dKDyckxSnNHw/eUsjWXYyd/gpUNvXpqPnijNe2/An
	Px1JAbz/Ml/vqc+ZhbNZHY37CvyvFLJEwwzVjzRPihwzu27MKo3juA/H3ggjD3DwpDwc647eMFPQQ
	7XxkLN9z5sa8lNb6aEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m71AB-005mcC-St; Fri, 23 Jul 2021 19:48:51 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m71A9-005mbb-Gg; Fri, 23 Jul 2021 19:48:51 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 1D4745C1E18;
 Fri, 23 Jul 2021 21:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1627069727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMPql+B5GblrrlNZo/9FxiJk+TdbwSV1VxZnWDkohjU=;
 b=h4QkA6lWdPxBMN9lJJ8SKKTfhSFKzQGmC1rIN49LJsx1NFUrWkm6EoslnjqoHlClrUZcul
 /EeCEx7IlArmUrROfKatpabF/QRpc5uaA4EEL2APalGN/Ps5HTChDoG8suVFcfJen7crwd
 cbAyHBS0eAimHdVvf2QxOC/kkHCZe9E=
MIME-Version: 1.0
Date: Fri, 23 Jul 2021 21:48:47 +0200
From: Stefan Agner <stefan@agner.ch>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Byron Stanoszek <gandalf@winds.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Mike Rapoport <rppt@kernel.org>
Subject: Re: Random reboots on ODROID-N2+
In-Reply-To: <0067ee4c-b9d2-1c92-2444-759ac9a56de0@arm.com>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
 <a0ef23c932d1a7412d620237d9acde0f@agner.ch>
 <alpine.LNX.2.23.451.2107221723060.2673@winds.org>
 <c2a16fbc-653f-5993-f9bb-9ee8c707515e@arm.com>
 <d1fefb1ec2e7ed1b40083426ed7102c6@agner.ch>
 <216a006d-6df0-4229-d2c1-32256853c857@arm.com>
 <0067ee4c-b9d2-1c92-2444-759ac9a56de0@arm.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <50c6925775c207d0751e20fa9d45611a@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_124849_890898_8547F86F 
X-CRM114-Status: GOOD (  13.11  )
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

T24gMjAyMS0wNy0yMyAxOTo0NywgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjEtMDctMjMg
MTc6MTQsIFJvYmluIE11cnBoeSB3cm90ZToKPj4gT24gMjAyMS0wNy0yMyAxNjo1NiwgU3RlZmFu
IEFnbmVyIHdyb3RlOgo8c25pcD4KPj4+Pgo+Pj4+IEJvb3Rpbmcgd2l0aCAiZWZpPWRlYnVnIiBz
aG91bGQgKGFtb25nIG90aGVyIHRoaW5ncykgcHJpbnQgdGhlIG1lbW9yeQo+Pj4+IG1hcCBhdCBi
b290IGlmIHlvdSB3YW50IHRvIGRvdWJsZS1jaGVjayB0aGF0IHRoYXQgaXMgdGhlIHNvdXJjZSBv
ZiB0aGUKPj4+PiBtaXNtYXRjaC4gT3VyIEVGSSBjb2RlIHNob3VsZCBiZSBwZXJmZWN0bHkgY2Fw
YWJsZSBvZiBzZXR0aW5nIHRoZQo+Pj4+IG1lbWJsb2NrIGZsYWcgaWYgdGhlIHJlZ2lvbiAqaXMq
IGRlc2NyaWJlZCBhcHByb3ByaWF0ZWx5LCBzZWUKPj4+PiByZXNlcnZlX3JlZ2lvbnMoKSBpbiBk
cml2ZXJzL2Zpcm13YXJlL2VmaS9lZmktaW5pdC5jLgo+Pj4KPj4+IEJvb3RpbmcgNS4xMi4xMCB3
aXRoICJlZmk9ZGVidWciIG9uIFUtQm9vdCAyMDIxLjA0IGdhdmUgdGhpczoKPj4+IFvCoMKgwqAg
MC4wMDAwMDBdIE1hY2hpbmUgbW9kZWw6IEhhcmRrZXJuZWwgT0RST0lELU4yUGx1cwo+Pj4gW8Kg
wqDCoCAwLjAwMDAwMF0gZWZpOiBHZXR0aW5nIFVFRkkgcGFyYW1ldGVycyBmcm9tIC9jaG9zZW4g
aW4gRFQ6Cj4+PiBbwqDCoMKgIDAuMDAwMDAwXSBlZmk6IFVFRkkgbm90IGZvdW5kLgo+Pj4gW8Kg
wqDCoCAwLjAwMDAwMF0gT0Y6IGZkdDogUmVzZXJ2ZWQgbWVtb3J5OiBmYWlsZWQgdG8gcmVzZXJ2
ZSBtZW1vcnkgZm9yCj4+PiBub2RlICdzZWNtb25ANTAwMDAwMCc6IGJhc2UgMHgwMDAwMDAwMDA1
MDAwMDAwLCBzaXplIDMgTWlCCj4+Pgo+Pj4gU28gaXQgc2VlbXMgVUVGSSBpcyBub3QgaW4gdGhl
IHBsYXkgaGVyZT8KPj4KPj4gQWgsIE9LLCBpbiB0aGF0IGNhc2UgSSBndWVzcyB0aGUgcXVlc3Rp
b24gcmVtYWlucyB3aHkgZG9lcyBlYXJseV9pbml0X2R0X3Jlc2VydmVfbWVtb3J5X2FyY2goKSB0
aGluayB0aGUgcmVnaW9uIGlzIGFscmVhZHkgcmVzZXJ2ZWQ/IE15IGluc3RpbmN0aXZlIGFzc3Vt
cHRpb24gd2FzIGFuIEVGSSBtZW1vcnkgbWFwIGJlaW5nIHByZXNlbnQ7IHNlZWluZyB0aGF0IFUt
Qm9vdCBkb2VzIGluZGVlZCByZWZsZWN0IERUIHJlc2VydmF0aW9ucyB0aGVyZSAqYW5kKiBoYXMg
aGFkIGEgbGlrZWx5LWxvb2tpbmcgYnVnIHJlY2VudGx5IHdhcyB0aGVuIGp1c3Qgb3ZlcndoZWxt
aW5nbHkgc3VnZ2VzdGl2ZSA6KQo+IAo+IEFjdHVhbGx5LCBwb2tpbmcgYXQgVS1Cb290IGEgYml0
IG1vcmUgSSBmaW5kCj4gbWVzb25fYm9hcmRfYWRkX3Jlc2VydmVkX21lbW9yeSgpIC0gY2FuIHlv
dSBjaGVjayAvc3lzL2Zpcm13YXJlL2ZkdAo+IGFuZCBzZWUgaWYgdGhlIHJlZ2lvbiBlbmRzIHVw
IGJlaW5nIHBhc3NlZCBhcyBhIC9tZW1yZXNlcnZlLyBhcyB3ZWxsCj4gYXMgYSBwcm9wZXIgcmVz
ZXJ2ZWQtbWVtb3J5IG5vZGU/Cj4gCj4gSUlSQyB0aGUgc2VtYW50aWNzIG9mIC9tZW1yZXNlcnZl
LyBhcmVuJ3QgcmVhbGx5IHdlbGwtZGVmaW5lZCBlbm91Z2gKPiB0byBiZSBzdWl0YWJsZSBmb3Ig
dGhlIGtpbmQgb2YgdGhpbmdzIHdoaWNoIHJlcXVpcmUgbm8tbWFwLCBhbmQgbXkgbmV3Cj4gZ3Vl
c3MgaXMgdGhhdCB0aGF0J3Mgd2hhdCBlbmRzIHVwIGNvbmZsaWN0aW5nIGhlcmUuCgpTZWVtcyB0
byBiZSBwcmVzZW50IGluIGJvb3RoOgoKT24gdjUuMTIuMTAKIyBmZHRkdW1wIC9zeXMvZmlybXdh
cmUvZmR0Ci4uLgovbWVtcmVzZXJ2ZS8gMHg1MDAwMDAwIDB4MzAwMDAwOwouLi4KICAgIHJlc2Vy
dmVkLW1lbW9yeSB7CiAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMDAwMDAwMj47CiAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MHgwMDAwMDAwMj47CiAgICAgICAgcmFuZ2VzOwogICAgICAgIHNl
Y21vbkA1MDAwMDAwIHsKICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwNTAwMDAwMCAw
eDAwMDAwMDAwIDB4MDAzMDAwMDA+OwogICAgICAgICAgICBuby1tYXA7CiAgICAgICAgICAgIHBo
YW5kbGUgPSA8MHgwMDAwMDA2OD47CiAgICAgICAgfTsKICAgICAgICBsaW51eCxjbWEgewogICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7CiAgICAgICAgICAgIHJldXNh
YmxlOwogICAgICAgICAgICBzaXplID0gPDB4MDAwMDAwMDAgMHgxMDAwMDAwMD47CiAgICAgICAg
ICAgIGFsaWdubWVudCA9IDwweDAwMDAwMDAwIDB4MDA0MDAwMDA+OwogICAgICAgICAgICBsaW51
eCxjbWEtZGVmYXVsdDsKICAgICAgICB9OwogICAgfTsKCi0tClN0ZWZhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
