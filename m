Return-Path: <SRS0=sb2I=QW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F78AC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Feb 2019 23:16:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9C5222D0
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Feb 2019 23:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XdgjpYG/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IGu5/K7t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9C5222D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDe5jNbFAZ9VULauO04Qxkzi6sKaabQwQ1pmooglK+U=; b=XdgjpYG/8eL40W
	JhnljZNUmhVEYjTAlxdWPkkAmcpCQcOg5STJH7mKQIyNREAauZRU8aa1/yPRBDfcrZ2BJbSPxeNx9
	HMMIu0nbj4nPjuO8laRK5K7diEyaFH9fszdl4iPFsZ3Ly4zIIRUE/nsYk9eMAAzQx6jx3B6c2Pr2r
	sYijA+7wUmvss1cSBZYn3Xx5SO3NcFIg6UAJP/EKEWx+siswsOnNTWXIvDxEKD4fJanbK1ytRXCKg
	+h+XOHUyo9joRQS8RoT/evTV6UUwkMH/wcNOBtY0LL2RMHfTs/gdU1Y+sxuL06KeMHtZcspstjrj7
	yCxOozmBYStea/kXXAvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gumiC-0004jt-CQ; Fri, 15 Feb 2019 23:16:04 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gumi6-0004iv-Ds
 for linux-amlogic@lists.infradead.org; Fri, 15 Feb 2019 23:16:02 +0000
Received: by mail-pg1-x543.google.com with SMTP id w7so5475939pgp.13
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Feb 2019 15:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=a/xCWpPO4dz3VeuOc/NfK8EyXiCDOjR5lA+mhjZkfV4=;
 b=IGu5/K7tG7NeesRq1DAVK/bnQcwgiQBlaBY0fH3YdE+0oIUiza42BuiYbMqif4fnbI
 GSlCN+UjV1WUhA56a9u2AKY4IIRy+0A/EhVemyCijnOMSY6AV8C1Ou4PBRXMSUfEWJRK
 Tf2gZzKHrhHo1FdQrdpOXWglZxFM3530pfp+uyCFaKRLYwYod+3RNaGlafmJroJNvnH/
 DOpm9tkPCANp47Km3nZX0XRGdEpWVOo+4FH5s/lSqWI9IINnMn8dmExN+vjqyX+G3uWT
 r2mcp0I9WZpYncPS/SUc0ox6t+4rr395nHu2yKy48oU66p1JA9na+4Nrn1AHmcFzCXbZ
 YR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=a/xCWpPO4dz3VeuOc/NfK8EyXiCDOjR5lA+mhjZkfV4=;
 b=Vsvdt33QCX6hnSl7Iu3YAA/EEwEEWhpkVZzuuxEOot5DOdAhd7B/2lVnQEl28p++v5
 huP58nItP8ZdYeSftpWzuqvMbG6gkBmbtwcPHDRL91o6BXh+RNrQU/GC+8NNxTbIrK7q
 yLCEryk6ZFVUORJWWLEPW5qb5FdCsTS2JqB5tXsDiQjr6by7vooDqeNk1r5uuoEsdy2t
 SEJWqlAHPbpIx7XvRNyIRuiwwRoETZ6v4iQAP/MvU76xc/xqwnwgiAWrGMsrfg8IwtDi
 X6jRWcZOQAeAeKpMDsia40aVyHGo7Q0sPbShqIJvmJBeE4IpJXpKG1sVC8rtpXzJGTD+
 derQ==
X-Gm-Message-State: AHQUAuYsIZ9lc1hWPCvrDlC4NImk0g2atATEN6iF31dX+DiyKKh8+/VV
 eWCcY3pK2xiuPYgM7pE05sNo3A==
X-Google-Smtp-Source: AHgI3IZX1O7yQLtX4uzcrYuO7zkypczEXlHzmOIX5x/DBGa0Bkf1VA8/KOLURGHWNzGp83wlrlepRA==
X-Received: by 2002:a65:6210:: with SMTP id d16mr7507604pgv.34.1550272557734; 
 Fri, 15 Feb 2019 15:15:57 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:100f:5904:cb2b:8631])
 by smtp.googlemail.com with ESMTPSA id c4sm17086739pfm.151.2019.02.15.15.15.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Feb 2019 15:15:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Julien Masson <jmasson@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] tty: serial: meson_uart: Add support for kernel
 debugger
In-Reply-To: <86k1ibv74r.fsf@baylibre.com>
References: <86k1ibv74r.fsf@baylibre.com>
Date: Fri, 15 Feb 2019 15:15:56 -0800
Message-ID: <7htvh4iqxf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_151600_104325_052044C8 
X-CRM114-Status: UNSURE (   7.46  )
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Julien Masson <jmasson@baylibre.com> writes:

> The kgdb invokes the poll_put_char and poll_get_char when communicating
> with the host. This patch implement the serial polling hooks for the
> meson_uart to be used for KGDB debugging over serial line.
>
> Signed-off-by: Julien Masson <jmasson@baylibre.com>

Looks good, and very useful thanks!

I'm adding this to a testing branch which will get included into the
'integ' branch of my amlogic tree for some broader testing.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
