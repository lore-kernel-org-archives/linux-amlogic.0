Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA17CDB46E
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZjxTBINbq1aZ+kvhtfgl1Fa3tjX9Ka3xb8CKcz06IM=; b=UHZGm8GC8xD5pJ
	kHiOljKTlLfLDDRjeWiV4H+e0BxR1BTvLuwuPPHKkQM0/gFqp+opE1PChRAr/cHZU+EG70WMsxpOU
	A6vKQha3cShSEfV/dBey6lwfbt8elcrQIfhfRMBUlhJ14ZXhY5O0iybaHltIiM94loyaf7fvQXIf8
	g9FR151eW8DY7g6mzB9imkDJLfRSmNRCRyBdgt61pnjDOZaap/TeTsmimDHzXbmOeVHlMJJiMGk3p
	nlI/BEr/OzSAFjLqYLfeYXjJuzJ1n3gujg4Y6gTDgnSpp2nCohWM7BPib+/SoRVrtppQ312JIq2vR
	mXEhQN0SIcS6JG58QlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvlT-00156o-1C;
	Thu, 12 Oct 2023 13:30:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvlP-00155K-1W;
	Thu, 12 Oct 2023 13:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 617BFCE286D;
	Thu, 12 Oct 2023 13:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD6DC433C8;
	Thu, 12 Oct 2023 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697117404;
	bh=NKCpsSQBteE4J7/LEFm7hT7vdH4qeVTvzOUHXiJH5eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ysSN7UJGZcbdfH4+nBdUKklO43ddpWgMKFxbnAo9qYLKaELcE1aptQXZiteVeYl39
	 rq5MVgQ9Bszo64Caen+oio/M2Wl/WZtSu8XId0X0fpDob6RWorKz4e/QMnLTDXCup6
	 30UV/okoD8M2nV3/OdSJ2XZtSp/+HPJ8mrqdabKE=
Date: Thu, 12 Oct 2023 15:30:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pkrasavin@imaqliq.ru
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] tty: serial: meson: hard LOCKUP on crtscts mode
Message-ID: <2023101224-outmost-yesterday-5623@gregkh>
References: <OF950BEF72.7F425944-ON00258A46.00488A76-00258A46.00497D44@gdc.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF950BEF72.7F425944-ON00258A46.00488A76-00258A46.00497D44@gdc.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_063007_741516_C40360A9 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, Oct 12, 2023 at 01:22:41PM +0000, pkrasavin@imaqliq.ru wrote:
> There might be hard lockup if we set crtscts mode on port without RTS/CTS configured:
> 
> # stty -F /dev/ttyAML6 crtscts; echo 1 > /dev/ttyAML6; echo 2 > /dev/ttyAML6
> [   95.890386] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [   95.890857] rcu:     3-...0: (201 ticks this GP) idle=e33c/1/0x4000000000000000 softirq=5844/5846 fqs=4984
> [   95.900212] rcu:     (detected by 2, t=21016 jiffies, g=7753, q=296 ncpus=4)
> [   95.906972] Task dump for CPU 3:
> [   95.910178] task:bash            state:R  running task     stack:0     pid:205   ppid:1      flags:0x00000202
> [   95.920059] Call trace:
> [   95.922485]  __switch_to+0xe4/0x168
> [   95.925951]  0xffffff8003477508
> [   95.974379] watchdog: Watchdog detected hard LOCKUP on cpu 3
> [   95.974424] Modules linked in: 88x2cs(O) rtc_meson_vrtc
> 
> Possible solution would be to not allow to setup crtscts on such port.
> 
> Tested on S905X3 based board.
> 
> Signed-off-by: Pavel Krasavin <pkrasavin@imaqliq.com>


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your name for the patch on either the
  Signed-off-by: line, or the From: line (both of which have to match).
  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
