Return-Path: <SRS0=9KOL=XH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D130C49ED9
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2019 09:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406672084F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2019 09:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1ntVdFR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AdeQBBjy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 406672084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftCJj3stibkahWd42AAwC+1eCd/M3EfgWEl8nC0j2ko=; b=G1ntVdFRD9L8N6
	jld8KECkRdltUaoydI6P4kq9ihXrMKYWa31dIEMJc+9VjZoD/2wEu1ar0AUiVyzgC1n3GC0KdbCh4
	an6RrlkRmkwOzpi5+Fvi3CBAVOQq2hB9Y29RHrEvLMgQHQp+SWiXgTr460+3Di9Nq+GnF5qq0eSih
	AB4eLyYuyI9jA04orxq/WDiZ6M7gY2hn9nh0UWcScjwJ+CdaPg4JjC9dqtWbLtGR21V/QeM9UF+B1
	hfRKthx6W2+js1I6FKa3BZntQTm5eeHtKqCgEajy7p1hYTBFdiK8neoAVD9+magSvzlj1PD8pByR9
	zRg3DWXuGCRpgOizGd1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8LIX-000348-Mv; Thu, 12 Sep 2019 09:21:53 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8LIU-00033N-Ly
 for linux-amlogic@lists.infradead.org; Thu, 12 Sep 2019 09:21:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id t8so18705173lfc.13
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2019 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cWbAmMUJiY4SaUXIYl1Pgpjy5EqqAYfJcgipoXnRTYE=;
 b=AdeQBBjy6CL4VP/0PlsP6CszN1UMsI32sHf9+jhrLCw9n+HVEKlEbvGqTY021gpHvV
 pyfLTPZ8qa3WJ969gKBL9quwpznQFuIJsMvOiAmk+nGsfWqxn5xfRIhPA0vnyma/IxDd
 kZO1BcdnNJjN/wGSNNND/aCfOd2cMGpiq97ol7SVvnxXZ2hFSgKWMYI9th0BQlsbsnsy
 vIBpUI1WuXg6gnYHakgGbqH7zH0sBB6BjvBPN77lpPQrmb+thij5zFwcLKoFXvpJUnKB
 MAVMuG7O8tBqxAdxHVK6Vn82GFAk5B0qFUVybzxm2IlkMVaMvQNAfB7uDS2HI7dbE/vM
 l0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cWbAmMUJiY4SaUXIYl1Pgpjy5EqqAYfJcgipoXnRTYE=;
 b=CvKgYq2wN6s8B1n+AG2OJe7HmJr6+4Qqrku/IzPizy+hU+77LVCwVuBHzz1NmdoV/f
 ZC/NNIAzAekg5VK0xbV0Czdk58OMDC0OlhrFGUhA46xy6gHuFyZyubbSho9FVvkAuojM
 DWA5NrOJc0ZzYbIQAg0JJIVM29rjslBi7ZqmKFhznR6//L/UJrcQPfg3XUe5/GbPaibm
 xD/qOYvXOPyULtLE2/XF7nBCfZpyljSVCUh9+EltIIR1P4t7u1LBFYBwcHcGLqZ+aGHx
 ljZYkiUhaeL2pHiw2sU85qM3dDNndX+wk6bGiRkPpRmqdYnVWYZocgaXyfHuN5rOVilC
 xlAg==
X-Gm-Message-State: APjAAAVurUzL13qHuAmjlh9RBRM4FNQpLzg7fzmtqHk0vD3YMBin3pZU
 uvOGjqappad2Mv8jSBUn6Kn5vLrwlJNHKlrsMfmZgQ==
X-Google-Smtp-Source: APXvYqy8wCgVEJmrY9znr0K+2GgttgH/5CMv7j/yFWMaCet7QyhGODz5XCya6F+CNCIqXd1oVc6o6Qx/zcl3krZnuU4=
X-Received: by 2002:a19:48c3:: with SMTP id
 v186mr27193881lfa.141.1568280108846; 
 Thu, 12 Sep 2019 02:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <1cc32a18-464d-5531-7a1c-084390e2ecb1@gmx.net>
In-Reply-To: <1cc32a18-464d-5531-7a1c-084390e2ecb1@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Sep 2019 10:21:37 +0100
Message-ID: <CACRpkdY=Jema8LmeF_k47gQsdxTHPi5sVCYM3ihe47=bw6K4cQ@mail.gmail.com>
Subject: Re: [BUG] wrong pinning definition or uart_c in pinctrl-meson-gxbb.c
To: Otto Meier <gf435@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190912_022150_726921_19D0E1F5 
X-CRM114-Status: GOOD (  10.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 10, 2019 at 5:01 PM Otto Meier <gf435@gmx.net> wrote:

> Hi i tried to use the uart_C of the the odroid-c2.
>
> I enabled it in the dts file. During boot it crashed when the
> the sdcard slot is addressed.
>
> After long search in the net i found this:
>
> https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856
>
> After changing the pin definitions accordingly erverything works.
> Uart_c is functioning and sdcard ist working.
>
>
> Fixes: 6db0f3a8a04e46 ("pinctrl: amlogic: gxbb: add more UART pins")
> Signed-off-by: Otto Meiergf435@gmx.net

Looks like a simple fix to me, Martin could you take a look?

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
