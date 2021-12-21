Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E21C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CE/bl458Kiuqrup+eB0CA385Ez9WqDAN3SCV54trk1Q=; b=TSFZkHwS/JvZLr
	FwncwlA5hIKBLs3E4Dm5k1iaaKILAj6+SWSBKKqUtWdz8khPBh3z8FiyTd4uutqixI30umpekGtxv
	xaqmAFTqqm/u9vYxUbr/4Qk/q2cxGyohRFTPGkXouUBZNbR+k/QcoZweR0hMGkzPL9UPjgiw8gHLU
	m9iFijUbqNRGA3Hhsm4rnsG3qULMleM3MXcx9TpUONI0ihVVvTJqMo7KB2AiZ0HFJdLnczXE9k0Qs
	nZQXd/2D0AQvqRT/CC4+ugoTYEJRcTh77CjJ3bF17opXj8QaymCIwFmXCKlXkhEQPqlDKjRScY6o7
	G1Xk7obGTNNJ8DJEA4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzZbS-005m5g-Hq; Tue, 21 Dec 2021 07:30:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzZbQ-005m4Q-Cj; Tue, 21 Dec 2021 07:30:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15CE7B8106C;
 Tue, 21 Dec 2021 07:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C987C36AE7;
 Tue, 21 Dec 2021 07:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640071825;
 bh=CJerA/mN0YyI2tFVe/fzLdV7aBBk5wmHqqJDBcg53KE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r25qSWLbqw89+H4nLz/vRzBcGGuUTagWmFT5Il8sB9UAhKPX1EgaPZfSO1kzOUG2e
 Rng1IJUYuh24Ay1tz4uJGzAq9BZybhaV/mxmaGeJlCYb8YAD/eukVz8N+db0XUYog1
 t4SpNyTlO7GAPpyv+hUtppMNZh9wTR+LuiWx5AYM=
Date: Tue, 21 Dec 2021 08:30:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/3] tty: serial: meson: modify request_irq and free_irq
Message-ID: <YcGCj2jGpzl+sKcT@kroah.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-2-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221071634.25980-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_233028_603146_1DEB8A3E 
X-CRM114-Status: GOOD (  10.44  )
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

On Tue, Dec 21, 2021 at 03:16:32PM +0800, Yu Tu wrote:
> Change request_irq to devm_request_irq and free_irq to devm_free_irq.
> It's better to change the code this way.

Why?  What did this fix up?  You still are manually requesting and
freeing the irq.  What bug did you fix?

> 
> The IRQF_SHARED interrupt flag was added because an interrupt error was
> detected when the serial port was opened twice in a row on the project.

That is a different change.  Make that a different patch.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
