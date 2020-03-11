Return-Path: <SRS0=TM5R=44=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DD1C0044D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Mar 2020 19:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E4020578
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Mar 2020 19:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="svbXRn+m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ARE6qGsm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00E4020578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6fuJybqyDGglVTk3iM3EnN89hJ19tPgqFXUiOZ7tqk=; b=svbXRn+m8z2q7u
	CPmMufH8Y7vFkxdn/s4yIwcr6evgQomKxjLmjMzocHMtkVNiDmnHCMhyiWYZiE2yMQ6qHwmUe+Q/V
	AfwUB1dB2g4J4bDgB+OvgBUGoRC/1XUYYuShK5qGjIr9WRzkkxuOzrkS21iFm7JvO5uYKnua2Oo8t
	te7dOp0aA16bMD4JxbOBHra9jB9s5W9autvRYJT/KBALVwOiiM423fX7pl/WS9+E1jz+W5VwnIqh5
	ETUhSlNzqT+9P9dmA4xUxqdgIihoWBaTCLLb/F9jd3jx98dpO/v0vFOWZ/8sVuJzzUH7v0lO9Bm4c
	j0p2tle9+oS/SOy35BLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC6xp-0000qe-Cp; Wed, 11 Mar 2020 19:24:21 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC6xm-0000pe-3s
 for linux-amlogic@lists.infradead.org; Wed, 11 Mar 2020 19:24:19 +0000
Received: by mail-il1-x143.google.com with SMTP id p1so3124741ils.12
 for <linux-amlogic@lists.infradead.org>; Wed, 11 Mar 2020 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8N/7KqaO2uHDIYZv/eBCikgO0CGFEy0TUrj3C3ZKTKg=;
 b=ARE6qGsmx2gNgSWJCSYU0TNiWLYMwyiRcF6ENWM3CzZ22PibB5K9mK6zqiGKXRuzWy
 KopIQ+9mN/zayHYAau1eIEgQO/CVEKQFu7DTE9CQOd0YytHsopNF7ePGCmgBn4lttdgq
 MMEyPTdXGQ7lKTsi+rgkBT4ejvtJ6j+kWqLpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8N/7KqaO2uHDIYZv/eBCikgO0CGFEy0TUrj3C3ZKTKg=;
 b=liwlfVsI0GfscPdWAF56UFOMl1nSWl0n4XHp2sQAxiJ+2f13LM5VrZO619tOTOe0AR
 olfMviQ2OnUHGc6BdHEmeZr7jBngF22AHuEPBZJoSOLaNOksIa8dyJZV58kCaiqcR/Ht
 dPeUDEtJn+HMkuazMYpu5kO0gHOIxCBn29IToXuUSXNQqfTsobOuV6ktNr0LFNIfqC/e
 L2bXJ6YSKmxXrwgwlfKAFEEbDXU7UtlbR1d+BCWegPEYTGORFvEhGiJIQWZB946nuHcZ
 vwYM5ESYI0OX0oAMvkFOrbwFzv9Cj0ey5n4u9L4Jpt57e2BAheEOUYZbeZi7QLA4KgVq
 FmoA==
X-Gm-Message-State: ANhLgQ1DtdsMW0BhjZ/GvZ/fvtzgWBMMNobuWVusdJ97EBFYkhzIYs7s
 3OA8ZZLIxNZyhlM+dlP5/wYGMMEkYIWQdmNDteEEdA==
X-Google-Smtp-Source: ADFU+vu73cL6OluZ5si943eP+eQIpQ8nGNRk/kAu29sLxMb2Kjpld2YYVtSCdcWAgwpjVWtWsQ9Tjb7Cnb1d1i9YbQA=
X-Received: by 2002:a92:52:: with SMTP id 79mr4698842ila.41.1583954653040;
 Wed, 11 Mar 2020 12:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
 <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
 <1326f594-3cfd-c03d-4f2c-50eeb75724b2@amlogic.com>
 <CAODwPW8WwntWb_=dg2J3AMy-gHw2QvNj_g98SufN13+AuGnUSg@mail.gmail.com>
 <b4ba821a-eef6-4aea-1eba-897171b92c41@amlogic.com>
 <CAKz_xw2T1UceCwFZnBxg6WVp2D4+MziyvQPdU6tEnR_BdLh-PQ@mail.gmail.com>
 <ad28aa47-0490-937f-898f-0e4695ef6ec6@amlogic.com>
In-Reply-To: <ad28aa47-0490-937f-898f-0e4695ef6ec6@amlogic.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 11 Mar 2020 12:24:01 -0700
Message-ID: <CAODwPW9oxx33hkO3kv2_G8YyLWvigVHkfJU7xUHLVgB7QU2i3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To: Xingyu Chen <xingyu.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_122418_159673_F4663FE4 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Evan Benn <evanbenn@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Yonghui Yu <yonghui.yu@amlogic.com>, Julius Werner <jwerner@chromium.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> - *_INIT and *GETTIMEOUT.      Although your driver does not need them, could you take them as options in your driver ?

The driver already has SMCWD_INFO which is used during probe to
retrieve the minimum and maximum timeout values supported by the
hardware at probe time. Maybe it would make sense to rename that to
INIT (which would still return those values, but can also do whatever
initialization needs to be done in TF)? GETTIMELEFT I agree we can
implement optionally, and other platforms would just return a
PSCI_RET_NOT_SUPPORTED for that.

> - *_RESETNOW.      It is used to reset the system right now, similar to your SOFT RESET. could you reserve an operation index in ATF ?

Just curious, why do you need this? Shouldn't you use the PSCI
standard SYSTEM_RESET SMC for that? (If you want to control exactly
how the platform is reset, you could also use SYSTEM_RESET2 with a
vendor-defined reset_type.)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
