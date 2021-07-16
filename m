Return-Path: <SRS0=nqA+=MI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35422C636CA
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 08:24:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AAC7613E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 08:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AAC7613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptC8HiOTkqP2dmTzys6u0tcU9TBeNyxHAYM72c+Wnuc=; b=SCvQFUKeqXI+Pd
	2Jwx/6gMxHM+GlL1cyYwXZGodbRiF1cIy0RQf9uR3iRWQEKCPVw/rQIMOhT1BWRVQx5Lq8fq9slT3
	+DbOZUSvkd6yd9EG1svabgGP85e/GhEhSgxvIGAt19DGMUhabuECD8VYDurq9SyunwCBBUSzshikd
	jCQyfoFvrzfO2YwCc8IKAiKAWbPJcVk17zhgh4833Eg2qCobwfRvsGuu+SjM/mkF7KHBAmqTEFhgy
	s4N2msGCy3UVopB9aj3BXDof7VTrvCJKuY1FLahmmntYbqGQxcGAawRsJ9fCDd+g259Z2voW++n2h
	Ah/9G1DCCd2qw/yXPMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4J8n-003i7J-1P; Fri, 16 Jul 2021 08:24:13 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4J8k-003i5M-4B; Fri, 16 Jul 2021 08:24:11 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 0894EC65B9; Fri, 16 Jul 2021 09:24:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1626423846; bh=k4GV0GyL3ss27o/H8GNejAFIH+XbYUndAcIjCC5L3s4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P3O4/mlSQPw+CSbX13SWksOS8UAwp1Lh+QLjaMXCjvYFKitLQQSNAqSO20WtJHPPe
 aiydCsjegm81mLgM84FLrRBk/hnymcloU1EUeRcRs+4s9fC3xB/x9sZuPk+JITlR1f
 J82igZN51I+16tN0UtumrXDfkbn9cAcU4bVqVgwS5N4KGz+uUDTJYRbhDIB8wfwOB6
 DvnP4ABtNJ2ST682LTafKe4pQEMhtufXC831QFu3RwfHKc2/7aLYw4kOSl8PEqBE0U
 nzXZl42EpJRk7ZBW6FW/JJgu3z/UjKuWDR7VrehEP90Lco3uEqNTF9AJo1aSx/ozf2
 WF3YnLyyzpzzA==
Date: Fri, 16 Jul 2021 09:24:05 +0100
From: Sean Young <sean@mess.org>
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: mchehab@kernel.org, robh+dt@kernel.org, khilman@baylibre.com,
 narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, rockosov@gmail.com
Subject: Re: [PATCH v5 2/2] media: rc: introduce Meson IR TX driver
Message-ID: <20210716082405.GA30719@gofer.mess.org>
References: <20210714212706.24945-1-viktor.prutyanov@phystech.edu>
 <20210714212706.24945-3-viktor.prutyanov@phystech.edu>
 <20210715214001.GA25809@gofer.mess.org>
 <20210716013652.248bce6f@192.168.1.3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716013652.248bce6f@192.168.1.3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_012410_348268_C0E06C65 
X-CRM114-Status: GOOD (  26.22  )
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

Hi Viktor,

On Fri, Jul 16, 2021 at 01:36:52AM +0300, Viktor Prutyanov wrote:
> Hi Sean,
> 
> On Thu, 15 Jul 2021 22:40:01 +0100
> Sean Young <sean@mess.org> wrote:
> 
> > On Thu, Jul 15, 2021 at 12:27:06AM +0300, Viktor Prutyanov wrote:
 > > +	meson_irtx_fill_buf(ir, tx_buf, buf, len);
> > > +	dev_dbg(ir->dev, "TX buffer filled, length = %u\n", len);
> > > +
> > > +	spin_lock_irqsave(&ir->lock, flags);
> > > +	meson_irtx_update_buf(ir, tx_buf, len, 0);
> > > +	reinit_completion(&ir->completion);
> > > +	meson_irtx_send_buffer(ir);
> > > +	spin_unlock_irqrestore(&ir->lock, flags);
> > > +
> > > +	ret = wait_for_completion_interruptible(&ir->completion);
> > > +	dev_dbg(ir->dev, "TX %s\n", ret ? "interrupted" :
> > > "completed");  
> > 
> > Here two things can happen. One is, the process received a signal
> > (e.g. ^C). The other is that the hardware didn't issue any interrupts
> > due some problem somewhere. In the latter case, we only escape this
> > wait_for_completion_interruptable() when the user gets fed up and
> > presses ^C or something like that.
> > 
> > > +
> > > +	spin_lock_irqsave(&ir->lock, flags);
> > > +	kfree(ir->buf);
> > > +	meson_irtx_update_buf(ir, NULL, 0, 0);
> > > +	spin_unlock_irqrestore(&ir->lock, flags);  
> > 
> > Now it is possible that the buffer gets cleared before that IR was
> > sent, if the signal was received early enough. This means not all the
> > Tx was completed.
> > 
> > > +
> > > +	return len;  
> > 
> > Yet, we always return success.
> > 
> > In case no interrupts were generated we should return an error in a
> > timely manner, so the wait_for_completion() needs the timeout. You
> > can use the fact that the IR is never longer IR_MAX_DURATION (half a
> > second currently). Not sure what the returned error should be, maybe
> > -ETIMEDOUT?
> 
> As for me, ETIMEDOUT is OK.
> > 
> > The problem with the interruptable wait is that a process can receive
> > a signal at any time, and now when this happens your IR gets
> > truncated. I don't think this is what you want.
> 
> Should I replace wait_for_completion_interruptible by
> wait_for_completion_timeout in order to wait in uninterruptible way?

Yes, the process can receive a signal if the terminal is resized
(SIGWINCH) or if the process is backgrounded and then foregrounded with
^Z and fg (SIGCONT). If this happens during tx then the tx might be
incomplete.

Thanks,

Sean

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
