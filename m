Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4D6C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLQ1H4drWFfRQScuu9kmyNo2KSTn6LOYvjr0HWceG/8=; b=x+PzDhR+SyYivL
	7UWCniMLeJGFZPfsXdBbu7kFu8LT8PPGb/pZlZUPmR7quHhqvg3tLagNCFbkRY07IcepCCmQVGkpL
	tOS97R1fJ6AdoRMTAL2cqw1Kb8jap7a2kyUM2HurC7uatesocFeaPBOPXGj6SavNvP7YkjCVZPSbr
	jgWon6gYmXUQyMf8vbVI9weoeRWxSTw5WtmDy8gcO7IRMkx5fx/zOFc9s/cd7m9nGqmzOeVh0EmX5
	95eA1OcnGY+CFKGUleEWpGJgrsiXUHKEUVcoBazaxk71rfWBNPn80ibrB35f92bsciCN/LSAmYBF+
	U/6k92flLMyRVKBoOwPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXITJ-00000006xPQ-3Oh0;
	Tue, 06 Feb 2024 10:14:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXITI-00000006xP1-3wbi;
	Tue, 06 Feb 2024 10:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZtCCWZhu9Pe3rgXwf+V6JpR3qXWYyc8Tma3pMX6qmQI=; b=czop5hnTrTB5+yijhl4Z8h6t6H
	HAjotPOuS6rQwGDwaMCbZoGFIsu1WJ/NXixe4n7tGJf+Q6QcGjmfylZBXluQg9SDufs5uwR5bpJ3b
	Hir0sg4rSA4I0F0WRlq7P34HKJNBj6urhlrZ1OWbSSJ2rlQbwD045ey/Q72SeHKOgwASHCuXEzAg5
	/xLHLUdXdW/Dw6srUK/X03a03mzaKyxe6WoCWI8vu09/eYWLlZxLclP2cftAcuNHRvEy91nfPA2uD
	TEGtpVXMA+zvByYkzN4awuXyt4ZFViZl7QKuKugJ0iHLjbkRI3ISphMFDYQRTJTZ7VVbQXvtSrtgM
	sADjM4Vg==;
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXITF-0000000CU16-1vb3;
	Tue, 06 Feb 2024 10:14:31 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6040a879e1eso56243947b3.3;
        Tue, 06 Feb 2024 02:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214466; x=1707819266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtCCWZhu9Pe3rgXwf+V6JpR3qXWYyc8Tma3pMX6qmQI=;
        b=G5BewmP83QKu+8UBjtneNQVcVHgkeaCcmp4K+Hv5ln/qDXNDK1CmzI/wuQ2XMSyT88
         xjfDPRIl+qkkevcjcUsS0BDClb8BXD7JFQJ4k7kdOY9b6yB/hqJP0jPj2g8dBCwjuTl+
         XIi1f0ODNzqIWJXXw/oKotFZhyDDJv7nQKW2UEqCis3bPVFLueTWDMyuo1FmWvnichUq
         LgPV9y8YrbMP+T4zXPTQiP4TQkNrydpkTUOrFwEnewh0z3qC0T30Si0KWjeI3MzPY7vz
         JPygHyovMNe+zUltAz5j3OU1/WR9pkpnAKdCHGa+j/wZM2iNqeAasTeNTrKs+aTIPreH
         8PLA==
X-Gm-Message-State: AOJu0YzUY82QL1F+DbqcR3Fdc08S0kR1Q49cm0X/FlskBaqLUPTFvfVt
	qbj/3Zqr4tTMtvUuHXaC9qn43k85ZlkgCCafpEoD2duxBEAL7ta9UV4GPPsIby0=
X-Google-Smtp-Source: AGHT+IETuUTg5BhIW4ceopPDViiVj2zwKy/U+RawIpJXAgm/NyOE+xUh3hAiiHXPREroIhrao4VmcA==
X-Received: by 2002:a81:9986:0:b0:5ff:7eaa:92ad with SMTP id q128-20020a819986000000b005ff7eaa92admr949354ywg.37.1707214466346;
        Tue, 06 Feb 2024 02:14:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXhuvNqsObg7ftqrqPHKYLg0EzJYXnbhs/e1PPyijP/NoSlWh/5H7/4bkvmbFFs61VWZXa0H8O8PFodcvvhYQA+eThBkFibr+2ECufQ3LApH/88nspIaOEp+87dzwLaVv+X8aRwn2W8CRHriOBmZVzgiGDmoU2wAw==
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id fq2-20020a05690c350200b006045d53b3ecsm406979ywb.20.2024.02.06.02.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 02:14:26 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-603fdc46852so57137577b3.2;
        Tue, 06 Feb 2024 02:14:25 -0800 (PST)
X-Received: by 2002:a81:e809:0:b0:5ff:b07b:fb0b with SMTP id
 a9-20020a81e809000000b005ffb07bfb0bmr1059881ywm.49.1707214464961; Tue, 06 Feb
 2024 02:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20240206071314.8721-1-liubo03@inspur.com> <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
 <ZcIE/RMTq34TgpQt@finisterre.sirena.org.uk>
In-Reply-To: <ZcIE/RMTq34TgpQt@finisterre.sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Feb 2024 11:14:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVj1bS9s69ASrd5xULc8oELoBbnb8HEX9MEmA43853_EQ@mail.gmail.com>
Message-ID: <CAMuHMdVj1bS9s69ASrd5xULc8oELoBbnb8HEX9MEmA43853_EQ@mail.gmail.com>
Subject: Re: [PATCH 00/18] mfd: convert to use maple tree register cache
To: Mark Brown <broonie@kernel.org>
Cc: Bo Liu <liubo03@inspur.com>, lee@kernel.org, wens@csie.org, 
	marek.vasut+renesas@gmail.com, support.opensource@diasemi.com, 
	neil.armstrong@linaro.org, ckeepax@opensource.cirrus.com, 
	rf@opensource.cirrus.com, mazziesaccount@gmail.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_101430_095802_2BB3DB3E 
X-CRM114-Status: GOOD (  20.55  )
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

SGkgTWFyaywKCk9uIFR1ZSwgRmViIDYsIDIwMjQgYXQgMTE6MDnigK9BTSBNYXJrIEJyb3duIDxi
cm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDA2LCAyMDI0IGF0IDEwOjMz
OjIyQU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IElmIGFsbCBvZiB0aGlz
IGlzIHRydWUsIGlzIHRoZXJlIGFueSByZWFzb24gdG8ga2VlcCBSRUdDQUNIRV9SQlRSRUUKPiA+
IGFyb3VuZD8gIElmIG5vdCwgcGVyaGFwcyBSRUdDQUNIRV9SQlRSRUUgc2hvdWxkIGJlIHRyZWF0
ZWQgYXMKPiA+IFJFR0NBQ0hFX01BUExFIGluIHRoZSByZWdtYXAgY29yZSBjb2RlIGZpcnN0LCBm
b2xsb3dlZCBieSBhIHNpbmdsZQo+ID4gdHJlZS13aWRlIHBhdGNoIHRvIHJlcGxhY2UgUkVHQ0FD
SEVfUkJUUkVFPwo+Cj4gVGhlcmUgaXMgYSB2ZXJ5IHNtYWxsIG5pY2hlIGZvciBkZXZpY2VzIHdo
ZXJlIGNhY2hlIHN5bmNzIGFyZSBhCj4gcGFydGljdWxhcmx5IGltcG9ydGFudCBwYXJ0IG9mIHRo
ZSB3b3JrbG9hZCB3aGVyZSByYnRyZWUncyBjaG9pY2VzIG1pZ2h0Cj4gZ2l2ZSBiZXR0ZXIgcGVy
Zm9ybWFuY2UsIGVzcGVjaWFsbHkgb24gc3lzdGVtcyB3aXRoIGxvdyBlbmQgQ1BVcy4KClRoZSBS
RUdDQUNIRV8qIHZhbHVlIGlzIHNwZWNpZmllZCBieSB0aGUgZGV2aWNlLCBub3QgYnkgdGhlIENQ
VT8KV2hpbGUgc29tZSBvZiB0aGVzZSBNRkQgZGV2aWNlcyBhcmUgb24tU29DLCBhbmQgdGh1cyB0
aGVyZSBpcyBzb21lCnJlbGF0aW9uIGJldHdlZW4gZGV2aWNlIGFuZCBDUFUsIHNldmVyYWwgb3Ro
ZXJzIChlLmcuIFBNSUNzKSBhcmUKZXh0ZXJuYWwsIGFuZCB0aHVzIG1pZ2h0IGJlIHByZXNlbnQg
b24gc3lzdGVtcyB3aXRoIGEgdmFyaWV0eSBvZiBDUFUKcGVyZm9ybWFuY2UuCgpQZXJoYXBzIHRo
ZSB2YWx1ZSBzaG91bGQgZGVwZW5kIG9uIHNvbWUgQ1BVIGhldXJpc3RpYyBpbnN0ZWFkPwoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
