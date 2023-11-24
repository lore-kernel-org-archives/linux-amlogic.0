Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD27BC61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pm3rTJGOusswaPAkywyJkLGNjRjhERVzuPtkFDthNmg=; b=DBiOki6XVW0X3Z
	ddkOzJ7Qu0Lj28c7m3ApKT87x5guxay7kCPeqlBmJPVKVbCjrzOS4PzixQrSQFNr8nnLYlwE5YwIQ
	MQMp/0AnDlvcFyQT3CYDYHxmnTVxyVORQd5RDLQgEEb2Fe3dJGRO4e/ig5ZASXGwXEBjGqwqe6L+h
	SebD1gsum0kZEHWVzPv+nB3xC5yyWaZxt3DVDIdIyexN29rwtFSkeBmDjzcvM7jFgrfS7Me6VZVDy
	XVRA5RiHV4/l76KrFnCrbTIxIhDxWQs2Z+Q5f8MZyzk6kzge+25fFkKiGDgBIJ0aBMhECKZX0rmZy
	xV2KQEUIhLpTuqvbrXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6c20-007xdj-18;
	Fri, 24 Nov 2023 19:40:04 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6c1x-007xby-19
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 19:40:02 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-462d0491c29so501355137.0
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 11:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700854795; x=1701459595; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IFaoM2nPbmC77v3546G+DOzaGeOySECW/jienI0R7po=;
        b=ZqywvMkmj/s/FzPH1dI0RvPNfO8XI93vhROCFM2cwU28Ed1fCniZlWwDq9PuMSw5Gj
         BoktCQomKJtkgBKG/KmEPCWJZY/eibLCzEcgH8m2j9UqVoF4f91HyTpZ2y41Khnosp1j
         oJlmKeak6NTbvOvZWEeFt6UFg73x3XiqRHIbHHkXqyXc8C/U/IO/WzaZLOhzmcJSZHKV
         EAqPF4iRxfvhJymCuUzIjziwJKB8qM3r10LcfM83Lkm41POaBcZDI8ZM9C+rQKpbiJPK
         HW562a3HutkUtDl17twxRBWMTUfK8HKY7YjkZ+6mi377M8jOYzBY2pdfWJh5vK6yFBSB
         tEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700854795; x=1701459595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFaoM2nPbmC77v3546G+DOzaGeOySECW/jienI0R7po=;
        b=glYXTdsDzmqKqh33ME5QL6LL/mGX0iGFVoqsYFeg1+8GSjXlol7aam45/Hbu/CpQoc
         WmMYzo+J5rb2+t3Beqy6i72k0MmZXEYO9rlV9bQJAN4rxN+VRZ/3Nqbo6JMOGVpfieHp
         9jVutxQZS1STRpFeLcuOUhtveLyf9wO1qzJPZsijtQ8MehCyv8NeJJIj6hnj72aZSAs3
         Y3W6LcHvBghp33ORBeMLmKcPzN48Omo9kQ1KgEG4fu6+dXCC8LuV3ecKdt3PjIDgJGLg
         uKMX/kuJafUZWn5PrGpUACoAx8xq4QwIleyMhmJhPvt3UqROR3Py+hSyjOSaIzbXB3VO
         NHZg==
X-Gm-Message-State: AOJu0YwRUJUGOWBV5UnlcJGASq7xY0G2R3Wl2KPdUCKzRmJyXNSq9/QT
	eSatsMDlm3xKrNNbZfPYVT9O/MOgcCn/EYUxoCuNOQ==
X-Google-Smtp-Source: AGHT+IGE2G3fpION1Xr2Bdv7ckqaMoBQrZm3R4iwiuD1S/Gq234WQt/q1WgcB8s0vAQggepOJ+sFLXYnm7wW+HS0NTg=
X-Received: by 2002:a67:af01:0:b0:462:ac9d:fffb with SMTP id
 v1-20020a67af01000000b00462ac9dfffbmr4041899vsl.13.1700854795287; Fri, 24 Nov
 2023 11:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20231124171941.909624388@linuxfoundation.org>
In-Reply-To: <20231124171941.909624388@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 25 Nov 2023 01:09:43 +0530
Message-ID: <CA+G9fYuVgqVc57YAwfA8MK6_Q86wD=RznCYKHDf_tD3foM9Y5w@mail.gmail.com>
Subject: Re: [PATCH 5.4 000/159] 5.4.262-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, dima@arista.com, 
	linux-amlogic@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_114001_394739_43637408 
X-CRM114-Status: GOOD (  15.52  )
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

On Sat, 25 Nov 2023 at 00:52, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.262 release.
> There are 159 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 26 Nov 2023 17:19:17 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.262-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


As Daniel replied on 4.19 build failures,
Following build warning / errors occurred on arm and arm64 on the
stable-rc linux.5.4.y and linux-4.19.y.

tty/serial: Migrate meson_uart to use has_sysrq
[ Upstream commit dca3ac8d3bc9436eb5fd35b80cdcad762fbfa518 ]

drivers/tty/serial/meson_uart.c: In function 'meson_uart_probe':
drivers/tty/serial/meson_uart.c:728:13: error: 'struct uart_port' has
no member named 'has_sysrq'
  728 |         port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MESON_CONSOLE);
      |             ^~

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
