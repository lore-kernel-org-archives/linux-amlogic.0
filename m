Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919DEEA719A
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2026 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5HoPEpS8RAXk4JpG54rjEsETlNgzBbbJxH8WDKubHk=; b=u7DTFLIyuveQ/BTgCosrRx9sip
	GAj4YomizAC9vlR2Y4Ad0cyywLWx3dd6KLpc2u47qynjB6EPpxIZ4kuLWGCqZJNAV5OtkEAN3Q5zI
	l5TNTMDa7hRZ2fojYpRUngAC3vlja5Lmvapo22a3bTF5vSSpNT3Kq2dT5Fc/dyAlWih4YTYn3mvyp
	fdg+7xxlfXN+ju+MCisGkEOZ9+SxeD0UyGLztGlI8dW+8fXWysxS2N3yJ2ojUIL+9piaFZ+Z79Cx4
	jcIw6gvL1F+f/Rq8UuXgLBArVzKTG5nCHOmvFtXJtX2lRiZwc9w9Fma+7PhqHA3chmAo02KeBbr1e
	6kR26BOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEULV-00000005tyh-2fwu;
	Sun, 19 Apr 2026 15:46:05 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEULT-00000005tyM-057K
	for linux-amlogic@lists.infradead.org;
	Sun, 19 Apr 2026 15:46:04 +0000
Date: Sun, 19 Apr 2026 15:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776613559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLT2eB/INmsUfan5ZJAA2c3NcOmLZcowwg74jDCzZuo=;
	b=j2Zw050Wogbc2NCupEep4CzUQsU7sA3tgzIJaluoWghjIvUaL0f7VP2OZgBqANVGKwEX+W
	G/Azd3ri6eq84cN/+3ERkL3ueNR5HbXYh4JG3LZCWrtSV2HI+suUWTassAM20Psu757NTv
	IzHmQCw1pzmfmWBameM/c69i4bkt5/NJq0QN0D4Lp/A4yE6/KkOEfxWtLtbUjg3XHvhH/c
	iHIsiKEIjwRjVWHIk8xO3VtPfOqFXH16NqXuSDJ5BIzdr3cLEFVxyxpArtbrwM+HLQaEIC
	mGNo/PUbm0Ztu2c4uF24lNy4HHVlAr6afGwLLP/OMNop4LnSkkoG34OX4daGWQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH] arm64: dts: amlogic: add support for Amedia X98Q
References: <20260419150855.121136-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260419150855.121136-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdqzsc.3ut55yjhut283@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_084603_275658_4005126B 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAxOSBBcHIgMjAyNiAxNTowOCwgY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50
LnVpYmsuYWMuYXQgd3JvdGU6Cj5Gcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwg
PGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0Pgo+Cj5UaGUgWDk4USBp
cyBhIFRWIGJveCBiYXNlZCBvbiB0aGUgQW1sb2dpYyBTNCAoUzkwNVcyKSBTb0MuCj5BZGQgdGhl
IGRldmljZSB0cmVlIGZvciB0aGlzIGJvYXJkIGFuZCBkb2N1bWVudCB0aGUgY29tcGF0aWJsZSBz
dHJpbmcuCj4KPlN1cHBvcnRlZCBmZWF0dXJlczoKPi0gMUdCLzJHQiBSQU0gKHZpYSBVLUJvb3Qg
bWVtb3J5IGZpeHVwKQo+LSAxMC8xMDAgRXRoZXJuZXQgKEludGVybmFsIFBIWSkKPi0gZU1NQyBh
bmQgU0QgY2FyZCBzdG9yYWdlCj4tIFBXTS1iYXNlZCBDUFUgdm9sdGFnZSByZWd1bGF0aW9uCj4t
IFVBUlQgKFNlcmlhbCBjb25zb2xlKQo+Cj5TaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3RlZmFu
IEvDtnbDqXItRHJheGwgPGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0
Pgo+LS0tCj4tIFRoZSBXaS1GaSBjaGlwIG9uIHRoaXMgYm9hcmQgaXMgQW1sb2dpYyBXMTUwUzEu
IEkgaGF2ZSBsZWZ0IHRoZSBTRElPIG5vZGUgZW5hYmxlZAo+ICBidXQgb21pdHRlZCB0aGUgc3Bl
Y2lmaWMgY2hpcCBzdWItbm9kZSBkdWUgdG8gbGFjayBvZiBtYWlubGluZSBkcml2ZXJzICh5ZXQp
Lgo+LSBUaGUgY29uc29sZSB1c2VzIHVhcnRfYiBhdCA5MjE2MDAgYmF1ZC4KPi0gVmVyaWZpZWQg
bWVtb3J5IHZpYSAvcHJvYy9kZXZpY2UtdHJlZTsgVS1Cb290IHBhdGNoZXMgdGhlIG5vZGUgdG8g
YXJvdW5kIDJHQiBpZiBib2FyZCBzdXBwb3J0cyBtb3JlIHRoYW4gMUdCLgo+LSBUZXN0ZWQgb24g
dGhlIDJHQiBSQU0gcGx1cyAxNkdCIEVNTUMgdmFyaWFudC4KPgoKQWxzbywgSSBqdXN0IG5vdGlj
ZWQgbm93LCBidXQgeW91IHNlZW0gdG8gYmUgbWlzc2luZyBhIGxvdCBvZiBwZW9wbGUgaW4KeW91
ciBUby9DYy4gWW91IHNob3VsZCB1c2UgZ2V0X21haW50YWluZXIucGwgdG8gZ2V0IHRoZSBsaXN0
IG9mCnRoZSBwZW9wbGUgeW91IHNob3VsZCBzZW5kIHlvdXIgcGF0Y2ggdG8uCgooeW91IGNhbiBh
bHNvIHVzZSBiNCAodjAuMTQgaXMgd2hhdCBJIHVzZSkgdG8gbWFrZSBzZW5kaW5nIHBhdGNoZXMK
cHJvcGVybHkgbXVjaCBlYXNpZXIpCgotLQpCZXN0IHJlZ2FyZHMsCkZlcmFzcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
