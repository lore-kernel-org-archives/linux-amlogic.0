Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36AEC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 20:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSUkquXsZ47z+VtWH2AejfRosVtUNg0MbNJPeRh860I=; b=dcjEmLI1uCct+D
	vChQBc1Q0TN+kVCsSIKlWAxXBXk9Nfhds+2S/DEvLQGojc+2tQ1dKC8PS3U8zchRyHaYXiQz/ekDM
	9Oo/7BmV6F3RyPYxPy/tGj1iB5SB8cvKsornDMs8N8zp8DmqvYE+HRpXsQKCzVYptAlnm8oxfbcu8
	GbDvBGgzVe4iV086xNfZvMw36xZsW4CAnPSp14mHtGp6S9xTaeF55rVNapPjhlQr9y+E3ialUzSJr
	J/3G7zh/jW99qagCZZCmFmOp3rsXMkJq1a6hC8Qp7VUfev8u/KnhAbXW7SzPvF12lQTTd/A7Ucwf1
	uENhIlja0P6R8t5v14iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwVhq-007E8X-Bw; Sun, 12 Dec 2021 20:44:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwVhn-007E7s-J6
 for linux-amlogic@lists.infradead.org; Sun, 12 Dec 2021 20:44:24 +0000
Received: by mail-ed1-x52c.google.com with SMTP id e3so46733109edu.4
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Dec 2021 12:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GXgQgWZOt5Lcd8tcpSKbzedZtLgdrih2cq1/keXFtPE=;
 b=L7nAQLMJOL6Hq5grsZF2AlyaDdFjp4lq/O6Zic2EMxi0260c8TvRhC7fHhco/k/jgT
 sWOiiaRamLrRQxLqRcRPmm3i1iV4+HdxvKWgrZX94jXQFX/LLitz6mIPm3kFf0HFa9GM
 GGZC5ePi7UyU5L/KFa6J1TeLcBgqB7INckcVgZJoslWTIcNrmyPzAWEgNR86B0+ZTne1
 cUU65FfwSkv0j82+cGXV4AnS7CeC9rltDfyWxdmZ5UFqpZCaZTpdXHAaaCEt6obiDVcj
 FS2kh6tYKcSLUzsXQX09T9RCDrGPwKLbhtUXzE+SKIzle3PmF7ZRCZ60La8mQsb5PKRc
 M7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GXgQgWZOt5Lcd8tcpSKbzedZtLgdrih2cq1/keXFtPE=;
 b=MN6TIaFUpRShEAAqOXtOKhvPnhLEJsMH4XSJowgF5qBj61i95judptZfALbiFfn/Gk
 AChI+1MLb9OrMRefROTIvaeZYN7MKSmqfRXG4kHzGUFS3io1UHU7KFd6UJgfrG2p2OJx
 LLdJQQ3jsX2Lf2mO41x+jUUAMJstWxzwAbyU0MBX3nB2b6iTHoLJbWY359cfQbGR3xz2
 ob/YkOrnGyu+jdmSB2nSfTdhO9LorQmZiEl1M3BW3Z5QDW8AAZK4QPk4UXTBZhJVaKwN
 GpqhAqnDbnnrInor2VIAppfimCK+eI1vXAQUl/U1bx3IUVZuhfRGEQxid5ndoowvyfmF
 ShZA==
X-Gm-Message-State: AOAM532783QGgiIgfJVviJL9fefL7YV4Sgdu1PgVzJUooN26TTBx4MU1
 7Wm1we/AuowTWGna1Sx7QiY8lqFgmXbs1cWxbGY=
X-Google-Smtp-Source: ABdhPJzd9TJQxEj/IUeKFluoqBBNCf+I+jyNuTmqEgQoBDo5oMC03OGm1ZEbULxErDuYoX+13MJUJIn2b4UjzQ+DZtk=
X-Received: by 2002:a17:907:75d3:: with SMTP id
 jl19mr39883954ejc.520.1639341862137; 
 Sun, 12 Dec 2021 12:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20211212201844.114949-1-aouledameur@baylibre.com>
 <20211212201844.114949-2-aouledameur@baylibre.com>
In-Reply-To: <20211212201844.114949-2-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Dec 2021 21:44:11 +0100
Message-ID: <CAFBinCDZw2Zxj5U_x8=EOmh1DX22vVbLwyDHvOYkLiSmuY7YDw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org, 
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_124423_654716_17C45F26 
X-CRM114-Status: UNSURE (   8.53  )
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

On Sun, Dec 12, 2021 at 9:20 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Use reset_control_rearm() call if an error occurs in case
> phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
> phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
> and the reset line may be triggered again by other devices.
>
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework. Therefore, use of reset_control_reset() on shared reset line
> should be balanced with reset_control_rearm().
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
