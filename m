Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0C7C004C9
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3EE214AF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eSdg5B2s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBvSV/Sr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3EE214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuG5kVIdBP2g8wZt0i/ktemPZYqw1N8UgyTDtHlzgn8=; b=eSdg5B2sbMh0mL
	D0H9ZOJOrt46bEUSXtri8Y45mjWdA8KTF/t5iGsFE02z/fc6cAUTdLH5SG784LUrX515nzvmext7q
	RQFJEiqF9OY2dEAPQ19P4fT1cJ2/IfLzljcC9cSz/+iSeCAA8cPMBHtQM/Wg/Q0PgzuPnp6x4oFRC
	wyVDvQLrP5wXY2/X99x2LuI4s3jGCaYrZPGBxqtUnanLJCL80GfK0YAcb089ZGHQNclvkwBxkApDS
	jrQSTz/C0Ko4Lq1yV1n7h87OY/xUiYGDLfMB8u3BTGE1fFMgX2g2uDQIE+NXE6TFY0DlnhL14eAHK
	NNqtcKPEvBuTwkDyNO9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL84e-0004MR-VN; Mon, 29 Apr 2019 15:20:08 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL84b-00035L-23
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 15:20:07 +0000
Received: by mail-ed1-x544.google.com with SMTP id a8so7423229edx.3
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=dPnq76BudBLUCskM0DaeuuctlwoGzT39qQr2q1xJdTg=;
 b=BBvSV/SrDNJ31+/UOkSM5bpG5QGX9iuVEAlHSpvrDOGj+4PW80QrSA2NQvvNYxzojp
 Zd++WkJIJdsJI48+0P5HrqTBvNXDC1r245KbMoADl3uY5vH+mVrnUi6+8qjpF2ydE+tq
 TwF1hj4480FhhbTHgn4M/QznEs6p0sHaHA9yrWx15VQqD4rerfkEYjhIuk1lUIvL8NJx
 M8wE73xeYfkcTLVAM5oCB5RVNjauTgvl4PjUAhsoMUZ5oTPhnvZ5wvz6bSMifDGNwT/e
 KSK9tYNcpfIF8GPBuVeJpf2B9oLlA2ItKshISp7tatkcaGkzhTIiD3dveMl7nJ6B+iIV
 zmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=dPnq76BudBLUCskM0DaeuuctlwoGzT39qQr2q1xJdTg=;
 b=QK8zdCDUfE0v1HbCdQrB6C6VmFgdFrR5slztLfrWGYNylIrC3SfSj8sspSw4RsCvb4
 BoJHOzQYXCk/tAww1VKSzLeIrj+r6E/8QgL1T/9iSRrswKLuWTEmI2gd/5ezWEd5NUF4
 Hr9+lzpqI+KlroyMyQuNORdZboIVv6/s4LrwwNxesYYTfSx0aNYtWvFTs6kV/ctSZUdx
 SHIRK4jJK00jX1dX8m+/HL40AVK2pttoqfA/y+0XRRpd5+Gk8cvfZlvr6gCSCEgaN3Vp
 x/0Msqb9lDBPmZ9N7mEqnPU6y+2W9r+uSvq2TSP7RbeCJpXTCKSMetpwjhokTHhSYKQu
 D1pg==
X-Gm-Message-State: APjAAAUvQFlHnFYmslKEWFxpd5ZevlDsPCsRqru7mhkuRBD/mL2b/0Co
 k9AVemFDYXaM2VY0tUp0pAM=
X-Google-Smtp-Source: APXvYqwQbi0omP7jYdcby2odHruq4pxaQ7sP2Qij52VODZOog6lth6WIRzjEKd0jUTWzRbOuB+nVlQ==
X-Received: by 2002:a17:906:2482:: with SMTP id
 e2mr12684688ejb.289.1556551199464; 
 Mon, 29 Apr 2019 08:19:59 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 p18sm5851269ejm.4.2019.04.29.08.19.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 08:19:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
 (envelope-from <peter@korsgaard.com>)
 id 1hL84T-0000dV-Kj; Mon, 29 Apr 2019 17:19:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 13/41] drivers: tty: serial: uartlite: fill mapsize and
 use it
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-14-git-send-email-info@metux.net>
Date: Mon, 29 Apr 2019 17:19:57 +0200
In-Reply-To: <1556369542-13247-14-git-send-email-info@metux.net> (Enrico
 Weigelt's message of "Sat, 27 Apr 2019 14:51:54 +0200")
Message-ID: <87muk8rg82.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_082005_192237_0775C306 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 andrew@aj.id.au, gregkh@linuxfoundation.org, slemieux.tyco@gmail.com,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-mips@vger.kernel.org,
 linux@prisktech.co.nz, matthias.bgg@gmail.com, khilman@baylibre.com,
 linux-serial@vger.kernel.org, sudeep.holla@arm.com, sparclinux@vger.kernel.org,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org, vz@mleia.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:

 > Fill the struct uart_port->mapsize field and use it, insteaf of

s/insteaf/instead/

 > hardcoded values in many places. This makes the code layout a bit
 > more consistent and easily allows using generic helpers for the
 > io memory handling.

 > Candidates for such helpers could be eg. the request+ioremap and
 > iounmap+release combinations.

 > Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
