Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A630C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 May 2022 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWdt3SPB4ly/pMouLF26wQ4P/8sVDStsQ/xZ+Gzh/rU=; b=RqWbxG5f2o+GAe
	CYnVuFziEjCPoc37fZULwcoS/XgMetf62aQSw6SJl1U52layM4pCWsZHFGF2K+a2KkuaqSs78C0gv
	rUSyy7abZNhBJIfnAA1HS8t9ijszJo0RRLOtjdjN8JJBkxReDNOKQicuURfYjKOumqbB4LZuh0XUH
	HhIznSQSXsMBJLB09auzEO85GgwrfvGmd3HEZbLdfkzh4pRZZKG5Tk2szSVbuNdpalG9nmv4tYd1H
	eugcd5pCpu53INLjNC/fy/3wIBKlWMkDGnNAG3AXzfeXS39tp4qT5FlxAN3LfhCJT6XhQCo5rjsTX
	hcOJkwAIOL1k/Aj0P0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmu8u-002JQl-1Y; Fri, 06 May 2022 09:20:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmu8q-002JO7-0b
 for linux-amlogic@lists.infradead.org; Fri, 06 May 2022 09:20:53 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651828848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ByGMit4bInofkI4sp0URUqarfW2TZeUZlukIgdPUvmI=;
 b=2xLeSLrZtbphqBEHpyBD6Jp8lUHc9pa8DxvTNRq18TNLO7sGo+vzptVDKo/gLFsakfbJZD
 kI7CaEPdDu02nj1WPhve0bW0S8a6PKnotGP2Kcy2AENcJStC1kz/1L433P0J0orBXR+OEK
 fs9UBw4pUxHF6X/xq/AJ7nUw9QU1l6wQZGZRN3DT8B1QCWL2DT3YoQjfimAh1KJWhKC3o3
 2qamUtne30lYqw+s+3bC+URgqNjjiIP2L2otEJ6eh38BSCUxMkqM75uyhrhMhJkm0BIXlc
 gM4Yq0em3GnaTHi3ICqQTirV6ibRirsY/Pc5bV+N5FURqr751Jk96B+ZWdQdhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651828848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ByGMit4bInofkI4sp0URUqarfW2TZeUZlukIgdPUvmI=;
 b=RBSAE2VBBVWieZu/LaOmvSElA6Yx5ZMtPFrmrn3/HspTF7dIczN+W7SFimeJZj9XZ3nhSY
 3NxH8BEdpamHiwBQ==
To: Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <b7c81f02-039e-e877-d7c3-6834728d2117@samsung.com>
References: <Ymfgis0EAw0Oxoa5@alley> <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <Ym/Z7PYPqvWPEjuL@alley>
 <45849b63-d7a8-5cc3-26ad-256a28d09991@samsung.com>
 <87pmktm2a9.fsf@jogness.linutronix.de>
 <87a6bwapij.fsf@jogness.linutronix.de>
 <87zgjvd2zb.fsf@jogness.linutronix.de>
 <b7c81f02-039e-e877-d7c3-6834728d2117@samsung.com>
Date: Fri, 06 May 2022 11:26:48 +0206
Message-ID: <87pmkrkoen.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_022052_246778_B859A75C 
X-CRM114-Status: UNSURE (   4.77  )
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

On 2022-05-06, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Could you try booting the meson hardware with the following change? (And
>> removing any previous debug changes I posted?)
>
> Bingo! It looks that the startup() is called when getty initializes 
> console. This fixed the issues observed on the Amlogic Meson based boards.
>
> Feel free to add:
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks Marek. I will post an official patch on the correct people/lists.

John

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
