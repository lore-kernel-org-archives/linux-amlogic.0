Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73C2C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RK/iKBzyJJtcq/zk1l7FIvybhcLBChfdaNSJ3Ya0HpA=; b=SIbLiLAKbCSXVe
	aKfibgY9j1GqyRqb7Az8Rj3yfhRRFlF4T4wd4+WqNMmdTWL/xBm97Dg7rXM/Ktoyfbu0jv2LCZUyH
	aIobeYGb2J5b02ZqyM2o8xTqcYCo//M54V6okShHDr/SoJLyFANVaW6Qya7q6TLN1p1wIPpA64PLX
	OWFYcYwL1Xr9s+h3iMufdvz66RC03TrYOxFsvfMtx9U7JmJ4RqtnnBT1CP+18grBwb7KZzrEK5HLL
	W78okdT+ze1CWvQwhg9afW/jjAMF29x5622IPzFXUqiNhwH2XQS8C+gDqoczOugzy/PDOM273i+eA
	EhRoSM4Af3Zf5e9E3vAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2uXE-004MBv-UF; Thu, 30 Dec 2021 12:27:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2uXB-004MAs-SG; Thu, 30 Dec 2021 12:27:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8DA49CE1BF4;
 Thu, 30 Dec 2021 12:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1D8C36AEA;
 Thu, 30 Dec 2021 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640867268;
 bh=VJ282ssHcoqNUg3SeZeEklixHEqnQib91Mu2AwIeAE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y0nqmz/a2HzM9e3A3QG2PlphqUhNNmc5AL0O0DEnBL5sQF+Zm/bKkS8m/USVjIrC7
 Tz+Dvm9qA5VFSpW62bE9pN141JENaVqGDY4JOnBxMBFbpxvMcnBFrYEVJAWuMt4SM6
 sgrx4LGTsHGPlWH3stjiRs2BZYnmHRaR7uYdPIxg=
Date: Thu, 30 Dec 2021 13:27:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vyacheslav <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 4/6] tty: serial: meson: The UART baud rate
 calculation is described using the common clock code. Also added S4 chip
 uart Compatible.
Message-ID: <Yc2lwhYKQ03pGho3@kroah.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230102110.3861-5-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_042754_127097_97FD8F6B 
X-CRM114-Status: UNSURE (   9.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Dec 30, 2021 at 06:21:08PM +0800, Yu Tu wrote:
> Using the common Clock code to describe the UART baud rate clock makes
> it easier for the UART driver to be compatible with the baud rate
> requirements of the UART IP on different meson chips
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---

Your subject line is very odd, please fix up.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
