Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E58C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTRldKAAjaetRRZeqFMStfQR9wjhLTzzYRVBRoW3fxg=; b=KB7WGcX+mjt2XW
	FHDVA1/gxm+q+iC6hXxxbt/XlmUKt70QWo8dQg0GX4ZRdLlK8ZWoJQro6H8C3576kW5gFdh003aUq
	IsIq0xwnrhDhzen0abNSoT5XXlpclnP2RK4uYtr2aFOyhXXJimnyd/s1CmLaGMiUhlvdwQ5UKGzy+
	y2e/6oOP0nREe0MvX5l5U9dTQio8c7soZ+XQLM4np+EW9rbl5k+7YqrpIbFrbS52WS2dFWALsKHEZ
	MelorUZR0Ws9Aoj6TzAgfzqL18SNuPMvoKFGBCwvmVbZc0vOW6+szDvGT81zEYf54xN1W/PqGHbs3
	AAL4lfH+Vhrm8Boc2KDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzZd2-005maW-DN; Tue, 21 Dec 2021 07:32:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzZcz-005mZj-UW; Tue, 21 Dec 2021 07:32:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4173561425;
 Tue, 21 Dec 2021 07:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F25C36AE7;
 Tue, 21 Dec 2021 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640071924;
 bh=siOKuI9TLZ2SagEvBuHZINAGCpcztazaYp56jX0A6YI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cszWef5TdMj2NWbcOPxb6AA7YxTfIKDZ0f5HXy7SiH4dSnXIGJqCEwdyeqbvQlok0
 vS8ekrt/teFFkefOYbeaUS97CNQ1cjUOJ5qcM6r996zEwcEVK0ynO+Kznx6kNv+iT3
 /5aQNDXpZ46ltorzMW2Wteh84rHV+2l2n3bbnROY=
Date: Tue, 21 Dec 2021 08:32:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/3] tty: serial: meson: meson_uart_shutdown omit clear
 AML_UART_TX_EN bit
Message-ID: <YcGC8hlOEbzH8rc8@kroah.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-3-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221071634.25980-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_233206_044645_9281F78B 
X-CRM114-Status: UNSURE (   9.80  )
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

On Tue, Dec 21, 2021 at 03:16:33PM +0800, Yu Tu wrote:
> The meson_uart_shutdown function should have the opposite operation to
> the meson_uart_startup function, so the shutdown of AML_UART_TX_EN is
> logically missing.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>

What commit does this fix?  Should it go to stable kernels?  Please put
that in here if needed.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
