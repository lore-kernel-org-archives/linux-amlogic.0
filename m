Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC68C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URaKT549/BVN9G4UJrsJinG9UGg8hSNKtznrNbVyt34=; b=sr1dG9g+/Px+bG
	AJpMqkZ4nKi54fIZliEeK1iiWSsir0TJtQ35eNNu8olJc+x+A7xsTJQN33+pnOuQJO6wLH2/03zPZ
	LcMjt+q9720DLCUNYNRuXHIi6E6Rsy4ukcZsrVT8uERXoz1lq3ezY33GCymoNxMscQFOu/W8/OaSK
	ku+u/O/bP17Wh+nqwluLd7SLAm83R0bJJpQaXHYBDcyzFZwObAcbeMVIU/viplUA7Iw4ROAhjpQ+G
	gE6bVXMiFQE8783pNqRnRqLv1DftOjPgVXDoWxWI1FBXHucd1yLZPiRS28PIbHWaxKrzY8RP2cD/f
	aOnzuryXK3m4urB5sxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PEp-009KOT-QB; Mon, 03 Jan 2022 15:27:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PEd-009KKw-ND; Mon, 03 Jan 2022 15:26:57 +0000
Received: by mail-ed1-x52e.google.com with SMTP id j6so137102910edw.12;
 Mon, 03 Jan 2022 07:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/mrTdODckT8qhbL/5PnfjpaZaia9nDRKBsRlTwu+wxc=;
 b=QzjIngw3OXouM0j0FuX8ke2NA6llaMWR0jHIZktbuOcuMJKD4Gv5INANZVZlNnIvTp
 Qi0C3XWe1tMpSWHgTKmzvHd2eZZeW/nN0RDblrrYYL75BV/GJ/pzKnk0ToNiGepyuU9L
 BpNq4GFScrOnr1bXrLD0zSVyltAsjhbhr5tXoZ8vy7FS94IuLqcmfia59ktyPNf3Dd6f
 YzYLyXgjGaaA9rJLxw4+SOlkXXJZ14GxfRQF1v5TDgRcVCl2RMMobinl5MiIjEjh/2A6
 gXKaaIDeyKGHXtT8lfS4U6VbVOOLasqVchzCPiCsRwi3yPAJIU6npenSDPYO9e+8Gdbt
 2cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/mrTdODckT8qhbL/5PnfjpaZaia9nDRKBsRlTwu+wxc=;
 b=l4Bk4IwRsNNoczYGSjsoGAwz5pVAFySf/uynaoGMvICQ6qIh5iaphHjWL6Kr8ecye7
 AEh/LSIRLXdI9S7xEyJ4jcTurwh2wVVFRVlBIFq3wFsb98ZugaGejD5fzKS6KcJ+UQ7m
 UfYa5q8Tp37eYGvRFaNTgjD7mmixtzeAatCZhlO7/z2SD/5yHQ/J62h+JgtLTHYe/bQ6
 sYyHPV+KCWrtiO0+ole8cor84kwXR9L6tDIIo9amgUUMKQfzvb0KzLxNwfLL0I3aABVt
 R6SXAZamSKEq/oXXrh3DPW137IRN6solUW2i+CnKaTP3YwZeGOkOjf57PetBgEYpJsDQ
 h5Pw==
X-Gm-Message-State: AOAM533MT3YHmBGrR03GeRmhsOU6b8DZ7GtiB4WaAZXADIwgulK4FzQa
 ThrLsXYc4oVqtRP8CULcE8W+2Qz5bhiYVg==
X-Google-Smtp-Source: ABdhPJxp2hwL2P99jM090XOgIRr00xSYgTseLDej0gMJrdOKgQAWqmpLBvjzW9N436LU8ihAZaA+Eg==
X-Received: by 2002:a17:906:9413:: with SMTP id
 q19mr36843139ejx.296.1641223613099; 
 Mon, 03 Jan 2022 07:26:53 -0800 (PST)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j21sm10662894ejj.133.2022.01.03.07.26.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jan 2022 07:26:52 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [RFC PATCH 6/9] arm64: dts: meson: add initial device-trees for
 A95XF3-AIR
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <6ff128a6-91cb-5b83-737e-e703cab81743@baylibre.com>
Date: Mon, 3 Jan 2022 19:26:49 +0400
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Benoit Masson <yahoo@perenite.com>
Message-Id: <F8463510-1955-4826-BE05-20F3B4079ED4@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-7-christianshewitt@gmail.com>
 <6ff128a6-91cb-5b83-737e-e703cab81743@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_072655_786495_9C48C502 
X-CRM114-Status: GOOD (  12.22  )
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

Cj4gT24gMyBKYW4gMjAyMiwgYXQgNzoyMSBwbSwgTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPiB3cm90ZToKPiAKPiBIaSwKPiAKPiBPbiAzMC8xMS8yMDIxIDA3OjA1LCBD
aHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+PiBUaGUgQ1lYIEE5NVhGMy1BSVIgaXMgYmFzZWQgb24g
QW1sb2dpYyBTOTA1WDMgcmVmZXJlbmNlIGJvYXJkCj4+IGRlc2lnbnMgYW5kIHNoaXBzIGluIG11
bHRpcGxlIGNvbmZpZ3VyYXRpb25zOgo+PiAKPj4g4oCTIDRHQiBERFIzICsgNjRHQiBlTU1DICsg
V2lGaSBhL2IvZy9uL2FjICsgQlQgKyBHYiBFdGhlcm5ldAo+PiDigJMgNEdCIEREUjMgKyAzMkdC
IGVNTUMgKyBXaUZpIGEvYi9nL24vYWMgKyBCVCArIEdiIEV0aGVybmV0Cj4+IOKAkyAyR0IgRERS
MyArIDE2R0IgZU1NQyArIFdpRmkgYi9nL24gKG5vIEJUKSArIDEwLzEwMCBFdGhlcm5ldAo+PiAu
Li4KPj4gLSBIRE1JIDIuMSB2aWRlbwo+PiAtIFMvUERJRiBvcHRpY2FsIG91dHB1dAo+PiAtIEFW
IG91dHB1dAo+PiAtIDF4IFVTQiAyLjAgT1RHIHBvcnQKPj4gLSAxeCBVU0IgMy4wIHBvcnQKPj4g
LSBJUiByZWNlaXZlcgo+PiAtIDF4IG1pY3JvIFNEIGNhcmQgc2xvdCAoaW50ZXJuYWwpCj4+IC0g
MXggUmVzZXQvVXBkYXRlIGJ1dHRvbiAoaW4gQVYgamFjaykKPj4gLSA3LXNlZ21lbnQgVkZECj4+
IC0gTXVsdGljb2xvdXIgY2FzZSBMRUQgJ2FyYycKPj4gCj4+IFRoZSBkZXZpY2UtdHJlZSB3aXRo
IC0xMDAgc3VmZml4IHN1cHBvcnRzIG1vZGVscyB3aXRoIDEwLzEwMCBFdGhlcm5ldAo+PiBhbmQg
d2l0aCAtMTAwMCBzdWZmaXggc3VwcG9ydHMgbW9kZWxzIHdpdGggR2lnYWJpdCBFdGhlcm5ldC4K
PiAKPiBJIHRob3VnaHQgYWJvdXQgdGhpcywgYW5kIEkgdGhpbmsgd2Ugc2hvdWxkIGhhdmU6Cj4g
LSBtZXNvbi1zbTEtYTk1eGYzLWFpci5kdHMgZm9yIDEwLzEwMCB2ZXJzaW9uCj4gLSBtZXNvbi1z
bTEtYTk1eGYzLWFpci1nYml0LmR0cyBmb3IgZ2lnYWJpdCAxMC8xMDAvMTAwMCB2ZXJzaW9uCj4g
Cj4gV2l0aCB0aGlzLCBJJ20gb2sgdG8gYXBwbHkgdGhlIHNlcmllLgo+IAo+IE5laWwKClRoYXTi
gJlzIGZpbmUgd2l0aCBtZSwgdGhhbmtzIGZvciB0aGUgcmV2aWV3LiBJ4oCZbGwgcmV3b3JrIHRo
ZSBwYXRjaGVzIGFuZApzZW5kIGEgdjIgc2VyaWVzIHRvIHRoZSBsaXN0LgoKQ2hyaXN0aWFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
