Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FE0D25B45
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jan 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQ61ZmJTYRUsB2qV1f7+MGrD6RY9K2M7eWBhvGPlTQk=; b=vTbhnKRIUGNf2z
	7mHTtbIromxjRRQNaQVSJ9DuUbRZjtLWoO29FowW5beHHyRIHdR931F6BzruOTR4aikqV/0mvGi4S
	K7lpR22bU1moDtbwmmfxz5WnMadjPRf6Z6GuKN7sMcBW09iwVST04YoaRPhhHLvCYnYBK3RxKKppB
	MMqCc5mMgbEPBzxtiRkx8DarZ4GXM9xuUkbYs5azyolQBoY/iq8LfrSr7leB0ZCff7gbwW4Hiic5w
	/1kVa0cx92HcXqb9m69hL9CYb8ZvswrDhVNt3N81eYkTOtyuxHATi1h782ATS3/vBInXC6PUP3myo
	VOVa8vdbJedWHSJkBXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3jF-0000000FvmD-3vXr;
	Wed, 28 Jan 2026 11:28:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3jC-0000000Fvky-1CZy
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Jan 2026 11:28:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B13111A2ABC;
	Wed, 28 Jan 2026 11:28:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 859D66071F;
	Wed, 28 Jan 2026 11:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64D2A119A880C;
	Wed, 28 Jan 2026 12:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769599729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QBBuyhtDVUcmCyPFukQunvBh3yCxAEkSKtkTkXjGZDw=;
	b=OhT+vNxleDjxcYy5pINjuLDxSiBlo02MNUX0svbs548k0VM0tD2K6OAmgmW1zhMwvupuCW
	KnvtaopyJet9O1vQ2PQA/d4uNeq3ew6YhyUfOOdjRj/jOAac6/9ZyyBzOK90NIMCH+C9YU
	KI9+jNPKxN9EIC+wSsIZ8xNf3uqCzRG5XOHZfM8nW/hTtftqiF4jCYrkLSUxoGpZTVD8iX
	ve7l3UZEI13j9DkF8acv1J/UZR9qbBBh9KUq+b5d4D0BdxLJQv9j8mQNQ8u9yirC7yoqnr
	uC69DbO7+9WhAS3xgCq4TDG/CeZonb9ilCB7nLnX3W50VZr2TjBLGILTdpdM4w==
Date: Wed, 28 Jan 2026 12:28:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Yiting Deng <yiting.deng@amlogic.com>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH v2 12/20] rtc: amlogic-a4: Remove IRQF_ONESHOT
Message-ID: <176959971728.1166553.14340155586831654418.b4-ty@bootlin.com>
References: <20260128095540.863589-1-bigeasy@linutronix.de>
 <20260128095540.863589-13-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128095540.863589-13-bigeasy@linutronix.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_032854_808241_D42D42D3 
X-CRM114-Status: UNSURE (   7.97  )
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

On Wed, 28 Jan 2026 10:55:32 +0100, Sebastian Andrzej Siewior wrote:
> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
> The flag also disallows force-threading of the primary handler and the
> irq-core will warn about this.
> 
> [...]

Applied, thanks!

[12/20] rtc: amlogic-a4: Remove IRQF_ONESHOT
        https://git.kernel.org/abelloni/c/1932db202c93

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
