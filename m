Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76579C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmAKwId6K0MJVU2WBG0voimRByzRwUHeLo4W3NARm5s=; b=orXJTSWmjyJ/6e
	uU2i5GMOD3IheuaIJFsLo8zX79SMAzEUvDdUq2+ga6lSMQzL2x6kOa5mKSwLJLtYPvMNfePywhSLk
	ZmlmZjV3v4bWSf8GIYCyqj33wYUJAHe5G2LI2XfdV8AQe8ywWsIb6eWZJlU8iavnbeHqJUP9xXR2v
	l5GPYEFChLo+q1jeB5xIYWMj42/WUB345KNY/sPaDETrxPFUkm7BKX97tI8bWZdH4aM7q1uWJXulU
	JzFDjP4bsaz1DOUinHfxII5ECHf1lcmQK8VvodIW2W1KITABovxrw2wwcwvqmtBTZgxGOJMx4JeAe
	c/e94/ln8Gl+lbM1AmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwmn0-00AE5V-DE; Mon, 13 Dec 2021 14:58:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwmOT-00A50X-Gc; Mon, 13 Dec 2021 14:33:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F183CB810D9;
 Mon, 13 Dec 2021 14:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27007C34603;
 Mon, 13 Dec 2021 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639406010;
 bh=0KP5RiqfRbx8AGqs4LGjwAVD0r8NMJSxdqT8cquzQxU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PklEmRZuuqnoVu0HVi9jQ7TvypfHLsmTVt1qHeEV/nwSuHQDWFL2+xUlu1QVSfbZb
 WsuRo/G94mr3WYF4RYlZ8Rfar9eS4Pm+dKzrW3jDkRb6FFpyV+RUvSEXyc2YZcuypi
 uhvAbjZpxb90rBgA/rShyWJuAQCZ0KxF04AB2NRGwL2JJ9ff7jc/7UiTdcgd1XFxQn
 Xk8wK+KeO/pNgvpcrZ2YDKpZD5kSlYT17priv4fgC4xcRbwRNmXNazZ5F9RAO3U3Nv
 MhLSZCAVsv5xlI4S57OVFua/MvnNn3Q6oV3U3q13Z9IliETEu0/k1eTbXyFfVYL2Od
 i9uS7ewaUlFhg==
From: Arnd Bergmann <arnd@kernel.org>
To: arm@kernel.org, soc@kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic fixes for v5.16-rc
Date: Mon, 13 Dec 2021 15:33:25 +0100
Message-Id: <163940599183.928695.2462743017012142857.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <ab9f066f-480b-84b2-248e-953f2f2b5f59@baylibre.com>
References: <ab9f066f-480b-84b2-248e-953f2f2b5f59@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_063333_740131_8FA751AF 
X-CRM114-Status: UNSURE (   7.70  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 1 Dec 2021 11:40:40 +0100, Neil Armstrong wrote:
> Here's a couple of fixes for v5.16-rc1, one for the amlogic Kconfig and another for the JetHub D1 DT.
> 
> Neil
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b257c5f03508a9606fff8ce76592c2bcb27191e6

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
