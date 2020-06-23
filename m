Return-Path: <SRS0=9YHE=AE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A193C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jun 2020 19:41:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AAD20EDD
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jun 2020 19:41:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JhH/TgRR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Z1BzIYpf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AAD20EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2oLiZSmD2SF/+ZIw6EUUB8WrFe6QauTFQJSGxc5bMak=; b=JhH/TgRRY5sQk7SNbeBdTemI13
	u+DA+ZrfJTWf7v0YvtM05Uvc47MbGxBRWorNcSbWwGQ0Id86H92LUqxWxsyMRyV3ZmkTvNWZPkX1h
	DkTSRk9MpMh9Fx+V+JBUU8yxId4T/WFaWV7aoYrpojKyrBxzZ6mOhI8oyeWSkUkCqq0gnxUynFOGx
	UnRyA0YvusvJP6tzCKspo9wT+DT6Kvw7raqG1Bfo+Shg6SATDFlBz2Ol5kiJJL/fQGxvPi3i+62S6
	SBCxcHQQyCkAVpxhT/s6D4cZtCKITuOaPwnvgHrnAjgxSCQu4F8g+KPRck8mePPnmK/z8QILb2K9S
	kr+Cznrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnonU-0002xN-93; Tue, 23 Jun 2020 19:41:32 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnonS-0002wZ-7X
 for linux-amlogic@lists.infradead.org; Tue, 23 Jun 2020 19:41:31 +0000
Received: by mail-ed1-x533.google.com with SMTP id b15so2489063edy.7
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Jun 2020 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=QaWXoPvb/UY82AUyLY2HAwc+4ucBN+b7gaAd2SXS4aA=;
 b=Z1BzIYpfavKlaytyJPr3uz/U9s6H56dpeqqRkXwKgchnqFAgbtKqbk6Yzwxt2a6u0I
 s50dMV6qwoNXoBK7tcBbzEUaG/eEOVN7F4lOOSbBbUvnFmKeqfZ0REi8rTDFcEUBR6lJ
 3mnWvoCmhydjiW6T97UbfL3G9eXJ+uJOEy/TuDgnT67I8nECYWnu8EAnhshC0RY8us1/
 OyzEl38pG27JqD+xe4RlQ1uwfndh7S/pPQB7rXrUh3RwlekaSJDOvX/6K52CK3aLbLFq
 ycRzewu6k6NJUksrLX+D/wMowcI+eax2H4qF3Vr31tXrcqO8pd5yChE4d4m9OPnNFRbZ
 JWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=QaWXoPvb/UY82AUyLY2HAwc+4ucBN+b7gaAd2SXS4aA=;
 b=X+ATKuiHTJs1ztMIBwIZ+DrNKrM4VoCj0t9cAE72X4tH+hH5h0v+V6DI7xI27/d6w7
 UW+pZvVln5xznLPVnnI5qLLOHmoQsZcA/9ML9P9/yJ39t9nliZUt5l56jPWWb3+s+hGU
 Sn5QQ+lW/+0DJHLcbd6LIuS2d1QDsXL0Et4jW+eX/0QP1rqXkT++KKr2XjJsRry4YQhU
 p7YhrHuNQcs/v2LImIW5FCOu7uc7U7kVXJ+tyPNXBxEged4mdDOYfWkL197l1gPuqzMj
 o5jZyLsOpLdX1p56sGTnFZNcGDmVijIBzXgASkHwNkeUGnNgx5EkrWDYxC+cA7IDFs5t
 WIEQ==
X-Gm-Message-State: AOAM5311SQVa5DxjilavAy/P+bOidOCmjwFKdGrd+qecZIdXGti4PfP+
 8WHUyq2O9bi1EvoeFggP4xOMr0V8IrOv7TAJrQC/sGsM
X-Google-Smtp-Source: ABdhPJw73gylm8WplYNO2ELN9N09MjAKUXuyLKkrZArdo1stRawWcfIBWvCUdJTmWofaX9gQf+P6qVkDHXoUTrXiNco=
X-Received: by 2002:a50:b022:: with SMTP id i31mr23801293edd.301.1592941287233; 
 Tue, 23 Jun 2020 12:41:27 -0700 (PDT)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Jun 2020 21:41:16 +0200
Message-ID: <CAFBinCAMWmt9x_B3PwoqSNm-SQJpe5dD9C0PHS5Tg1eBo49juw@mail.gmail.com>
Subject: mailing list archives / subscriber list reset
To: linux-amlogic@lists.infradead.org
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
Cc: khilman@baylibre.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

this is an extract of a discussion from the #openwrt-adm IRC channel:
[10:38:23] <dwmw2_gone> My mailman backup is even older than I
thought. It's from May 2018.
[10:38:33] <dwmw2_gone> it has lede-bugs, lede-commits, openwrt-adm,
openwrt-devel.
[...]
[14:38:45] <dwmw2_gone> ok, the lists should be running again
[14:38:54] <dwmw2_gone> with subscriber lists reset to May 2018.
[...]
[15:10:36] <jow> people who unsubscribed since may 2018: sorry. people
who subscribed since may 2018: please resubscribe

As far as I can tell the linux-amlogic list is also affected.

Lists are back up and as far as I can see no (queued) mails were lost
(based on emails which I expected to show up in patchwork -> all of
them are showing up in patchwork).

There are two reasons why I'm sending this email:
1. I think everybody should be aware of this
2. to start the discussion if any action is needed on our side now
(for example: do we want to restore the archive by handing over a
mailbox backup of some sort to David?)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
