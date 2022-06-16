Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897D0C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 02:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pZ2+HMZWXpm7LisiFdaZ1fifFhQ6vbDdre81/Mbaz4=; b=qpjwAszMXsB2HG
	McqOwEv9IArx4iUrbJ5eeOdPjF3Ls/5siS2shUCgTaJ5a6HC1be7+46qacayvs00XN2omc4gp4a2C
	6VYziaBo9ftnOy1TOjIFVUlajbWX+8LMueFPJaDuKcQ0HIUt8qN1xuO1MViAUs5hmUCHiTA2Kuy8P
	bbPWn+8cW2lZzPCeHis5L6qQkDDmtHGIxhek38M8b7ndkEgKqf8jn3c8J6Ds5HsnftnsAzToENuOH
	rxTSZiW+6yD222UEvcLN743V0I+LTGu/btKlptG2eIC5lsdlgztggPn8JUR5azVt6AOuoxkbdoSDw
	EljirL9bGq1TwU0hIzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1fOM-0005kO-83; Thu, 16 Jun 2022 02:37:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1fOJ-0005jP-Ee
	for linux-amlogic@lists.infradead.org; Thu, 16 Jun 2022 02:37:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E35CB82205;
	Thu, 16 Jun 2022 02:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A86C3411A;
	Thu, 16 Jun 2022 02:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655347068;
	bh=5v4m6W3GRsK28B/HjD5PkoAYkuQiMh5fLFhuesLG1bI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Cbj9+IZYjJTG2r2Of1bY1CmFVAhgDQOQRlhdIpTjM89D0Ke4CPcbbLCrkBCq8cZ8f
	 t6yPMq1J1jSw+TeVmtcuVFSOt+Mb7S3MM4x88d17djU5hAYx6K9mSBOWASt4Gu36n5
	 j5Xj6N74VLKopZyHrYjTJHAi8pCUSJtU/erZVuGb3p1NNIYlBlGgLyVpULLcV/jbtB
	 rBNLPhvPeOxOD5/zgvCHte1b/vGYfWilnybKtwqbh3mcPy4UPLSZLsN2hbg811tp4U
	 dmuzQQnAzODTWBRhPAoX5Je8u5bZ34wVu9lMsqaUo3lDU37sRpTSZEW11u1ZC0dOrX
	 NI088NcfLysIw==
MIME-Version: 1.0
In-Reply-To: <20220520075737.758761-5-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de> <20220520075737.758761-5-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v9 4/4] clk: meson: axg-audio: Don't duplicate devm_clk_get_enabled()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Alexandru Ardelean <aardelean@deviqon.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
To: Russell King <linux@armlinux.org.uk>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 15 Jun 2022 19:37:46 -0700
User-Agent: alot/0.10
Message-Id: <20220616023748.91A86C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_193751_675237_F868079A 
X-CRM114-Status: UNSURE (   6.83  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBVd2UgS2xlaW5lLUvDtm5pZyAoMjAyMi0wNS0yMCAwMDo1NzozNykKPiBUaGUgY2xr
IEFQSSBqdXN0IGdvdCBhIGZ1bmN0aW9uIHdpdGggYSBzbGlnaHRseSBkaWZmZXJlbnQgbmFtZSBh
bmQKPiB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5LiBSZW1vdmUgdGhlIGR1cGxpY2F0aW9uLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+Cj4gLS0tCgpBcHBsaWVkIHRvIGNsay1uZXh0CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
