Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABEDC3ABC3
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lr3A5A2BxdRLO1FH10g32jN25ZHUgswoineB9AhS81Q=; b=ke96dvxpMdq7Ml
	YY6sCXX6k2f6C/gYryW3qA28WsnBCUGrhMsOsSWGk0Dr9hXDgBvSWCqvX3gKd5sNz6uQQSHKGpMVk
	SpP0jE4YVT9sRyo/Txyc74UkdKswT/aq0SXhvVeFgGAHeHVQrDmlU065MX0/8SWCd8h8EpJKuwElb
	n+9KPCCrndEAEF7dbme/HIGi3QQKrowfp7dNYfXg/ch1fkVZHkeaT8s07PZAk2XbHpyAbEEvHJVMQ
	e38KqJLlQibfI+KMf/LoOrqdlcUu3RIMy3F/gSqX9Hdv9mEbSoCXW8mrOph/0I4uTBYHkyzmsGPSN
	kkLrYJveMfF7P5F4NeWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRN2-00000004Pyp-2KeN;
	Fri, 09 May 2025 17:18:48 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPEC-0000000412h-0MJm
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 15:01:33 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ace3b03c043so355338566b.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chewies-net.20230601.gappssmtp.com; s=20230601; t=1746802890; x=1747407690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBgL3ZL550pwHUyGu0636IzKUM8jYg6oWWIjwlwmye0=;
        b=Flu/k32eibot45mVbnb5781S9XolH8j9uVCPhgvKgiU2BQB1k2oXMuKf9WK5l8DTgD
         5jvuJhIhm+nQtJzf50YAo9Tq//BpFwQ+LRSLMb9regN2rvFLOZ8ykGLxKvBghjKyfn1t
         SBqR5LR4BGY6e4L4Oo+SS9Cl5pzvSZGkdLX6ZfGNZR9tY15fZImti2NQThlBIJI8NS9h
         ufahxQ6R0+wtHr0beo03U2ccKqmPqowkC+H4lv/PAi4H05gO6k4oPxCVdHC8huTCPSe+
         Y90iUraas2v+/Wj/HVvoLcA9+EZ3+8PxqlROHMwbzHvWPuXmvPVSiMpnafdtKKhrmMJt
         q0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802890; x=1747407690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBgL3ZL550pwHUyGu0636IzKUM8jYg6oWWIjwlwmye0=;
        b=okzj23y6qCMfAM+x2U5Qr436xgYrHSudWNsRF3TMG4wErj79xrAAnNW5B6hhDrqr02
         2Qo7/zc22NCcRW+5UFava/I2TQ+8n8HVF67nfHaF1uVZgnIoRIjcLrsxvPDj/sLmtrRK
         w8p9PInQoeSYjw119/44LAIWy5dL5Df28pM1lzg73B/UVa8MNUCisaH8OMTm5LFf4sP6
         b/9xlBZ+2itL0TYEZp8SA8+H0e7o/RXGdLxZEAdBsIsKaMEHOe9o0MX5pRjUtz45uS5u
         G3Q86VFfU71JYfHoSuglwL5v4N7a2Yzc50/8X0H8VzygR3NG08+XpTSPDovALBwpW2h5
         73vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3kdEqmeTN6jFMEcqW1gKcV2gaXymfYOKcXUwEuFQ1s2oWiiDaalVxeJIJbiSv1TPfqBMKwykohfzBBsvl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo1V4oN3pdG1mZ7/yw6FZ6dXUs/QcNvPk+iyeNiuLWj4d5D/25
	eX4pnJDn9dGqOIaAay9Y9XL2PSi+9VLx2BScPVMlr/SliF4u5Yx6JOyObCyl9hAW1Ist+AVPMoo
	Gn9vmbDvijBq5zGdy6dyb3oLRfVx92j8G1zpg
X-Gm-Gg: ASbGnctAOlBGS8bvoHKp3/DNlgPcvrsHjSyzmUNZknv/ERPpiZaqHRGH4I6S4prIRFL
	inO5mQBL0ZNFxHtsJRA+toswQsio3sE8b4njSOvgyUWbm7gZ/XaeviFnsYPxTi/NP1uauYvORpr
	FrHzIceL3Ppm/CSBqZBQsO
X-Google-Smtp-Source: AGHT+IFf+nVAgdwIKvhp6FKx94q2YT6+sEg9xhUFkBICZbH6CrypO4w3U2C9D+gFHigfCbHoi7dvxkUDtWZbD7xfAIc=
X-Received: by 2002:a17:907:a2cd:b0:ace:caff:675a with SMTP id
 a640c23a62f3a-ad218e47c9bmr306712966b.10.1746802889091; Fri, 09 May 2025
 08:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org> <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
 <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org> <CAEUiLuYW61Vz4zAie2K9cnXXQxxRj150Nc-fJMQCh9NwXZQmzQ@mail.gmail.com>
 <CANAwSgRkqAj5Q4LMO-CKBSoMgO-+zd6JpbVs+eWY3kPgmj9bug@mail.gmail.com>
In-Reply-To: <CANAwSgRkqAj5Q4LMO-CKBSoMgO-+zd6JpbVs+eWY3kPgmj9bug@mail.gmail.com>
From: Wayne Schroeder <raz@chewies.net>
Date: Fri, 9 May 2025 10:01:17 -0500
X-Gm-Features: ATxdqUE_PmhZ54jFeg6jIYai2y3B-gBv2fkdfTsqYASmYzXd9Nfo6C7yAcR2Cw4
Message-ID: <CAEUiLubakMjzhi2sUTQx1S4ciTjkL6ysx465i1t-T5zKUQdUvw@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: Anand Moon <linux.amoon@gmail.com>
Cc: Ferass El Hafidi <funderscore@postmarketos.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, u-boot@lists.denx.de, 
	"u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_080132_356560_2E0EE5B0 
X-CRM114-Status: GOOD (  21.98  )
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

WWVzLiAgV2lsbCByZXBvcnQgYmFjayBob3cgaXQgd29ya3Mgb24gdGhlIG4yKy4KCgpPbiBGcmks
IE1heSA5LCAyMDI1IGF0IDI6MDjigK9BTSBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gSGkgV2F5bmUsCj4KPiBPbiBGcmksIDkgTWF5IDIwMjUgYXQgMDE6MjUs
IFdheW5lIFNjaHJvZWRlciA8cmF6QGNoZXdpZXMubmV0PiB3cm90ZToKPiA+Cj4gPiBJIGFjdHVh
bGx5IGFscmVhZHkgaGF2ZSBhIHdvcmtpbmcgc29sdXRpb24gdGhhdCBJIGRvY3VtZW50ZWQgaW4g
bXkKPiA+IGdpdGh1YiByZXBvIChkdWJzY2hyby9vZHJvaWQtbjIpLiAgQWxsIEkgZG8gaXMgc2V0
IEJPT1RDT01NQU5EIHRvCj4gPiBjaGVjay9kZWxldGUgYSBmbGFnIGZpbGUgb24gbXkgYm9vdCBw
YXJ0aXRpb24gYW5kIGlmIGl0IGlzIGZvdW5kLCB0aGVuCj4gPiByZXNldCB1c2IgYW5kIHNsZWVw
IGZvciAxMCBzZWNvbmRzLiAgSSB0aGVuIGhhdmUgYSBzeXN0ZW1kIHNodXRkb3duCj4gPiBzY3Jp
cHQgb25seSBvbiByZWJvb3QgdG8gdG91Y2ggdGhhdCBmaWxlLgo+ID4KPiA+IENPTkZJR19CT09U
Q09NTUFORD0iZmF0cm0gbW1jIDA6MSByZWJvb3QgJiYgZWNobyBSZXNldHRpbmcgVVNCIG9uCj4g
PiByZWJvb3QuLi4gJiYgdXNiIHJlc2V0ICYmIHNsZWVwIDEwOyBydW4gZGlzdHJvX2Jvb3RjbWQi
Cj4gPgo+ID4gSXQgaXMgYSBoYWNrLCBidXQuLi4gdGhlIHN5c3RlbSByZWxpYWJseSByZWJvb3Rz
IHJlbW90ZWx5IG5vdywgYW5kCj4gPiB0aGF0J3MgdGhlIGltcG9ydGFudCBwYXJ0IGZvciBub3cu
Cj4gPgo+ID4gV2F5bmUKPiA+Cj4gPiBPbiBUaHUsIE1heSA4LCAyMDI1IGF0IDExOjIy4oCvQU0g
RmVyYXNzIEVsIEhhZmlkaQo+ID4gPGZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBXZWQgTWF5IDcsIDIwMjUgYXQgMTowMyBQTSBVVEMsIFdheW5lIFNj
aHJvZWRlciB3cm90ZToKPiA+ID4gPiBJdCdzIGhhcmQgZm9yIG1lIHRvIHF1YW50aWZ5IGlmIHVz
YiB3b3JrcyBpbiB1LWJvb3QgYXMgSSdtIG5vdCBsb2FkaW5nCj4gPiA+ID4gb2ZmIG9mIGFueSB1
c2Igc3RvcmFnZSBkZXZpY2VzLiAgSXQgY2VydGFpbmx5IG5ldmVyIGxldHMgbWUgdXNlIHRoZQo+
ID4gPiA+IGtleWJvYXJkIHRvIGFib3J0IGF1dG8gYm9vdCwgYW5kIG5ldmVyIGhhcy4gIE9uIHJl
Ym9vdCwgdG8gcmVsaWFibHkKPiA+ID4KPiA+ID4gWW91IGNhbiBzZW5kIGJ5dGVzIHZpYSBVQVJU
IHRvIGFib3J0IGJvb3QsIGlmIHlvdSBoYXBwZW4gdG8gaGF2ZSBhIFVBUlQKPiA+ID4gYWRhcHRl
ciBhcm91bmQuCj4gPgo+IENhbiB5b3UgdGVzdCB0aGlzIHNlcmllcyB0byBzZWUgaWYgdGhpcyBy
ZXNvbHZlcyB0aGUgaXNzdWU/Cj4KPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvdWJvb3QvbGlzdC8/c2VyaWVzPTQ1NjA4OAo+Cj4gVGhhbmtzCj4gLUFuYW5kCj4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdAo+ID4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
