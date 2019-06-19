Return-Path: <SRS0=5M87=US=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9115EC31E49
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2019 08:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233732080C
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2019 08:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qDCAFA5s";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="pjiczPUS";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="pjiczPUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233732080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aplu.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Twwx6FC0VEElEKdvpVPTMgSADD9PaPjJb5lZ2FbG0JQ=; b=qDCAFA5sMz4RASBLLT1R5dHo1
	g/vzPorTOOe/ADys0iT8Iebb6+zGTeVcNqik33ZaEQf24UJ29C2/dSFp+AjugqZ8ZI/nH2i0CFGQa
	JfOeHY/3LRT4BOfRgGi6PBLQnR/ZXW2ccyJJOTLYrRFRtjulogj+tOvlsIrgeC8RXOMsAQ9B0OuXA
	8gJxwM5R8thcIzwtyWGutd+AYMzszoepHrzCdEdd2NPmAajNfMKp+DGdJ6S91ytzsDVi7y21yWBrT
	Ouy/URDRghAqJc195FEMASZ5SQo/AGgCpW2/T7/+igci5sjX/QBYvKGgdUsKlqTKEONUpzL0BAnN5
	gJaRvkwRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdVq6-0002DD-7Y; Wed, 19 Jun 2019 08:21:06 +0000
Received: from eva.aplu.fr ([2a03:7220:8081:2900::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdVq2-000224-85
 for linux-amlogic@lists.infradead.org; Wed, 19 Jun 2019 08:21:04 +0000
Received: from eva.aplu.fr (localhost [127.0.0.1])
 by eva.aplu.fr (Postfix) with ESMTP id 4E76BE27;
 Wed, 19 Jun 2019 10:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560932443; bh=PhzqnKZKE11n2wzXx+gP6oRgiNP5TMJ/elYyUJ0Shn0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pjiczPUSA49y6inmjhCAr1qCDpxe93mpY+bGpYg64LAVGVOp8hlF71jAnNk8VNoPs
 8MfvPs8PxbgzNV1uZLeCv8oh5/EyZ5Qkd9a8AYh9CdlXz4knPoG7clrJsBV0UhmBIO
 GEoLYxxzkbNl5o6bEGlvQh/LLAyol//68hVADZ1O8Kqg91uxzxV95szjtz5oSs5ztq
 NgMKEbsFNuhvFOHf3MQGKna3VXwWXhVAbrT3kxk3L4gglw+gK0XRG4nYqC6jdiaDph
 QujFNRtihEORXrnel2+uPwpwxtggJJ0qLTOEg/dX/PRMrXPwgohdRKHfsS9NMQN/iU
 WqZso70yraS4jTC1OJ3/zCYf9Rn2sQR4jbIJxCA+eO/1Y43/z/mnMr5Y3JR+56FCDh
 WRrO4wiqMM2xpo2ZR5ZXpWG+ydYGBqzco6kKWy1GQofIlYYpEQRkB20ldDGkxkfA+L
 YEekaj4sLOmDsFg17J5GYoHvMKzOhwB5uLKbrW0syuF34bKE2EayyXQnmXfIwJsamy
 rlOBSZSNp8Mnj1/Zrb6IM58eSPe1hZv5WOXyBgzWelozWGCjj61UEts1y/A8/6k+GS
 a58/Uw3Bphq+v3xp74ZlSmNdVVXnKd5RozkwOO+FvBY4xdXRe/cDHfS8XW10qrPVdj
 1Utkowefm9P3QGNwbaWNEG8g=
Received: from mail.aplu.fr (localhost [IPv6:::1])
 by eva.aplu.fr (Postfix) with ESMTPA id F2CCFCB7;
 Wed, 19 Jun 2019 10:20:42 +0200 (CEST)
Authentication-Results: eva.aplu.fr;
 dmarc=fail (p=none dis=none) header.from=aplu.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560932443; bh=PhzqnKZKE11n2wzXx+gP6oRgiNP5TMJ/elYyUJ0Shn0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pjiczPUSA49y6inmjhCAr1qCDpxe93mpY+bGpYg64LAVGVOp8hlF71jAnNk8VNoPs
 8MfvPs8PxbgzNV1uZLeCv8oh5/EyZ5Qkd9a8AYh9CdlXz4knPoG7clrJsBV0UhmBIO
 GEoLYxxzkbNl5o6bEGlvQh/LLAyol//68hVADZ1O8Kqg91uxzxV95szjtz5oSs5ztq
 NgMKEbsFNuhvFOHf3MQGKna3VXwWXhVAbrT3kxk3L4gglw+gK0XRG4nYqC6jdiaDph
 QujFNRtihEORXrnel2+uPwpwxtggJJ0qLTOEg/dX/PRMrXPwgohdRKHfsS9NMQN/iU
 WqZso70yraS4jTC1OJ3/zCYf9Rn2sQR4jbIJxCA+eO/1Y43/z/mnMr5Y3JR+56FCDh
 WRrO4wiqMM2xpo2ZR5ZXpWG+ydYGBqzco6kKWy1GQofIlYYpEQRkB20ldDGkxkfA+L
 YEekaj4sLOmDsFg17J5GYoHvMKzOhwB5uLKbrW0syuF34bKE2EayyXQnmXfIwJsamy
 rlOBSZSNp8Mnj1/Zrb6IM58eSPe1hZv5WOXyBgzWelozWGCjj61UEts1y/A8/6k+GS
 a58/Uw3Bphq+v3xp74ZlSmNdVVXnKd5RozkwOO+FvBY4xdXRe/cDHfS8XW10qrPVdj
 1Utkowefm9P3QGNwbaWNEG8g=
MIME-Version: 1.0
Date: Wed, 19 Jun 2019 10:20:42 +0200
From: Aymeric <mulx@aplu.fr>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: Meson8b network not stable at gigabit
In-Reply-To: <CAFBinCDLaz4GebHgVo6P6C9ZtL5LtihVczAyuaRN+mnXKhHuzw@mail.gmail.com>
References: <2878d188-4c06-b1a3-4ba9-00a274cd2018@aplu.fr>
 <CAFBinCAV=UuX4vovuUqb+hs+sbHth4asQT_idBq2XiBKBeVbGw@mail.gmail.com>
 <c6684037-7d06-457e-2931-9e375128b2e7@aplu.fr>
 <CAFBinCDJ0oAhrficayP0aMWrUsasU-NT6RkGH3x1BLw8U3h6pA@mail.gmail.com>
 <22a14736-d363-f5a8-fdb3-fec5400cb6a8@aplu.fr>
 <CAFBinCDLaz4GebHgVo6P6C9ZtL5LtihVczAyuaRN+mnXKhHuzw@mail.gmail.com>
Message-ID: <b0e028410f5b0b21584fd654f8446edf@aplu.fr>
X-Sender: mulx@aplu.fr
User-Agent: Roundcube Webmail/1.2.9
X-AV-Checked: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_012102_727516_BD324A4D 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On 2019-06-17 21:36, Martin Blumenstingl wrote:
> Hi Aymeric,
> 
> too bad, that was the only "smart" idea I had.

No problem, that was more than me. :)

> 
> did see this issue with kernel versions earlier than 5.0 as well?
> then you can try to git bisect the cause

I've made a switch from 3.10 to 5.0.4 directly (and the issue was 
already there, I just didn't had time to report/investigate), so I don't 
know is the issue was present in any earlier version.

> 
> you can also send a similar mail to the netdev mailing list (please
> keep the Amogic list at least Cc'ed) and ask for help there
> the Amlogic SoCs use a DesignWare MAC (Ethernet controller, the driver
> is called stmmac) with a Relatek RTL8211F Ethernet PHY.
> there's little Amlogic specific registers involved: they mostly
> control the PHY interface (enabling RMII or RGMII) and the clocks
> so it's very likely that someone on the netdev list has an idea how to
> debug this because a large part of the Ethernet setup is not Amlogic
> SoC specific
> 

Okay, I'll do it by the end of the week!

BR,

Aymeric.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
