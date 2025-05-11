Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92110C3ABC3
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 May 2025 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGLevhdayPR8P3DPHaqawmqr+UaIc8CLDBfdxGkSoWY=; b=T1Ac0UOQ2auXLF
	fzzvdobeDguIk94tjakwMyT+zwBL0SRgHxSaORKHOQHEXuF3vUSxiB8Gb6/kbe+qcXsrO1XQnYcm9
	1Dq09cXOe9Bn6f4CkHzeKavSvn3+AVratTqP8NbuogH/DvrsfHbytLT0DZfc0nyg6W0aWjJvLVm0L
	ow/lPPX41ngy91kYR1xQMw8b392LcXbDC64LX+xloJCO2s6is3+PvWEt+NmRSvYPWmPndTO738YmX
	s47k7BzGA+FQtriTLclIIMd6JNSpshcLO61qNbWfL5mDoJzgy5bSY0oV5Ykzq0KS+88yQW+TA0fxR
	Vr4U+qKIW6JUCTZYIlWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAdJ-00000007cLW-2RnN;
	Sun, 11 May 2025 17:38:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAdG-00000007cKj-3CkV
	for linux-amlogic@lists.infradead.org;
	Sun, 11 May 2025 17:38:36 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso1236551a12.2
        for <linux-amlogic@lists.infradead.org>; Sun, 11 May 2025 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746985113; x=1747589913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=;
        b=ZcLZlmk0MyTcoE3r++J9d1myPyhqyjOPSYMNw0Hl22QubXgXbihK5imena2saI25os
         oButsZIU6hy8lZ3a+RZj82RyWG/Kq0cCQSc0dYYhxtBCw5zpPdwlYdNn/jDpsnEU7umQ
         MiVVxqiiFaqFmpcssyiGDGJd12wnVrlc7HhuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746985113; x=1747589913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htpdGgGE0WJqHpqKCEDMnW5Vc8YelVzDOmwa66AXTRc=;
        b=BNk0RRvD+MNqjAB6rCu1cgWhy1/lNcC4US6jUHjQt6+Qg1EFfYtPgJ/cFLi4ncQyYC
         mBxc8uO9SUgKDeN+m77wrSo4gTcNoosWrbQ6q0Kn0NP0lh80p13N2KGebwnl1flj4OFJ
         sAy4STmbvgdEo104fnr4oJQyX4/mG8svGqUzHy+CuL2XaQA7U1MFXPksRGh8rZOP8hnQ
         DTflnUwJZ+ar5mdkRVhMRq5j3rrAHp4bJwK7az//D+E54pNXda+k6cPr8bdvLZhiF2ZH
         MF6g+uiygJRO4x3xvvzZmWvBVu8U+nxA61gLcb9JVLJRuNeHGkbLGKinC2MyoGKhwuvc
         6t7A==
X-Forwarded-Encrypted: i=1; AJvYcCUoloM++GyT+OGwxnXsTMDb+Y77eQmDjjKDGAthmLkCf+awcpx9tNSySHdUjYdZ0lIAv9sxvXlILcw0+UoI@lists.infradead.org
X-Gm-Message-State: AOJu0YyWYddjkc4CrzmkoHHkCATTP0aBu46WNFZwTpAf41kN34Iw1COb
	iMeX/do2xziJ0L/RkJPowxP4fIXUq2vyvAfdrhsptzpE+Pgkg+s77T5/ItUjHplkIQQdSajhKz/
	trEiD2zcDzAK9TMUIJ37GUaL6V6l3a/ck42DrHQ==
X-Gm-Gg: ASbGnct1vx/SMcaXGA/AvXmCOL8OHXG+7Z/3aA7Zg6gFMfRkUm78IkbnvxPbpLQQMOz
	cwyA4Ziyy4F1/xQV4L2aKLSG6c9NwfycTMzmxPuSVCoLTINYJIFFnBWUJAe0qhl+YOcFmhGatkP
	t+3C1q8Mh9QvnnVAAVEykj5OogSnbXQzaQgZ3gX+by+hZ68oGGP+WbZCbtdbYt5MssVacLYlmZT
	kGy
X-Google-Smtp-Source: AGHT+IGlWFjDOSR6LptznPfsrBGcmLqTeFU1+S1/2WDCbsxyxoLwah/czQtlkvxYzoeR/HfJw2W1NJ3/is38sxpCk0Y=
X-Received: by 2002:a17:902:e94d:b0:224:24d5:f20a with SMTP id
 d9443c01a7336-22fc91c2cdcmr176733505ad.48.1746985113315; Sun, 11 May 2025
 10:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250511172732.1467671-1-da@libre.computer>
In-Reply-To: <20250511172732.1467671-1-da@libre.computer>
From: Da Xue <da@lessconfused.com>
Date: Sun, 11 May 2025 13:38:22 -0400
X-Gm-Features: AX0GCFtg3EgdoWRuH-CkzemoXtkQsOI76TednUqqH8u_ZIuzhBzf52QSqYFsAO0
Message-ID: <CACdvmAiqQj4NjazMvdwQtB5zX+SQs7bwXEchT5thNM83=bQBhA@mail.gmail.com>
Subject: Re: [PATCH] clk: meson-g12a: fix missing spicc clks to clk_sel
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_103834_857000_E8DEB3CD 
X-CRM114-Status: GOOD (  16.61  )
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

U29ycnksIHRoaXMgaXMgYW4gb2xkZXIgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggd2l0aG91dCBGaXhl
cyB0YWcgZnJvbSBhCm12IGVycm9yLiBJJ20gc2VuZGluZyBhIHYyLCBpZ25vcmUgdGhpcyBvbmUu
CgpPbiBTdW4sIE1heSAxMSwgMjAyNSBhdCAxOjI44oCvUE0gRGEgWHVlIDxkYUBsaWJyZS5jb21w
dXRlcj4gd3JvdGU6Cj4KPiBISElfU1BJQ0NfQ0xLX0NOVEwgYml0cyAyNToyMyBjb250cm9scyBz
cGljYyBjbGtfc2VsLgo+Cj4gSXQgaXMgbWlzc2luZyBmY2xrX2RpdiAyIGFuZCBncDBfcGxsIHdo
aWNoIGNhdXNlcyB0aGUgc3BpY2MgbW9kdWxlIHRvCj4gb3V0cHV0IHRoZSBpbmNvcnJlY3QgY2xv
Y2tzIGZvciBzcGljYyBzY2xrIGF0IDIuNXggdGhlIGV4cGVjdGVkIHJhdGUuCj4KPiBBZGQgdGhl
IG1pc3NpbmcgY2xvY2tzIHJlc29sdmVzIHRoaXMuCj4KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmc+ICMgNi4xLng6IGExOGM4ZTA6IGNsazogbWVzb246IGcxMmE6IGFkZAo+IFNpZ25lZC1v
ZmYtYnk6IERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0ZXI+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL21l
c29uL2cxMmEuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2cxMmEuYyBiL2RyaXZlcnMvY2xrL21lc29u
L2cxMmEuYwo+IGluZGV4IDRmOTJiODM5NjVkNWEuLjg5Mjg2MmJmMzk5OTYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jCj4gKysrIGIvZHJpdmVycy9jbGsvbWVzb24vZzEy
YS5jCj4gQEAgLTQwOTksOCArNDA5OSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJl
bnRfZGF0YSBzcGljY19zY2xrX3BhcmVudF9kYXRhW10gPSB7Cj4gICAgICAgICB7IC5odyA9ICZn
MTJhX2NsazgxLmh3IH0sCj4gICAgICAgICB7IC5odyA9ICZnMTJhX2ZjbGtfZGl2NC5odyB9LAo+
ICAgICAgICAgeyAuaHcgPSAmZzEyYV9mY2xrX2RpdjMuaHcgfSwKPiArICAgICAgIHsgLmh3ID0g
JmcxMmFfZmNsa19kaXYyLmh3IH0sCj4gICAgICAgICB7IC5odyA9ICZnMTJhX2ZjbGtfZGl2NS5o
dyB9LAo+ICAgICAgICAgeyAuaHcgPSAmZzEyYV9mY2xrX2RpdjcuaHcgfSwKPiArICAgICAgIHsg
Lmh3ID0gJmcxMmFfZ3AwX3BsbC5odywgfSwKPiAgfTsKPgo+ICBzdGF0aWMgc3RydWN0IGNsa19y
ZWdtYXAgZzEyYV9zcGljYzBfc2Nsa19zZWwgPSB7Cj4gLS0KPiAyLjM5LjUKPgo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
