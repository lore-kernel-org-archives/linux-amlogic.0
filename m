Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F67FC4363D
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:31:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B92E42371F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:31:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KgF2Fnxp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B92E42371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f9MELYImDEQZfq572LAjAziFJKZWc2y4qGNtIGj15Yo=; b=KgF2Fnxp24Gc0qj/+KREvVJDD
	XdFQ8a8YOHxMyAG56lo6/gWGlBRXMxGn3Ob4wy8DP4astOHMYEne7rMgNn05Dmx35oKhmIx9zX67D
	O0S4sxex2bKM4Jjduv7yUcv52C+1RX5JbbQKcHvz5o0PhWPQbkC1m0o9UB1yUaOY+k6/QMyZ89+39
	t9n+LtAouIbdm/y2cZbgplAoKyFIfF7We/eBf9Qc09aYuhCPMJ7U/L9SwQnk/XtPddlSPCHr1eDhR
	CnyZgsMaW4C7gvxvgGpOUrCZ80EvftUSTzUZ6k9/056dqGZulCEhDkEB7W24c4xNP+q1ze9LzOpse
	hsGTms4dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKtcr-0004sk-DX; Wed, 23 Sep 2020 01:31:17 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKtcm-0004rM-MN; Wed, 23 Sep 2020 01:31:13 +0000
Received: by mail-il1-f193.google.com with SMTP id t13so19225045ile.9;
 Tue, 22 Sep 2020 18:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tv66K9/1GwChFMOL9H+ReDrw3yHm6Xrj/b9POnLRMWk=;
 b=iRziBd5I/C5b8YTSN4z5G0PBh09Mf+so3cAtb/KhBRB3Hl76FJklf/gii18uokJK4H
 ZuhDG/fAOKbjs9RD/sC7lctHcSYaQSqXPYdjX2o2pRvJUQdC6+Hu8hGAiZjEwRhn/paf
 F1jPhY3RDJPITOdLkQ6VywsdemJck4vVSE9JnZvAe837VPZHvYMBfFDJ1ctl3di0KsPE
 H2Y6TdG1Z9bhOsglY5FD3OTnzmUvKzX/XYrLGNPpBFFkgMH7LHiX2q5mHCFiZQux2zc2
 6YpzOi6ljI9JtBMyKzqDxklaWeCeORjFSc9VjShgMW4a47dCsBgDD6q9H7WxBDPnp37+
 TKiA==
X-Gm-Message-State: AOAM5330kMJ6vjig0rr+Zx/YQ0PfdxpohpxDoKdM4Tr5yUvWPVtqpZ2b
 epFJiWnOnTpV7hYfh4pE8TE8lHc01Imt
X-Google-Smtp-Source: ABdhPJznf0joDq/+4rusUaWg9pREPYnskIi0ja+Q0v6qwylDJWmE+LZNhJeA9vXJERaYvqHxRdYGLA==
X-Received: by 2002:a92:8e42:: with SMTP id k2mr6881150ilh.175.1600824672137; 
 Tue, 22 Sep 2020 18:31:12 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m8sm8136478ioq.11.2020.09.22.18.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:31:11 -0700 (PDT)
Received: (nullmailer pid 3660842 invoked by uid 1000);
 Wed, 23 Sep 2020 01:31:10 -0000
Date: Tue, 22 Sep 2020 19:31:10 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clk: axg-clkc: add Video Clocks
Message-ID: <20200923013110.GA3660801@bogus>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
 <20200915124553.8056-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915124553.8056-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_213112_747634_47B5F918 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 14:45:50 +0200, Neil Armstrong wrote:
> Add clock IDs for the video clocks.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/axg-clkc.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
