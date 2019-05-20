Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947B5C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:52:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE83206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BRc00rrL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Y0ZsEHVp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE83206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhse+bbYctNjYLtWbSlxdi1zEy7M33F896T3ksZiwuY=; b=BRc00rrLWE7A9n
	nNtdnXdxixTe8qA009qk/S/BARDueVTeEPQ3o9em3KSBjA6VnQGEmC2AuHfI1kUMNvbNLYwu3vgni
	J3GSwBcDVN6TyuyHl5jEuGTLNivX4Ckq5pgwkNuEJEhRexB19tmDq8GcwPwvDac+pbWyI53vS7ul0
	UnFjUM9Lq84xL+HC3zH2FuphaPI5i/bmGy2CZb3ES82vjhqQF+PZg5tRrhnoCXjVXVzPv0PCloocA
	yimxPjlDF5eKjdK1AJO23GMD5NP9ogBEDTOcuWCzm/elTEw2uor2r3RKygbJ/+t22fioI+cz2yzMb
	hjPTkfZD+Fn+RYtBu5LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmSm-0005Y6-DA; Mon, 20 May 2019 17:52:40 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmSk-0005Xc-0H; Mon, 20 May 2019 17:52:39 +0000
Received: by mail-ot1-x342.google.com with SMTP id 66so13849757otq.0;
 Mon, 20 May 2019 10:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCYkZ5M+DBQgIFJKIayxK6zD6QbZvJ7bD4zbXBwyRpg=;
 b=Y0ZsEHVpoxgSUFIfwTB7pzDHjHGpHMDMbyua0ENJz7KIRBOcTnPfVSz6MQym1RT50/
 q/69sL2xw4KTqicatOgiKfefuy2ZJm1MrpGBnIzItm8RFVtj0kvioVcudPjdOLNKLCPL
 8zCUimTU+hEALkirtzA3R3/6MvIUnrx5GXSBgmfJzMIWa2kcs0ZrUXIojX18lGHzQBhD
 qlJEatnohUpRB+vUpQxCpNo/CeYotKqN3Y/NeKqK2fzu/cb4IRO9/7ZJkqPWAWHkHvJp
 KIoHB0rqpm81BATx4rjRTn/n0RMoNSG6ujfYgcXJwMQrAX0+gkuXJ+k5L0MNhgUgYaDn
 7N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCYkZ5M+DBQgIFJKIayxK6zD6QbZvJ7bD4zbXBwyRpg=;
 b=hTnxRmdqaXpMJC2MEyV8E1tS0/xq3ECBsFXLBNQbA7egYuA5v/zetUKe1x5kEjYvx6
 +yUtIQiKgrEE/L9irDVm68Kckpesdo++VlTEeaROc4vkx7CN9O55BaXSQ/mjkMopiUgF
 7rTbK9lDQyv2YepHY8lz6gp9SS8MQAApMG7fVG9vU4cjp8Uh4dplGG97D3Gd2uFG2mn8
 9hx3RhG+OCDcPSGY6HX/uZf8AkR+3HaGrSw/Yn4j6zurCCJmETomquyfuq3IBxcjAP7m
 cY2KsdQ9vaoUUwcif82ziPYZBXWYTYPV6obZ/ulRRB4Ev1eGmwE+bCqE0E1tE/+f3iDo
 INkw==
X-Gm-Message-State: APjAAAWqYkPIasMxUmLOEW6W5V4x7Ong/UvMb/Hvmr6ve1oGxZ2+NhhC
 nuWg7/M3RjcbbJ1zYJGN7DkNW/IPpxC8WTRR4gynuqkla9Y=
X-Google-Smtp-Source: APXvYqyldFSFE6fn2yQPf1T1K5Er6qeZRNRO8KFH313crHAJiQ1EFivfC1Dboq6ILQFWTm5vdRbbR+xOAqmaN/myM5A=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr45229266otb.42.1558374757110; 
 Mon, 20 May 2019 10:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190520134817.25435-1-narmstrong@baylibre.com>
 <20190520134817.25435-3-narmstrong@baylibre.com>
In-Reply-To: <20190520134817.25435-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:52:26 +0200
Message-ID: <CAFBinCBmgTdZBDd5D_rCVQwO4UcJpXjX=Rc+0qgADF9sW-wFWQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: meson: g12a: add drive strength for eth
 pins
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_105238_048764_CEBEEB44 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 3:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> With the X96 Max board using an external Gigabit Ethernet PHY,
> add the same driver strength to the Ethernet pins as the vendor
> tree.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Amlogic's vendor kernel (from buildroot-openlinux-A113-201901) does the same so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
