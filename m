Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C9DC3ABC6
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 May 2025 19:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsvtMKF31MLgByjb2OGB1vRQj6aTnDuDjytTPizj7aA=; b=VhLkqt1C6hcp0u
	CP171gCWP/ikz7vwtxmtGsO+46efx15icbXMZ9pJDfwrVbH5Fncc5aD74Qv7SCFj5vEgwbqkNoYBP
	2Kk0mvfquaJaPUHYUEp4dtbVLboaGmueDLsF76osjgVF4WQzGouElt8pq+pRWRNTfi1uWhRBRIjPo
	fctzvCrkBv25DUZsTQZj6GHzra8aBXNYQBTZfhn/jP7VCYs+6if594JkAq4HEYY5T8JfJm5cSM8Gf
	dQrYlQ/h79b1k1evbSdbLA9EAkN9SFl+sVIs/OkPAqJR+7SnECbHirBrK1Jwaz7JOpI96bj38UIzF
	Vp+JsUpFN0oRQ0u9upwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7KP-00000001hUe-1aqk;
	Thu, 08 May 2025 19:54:45 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7KJ-00000001hPj-178R
	for linux-amlogic@lists.infradead.org;
	Thu, 08 May 2025 19:54:43 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac2963dc379so224118366b.2
        for <linux-amlogic@lists.infradead.org>; Thu, 08 May 2025 12:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chewies-net.20230601.gappssmtp.com; s=20230601; t=1746734077; x=1747338877; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3stnx/8tSv02z2R+WZ/pNypTKXfQ6hJ4O4a92YG83Ic=;
        b=Mk72eAk0VTsKjWxzOe9OShw+y3WEFOB4avnn4zpjtxkONCoWDVXWtEl1fy0950pV9t
         75O8X076kozPB/l7GK47bg98r4PFZyLhhZ240yTBLu8wLzU54Zhf3B9sagKx/aheMBPQ
         Lo12W4qnD0gdSz1stclJQwpZMSxYvNxX7vKJNChtSAGBrUnDGclkLFts5wZdtclLIFaz
         EXXjQ2yDi5uwqu0N/HoIoouk8lGzy2EVTdGcZK783vi/feWCVZ1lC1CkiXVjQvBakGMM
         rX74TshQWUoLXQYYMBGC3WqU4LehP5Mn7/vkUQag6i2hcsteo3HQt6B+IkJyYWaxoapf
         Tfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734077; x=1747338877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3stnx/8tSv02z2R+WZ/pNypTKXfQ6hJ4O4a92YG83Ic=;
        b=lw8kovhThmIGC4D1lD5ZVdrJAhkQ7VfM/XrDukgrZhJMDkJ2UrrOSMcuaR+lUtKeHv
         hH0bBZoA33P9WjEX/Y+Fj9rMMULAiV3FHMzdIbipG9N/OKLvOP63pOHCeRnyCyUvAziJ
         zg1WJpw2Vq7itTOtihWLyzBRpdE5lT0dJKGm0g4ozwH8acTLNGrHnfx9EjHw6uTAiDrU
         lSA6H9bpn33OMAY7HQllkKsON1ft9buoiF35kqhH4ilHYTjUf5LitJDycF+8xlbWyVfx
         IGJeQYn+eIblJ6bEcuizuY6hN/srhtaiQX/Z2AyjSVe0PKsZxRn51WfPAdSrsAJD5IB9
         JZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCVC7WwG5GjKzqMJgc2Y2qls+aWfoBoxVZgDi4o30vEGSMhftiDR1I6nKui4/0RftPJbX3bMefN4hbNf0BK/@lists.infradead.org
X-Gm-Message-State: AOJu0YwmKOQ6CKCdekbUkJOpaWeaZIRTp4qgNdEde0NzrcfhUvAJn6GM
	1UTAmW7FVVoq1H2b6nFDcuVl5AMgdCa3nzXjUf8sBLs+VP/pQXl7iDIBy5n7zJge2VKtx22QBvH
	jRyoor1TZgtCpea9i6q1qyG4mIGj1sFH+Nd0O
X-Gm-Gg: ASbGncv11jZVKuVvSaqeLMe7cfq55ermRQ6bwE2/dTTnaXbAAPxtfFyUkljikEE/+A3
	WaO6exnoyz/w5nWc0eP8kgn4HhhSgKT2hwoQazhoYyRxxfVcjtWVOhGKDOqif1JlksmPf/bbFOC
	LhuukKteW2W7iS9z1Q07gvFj8IZWcdsw==
X-Google-Smtp-Source: AGHT+IH2+/gg13T5NN5Eyoum1lKK2XajbhrJ0rZkP+NMR+BmxtRzYNi93HyAeD7SxIGunz1ad62B7jFOeKm5i/whAuo=
X-Received: by 2002:a17:907:c081:b0:ad1:e587:9387 with SMTP id
 a640c23a62f3a-ad218f19a66mr78477966b.21.1746734076821; Thu, 08 May 2025
 12:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org> <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
 <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org>
In-Reply-To: <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org>
From: Wayne Schroeder <raz@chewies.net>
Date: Thu, 8 May 2025 14:54:25 -0500
X-Gm-Features: ATxdqUGw2CG134B1aSNbqeEu0cZ_c6g2trXskQS6xYNTP-PlR6OnNDQu0nF5Xnk
Message-ID: <CAEUiLuYW61Vz4zAie2K9cnXXQxxRj150Nc-fJMQCh9NwXZQmzQ@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot@lists.denx.de, 
	"u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_125439_431731_5214463C 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SSBhY3R1YWxseSBhbHJlYWR5IGhhdmUgYSB3b3JraW5nIHNvbHV0aW9uIHRoYXQgSSBkb2N1bWVu
dGVkIGluIG15CmdpdGh1YiByZXBvIChkdWJzY2hyby9vZHJvaWQtbjIpLiAgQWxsIEkgZG8gaXMg
c2V0IEJPT1RDT01NQU5EIHRvCmNoZWNrL2RlbGV0ZSBhIGZsYWcgZmlsZSBvbiBteSBib290IHBh
cnRpdGlvbiBhbmQgaWYgaXQgaXMgZm91bmQsIHRoZW4KcmVzZXQgdXNiIGFuZCBzbGVlcCBmb3Ig
MTAgc2Vjb25kcy4gIEkgdGhlbiBoYXZlIGEgc3lzdGVtZCBzaHV0ZG93bgpzY3JpcHQgb25seSBv
biByZWJvb3QgdG8gdG91Y2ggdGhhdCBmaWxlLgoKQ09ORklHX0JPT1RDT01NQU5EPSJmYXRybSBt
bWMgMDoxIHJlYm9vdCAmJiBlY2hvIFJlc2V0dGluZyBVU0Igb24KcmVib290Li4uICYmIHVzYiBy
ZXNldCAmJiBzbGVlcCAxMDsgcnVuIGRpc3Ryb19ib290Y21kIgoKSXQgaXMgYSBoYWNrLCBidXQu
Li4gdGhlIHN5c3RlbSByZWxpYWJseSByZWJvb3RzIHJlbW90ZWx5IG5vdywgYW5kCnRoYXQncyB0
aGUgaW1wb3J0YW50IHBhcnQgZm9yIG5vdy4KCldheW5lCgpPbiBUaHUsIE1heSA4LCAyMDI1IGF0
IDExOjIy4oCvQU0gRmVyYXNzIEVsIEhhZmlkaQo8ZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9y
Zz4gd3JvdGU6Cj4KPiBPbiBXZWQgTWF5IDcsIDIwMjUgYXQgMTowMyBQTSBVVEMsIFdheW5lIFNj
aHJvZWRlciB3cm90ZToKPiA+IEl0J3MgaGFyZCBmb3IgbWUgdG8gcXVhbnRpZnkgaWYgdXNiIHdv
cmtzIGluIHUtYm9vdCBhcyBJJ20gbm90IGxvYWRpbmcKPiA+IG9mZiBvZiBhbnkgdXNiIHN0b3Jh
Z2UgZGV2aWNlcy4gIEl0IGNlcnRhaW5seSBuZXZlciBsZXRzIG1lIHVzZSB0aGUKPiA+IGtleWJv
YXJkIHRvIGFib3J0IGF1dG8gYm9vdCwgYW5kIG5ldmVyIGhhcy4gIE9uIHJlYm9vdCwgdG8gcmVs
aWFibHkKPgo+IFlvdSBjYW4gc2VuZCBieXRlcyB2aWEgVUFSVCB0byBhYm9ydCBib290LCBpZiB5
b3UgaGFwcGVuIHRvIGhhdmUgYSBVQVJUCj4gYWRhcHRlciBhcm91bmQuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
