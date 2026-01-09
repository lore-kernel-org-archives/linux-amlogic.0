Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE3CD167E9
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jan 2026 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWXYUgR8mjMxzs8aP+8Kv9jvdMmIycfftWwXycW2gFk=; b=RmFQDsWqElO/IO
	NhLPTzBDsfLuyXL3FYNbVJtpvn8zIPM3LgLLWk7jHkAv7b6ypuS1AhN6/kv/UbytMjD76eMV9Ti/V
	KB6hxORJSAL1jNVMhL5dJaTb3d461zelDa9qKhWsU8iFil1BN7oyB5akU7wwzuqpb3RCH7uVUeL3J
	bQXmURiKXFEo8HB6UIsDodsKpUsOGeJBJtZMUz5Z/KGpsBC09VwfrGMLlWRJuXLlXv/O4fZDlTLG9
	bgWxiUO/WapUv/Xeh9amRW+zoeFi/CfVjUgRJBrViLIEATMlxxX+JyL7D494CcvgLpQokp+j4uDDq
	uLGRqN8HTz+gx/y+eX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8qV-000000021T0-0KLi;
	Fri, 09 Jan 2026 09:31:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8qT-000000021S7-2aE4
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jan 2026 09:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFFD460136
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8A0C19423
	for <linux-amlogic@lists.infradead.org>; Fri,  9 Jan 2026 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951108;
	bh=i8VIBeC6YWBmPy5MPPpmcXKww7Ylkwuah6DNxd1sOv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VD2XVB8gR77YjmtGc7SYxPku1BqTWNGM1CoCwkmQHN/NQy6b9hlPLQMJTswbWUCbj
	 rj4MKJVzlHyWB5HgZnVSYLZpzYJ6zTBDvgH9B4sV0xEVbsK9c74g76WdNb1yxdUgAO
	 JmFeKLIpTgIy579tAbdzHPSwIfIvy8mFxzqcKNmVotcGHUPF/Ffi/ZYO4CzLn+EjQw
	 Ka1uFED/cTCLrWqToD+WUhUsB3JeYogC9buAb1rtcWaeL8ymPrchihNIyQwpesk1/M
	 kZ2xdE+6/m1Da2Ok6l48fQYmT0k8eHIttIEdjLUeTfDyawtV+wCptR4BcKMA6849z0
	 tZXJBxDQzB6uA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-790b7b3e581so42600097b3.0
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jan 2026 01:31:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqUYY/IOl+e3TJRH08p2XLfm/kB7UKpvF3TcqecXLvTlzXgeCLozEXlc0SobibmXScI0TEuim/T3XsBkCx@lists.infradead.org
X-Gm-Message-State: AOJu0YxoWg5bohRERXX8mejeAOzWCs6VYS+gDe07DWTpFpStyUJz2AyP
	7wr/kVYKtYmD3RA+P44oqzJjvBm0zE5GqLgjp70OYB7tsE2r91rAf5vc1x/SmIOIG7++SQxPrBA
	e45IEmh34tXTmbMwwf9vafxRCOxgx9n4=
X-Google-Smtp-Source: AGHT+IEVxRShfaHD0ACu5gHbuU5njT0IbHJwXmzpDS9YK4ozZXnCMvqtMD62DrL8ET32u79jZQhbNPBVY7hyz2kavQg=
X-Received: by 2002:a05:690e:130c:b0:646:5127:a024 with SMTP id
 956f58d0204a3-6470d24397bmr10185146d50.7.1767951108033; Fri, 09 Jan 2026
 01:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:31:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLn1=5MDWjsNTZzbEVEF4QCp+pXZuu+JwdY-JXzufXDhow@mail.gmail.com>
X-Gm-Features: AZwV_QgAZ0_KDvNKwjEgDlRuSPhE9oJseVMZ4hVMx_2EzdTWDrNwZVkeejwtld8
Message-ID: <CAD++jLn1=5MDWjsNTZzbEVEF4QCp+pXZuu+JwdY-JXzufXDhow@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA5OjU14oCvQU0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKCj4gV2UgY3VycmVudGx5
IG9ubHkgYnVpbGQgdGhlc2UgZHJpdmVycyBvbiBBUk0gYnV0IHRoZXJlJ3Mgbm90aGluZyB0aGF0
Cj4gc2hvdWxkIHN0b3AgdXMgZnJvbSBidWlsZGluZyBpdCB3aXRoIGFsbG1vZGNvbmZpZyBvbiBv
dGhlcgo+IGFyY2hpdGVjdHVyZXMuIEV4dGVuZCB0aGUgYnVpbGQgY292ZXJhZ2UgZm9yIGFsbCBt
ZXNvbiBkcml2ZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPgoKUGF0Y2ggYXBwbGllZCBmb3IgTGlu
dXggdjcuMCEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
