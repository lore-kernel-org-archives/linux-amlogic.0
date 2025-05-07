Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E520EC3ABC0
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 May 2025 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjt70BeY9qcTw1fVXDYEBe6Q7Pw8TPKfBQuez33TjIA=; b=aBCmjPBRy/UD8a
	2wfmxOQG/OPQdR7UebND3WQkPhSJFuvrdfko00XJcc9e/0GvrvOnqVa/nqHSZ3cb8xbqm3TIDFMXM
	Nh9FA2pKZyzo72vtTuCY6Yut7jKbiGChvcFwnWDi4n6WFtRLzmVdAmyMJ/X6dlkzmdS1ho0QyOzrx
	uVtjeBJkUlcwt7mnT1Y/Ak5CnQx+e55iC0EMOs9Q78wWTP+nrtu+zpfe30ZO4+E7DfAVlL27I1U+n
	2xhT73QSWQU9ObFc/ZNUj4QuoDNTQTFgKDmL48XyoBILAFXwJLhkoslZBKMKaAZeBTY8XoY8i76KT
	a9fOhke+L1W7czNkISpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeP1-0000000FUsS-3RS3;
	Wed, 07 May 2025 13:01:35 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeOz-0000000FUrd-0d6M
	for linux-amlogic@lists.infradead.org;
	Wed, 07 May 2025 13:01:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac339f53df9so1339253366b.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 May 2025 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746622891; x=1747227691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiNXlxur2Dh7oN7P4Es0NHzTBV+X3Ml6Cdu3bCSQCe8=;
        b=Fhy4iO9sxq0y9v721XMGKbbyZc4/AUu/SQa2e/d+kOVRc0tE1guTScZzWuTOVWDQIn
         cXTNb9HTStHa5WQTXvYXnA24zj1YDDa4jc9RK7Bys5bUrbgFxWhiPvA4nSLpJUiX59IV
         jAxppVV1gYb0KFDmQeqosREn6k/Cv1o/qef43EvMcfGk3H3IpOtIO8VUcsCLMlF384/A
         gcJ1YCmUbxJGNoFj73Ma0KAkbhRhiMI9p3Z3+p/x/Hamhk4/a+wpQ8oVY5V4TpdcK8oD
         8XOCi3SrqGmjcPb/S0/mc5NA3vcDCJ6rjQPnmL3CYuE3xy5YNg4Tho3GnAB5Mwv7rodi
         X22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622891; x=1747227691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiNXlxur2Dh7oN7P4Es0NHzTBV+X3Ml6Cdu3bCSQCe8=;
        b=Zp6qH6c10eg2E4kUThST6vLfgYNqpCFfXmJm4iRzeXHD0RDHl2iG+uevGeRgiNJy9n
         T7/97iW7HmHmpDaRq1esK1h81IPFbj13GHCqUdLluJLF8T10fG0Ib8A3sFgSpKvbNI9Y
         m/nFIXWcYpJIOIXapJ9f1diheY5a4204JKRfnrfwo+wxE2ryVQ7IAqwbPOe+e25o34zF
         85DFk/u75I8QTkU15sMaegLPIn+PEcPA+MGb1vBKS49UJ2uWTVLXexCSTDHg9sn7ovIf
         TTssEQnJr9BJ+SQ8dldKIoyZcPDruuFoNLIo+cg2VFLWX7IWHp4q1x7++NVNUVR3cbF/
         6HkA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0loG02zzoTRq7xHAQzisJuUNW+zeIwqoW91t6pbflGsGtjeuh9vZUIxbpj0fvpFO/UOIBxUFuXGQQyuD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1QkOQ5FhqDuw8MmN+DQfTGTu1++mtxmDMXnlve+TSVlJmnsNN
	KDRJGwGuZQ64MfyEQHt4kkj6gBRa8uT9xuDJsRge7sy7i1iWFfmsL6ztMK5+bUSsQyRyKQJcJZf
	eWqX8sNXgNgrGDGcD1xJC6gg3Zek=
X-Gm-Gg: ASbGnctOz3Czq+DZjzwdlOApekZ9Mote1ImlPeNQim/XWoV+CteBtX/v/pBtTSsIDFe
	//3TCiiEG9qZDto/nRmLiE80gd7SiNg092NH0W1OYo/Y+zQ/7/fczX3O+uYWtVCSWlz2f4o+jdD
	6kXpCCVRlyLhs5fQ3uDQrG
X-Google-Smtp-Source: AGHT+IG02Z02N2xSddTvR9GvEJOIffjEx/5l5nVWEcqi4ELPqR9OiqScJnw1rud2NTaLP6BPWACNY23H103jmS9hmi4=
X-Received: by 2002:a17:907:2cc6:b0:ace:3ede:9d16 with SMTP id
 a640c23a62f3a-ad1e8b9587bmr328847266b.9.1746622890329; Wed, 07 May 2025
 06:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org>
In-Reply-To: <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 7 May 2025 18:31:12 +0530
X-Gm-Features: ATxdqUE0l5vsyzNKgL8uwyW-d7Ikg0-6lIS_zZgvV9ODcVZjJW6RmPTXmkIZfpU
Message-ID: <CANAwSgRMGOxrjuottn+rhU1Z3901LOgX=ktrMh7-HOJZhGaTmg@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: u-boot-amlogic@groups.io, neil.armstrong@linaro.org
Cc: Wayne Schroeder <raz@chewies.net>, u-boot@lists.denx.de, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_060133_191034_08778349 
X-CRM114-Status: GOOD (  16.47  )
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

SGkgV2F5bmUsCgpPbiBXZWQsIDcgTWF5IDIwMjUgYXQgMTc6MzEsIE5laWwgQXJtc3Ryb25nIHZp
YSBncm91cHMuaW8KPG5laWwuYXJtc3Ryb25nPWxpbmFyby5vcmdAZ3JvdXBzLmlvPiB3cm90ZToK
Pgo+IE9uIDA1LzA1LzIwMjUgMTU6MTIsIFdheW5lIFNjaHJvZWRlciB3cm90ZToKPiA+IElmIEkg
YWRkIHRoZSB1c2IgcmVzZXQgY29tbWFuZCwgaXQgd29ya3MgcmVsaWFibHkgYXQgcmVib290LCBi
dXQgaXQKPiA+IGRvZXMgbm90IHdvcmsgb24gYSBmcmVzaCBwb3dlci11cCB3aXRoIHRoYXQgY2hh
bmdlLgo+Cj4gT0sgdGhpcyBtZWFucyB0aGVyZSdzIGEgZGFuZ2xpbmcgcmVzb3VyY2UsIERvZXMg
VVNCIGFsd2F5cyB3b3JrIHdpdGhpbgo+IFUtQm9vdCBvciBpdCBicmVha3MgVS1Cb290IGFuZCBM
aW51eCBpbiB0aG9zZSBjYXNlcyA/Cj4KPiA+Cj4gPgo+ID4gT24gTW9uLCBNYXkgNSwgMjAyNSBh
dCAyOjA34oCvQU0gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+PiBJ
IHRoaW5rIGl0J3MgYSB2ZXJ5IGxvbmcgdGVybSBpc3N1ZSwgVVNCIGxhY2tzIGEgcHJvcGVyIHJl
c2V0IGF0IHByb2JlIG9uCj4gPj4gd2FybSByZXNldCwgZG9lcyBVU0Igc3RpbGwgd29yayBmcm9t
IFUtQm9vdCBhZnRlciB0aGUgcmVib290ID8KPiA+Pgo+Ckkgd2FudGVkIHRvIGVuYWJsZSBDT05G
SUdfVVNCX09OQk9BUkRfSFVCIG9uIE9kcm9pZCBwbGF0Zm9ybSBvbiB1LWJvb3QKSSB0aGluayB0
aGlzIHNob3VsZCBoZWxwIFVTQiBodWIgcmVzZXQsIEknbGwgY2hlY2sgdGhpcyBhbmQgbGV0IHlv
dSBrbm93LgoKVGhhbmtzCi1BbmFuZAoKPgo+Cj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0KPiBH
cm91cHMuaW8gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyNjcwKTogaHR0cHM6Ly9ncm91cHMuaW8vZy91LWJv
b3QtYW1sb2dpYy9tZXNzYWdlLzI2NzAKPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vZ3JvdXBz
LmlvL210LzExMjYyNTQzNS82MDU2NjY3Cj4gR3JvdXAgT3duZXI6IHUtYm9vdC1hbWxvZ2ljK293
bmVyQGdyb3Vwcy5pbwo+IFVuc3Vic2NyaWJlOiBodHRwczovL2dyb3Vwcy5pby9nL3UtYm9vdC1h
bWxvZ2ljL3Vuc3ViIFtsaW51eC5hbW9vbkBnbWFpbC5jb21dCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
