Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC5AC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 21:18:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0403216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 21:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JuD+mMsS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="avfP3RQd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0403216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NR4Uc/dUN+ne5WR0I11WbDI7gV/Zb9DwCcQVlPmGue8=; b=JuD+mMsSidaVQ8
	7movBdaRyk2KP0j+qu7Oq24irei52yALEP3Rb3+Txkd87S1mOYJqE9msAkaovnG5Y6qKEj1rN9GXB
	QV83VCHIF65yeWN2rh8j9pJHnN2A0fKaYrO1EqiFbF0qC4N6kpe9qh1cfPhENT7k2PyCkupcxVBUW
	ExuyqgljQjUH8N6sT9lh0Ff/m0Aq/pMXNJ7IFVS8cmnCfaCmqVEfRmqFhx6X5oslSOnr8W6RP0Xzn
	NMGAUtiedFvnX10rOA2anmZwXVCynqrMitgsP2DXG6EfeJs3nHF0rmqfHoDEdQjXhd80oq3TIew43
	FvzrUkLuccsyTi9qgIMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSpg8-0002JC-N3; Mon, 20 May 2019 21:18:40 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSpg5-0002IS-6n
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 21:18:38 +0000
Received: by mail-pf1-x444.google.com with SMTP id z26so7841527pfg.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=KwAzvLOrsGrLdW37rNbsYgX7kOv9ZoeLzS/6hKC6W6g=;
 b=avfP3RQdwhppd/vstRNn/zdW5SsXvba3ffCdxGlgjEJ1y6rQJXDbRpyDlYvvwGXY98
 bJj0wY65p9eLbsYplwq5bLdQryZ/HRWp4gPRCsLmiQIkmnZkf2Y3wDlXMhktx9hMKHUo
 i7XrrouEq2/wvpTqBya5HHdVLVGid1h0UVlwEZtP9McnxzbBZzRUuiQdHPYHNKqANb/L
 /aZCjVMDIf9vegrCIhgarS6AUHfdKAjkb3IAsP/CdlxCVymAoX63nc02FRwDDFs0SZxB
 t8HuXTOw65xD1U1yggoT7YqcVQRONJ1JXbeiGKtRgL/FPs6iD9qU0FTcx0lAMcY3g/Yt
 1uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KwAzvLOrsGrLdW37rNbsYgX7kOv9ZoeLzS/6hKC6W6g=;
 b=tzPXoR+lf5f8Vq9MJdxCsnvXHFPP42VxJz8HG1H6WsDlHNA+JzPRHUolw3FhgT54Ud
 YbL53SvB3ZgODvuU/r8V3sNiFHnzvbGPJiyDBYMqygKY2FM63MeA4lcZ/wYSZQdPg+jb
 vCCsUf9RP+NgoJF6a/nKZwHx9EQn3W/ON63Tkynu/sKAw5ahpOlMNRu4WHThWzEWF2Y3
 mCjzYj6RgNr4qhm5dtE1/voErODdV1DXIq7+4r0U2NBZnPJozP1KlvsdG3JHiECznbud
 u7VIids9R8M13Q9k9hOtkt6/v49vi01JFbr01mUfYq6JeQZnGXIHTWz5En6CoRxOkGWq
 0ufw==
X-Gm-Message-State: APjAAAVSzX6Y3TOJr3M0wovJW8+KYS4UE3Hpg99khn3VE1GXFHIEXS6l
 jw0+xHNIg1L5WSmviGFBxo3qlbEr/FitWg==
X-Google-Smtp-Source: APXvYqzSIOWReUBiSn5i9wiYls/tM3XVkbWOxHp5XkIIqOVylQGiSjT/FlLpBfs58MuEO6WmTc0QOw==
X-Received: by 2002:a62:fb10:: with SMTP id x16mr18663984pfm.112.1558387116318; 
 Mon, 20 May 2019 14:18:36 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:e483:1cc0:e2c2:140d])
 by smtp.googlemail.com with ESMTPSA id
 c15sm22024029pfi.172.2019.05.20.14.18.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 14:18:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: g12a: add tohdmitx
In-Reply-To: <20190516143216.6193-1-jbrunet@baylibre.com>
References: <20190516143216.6193-1-jbrunet@baylibre.com>
Date: Mon, 20 May 2019 14:18:34 -0700
Message-ID: <7hr28s7rkl.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_141837_250426_14F44AB6 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add the hdmitx glue device linking the SoC audio interfaces to the
> embedded Synopsys hdmi controller.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.3,

>  Hi Kevin,
>
>  The related device driver and dt-binding have been merged in the ASoC
>  tree, for-5.3 branch [0]
>
>  This patch is based on the audio series I have just sent [1]. Like the
>  patches I have sent this week, they are all based on Linus's master
>  branch. This is done so it applies nicely when setup your branch based
>  on 5.2-rc1

Thanks, for the detailed description,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
