Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD77FC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:53:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CAE620758
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PMr0nNpA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1nnog1OL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CAE620758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IGwMvEem1Kv+G1Meecgb0prLa2SL56FnSgFCAA5Mr9U=; b=PMr0nNpAW9YhfUWDO3CYyq7P2
	f86faBPZumhw7/wXMnh5HEcEQm20/HlfEVSvuZmusw0hXYxyYwFogXFbiBdp/QSktmraXL8/Bm8eK
	/kSYvGZPk7ZStMKiy7xK9yYxJW7KS+Q/8JxChE59n0UMdloEZNvYvQb6N7DoAAf7I7MUT5GrPWCxx
	XROzv9KPrBHBclHdiw1hrbwIvWTP0DyWs8ovgFir3RUj1mBwG2tYDarR5rBiV116YXTkceoLw4dy1
	2RLNHJM8xLTMk2O7OUgr6V4gjs42yEITe+iXqHAJ22zEBQXUVBo7/g7MsxLPno88Tr1sAFsAIZf7S
	ZxYDhavhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQBc-0005Rp-Sv; Fri, 02 Oct 2020 18:53:44 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQBY-0005QF-PZ
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 18:53:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id v12so2750582wmh.3
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 11:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Bi95YrOflmCtEoOhXnI8Z0xAJsTGAyx0xGj5b0E1L7c=;
 b=1nnog1OLxCpMXXuFlADcmPeGCJ/QHqFKFhIq/t1rQCNKzrYh0yiQ+GhfU//AXbXxHb
 3VgjX6NMdoQzb8Na0u6NhDoyTb2BdPEiDOij0AfnfPhoAZe5gaptQCFSNfXGFxVLVs07
 pTt8CUSgDV+I6u+qmcG0diLv+89NPRJRRl3rkGB1MA15VKboQ57gMjk3AUoNLEQjFWWb
 ej56NX3cqgdzWK6FmAeA6gZT4RllxDHIgipo4z9gb3pJRxLOvtg4QBFP+9K6aV7g/s3/
 r8QIbhwmWsPv6c7qi5LH5KxWSpQjNV8kUDEDB6PsvRiUiQ7Ji22cRgSqECstvwPVdn0o
 lQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Bi95YrOflmCtEoOhXnI8Z0xAJsTGAyx0xGj5b0E1L7c=;
 b=pz+o1c5Ahl2r1xLmBsqBBQei8AnoWP/2manHQCwpWTt+kQSfBfYPParwXMgFuzxDYO
 X68JRjwlO9q9TDOCi+V0Gz1PoqUdivEFMbOhTyMMKO+Scjx499cfv8wu2kI0p7S0NQ/B
 vOhnYTuCHogCnTnvnby9E336rnG3HKPzCXyCTgxZXzN5Kf0S5FAj5MxQQSrEiE/2T03f
 mTOpvTJG8XKPVW99Lt3mYdrSnL7pJRUW63fiSi548luyR1xt4WDNtbf82/W9HFYyRsGW
 x1uYf2T69cGoNR0UhhGQUKNjX0CiSl2NW8Ik7YJvDt1AwvGbpKcPEMOQXYyhLMDaF/2y
 UJow==
X-Gm-Message-State: AOAM531xkPowqqpvfz9hoy6bI2hEwjc6nE+hxQ/Z05e4rRuYBO8UypvJ
 R0haUHSex0fFKYpQCWtirc394Q==
X-Google-Smtp-Source: ABdhPJz1DJ7fedQ9xXPzzG6tOyY3pmkIAuRiazX88TRgzwY0ixzeUtcdm58X+KNyh1+Vgx6cQzHjxQ==
X-Received: by 2002:a1c:750d:: with SMTP id o13mr4568217wmc.54.1601664819623; 
 Fri, 02 Oct 2020 11:53:39 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id c14sm2610530wrv.12.2020.10.02.11.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:53:39 -0700 (PDT)
References: <20201002141619.14387-1-christianshewitt@gmail.com>
 <1jzh54it6f.fsf@starbuckisacylon.baylibre.com>
 <785296E3-FA91-4F5E-A8C0-1FAA8C576A17@gmail.com>
 <7h7ds8mppz.fsf@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: add SM1 soundcard name to VIM3L
In-reply-to: <7h7ds8mppz.fsf@baylibre.com>
Date: Fri, 02 Oct 2020 20:53:37 +0200
Message-ID: <1jmu14qx1q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_145340_872411_68D38371 
X-CRM114-Status: GOOD (  21.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIEZyaSAwMiBPY3QgMjAyMCBhdCAyMDo0NSwgS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxp
YnJlLmNvbT4gd3JvdGU6Cgo+IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21h
aWwuY29tPiB3cml0ZXM6Cj4KPj4+IE9uIDIgT2N0IDIwMjAsIGF0IDY6NDQgcG0sIEplcm9tZSBC
cnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKPj4+IAo+Pj4gT24gRnJpIDAyIE9j
dCAyMDIwIGF0IDE2OjE2LCBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWls
LmNvbT4gd3JvdGU6Cj4+PiAKPj4+PiBWSU0zTCBub3cgaW5oZXJpdHMgdGhlIHNvdW5kIG5vZGUg
ZnJvbSB0aGUgVklNMyBjb21tb24gZHRzaSBidXQgaXMKPj4+PiBhbiBTTTEgZGV2aWNlLCBzbyBs
YWJlbCBpdCBhcyBzdWNoLCBhbmQgc3RvcCB1c2VycyBibGFtaW5nIGZ1dHVyZQo+Pj4+IHN1cHBv
cnQgaXNzdWVzIG9uIHRoZSBkaXN0cm8vYXBwICJ3cm9uZ2x5IGRldGVjdGluZyIgdGhlaXIgZGV2
aWNlLgo+Pj4+IAo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlh
bnNoZXdpdHRAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9tZXNvbi1zbTEta2hhZGFzLXZpbTNsLmR0cyB8IDQgKysrKwo+Pj4+IDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPj4+PiAKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzIGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzCj4+Pj4gaW5kZXggNGI1
MTdjYTcyMDU5Li5mNDZmMGVjYzM3ZWMgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzCj4+Pj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1raGFkYXMtdmltM2wuZHRzCj4+Pj4gQEAg
LTMyLDYgKzMyLDEwIEBACj4+Pj4gCQlyZWd1bGF0b3ItYm9vdC1vbjsKPj4+PiAJCXJlZ3VsYXRv
ci1hbHdheXMtb247Cj4+Pj4gCX07Cj4+Pj4gKwo+Pj4+ICsJc291bmQgewo+Pj4+ICsJCW1vZGVs
ID0gIlNNMS1LSEFEQVMtVklNM0wiOwo+Pj4+ICsJfTsKPj4+IAo+Pj4gVGhlIHNvdW5kIGNhcmQg
aXMgdGhlIHNhbWUgc28gSSBkb24ndCBzZWUgd2h5IHRoZSBzbTEgYm9hcmQgc2hvdWxkIGhhdmUK
Pj4+IGEgZGlmZmVyZW50IG5hbWUuIElmIHlvdSBhcmUgbm90IGhhcHB5IHdpdGggdGhlIG5hbWUs
IHBsZWFzZSB1cGRhdGUgaXQKPj4+IGluIHRoZSBjb21tb24gZmlsZS4KPj4KPj4gSXTigJlzIGEg
bmljZS10by1oYXZlIG5vdCBhIG11c3QtaGF2ZSwgYnV0IHRoZSBjdXJyZW50IExFIGltYWdlcyB0
aGF0IGFyZQo+PiBpbiBjaXJjdWxhdGlvbiB1c2UgNS43IHdpdGggdGhlIHByZXZpb3VzIGJvYXJk
LWNvcnJlY3QgbmFtZSBzbyBJIHdhcwo+PiBsb29raW5nIGZvciBjb250aW51aXR5LiBXZSBkbyBz
ZWUgdXNlciBmb3J1bSByZXBvcnRzIChpbmZyZXF1ZW50IGJ1dAo+PiByZWN1cnJpbmcpIG9mIHdy
b25nbHkgZGV0ZWN0ZWQgaGFyZHdhcmUgd2l0aCBvdGhlciBTb0MgcGxhdGZvcm1zIHdoZXJlCj4+
IHNpbWlsYXIgbmFtZSBpbmhlcml0YW5jZSBzdXJmYWNlcyB0aGUg4oCYd3JvbmfigJkgZGV2aWNl
IG5hbWUgaW4gR1VJcywgYW5kCj4+IEkgbGlrZSBhbnl0aGluZyB0aGF0IGF2b2lkcyBzdXBwb3J0
IHdvcmsuCj4+Cj4+IEnigJlkIHN1Z2dlc3QgS0hBREFTLVZJTTMtVklNM0wgYXMgYSBjb21tb24g
bmFtZSwgYnV0IHRoZW4gaXTigJlzIHRoZSBvbmx5Cj4+IGRldmljZSBpbiB0aGUgY3VycmVudCBk
ZXZpY2UtdHJlZSBzZXQgdGhhdCBpcyBub3QgcHJlZml4ZWQgd2l0aCB0aGUgU29DCj4+IGlkZW50
aWZpZXIsIHdoaWNoIChPQ0QpIGZlZWxzIHdyb25nLgo+Cj4gVHJ1ZSwgYnV0IHR1cm5zIG91dCB0
aGVyZSdzIG5vdGhpbmcgU29DIHNwZWNpZmljIGFib3V0IHRoaXMgc291bmQgYmxvY2sKPiBzaW5j
ZSBpdCdzIGlkZW50aWNhbCBhY3Jvc3MgU29Dcywgc28gc3BlY2lmeWluZyB0aGUgU29DIGlzIGJl
aW5nIHRvbwo+IHNwZWNpZmljLiAKPgo+IE9UT0gsIHdoaWxlIEkgYWdyZWUgaXQgbG9va3MgIndy
b25nIiwgaXQncyBwcmV0dHkgY29tbW9uIGluIExpbnV4IERUIHRvCj4gaGF2ZSB0aGUgU29DIHBy
ZWZpeCB0byBtZWFuIG9ubHkgdGhhdCBpdCdzICJjb21wYXRpYmxlIiB3aXRoIHRoYXQgU29DLAo+
IG5vdCB0aGF0IGl0ICppcyogdGhhdCBTb0MuCj4KPiBIb3dldmVyLCBJIGFncmVlIHRoYXQgdGhh
dCBjYW4gbGVhZCB0byBjb25mdXNpb24gd2l0aCBlbmQgdXNlcnMsIHNvCj4gc2luY2UgdGhpcyBj
aGFuZ2UgaGFzIG5vdCBmdW5jdGlvbmFsIGNoYW5nZSwgYW5kIG9ubHkgYSBVWCBpc3N1ZSBpbgo+
IHVzZXJzcGFjZSwgSSdtIGZpbmUgdG8gYXBwbHkgaXQuCgpJdCBpcyBub3QgVVggb25seS4gVGhp
cyBzdHJpbmcgaXMgdXNlZCBieSBhbHNhLXV0aWxzIHRvIG1hdGNoIHRoZQpjYXJkLiBGb3IgZXhh
bXBsZSwgdGhlIHN0cmluZyB3aWxsIGJlIG1hdGNoZWQgdG8gcmVzdG9yZSB0aGUgY29udHJvbHMK
c2V0dGluZ3Mgd2l0aCBhbHNhY3RsIG9uIGJvb3QuIFZJTTMgYW5kIFZJTTNMIGFyZSB0aGUgc2Ft
ZSBzb3VuZCBjYXJkCkFGQUlDVCwgc28gaXQgc2hvdWxkIGJlIHRoZSBzYW1lIHN0cmluZy4KCj4K
PiBLZXZpbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
