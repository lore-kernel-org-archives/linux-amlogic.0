Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EF7C32753
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 14:08:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B713920679
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 14:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eBWQmsEb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="StxsIr6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B713920679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqrMSSceOrOWe6aZJqcgz5fXgPzUKx/KLDUoHZRaM4Y=; b=eBWQmsEbYFEb3S
	b5ab6E1eqn+K5RzvfJzsyj/v8eW9wKSsVBO+7C3OzGNY6FPvEGUmweKvzKoYC7diuELrFQHOJkc/m
	izeslRVH7pdnzifBMO7/bqVOzAvE6YgwFMdpnSeCDiyg8DCihN8drKiFybKFornq0MVuamA39QOnQ
	YfhwtBQmxbUmHukCkZai0nA1MsMA3VWSPoqf+y0VTqE/PMme0v5VfhI4dgyOH7Ud6nQm+DtrsA4Z7
	gtuO5K5zC8fVFeeSIu1SlCNGk5AqmOkQtGDWNbywpEKh8ZBkVqvW5ztdvyy3usWBt4cSqeBCkQ4p3
	6+LeffCnOU1J0woaJYrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htBlD-0008Sz-BF; Thu, 01 Aug 2019 14:08:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htBkt-000829-1r; Thu, 01 Aug 2019 14:08:32 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB90F216C8;
 Thu,  1 Aug 2019 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564668510;
 bh=1JyIuK4+07z6r13siyUfFBNIhbSOLStvyEv7aTDiL0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=StxsIr6kJab04Mv9+dIISaCW/YlcJEl4jG36/0vq1ghI0VDL1estEscC9HdwV7Ryo
 lk253CwRrVHhvp6pmUpMEXKeRisNnD72x1zxZCVk8dMlisZ/99kbMUJ2x51u9S8p4e
 lhSfUxcSOKqPQQmWavnemeulitgk4N1O8AktIVtA=
Date: Thu, 1 Aug 2019 16:08:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 8/9] dt-bindings: serial: meson-uart: convert to yaml
Message-ID: <20190801140825.GC31375@kroah.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-9-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801135644.12843-9-narmstrong@baylibre.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_070831_131977_EDA1B1DB 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 01, 2019 at 03:56:43PM +0200, Neil Armstrong wrote:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

I can't take patches without any changelog text, sorry.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
