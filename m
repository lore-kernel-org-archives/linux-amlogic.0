Return-Path: <SRS0=o2l2=KV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE14C47088
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 May 2021 20:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A6D2613BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 May 2021 20:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A6D2613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vzTtzhkOF6ShVIlOportQkZLnbQmJLgJ1+ixPBYWjV0=; b=mLRO6tJDPrgZm+7wDBdPB770Ls
	K7Citv/+6DhjMnDVOOvqbt1uIda//l352+Wc5/gBYElQ0mzba7Zv2fiwl4YjuAXjUHGRn/vrMwA3S
	FXizX/HVuKU24oM6XYa9j3E+G9pfL/eGSa+66pJqisKScp36SHDKoEYSC7FYO8v3dzE49Z1dTctU+
	YI6UGm+QFdDNfkKrQGaY93eJqaMvnebuh5lCgf/qjrR7oqePA7kxjuPay1XvJylZBjKnh12Qtc7XL
	V1f+Kw5A9zaP7aslaCYasJbK4h+JajyeFqs6CW42X3qxZs76Pe/yDMFx0q2gQtOUBJ+ocn4/QHjEg
	pPa5ixag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llzwY-00HJhy-Eg; Wed, 26 May 2021 20:15:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llz8d-00Gvlp-Jw
 for linux-amlogic@lists.infradead.org; Wed, 26 May 2021 19:24:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id g17so2049596wrs.13
 for <linux-amlogic@lists.infradead.org>; Wed, 26 May 2021 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=/FuUuvzMTISGpcPYuGeD/o7rbZ8bF0rpRLK07PV6RMc=;
 b=bjvQ0q8dBe3W1Wy96MOwMjmnJmzSd2G5vcWvhniAkfh9CAWdnLAyuh8sbqOTmPWpuT
 J553Z7tXii5lvkUvuJKn6YKGvYc1mAqhfAxKtg+NQCZkL/lkic/UbJyNs5ic5YlapYQZ
 MxX704oUBFMzUJ7rSX4unN4m/ls8nHTpJjV7qIWAB/tKi/mwOoD8TxCPmr+QROUVKB61
 kG6rJbLmy3t0DBUUmOAsYLwi08H48QM8tMTqnGPzvOpxjBDYFcawgCPgZXe19DyjNkEK
 FTdkboZjb9pYlmDrbU+eAIs97v/B0SgA3QAYGzwMa/hq9/Y8x69qyJr8SQtrsZ/rZwqi
 Wymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=/FuUuvzMTISGpcPYuGeD/o7rbZ8bF0rpRLK07PV6RMc=;
 b=ollitGBQYo4pcBPmD2j6A36dlpwVwSl6ihKfm2eHwWk5Qsm8ohcoYv5vinQwiHpmEG
 xFZjWnIymaUb0/4H2w642x7Nokaq5shkyF/DO+SdC32NcNbw7dKVwTWiPu9vGDE533ZM
 j0eeGTVzOq3UkauYEoXgULN9iFUX3pLQj2AebGGWu5pcG1PjRf4F1OO5JUPuKqxjrfbC
 UDLAdJcARIjLxEdKcLJ1HqtA/mfCAV7eTBBSqCv0TncY6GaUuEP13WikWN8eGFKhLKas
 AF1n1hnswFDcM8zjPcE4pCOQNe0TLNcMQ2VAHZ0GWBukRKr/TDZJDBZzHEhjE68dBuR0
 AZXQ==
X-Gm-Message-State: AOAM531fC1Fe978WGyD3jYciuiZ44aNiFGl4INUAk1Y6RAR5oDfxfXyc
 fiuCDY+I/WE151iVa09UIE/I/w==
X-Google-Smtp-Source: ABdhPJwJH/MkyPypRAdM1NXDfaKbtoXjStIpUhd1IcE5UQl5c2jZaYUzLT2tEIbMupEZJAvp2ool4A==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr3521012wrn.5.1622057056635;
 Wed, 26 May 2021 12:24:16 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id n6sm15035866wmq.34.2021.05.26.12.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 12:24:16 -0700 (PDT)
References: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 carlo@caione.org, Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: #linux-amlogic IRC channel: move to Libera.Chat or OFTC?
In-reply-to: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
Message-ID: <1jeedtb8o0.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 26 May 2021 21:24:15 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_122419_784424_33A96D26 
X-CRM114-Status: GOOD (  18.45  )
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


On Wed 26 May 2021 at 20:25, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hello,
>
> today the #linux-amlogic channel on Freenode was taken over by the
> Freenode network administrators: [0]
> I believe it is because the channel subject contained "Also on Libera.Chat".
>
> Due to the recent events going on with Freenode other (large)
> communities are also leaving Freenode, for example:
> - Arch Linux: migrating to Libera.Chat
> - OpenWrt: migrating to OFTC
> - panfrost and lima drivers: migrating to OFTC
> - (many more)
>
> So I think we have two options:
> 1. Moving to Libera.Chat
> 2. Moving to OFTC
> 3. Trying to get back our "old" channel on Freenode
>
> The steps (as far as I can tell) for switching to a new network are:
> - creating #linux-amlogic on the new network (already done by Neil on
> Libera.Chat and OFTC)
> - inviting the whitequark IRC logger to the channel on the new network
> - updating the topic of the new channel to inform users that all
> messages are logged and the logs are available publicly
> - updating our wiki with the new IRC network: [1]
>
> I am not sure which steps need to be taken to get our "old" channel on
> Freenode back.
>
> What do you think?

My 2 cents.
I see no valid reason for what happened today on the channel and I don't
think that trying to argue with freenode's staff is worth the effort

>
> Personally I vote for option #1 or #2.

+1

> I have no strong preference on which network to choose.
>

Is there any difference between the two networks ? 

>
> Best regards,
> Martin
>
>
> [0] https://freenode.irclog.whitequark.org/linux-amlogic/2021-05-26
> [1] http://linux-meson.com/


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
