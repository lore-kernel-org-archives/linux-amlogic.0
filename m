Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4512C64EB4
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 18:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991D820834
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 18:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtMgx/RS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991D820834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rt.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:
	Message-ID:References:In-Reply-To:From:Subject:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekFp+/2JMfee+1QzRM2RzaqnWz1cuMGHov9Nlbjnm7U=; b=qtMgx/RS/nGhRY
	EwasrkKszhz0xSPIhKdrIX7oSXYP+f4w/ajqjHajsO8Dx00cFHL6DHbyQLkotgdxll26qhMyYHPaU
	uuSdhObVXCtw2aIsMttLm23vsAtYlFYU+6uQdqX8K1SJad3TonwEx5RDQ7gvHmKW+6FBF88Wqiwq7
	yrum/tLvRLcKzQoXQ1J6HBMbdHkL0xkr3EgQsIw6dceV/M2iRTguX+q4/sRWW3PLh7LQYDeXRwWCe
	NJgs0B11OpIUvge+3QQR+1E2hQ21ca3KjX1pTeTlzdK11BnF/DQcKk+eqCxouLEj52SmA8VEsuaQe
	PfJOJfWTytvAcj1izPjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSnDa-0002Os-5x; Fri, 30 Nov 2018 18:08:46 +0000
Received: from smtp1.linuxfoundation.org ([140.211.169.13])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSnDX-0002Mz-BQ
 for linux-amlogic@lists.infradead.org; Fri, 30 Nov 2018 18:08:44 +0000
Received: from rt.cvo.linuxfoundation.org (rt.cvo.linuxfoundation.org
 [172.17.192.131])
 by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 56DAE852;
 Fri, 30 Nov 2018 18:08:32 +0000 (UTC)
Received: by rt.cvo.linuxfoundation.org (Postfix, from userid 48)
 id 4FAB570D; Fri, 30 Nov 2018 18:08:32 +0000 (UTC)
Subject: Re: [Kernel.org Helpdesk #64693] addition of linux-amlogic to lore
From: "Konstantin Ryabitsev via RT" <kernel-helpdesk@rt.linuxfoundation.org>
In-Reply-To: <20181130180826.GA15992@chatter.qube.local>
References: <RT-Ticket-64693@linuxfoundation> <7h36rj8pqe.fsf@baylibre.com>
 <rt-4.4.0-21103-1543531709-776.64693-4-0@linuxfoundation>
 <20181130180826.GA15992@chatter.qube.local>
Message-ID: <rt-4.4.0-6780-1543601312-640.64693-6-0@linuxfoundation>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #64693
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: konstantin@linuxfoundation.org
To: khilman@baylibre.com
X-RT-Original-Encoding: utf-8
Precedence: bulk
Date: Fri, 30 Nov 2018 13:08:32 -0500
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_100843_408496_82CDD033 
X-CRM114-Status: UNSURE (   4.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Nov 29, 2018 at 05:48:29PM -0500, Kevin Hilman via RT wrote:
>Can we add linux-amlogic to the lore archives please?
>
>It's hosted on infradead, so should be easy to import from pipermail:
>
>   http://lists.infradead.org/pipermail/linux-amlogic/

Archives have been imported and the list archive is now available at 
https://lore.kernel.org/linux-amlogic/

Best,
-K


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
