Return-Path: <SRS0=BRF8=QX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D35DC43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Feb 2019 00:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B1F62192D
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Feb 2019 00:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jbjIZ0iL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ds6zTJaI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B1F62192D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:References:Message-ID:Subject
	:In-Reply-To:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+/92RSvjxDzcQIfnfQRoF78QFIk4AxPq4VdiVu0n78=; b=jbjIZ0iL9p9O6H
	j6USMzN/G8CS99EGciYgt+Hz3iwqRb5kNk/4SR5hD7Klht8gwq8gxWLcLy0IAdytvWRVrbloKgQeT
	ZD9pjlBeEGLOvoEaumqyJk7vjd4egYMOrWxPJ3vD8Vdwx0Im8tpaHUwKW6eGAoBry8rDH+UTVwkYu
	vk91Uky8UvsinvKPpj7EnSnWk8EAyjXRJoBOrrmP2aLRBKgMwoHaXFb3nGQKldjwF0arr1vtWWDzt
	x7otxugIMFf1Wf40GFA4NZxzD/BUGNtybtVR6Hz2b4mu4UfzcXq1CRs2EMCaSj2NOEP3LZgmH3TIB
	QyvBXM2LMp3hWz4X2o6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gundQ-0006i3-KC; Sat, 16 Feb 2019 00:15:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gundN-0006c4-2M
 for linux-amlogic@lists.infradead.org; Sat, 16 Feb 2019 00:15:10 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95CEE2192D;
 Sat, 16 Feb 2019 00:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550276108;
 bh=+oODPZAYHVsPfIQyFWnNzL73TjSmut9tV/U0m4Y9KCQ=;
 h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
 b=ds6zTJaIlybOL9jN4IXWMhH6yOBr9R7FiK7p/x/bGGi1rGbOt9xGPdK53V0/BStZx
 f8J6rAV2Oz7prVpW5FIeu95vUOYY3v/9M1LsVRm0CHboNuYyd/PXgKGg8QWzzX4Sr2
 DTedHUa5rUYJL0x3vehiOMtKjncDTobrL5JDJNzo=
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
In-Reply-To: <e115449e-085c-8f82-b345-f610b5e735db@baylibre.com>
User-Agent: alot/0.8
Subject: Re: [GIT PULL] clk: meson: updates for v5.1 round2
Message-ID: <155027610778.115909.3881497720700465134@swboyd.mtv.corp.google.com>
References: <e115449e-085c-8f82-b345-f610b5e735db@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Date: Fri, 15 Feb 2019 16:15:07 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_161509_129959_7B023698 
X-CRM114-Status: UNSURE (   4.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-02-13 01:11:37)
> Dear clock maintainers,
> 
> Below is a request to pull updates for Amlogic clocks for 5.1, round 2.
> 
> It adds the G12A Always-On clock controller and a simple typo fix
> for a clock name on Meson8.
> 

Thanks. Pulled into clk-next.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
