Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA8DC54EED
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Jan 2023 21:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VshprW5ije9O7KaW+G1ngxblck5kqZwD/6NsVu9sa0=; b=dkTvubDzWBpnze
	V5wUNeXX69h8CZcIs//qNA2nN1TPfB34lrsAasGnnXKQ/2cVAgbvIMt4apNypE/4+geVxYn0MBuMJ
	CAZ/B3H7mJYnADdYbZrFF2LBlbuPtpJ4AzZrhD+DWfGguAHjVro6hlQkw4XSvA04mBgDqrHd1jaZ6
	kEKd9Zqbi56PgUuG6XZA+wsqR/6LVProS0koZW8okBJcBq2EFhd0MBQ5PLJqIsIifFzR1Nsc5WcGd
	0cUlZ+14cf5rVAAAsPjLerss4QFpPw+I+VxM7U+p8vBoN1u8Cq6a9woG3VlgLHmPDEw15epYKAAII
	ZJYYUUWr0U3vxDJ0Nymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMFE3-001ufi-CY; Sun, 29 Jan 2023 21:28:35 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMFDs-001udu-Et; Sun, 29 Jan 2023 21:28:25 +0000
Received: by mail-qt1-x834.google.com with SMTP id d3so8528583qte.8;
        Sun, 29 Jan 2023 13:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vvsETFyAWEBQowq6cfHTnP7Iio5EX4ZyEImdco3L9U4=;
        b=e1K8fFc++/gRpxtRWLurMWIVlKZ44/MaW68q2jyzT1NJlIBjCu4+T3u38nxuZ1pyif
         TBKMcxVW9YYszG0sCmnBtzCDiiAiW8JTZmhkRyEH1L/aP2IWS+L+8OnRMkxoOUaaWfUx
         DPgQdgHPMVNrNLACCstxyv2uoAf75HFOlVbiesVGWFOhl9xLHrSMI+nboqVzyTfVtpPQ
         e5Qzd8rsoHXekX5D0d9rkzm5HHJ66I+/rrvCZzDcPCf2yI6k/5z+aVF5cN29D0mw0ZaG
         mCapxaCBWcyPU92yzgTlzM3gX+/0tAOeYHJDTmIAWKLAjqY1hZND45M5M3FEbFw1ERGb
         tqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvsETFyAWEBQowq6cfHTnP7Iio5EX4ZyEImdco3L9U4=;
        b=lzCVXu/5QR0NJJGM3rgH9HEW0hyoZRkIJW5rcgMulhHnMEGTw1b3E90rrBtAo8dwcO
         GPeljokT0yFYtNQCenH2TY5YrgSg7TVsvwg3CjOvWyWY49jS07Y1NGWr3WMnUA9fnViU
         b6+tcHvh6ikLQGCvtuyOr6nWqDx7LQXPFNzGj7Sde+q7OUjbIp0X+o3nJqksHcQoEU8i
         yBvh/MhgHXYBfT5eWC4UDjVQ1NK1Y8MHTjQPnIRL478MUPKmuXzAoHEfn4esPzNRiMJO
         HtHN+0GDPe9zonpKQAz99XFHNOqEmxtvzVCCB3Kzl/Gd0EADq9xGnne9Dbv2bOa65T1E
         U1kw==
X-Gm-Message-State: AFqh2koJ/DI4Coj/A8SD+CcdEBNknEf/0C2hee6CB9NFejz3MBS5S9Ek
	+NkUMzflsWgtJgWrvAJTaMw7qxE1qwaDgsrRylM4utlmyNc=
X-Google-Smtp-Source: AMrXdXtvz+/bcPwRJPRwHRp/fsg+vFrqOVg9xu75imb1lMxdG5Up9Mi1ulKxVQevv+9KfeGbTcwUQL4wWCEkIW6yf78=
X-Received: by 2002:a05:622a:183:b0:3b1:c62b:c140 with SMTP id
 s3-20020a05622a018300b003b1c62bc140mr2510656qtw.313.1675027703027; Sun, 29
 Jan 2023 13:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20230129022615.379711-1-cphealy@gmail.com> <Y9akLWJfigajMuQP@lunn.ch>
In-Reply-To: <Y9akLWJfigajMuQP@lunn.ch>
From: Chris Healy <cphealy@gmail.com>
Date: Sun, 29 Jan 2023 13:28:12 -0800
Message-ID: <CAFXsbZppb5tDxR9tO7RN76=rt04MdAUU16HhyNizJBtAXtq+fg@mail.gmail.com>
Subject: Re: [PATCH 1/1] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	neil.armstrong@linaro.org, khilman@baylibre.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jeremy.wang@amlogic.com, 
	Chris Healy <healych@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_132824_516230_579E628A 
X-CRM114-Status: GOOD (  17.88  )
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

On Sun, Jan 29, 2023 at 8:52 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sat, Jan 28, 2023 at 06:26:15PM -0800, Chris Healy wrote:
> > From: Chris Healy <healych@amazon.com>
> >
> > The Meson G12A Internal PHY does not support standard IEEE MMD extended
> > register access, therefore add generic dummy stubs to fail the read and
> > write MMD calls. This is necessary to prevent the core PHY code from
> > erroneously believing that EEE is supported by this PHY even though this
> > PHY does not support EEE, as MMD register access returns all FFFFs.
>
> Hi Chris
>
> This change in itself makes sense. But i wounder if we should also
> change phy_init_eee(). It reads the EEE Ability register. The 2018
> version of the standard indicates the top two bits are reserved and
> should be zero. We also don't have any PHY which supports 100GBase-R
> through to 100Base-TX. So a read of 0xffff suggests the PHY does not
> support EEE and returning -EPROTONOSUPPORT would be good.
>
This seems like a good change to make in phy_init_eee().  I should be
able to do this.  Can this be done in a subsequent patch or does this
need to be present to land this meson specific PHY patch?

>         Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
