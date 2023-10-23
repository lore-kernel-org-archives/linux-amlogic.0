Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7517C004C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Oct 2023 14:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEYHSe5wsWttxIl2fSNbxKtV1CcVdaf46ccYmZUl+J8=; b=DD+hsdZqdXq4Th
	cHn5+oRl7BIwH4E3+CmgO5CLg1c81qtE0PxiOMeoRF1KjTDmLuGjk5XgBp+jTX8OQ7M090IKjJrZO
	DBgRyGxBgVVhnFnGSliKB3Onf20/dZCoU6WV1UyuISXsi7yc6WXDxbUh2lEIMCUSWi07o+SJEWCXy
	1PNVsnUZfXMS7XiCuyuzn64DIzQteM8kTbAVmkBpfSrBPXDRCJ6GXvGNmYsOkkz9Nhvd2Sr+4P9kA
	wAUnoyJUWDmm+lUAE0Mxu3+1lIteHD84arX5JRlIFXO3XMXsdOd3plBURUBS/756cr+FNW0DjQV0U
	mxA6bTihWq5DrJcp90Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw9w-007bnq-2V;
	Mon, 23 Oct 2023 14:44:01 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw9u-007bla-0a;
	Mon, 23 Oct 2023 14:44:00 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 529E75C0368;
	Mon, 23 Oct 2023 10:43:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 23 Oct 2023 10:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698072236; x=1698158636; bh=LQ
	3mQFLL5edFDiS47lGR9808SL3EsFpdSI3BztByio0=; b=LPel3AAy/6vzLYDh8Y
	Z3UbDeFGbTmUStPUg6sw7950XvTsu/LB73xT2WdH7iretw1kLUfXiFK7azKpv+pC
	NbTieHNl/2I9OOSX97UE4LvJs9jvxyusMr/b+bfwQQbgFpiXztkrX9Bj7eJI4V3b
	SGlHyKkQzXzgEkrK0A3zsnnE0zzoPt55lgBbdHHkjIs7rYI1xMkY7783evs9p5Gz
	kIljJ6jDDNi0Gxfy7qHvoMAvD7DqxwPw7kGjGYeR+8Skk2sezWY9d/h+dYLPqLaJ
	xzdFhxokhpvBr3U0dtmEqdszFmuUExsrXHeQHKYyBPPGZ2QPv2AGC473vij5O0Rp
	nrZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698072236; x=1698158636; bh=LQ3mQFLL5edFD
	iS47lGR9808SL3EsFpdSI3BztByio0=; b=BYSEWn2MEQtkSKUFEZlo6kqPOvlls
	H49NmpBLjZJ/eXwbcNMosHKRPpf3gz4VRViq4NfJTZWmB9fc2OMNs0w5ttrwBUzx
	lt9l/T6MEwlzdRczFXi3fNnk0uNYtluYpjlqNkoKbif9vx37piVjtrm1d5/+KwHU
	ig462CAIzamIyCLP7RGl5NAj27BSLoQY8szTVtWT2JeOKreDVanEc6Rb6wYv1lL0
	ZbKD3sWtNTj+LkZbfeIXjEkCAR56OfMRr+igZI/XzlQAYVmNVe7H0Xn25B7R/nQA
	CiyVX8U49XekNV0UJ6G2xxFKaxoOj5Ye43vQl0rm/lMXWvoxcGgwdDokw==
X-ME-Sender: <xms:q4Y2ZdcdjzKzlNrKR536Il2i9TXVBiU0ZZhCqseprek0UcwlEzEBNw>
    <xme:q4Y2ZbP66FfBoVrUGDdV1Ka3FOUlEEIXGTH_Yeo6cHMRsxHKfP_QbQ3ncwcc8VcPr
    EQ1pPX9nQAlNxi_4lU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeeigdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:q4Y2ZWjo0w3CIZllXxtYtTE-rqFNdE0RIeqC2_f3vTx4NPonNkQ-Jw>
    <xmx:q4Y2ZW_QyvqhnCIo-1oFZFlsvn_pyVwET1qabXsQuO7D8ZwQhmU_gA>
    <xmx:q4Y2ZZs9NqSZPdaeVobj_EKthwMGkRxPHEUzPbr0A4p3-6KOdOe4kg>
    <xmx:rIY2ZVEiv_pfQ_0h-XsfW-hNx9JUi5Y2G6O4bWRCZgNroShvlAYOkg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 234CEB60089; Mon, 23 Oct 2023 10:43:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <6fea22fa-86ec-48b2-93ad-56f77313d53a@app.fastmail.com>
In-Reply-To: <1j1qdlpgf0.fsf@starbuckisacylon.baylibre.com>
References: <20231023102810.4001943-1-arnd@kernel.org>
 <1j1qdlpgf0.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 23 Oct 2023 16:43:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>,
 "Yu Tu" <yu.tu@amlogic.com>
Cc: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Dmitry Rokosov" <ddrokosov@sberdevices.ru>, "Jian Hu" <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] clk: meson: S4: select CONFIG_COMMON_CLK_MESON_CLKC_UTILS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074358_287184_A990CE2B 
X-CRM114-Status: UNSURE (   8.47  )
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

On Mon, Oct 23, 2023, at 16:20, Jerome Brunet wrote:
> On Mon 23 Oct 2023 at 12:28, Arnd Bergmann <arnd@kernel.org> wrote:

> Applied fixing this minor checkpatch warning (1 extra char)
>
> WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> 
> ("<title line>")' - ie: 'Fixes: e787c9c55eda ("clk: meson: S4: add 
> support for Amlogic S4 SoC PLL clock driver")'
>

Thanks for pointing this out, I have no idea where this was set to 13,
but I've changed it to 12 in my ~/.gitconfig now.

     Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
