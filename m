Return-Path: <SRS0=A5vq=MH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A47AC12002
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 02:05:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360BD613BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 02:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360BD613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4B9fYzoS5UjMHojuYlxU+uK94v1tIxX5H7tSvz/eJ0=; b=w3FZgOZGuM7O+9
	3wvazm8sAqufRyYQaFimXLATP4B9Bq+rC4g3RQVGqUGVUPbdnTf8B+Vx4oZNpvdWYNsm22VDkRB5L
	pN9BLpu1TY5UUorZfNjeYkTcyqRBRHo24PXuTJac/JDNVgIL6dPP4yOVkxkOdEZszOeMywYKFWRcS
	kG5kLAawtWbp5zzIlmPY+RF9PT7hcCy16vERqCiZo2QK03Ovbg/F4hFIXCMWbIfim5iK4/gWmNhNd
	xIaKjnZHd6XPq2xouXGlnvHj34A+HCQ6u54gqdPutP3vboegBGHQAApBszs7Ev5rumU9deLdel+a3
	lHAXBl+QPskjAIrLGOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3qkF-00GqF3-A3; Thu, 15 Jul 2021 02:04:59 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3qkC-00GqEZ-Qr
 for linux-amlogic@lists.infradead.org; Thu, 15 Jul 2021 02:04:58 +0000
Received: (qmail 398522 invoked by uid 1000); 14 Jul 2021 22:04:55 -0400
Date: Wed, 14 Jul 2021 22:04:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Message-ID: <20210715020455.GA398513@rowland.harvard.edu>
References: <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
 <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
 <20210715014451.GA397753@rowland.harvard.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715014451.GA397753@rowland.harvard.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_190457_061645_AE026E5E 
X-CRM114-Status: UNSURE (   5.97  )
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

On Wed, Jul 14, 2021 at 09:44:51PM -0400, Alan Stern wrote:
> Martin, here's another test you can try, on both the Odroid and PC 
> systems.  Boot with usb.autosuspend=-1 on the command line to disable 
> default runtime suspend.  But then before plugging in the drive, start a 
> usbmon trace and do:
> 
> 	echo 2 >/sys/bus/usb/devices/1-2/power/autosuspend

Oops, that should be 1-1, not 1-2.  As you would discover when running 
the command.

Alan Stern

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
