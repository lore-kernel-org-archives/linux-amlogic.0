Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD5EC47420
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:47:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 421AC20717
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 16:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3KB15yM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U9roYUn5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9muHe3UO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 421AC20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AZO0sOY0TzrEyIO8h4X3E8NvqxO3g6nl7neXTxP4eRE=; b=Q3KB15yMV8QSX/T8lh610Laq9
	c4zYmYxDKrXQ6xs6fwFP+2neftJbUV57TAxIf5vx65jtXqHJszA91EWV50mt+kT7LNezv/zRNgoOD
	IEUNs9WmzRhgm66qC/4L9CYThtfeYN7vYTM/l2WQmscX2TnIfk91sd2Vc1TsPMx2EsOfBTILsYNBw
	dEJ6CUQZicLZeO6zXPNw1LGhPu1pc/+vQ0O3Ap1l2uuI7KXO4XIaEUzYLDsSKXzV2Ezg3xYAmOqq/
	ZdcIGrUPQ5AbALvbOsBN3QpSUs4YwBM/dsQ7MKmVpoRuLthbsZE+HlsTt+ePhwvsZOi7DatuynBho
	NhrpsJXeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMwIr-00061L-Oe; Mon, 28 Sep 2020 16:47:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMwDU-0003Bk-AB; Mon, 28 Sep 2020 16:41:33 +0000
Date: Mon, 28 Sep 2020 18:41:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601311287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GAgEtkWOwW2XJjw9x5CH75TnzqewgBMgplMvDXtZOUg=;
 b=U9roYUn5oRUKLV98VFKLQRDZa2THE0tI/VxOfDcoZob8aEtU+uK8X6mad6XoV+4lOUEL6S
 ZenvgWtZBjBkFq2G8h/KUMAcgl+xK5QAgS6Dc2L7CUDvMxpdj8TYIbb8SyolvaDWLuhPhF
 tsUdWWnsQlxoAQdikJ1LkIK72C96XBLvuw/NeAn3JaDpFopiHWfh0bhbwyuB2FRbZm6FD8
 ywpby40K8i/3gpwjtW306ebO6MuyqoWOH1Ec4iMhzdqcdrsdP4xu1fWcoW7sSy5tntol+E
 2fdGmM33cBaXP3al8YQBklOFbvxW7r3IUZhKAnZS2mRqbvu4RcZjdmpv5GmniQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601311287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GAgEtkWOwW2XJjw9x5CH75TnzqewgBMgplMvDXtZOUg=;
 b=9muHe3UOQGOo71zVollt05yEo3qA2Dmg3FJhXmwRWLZu5JDPa+6CRABDbPi0jA8RrCBjTx
 CNkdQjaRUfvFpfAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Brad Harper <bjharper@gmail.com>
Subject: Re: [PATCH v2 1/1] mmc: host: meson-gx-mmc: fix possible deadlock
 condition for preempt_rt
Message-ID: <20200928164126.57bszuobd5tt4xdu@linutronix.de>
References: <20200927025418.12382-1-bjharper@gmail.com>
 <20200927025418.12382-2-bjharper@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200927025418.12382-2-bjharper@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_124132_498709_81908732 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-rt-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-09-26 22:54:18 [-0400], Brad Harper wrote:
> ---

What happens if you boot this on a non-RT kernel with the `threadirqs'
command line option?

Sebastian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
