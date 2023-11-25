Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E84C4167B
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Nov 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8P1e4+NEVJiBnovGLQ4ZRO3Byn+I+FLFFO+chgtra0=; b=Ye+KgiAGIB3bQx
	bvUQ9/GTAveL5Wh1eZDC7Y1RshPesRq8xGQxHWMSJfNEJVsDiaOqSDkMle7JWssuY27kIV9BTaRlS
	hFltwbPrsLc4Ynar1su5Y6dKqk23pkSvzSTFMmOa9r1vpBE++eFkPVgMuJZZ8y1Q20FFZpIIR+PeP
	Qq7oZRMVf1pibJ/0Q+XK4ajdlL6aWH0YHGc0pfpQOPKNQhHqLoVQO2dkVr98wSt0qmjUf+J5C3dM3
	VeQbz617uXFnrg6WnGkud/cjXzehvB5S8LJKcslWx0LimAFo6ryc99LOb3hEWI3R9j/3fODACHSOD
	8gEKSxx30Xt4k54D60Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6uqm-009Qtk-1p;
	Sat, 25 Nov 2023 15:45:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6uqj-009Qsx-2J;
	Sat, 25 Nov 2023 15:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7BBE8CE08CE;
	Sat, 25 Nov 2023 15:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43554C433C7;
	Sat, 25 Nov 2023 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700927129;
	bh=ObM2SPrwslmICoD8Q96gXrgGU06eqzKoLp3WXIF2rqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhLQiHQ1HATVxzr6Gwt7XXIQnHL8Zcz8zl1jLM3PWyQBet3x6mNKzyg6WExfgkqWx
	 eW/useTyVBnWWRuGDIMzAPCMYU7/svCq+s78rzFjRBFSUDJcyCDW0mbfkdBt676+cq
	 0SHPxRpgr9gXGwIE4sB7XgvvDD5hQ3bal73ka9D0=
Date: Sat, 25 Nov 2023 15:45:27 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	dima@arista.com, linux-amlogic@lists.infradead.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 5.4 000/159] 5.4.262-rc1 review
Message-ID: <2023112517-agreed-email-0ecc@gregkh>
References: <20231124171941.909624388@linuxfoundation.org>
 <CA+G9fYuVgqVc57YAwfA8MK6_Q86wD=RznCYKHDf_tD3foM9Y5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYuVgqVc57YAwfA8MK6_Q86wD=RznCYKHDf_tD3foM9Y5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_074541_963359_7022FBE1 
X-CRM114-Status: GOOD (  19.83  )
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

On Sat, Nov 25, 2023 at 01:09:43AM +0530, Naresh Kamboju wrote:
> On Sat, 25 Nov 2023 at 00:52, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.4.262 release.
> > There are 159 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Sun, 26 Nov 2023 17:19:17 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.262-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> 
> As Daniel replied on 4.19 build failures,
> Following build warning / errors occurred on arm and arm64 on the
> stable-rc linux.5.4.y and linux-4.19.y.
> 
> tty/serial: Migrate meson_uart to use has_sysrq
> [ Upstream commit dca3ac8d3bc9436eb5fd35b80cdcad762fbfa518 ]
> 
> drivers/tty/serial/meson_uart.c: In function 'meson_uart_probe':
> drivers/tty/serial/meson_uart.c:728:13: error: 'struct uart_port' has
> no member named 'has_sysrq'
>   728 |         port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MESON_CONSOLE);
>       |             ^~
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Now fixed, thanks.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
