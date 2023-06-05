Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0441BC7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jun 2023 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WGO2eLdLHPixlhAm3xKhPjGAR87VuthAvdqsQPVSgY=; b=G0CdGBL5OMs0mk
	ti9sLDKyulm2jRJQruqhSX4emIHfBKj8a2n9NBLEO2PT6VDu6con7znE6JmssZobbPSrI4sGpN1lg
	3C/6hJD9RiMXPKbRZq2ZrDlvI8IoTCm8gd8PUuTffdipQvvbb6zxHyZBryqpBxEjLP1/Ti4ag09Sv
	sGTK2oqaW/Mso7JX0XzYcBTtWi3tnKFP3c9o5azglaRrEyGPzobjIcOGF0fHl0hLEz/r44CXxeMkE
	RgMqVT//KLv2UUoYwGRnQJAVbVEhyRDNU9Bz+UG7jB0mTrfUjhIVjFUmkRccSuM5OPnfEsBvS1A3s
	Ti5IkKPBUCHdrlWZGxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HKn-00Gmrg-2h;
	Mon, 05 Jun 2023 21:01:49 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HKi-00GmpI-38
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jun 2023 21:01:47 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-97454836448so678021766b.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jun 2023 14:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685998903; x=1688590903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEXZS1gc/9CsxEjn+8XGH2gyH4ZVDUPfm5WrWxbF+bY=;
        b=VCRszmJRUeSJ4wuYJqTGvGjobddCFTTNmzO4q/XTgCmEtOaN4ZBJqfkDt1Vt2YVeY4
         xRdjXfpleFTSxezDy2wuqFa9iUtc1QBhLzVC3PvxpG1f2zxrhoi8IzCAdDvHYyrDY3nf
         XSP63yjBHu6UFAR8nmufd6UdfaYM4bY6rEg42qlHvZ+fxrFAhDyffXqDy6wF1nDipDC2
         Q/Q5oSchMTsFX6txNA4f6jVkDwBwFTC9esVlP1spg/kCSkL4FaY9ffqi8JLxDuqF2oaG
         2qK6e8WAvBP/P+vlRiwz95XmIO1xex7vTzuCbTVj8WMsJN0b7HkbXLIoCjCB3ZgfAaKy
         Ol5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685998903; x=1688590903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEXZS1gc/9CsxEjn+8XGH2gyH4ZVDUPfm5WrWxbF+bY=;
        b=BKF3NALz1S8fJb+qUNCpdIUbTiBu75RPlwVKXy0epaN/r4qw50n9ds3/ZJES9DinpS
         eCnqLFEaQAZW3Y25qT1QkVVssoySVFVUcjVKEgCkmaDPtQBR+nR5g+qd/xXzZlYLEwvv
         bkFSYWvewmJ4HLf0ds66WBhBsUOPFSvnPwn2PrIgkOIqIkHDJIzNQF/3U66R/JG5am3+
         e+wNngW/t5j9+CBD9USYahjgHoGAXF0BWOOkhjrWfhkbq4WOmi/nFu+z+GXvMKZh2zli
         O1/5DcL0lFRusahhLSZkR49bCF5eC78sPuDVzEE9+rsXq6UwIACscuYm8+DYPDjw2oGx
         MqoQ==
X-Gm-Message-State: AC+VfDxECf7tYhI9zcQAiO6tBfAmCxf8iO6M9Js6vnhEX42gvD7oY08K
	Fg4KT7nCIuJ0oCZS+luT/KRTx3mGA5gfRumUkTs=
X-Google-Smtp-Source: ACHHUZ5muLUUggQcuPVEGkHZGvsnmvfw8pWrKXboQdeoETB8cltqkt7Ji1lOr4ZEv0d9L+FWrIhKDNSiroLSY94B/SA=
X-Received: by 2002:a17:907:3f1f:b0:96f:f451:187f with SMTP id
 hq31-20020a1709073f1f00b0096ff451187fmr89868ejc.7.1685998903000; Mon, 05 Jun
 2023 14:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
 <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
 <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
 <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com> <5eb7694f-8c45-bab8-4d4c-2852f125f0eb@leemhuis.info>
In-Reply-To: <5eb7694f-8c45-bab8-4d4c-2852f125f0eb@leemhuis.info>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Jun 2023 23:01:31 +0200
Message-ID: <CAFBinCAh3s6pHa6q20=cB86qJCaYRq3bKwZtwah2_DGLcGFB6g@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-mmc@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Luca Weiss <luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_140145_010819_31532217 
X-CRM114-Status: UNSURE (   9.84  )
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

SGkgVGhvcnN0ZW4sCgpPbiBGcmksIEp1biAyLCAyMDIzIGF0IDM6MTfigK9QTSBMaW51eCByZWdy
ZXNzaW9uIHRyYWNraW5nIChUaG9yc3RlbgpMZWVtaHVpcykgPHJlZ3Jlc3Npb25zQGxlZW1odWlz
LmluZm8+IHdyb3RlOgo+Cj4gSGksIFRob3JzdGVuIGhlcmUsIHRoZSBMaW51eCBrZXJuZWwncyBy
ZWdyZXNzaW9uIHRyYWNrZXIuIFRvcC1wb3N0aW5nCj4gZm9yIG9uY2UsIHRvIG1ha2UgdGhpcyBl
YXNpbHkgYWNjZXNzaWJsZSB0byBldmVyeW9uZS4KPgo+IFVsZiwgTWFydGluLCB3aGF0IGhhcHBl
bmVkIHRvIHRoaXM/IEl0IGxvb2tzIGxpa2Ugd2UgZGlkbid0IGdldCBhbnkKPiBjbG9zZXIgdG8g
Zml4aW5nIHRoaXMgcmVncmVzc2lvbiBpbiB0aGUgbGFzdCB0d28gd2Vla3MuIERpZCBpdCBmYWxs
Cj4gdGhyb3VnaCB0aGUgY3JhY2tzPyBPciB3YXMgcHJvZ3Jlc3MgbWFkZSBhbmQgSSBqdXN0IG1p
c3NlZCBpdD8KTGlmZSBnb3QgaW4gdGhlIHdheSBzbyB0aGVyZSdzIG5vIHByb2dyZXNzIG9uIG15
IGVuZC4KSSdtIGhvcGluZyB0aGF0IFVsZiBoYXMgc29tZSBtb3JlIGlkZWFzIHRoYXQgSSBjYW4g
d29yayB3aXRoIHRob3VnaC4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
