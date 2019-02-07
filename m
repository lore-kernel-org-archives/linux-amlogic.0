Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7CBC169C4
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:44:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BED2073D
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VHvlwkeu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qZIed9R7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6BED2073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds9v2XX9PEhJijsysSegHTrjqUgO9FICM+c661lVRsg=; b=VHvlwkeuV6JVjY
	weZki4auXi/PXrjyi34OujExPAMjx9ogmv48uf5xQZ3v0W+3oRBNrvIP2eMV0g1LCcc24niLYTqQE
	9CRbQah6wehpTqse26icr9m3zwqED/6e0f2g4/dJ5XqAKtIfap9Fs1AzTgTewoa19VCpDxFD9KY+0
	8prSFACKchGBDuNMHKWPGPcz5xwkCvU0xMjptw8grPQtzYnLTbZCknh3huqWuSSZJKXgnfi0Pa6gT
	TSne1fS9u/jXylF08wmHwUh0N0jnS5WKdd21D4495muLq/hpnbufaYWg91rGgBJmVr48l+UZuHLkf
	d1NJmKlEt1ur+eNi1IiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grabX-0006FI-MD; Thu, 07 Feb 2019 03:43:59 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grabU-0006Eb-WA
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 03:43:58 +0000
Received: by mail-pl1-x642.google.com with SMTP id o6so4135565pls.13
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Feb 2019 19:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5w5B1P+VC8OPdJBg9OEZbNyP/vbZZvm0bUlcL6DRhls=;
 b=qZIed9R7nxnKw+Mic8V3eJP6p8a93s/xeZ8kaSr6WjRrV29rPovQ+9EXbXvZDYCzeT
 Y8dVlhxfGRxqS6CAohL9zf1hJBujRlzqHAXcPUMXbPWjgMgJpOQZ0SjPtpf0aZBLcm/I
 jkmRWHpKCgPpw6IzPXmApNjFdT42yP2GU2VZwNXkDrNE6BEY6BZKj/w8TBYBcDNyEM0H
 DOdr+JBflSaRqXqFwYv1cAFMxs11LYYGnLdzWCQo6VYqMRpRf/ZsxIEHo6rFvM9WEuoQ
 fOWiXWckpsxSwWxelg1YPuVc6tnbILmC3PJscElZvCB37nALf9KnfzSU5ZW2Y+/xf/MW
 F0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5w5B1P+VC8OPdJBg9OEZbNyP/vbZZvm0bUlcL6DRhls=;
 b=EvMOzaebOIHvnz1BXU+0/JkH1PwNxYs+oXd+r4D/uMOD9/Wr9VjKddmNfQNDj+gHs5
 FvoLVwSc/T9CEI+84xhQIxA7+bmaiWrJdxQZ4bmxthtyfu+xZb8Wfo2g30A+9dCZ4zOL
 xw7G771gzTQxxHBOdt7kQFMjbM74LeMa+WA9EYUJNzBeSyicEqMYPOQ4g/n7YeA1apt5
 ZIPRDHpqrTYgOQZDSrIIe8ug/4lM3aEhh2Gc5htITO6t9hUbC3swiQtnRK6a7hVh9P/3
 j1YVB7oBp/YNMwaMNK7JdA14idMfMDxalL+Li8xMv97HA27EfQ6NgSl3/OrRatOBPzd6
 bRnQ==
X-Gm-Message-State: AHQUAuaUJQCGHitssam8KRiRiahSROeDXGpIajYr/VrhlDDO9I2+oUm+
 Q+XcK4CawL5tZriJd0Z1bIVFaw==
X-Google-Smtp-Source: AHgI3IYJrKiFtnuT70rhV93vFn8+FgPuSc6BHabOPqf7AIMpJRlXxbQQeNqgALhehBNdRbZo9wgmGg==
X-Received: by 2002:a17:902:2c83:: with SMTP id
 n3mr14463524plb.104.1549511034876; 
 Wed, 06 Feb 2019 19:43:54 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id
 m198sm13492925pga.10.2019.02.06.19.43.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 19:43:54 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: meson8b: ec100: improvements
In-Reply-To: <20190118234339.16050-1-martin.blumenstingl@googlemail.com>
References: <20190118234339.16050-1-martin.blumenstingl@googlemail.com>
Date: Wed, 06 Feb 2019 19:43:53 -0800
Message-ID: <7hmun8gt52.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_194357_043285_D960FC60 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This brings various small improvements for the Endless Mini EC-100
> board:
> - the Ethernet PHY status is not polled anymore, instead interrupt
>   support from the IP101GR PHY is used
> - general update for the regulators which adds missing ones, links
>   the parents correctly and adds some notes about the actual components
>   on the board for anyone who is curious
> - show the GPIO line names in debugfs for easier comparison of the GPIO
>   definitions from the .dts and the schematics / vendor kernel sources
>
> This applies on top of version 2 of my other patchset "ARM: dts: meson:
> chip temperature (hwmon) support" from [0]

Queued for v5.1 (branch: v5.1/dt),

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
