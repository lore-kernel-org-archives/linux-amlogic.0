Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CBB606A32C
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2026 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M8Jnaqpc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lbUKFsIu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zDB760LrTlz8B2+upewQaqMXOO89juBHSg5L70yCsi8=; b=M8JnaqpcN2QpGJn89KcEzS8fNd
	/OmfRUU8ZkrQ9JtzdcXZs8QtocqRmGMGnQtOVERA/l2sW4Bo4E6Oy5DDzaIm4b53YMPZFuSqGM4Op
	0HN/0YnRwFothlJRZDcIHJpV5cEEsLVA5rsNNEOJ3FNTnrbIlvG1lnSBbBr0Ww+ZKFmnF1wCd+rxL
	sUPo2rChU6FpNSeKu+57zAyILJ58er0Kg+M57lj2xwd4YPnDWoW7OrJl3PNwHDDt+0Mm1jxYxC2RY
	ryWAmwbY8H0Zyle9bNyJ5ZFYUlNc9iKD8rDdZqiruLd+WA6qVoOHt7s5LOm+DKlkSgF5duOGuvszO
	W2LP+zIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYZ9-000000053Wi-2ygJ;
	Wed, 04 Nov 2026 10:50:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYZ7-000000053Vu-3y2E;
	Wed, 04 Nov 2026 10:50:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC0D860DD5;
	Wed,  4 Nov 2026 10:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6751F00A02;
	Wed,  4 Nov 2026 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793789400;
	bh=jSpBDv8YD607sbMHNbPAeaBjk155ellTG9O/QhQRzvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbUKFsIunVUGOZSNi7sWqUHwAzZz4PFAb4KlEAuVuOkIKPbvA60P86o7vO8vQEVPJ
	 vZU3/om6CYPX5NLvN99Zq1RDRI3nc05sOqTWuuTBsop8cqhUkMoUktOJa66QL5gVpQ
	 uHz7ZcOUjgJkNtS8JUaI3060JJzTUqYeqEur+dpY=
Date: Wed, 4 Nov 2026 11:49:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] serial: meson: unregister the UART driver if port
 registration fails
Message-ID: <2026110413-delegate-antitoxic-1264@gregkh>
References: <20261104021501.1468500-1-vulab@iscas.ac.cn>
 <5b741c90-4e57-425e-b3ef-b8d10eac1f33@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b741c90-4e57-425e-b3ef-b8d10eac1f33@kernel.org>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 08:02:33AM +0100, Jiri Slaby wrote:
> On 04. 11. 26, 3:15, Wentao Liang wrote:
> > meson_uart_probe() registers the shared uart_driver on the first port and
> > relies on meson_uart_remove() to unregister it once the last port is
> > removed.  If uart_add_one_port() fails, probe returns an error, so remove
> > is never called and the driver stays registered, leaking its tty driver
> > and per-port state.
> > 
> > Remember whether this probe registered the driver and unregister it again
> > when adding the port fails.
> > 
> > Fixes: e71aab9d6132 ("tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs")
> > Cc: stable@vger.kernel.org
> > Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> 
> makes sense to me:
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

Nope, this is a bot, I strongly recommend that everyone just add this
address to their email killfile as they never respond and spam out tons
of crap.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
