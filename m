Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC6CC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Dec 2021 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVgxuPxy1it/W5XOIlQ0Jy9p6QQ8ZSCAuOoCx+BY0Vo=; b=QZq73N4xCsVDP1
	WSj6Yn5bJ/Dw2Oqg0qmjR5A/swi2s7giI7eFtqyTeQAxaj6ny8CfyHtEzBnxivqjiBGJupaxjriGU
	MXVwGM/EaQ5ZyvRgVtUkFUcVVWsNqyJSClz51kTtNxkFmyytsxL8/MLDUGHvwCkUyPfePVzRmXNza
	G1cN6yq4UhIyzd1XaUXmSiRhDodwbWVuUw2mWv9SL5+hHC+fPj1q15EBHx+F8lTQDsIxcw++nQIzd
	T+aJmhLqSobBOr8XfI/V5qajskVsxXlFN1EQz3X4ZX3djveGfynGImvg9T9KUzPLy29VdJDIA0PTf
	d5cj5ODxuaCgGZvbupAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxQut-00HZP1-Aq; Wed, 15 Dec 2021 09:49:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxQua-00HZGo-L4; Wed, 15 Dec 2021 09:49:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C732B81EAE;
 Wed, 15 Dec 2021 09:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C924C34600;
 Wed, 15 Dec 2021 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639561762;
 bh=tpItsWb3yCPu56wHhd2hRRm6LL8pA74DZCiB4o2ZBhs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OuRA0yiqB0m0bfw3d0Atrf6A2wDqET8XrSz6Hbbt9vlAdC8AfFSIo2fol/4SbhfkH
 GRalbCRHDnzdoYrfiCvEQaxtiDLm2gHXjxgGo3a+ojhByUfuTDC/Bz+ID4jY34R8+Q
 KKofbIu9xEZUCgnVlV560WY/7LcDarCnWPJ5ASmI2zhe2zl/7wTZrOqWOUEVhrBJBL
 B4fT83ySg9SiBD78EloEXf4HTl/qys3UnGTHtiaUnjM12Kq4niNkP18dZYdBCO4c/Y
 Y1tj0WsDtg8rVYqf/z/T+4jDw6sGNhWcy+0m7k4bJUL5hZdV7QJKOHbwn9ee6WtFoM
 NPZ2jeX552rTw==
From: Arnd Bergmann <arnd@kernel.org>
To: arm@kernel.org, soc@kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.17
Date: Wed, 15 Dec 2021 10:49:09 +0100
Message-Id: <163956174418.1227275.8750396607643099087.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f47b9b95-6cde-d2f8-eb36-78777d449920@baylibre.com>
References: <f47b9b95-6cde-d2f8-eb36-78777d449920@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_014924_866944_18952771 
X-CRM114-Status: UNSURE (   8.38  )
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

On Mon, 13 Dec 2021 14:28:40 +0100, Neil Armstrong wrote:
> Here's a set of Amlogic ARM64 DT changes for v5.17, with minor fixes and additions.
> 
> Neil
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1c8e994f16b79f08c565b11e617afc07225eecf0

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
