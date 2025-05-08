Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4CFC3ABCC
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 May 2025 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:Cc:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3cqJz3/dc+G22IVrzXHdJ6pfqnMAakuPW8jUnn27FA=; b=47cZ7+rBM4CRIG
	on09dz2THdaqI5lO8dIfrdb4aumGShJFzL36h2/CP7OcB27IXq/KIG5fywkAhFdjRUr5J7LWUf0Vl
	WfybR0c1Xu2B7JVzDSgdbpmuprI7wX1E0vD+99bfr4PiF0rI7bUd56F4TbR2JulHxNMJ1hR6VAqNE
	m+x4+njuhZ7SnRH7BlfKrc53CiSnx6kcQTcPca04ByH2j7XmZug/3cfRpouVJkPD8/8j7U101z799
	xRorROO4sReiQEGqcGwajtVdMy1z4gzCuWsdD8/1KrzjqwOhiMBc4jAWungK6yyb1Bge09jaclbMI
	kvY3jH6byhXNMRnl2pDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vo-00000001N6E-00n5;
	Thu, 08 May 2025 17:21:12 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD40U-00000001GtG-2mPM
	for linux-amlogic@lists.infradead.org;
	Thu, 08 May 2025 16:22:00 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746721313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HF3qtxM4GkzT4fveHtK2OKQDWeTf7B0vIqVn8VNER5A=;
	b=JGumOdy5Jtv+kWoz7HuxgXYP8LmUdY8CCioAcz7CKXSlPEem1Ium//58jz77RwsZoaesS6
	T6Mo8tTiK0MVH/Hnalc7XrrXJyi33p8nHK3fDO4foDRahyi+KUYPNxjpAosfe0qUQnusTR
	D/m6AXdmMHUcGIfAvun52sDsD9yLeghFWm/jo/g3CFHphwJy6U7ClmGJ6tfa9xrouKGnBX
	bz+n3A95mvzcyhg235MNh38dfWs4ypRLe53WNyT0uboi0+z6fMmBDkmzA92AiNrgDt4vXt
	B2tU2UbvI3Gu4aNRVfk5RC4rMF+f88OAnAzgKm3ukx8cbmdkyinYfRAPbfl/tA==
Date: Thu, 08 May 2025 16:21:20 +0000
Message-Id: <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <u-boot@lists.denx.de>, "u-boot-amlogic@groups.io"
 <u-boot-amlogic@groups.io>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>
To: "Wayne Schroeder" <raz@chewies.net>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
Subject: Re: Odroid n2+ usb broken on reboot
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com> <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com> <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org> <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
In-Reply-To: <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_092159_488368_17B14D70 
X-CRM114-Status: UNSURE (   4.40  )
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

On Wed May 7, 2025 at 1:03 PM UTC, Wayne Schroeder wrote:
> It's hard for me to quantify if usb works in u-boot as I'm not loading
> off of any usb storage devices.  It certainly never lets me use the
> keyboard to abort auto boot, and never has.  On reboot, to reliably

You can send bytes via UART to abort boot, if you happen to have a UART
adapter around.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
