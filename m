Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D96C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 May 2022 22:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5oGGOff0nc9r44G358p4yUm430RJcyM7SH1IXfkcTc=; b=x2hrb46O6uO8xv
	PhJ3C03y8+dXcqR0T14EhG7AmC2Ah13bKNJqCkGc04B1AKIVi8BVp78qSVRd5ZFL1FyQIb/L8cM11
	Fm9ar8Qp757hOxR9pUPaocHXyeH5T4EymbQK4OPYA7AhymamS/fcyYRdkuw5cunWtOVkaZlMKEu7W
	IfMx/ui5fyYY0Du8sYxHCWBTt/DX1Sm/digAsZK15X0HhGM0/AX0eEcUQdT8DVa9O4NiIVCX6XMgk
	+UvAXUj/NwPW8qXqsIYLkpuLZlYw+JMOT3eUNERlHyNEjTZ4QimQgJsAu7d8/pAXF9+JpGunjA0wV
	h3PHzqk6uZZdtYsjsOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr5Zj-00G7DR-3G; Tue, 17 May 2022 22:21:55 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr5Zf-00G75J-E6; Tue, 17 May 2022 22:21:53 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 338F11BF203;
 Tue, 17 May 2022 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652826106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/9LHOdniNqpsQQK4EjfOLUWtSZFf+YUbBePOrM8sjY=;
 b=Dz913Ph4XCoDRWfAUYm/4wmwX13Ds7HhDUORjFbIHvI9m12aGz+76PINitrvx2uWtyCK5A
 XVdUHqNp6rEleB6fkZl1bI7c9F2NHdZrrpcfcHbi77oMMYQXpSEBtM7sTtfJMDcnVogGHw
 TlzYHBZavoZmQ1WEGsu2LXeoNZWc5QUlz0YC65Eq/+u6bgyw+khrIN+6YJHhb1XqxaGK2X
 62ZoiHWnADfLIz2zobohb2pfPqqha3BPcbHC2LNXpGTjioJSpGqmpY+ljKjeouQN5lmMxf
 SYRa0zM+bcjbSWmrRofTlr1ONAbF4m/fFUae3qmNTvjbm75oU9Upk7B2fhy+OA==
Date: Wed, 18 May 2022 00:21:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Alessandro Zummo <a.zummo@towertech.it>
Cc: linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] rtc: rtc-meson: Fix email address in MODULE_AUTHOR
Message-ID: <165282608089.294838.1764827587733203954.b4-ty@bootlin.com>
References: <20220506232850.220582-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220506232850.220582-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_152151_703896_3F62A7B9 
X-CRM114-Status: UNSURE (   6.88  )
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

On Sat, 7 May 2022 08:28:50 +0900, Nobuhiro Iwamatsu wrote:
> From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> 
> Ben Dooks's email address is <ben.dooks@codethink.co.uk>.
> Fix Ben Dooks's email address in MODULE_AUTHOR.
> 
> 

Applied, thanks!

[1/1] rtc: rtc-meson: Fix email address in MODULE_AUTHOR
      commit: a37bdde620c2eb89505ee42ff60ed7030b50f71a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
