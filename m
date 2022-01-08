Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E2CC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jan 2022 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IN6wgN2wfS9MVpFsHSsufJ2aNxDWIixLoynbrtzlGPE=; b=g9PvKsTmeKbQiB
	PqrY9cQr4syECxcX/jUQ1uKP2YLEFcjt3euhRKLi2V7tBO8NLE7+qz/97PiPGX2S4EQyaTfCIiNXP
	buRT5jRPIXeKrBtmUBz5gD3VhgAgEi3UQOv5FbBaUxLG2+3DtqAgJg0uXVdvEdKyj1ZCMuYIp7wok
	pVXsZHD1ucpKp9/RhEG1rbu3CAVyqck+8kNcAb4FFzN/iiRfn1LcO0zN+1Jut7+gl8U3mOTteUswO
	KmpHGfMF+N3Kg/BXLii0yWqRAAkzW+USQSeR9cLKwYjyiAnv40zzsyjnTGH+5VYy6jzrn+64AbUys
	SuqBSK4VGrqIRpcHopZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6Jjf-0071XW-Hx; Sat, 08 Jan 2022 21:58:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6Jjd-0071WO-7o
 for linux-amlogic@lists.infradead.org; Sat, 08 Jan 2022 21:58:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e19so2076718plc.10
 for <linux-amlogic@lists.infradead.org>; Sat, 08 Jan 2022 13:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4Hd1sTJddOAEXNt6EvTLGETq0KW+NvG5jCzX8oMoecI=;
 b=LLZ0TYsk1sIjI6GUOYOQAq0OhqsK1A4fbANbCa+GWDCOy0mXr/bRDrc691o8vz8maJ
 b7fZ8a7qd3BmOnIH+boprZCvXmLdpSmTU3cdODLs4ydsWgPAzA4BvsLLE3X0nZACO3Ka
 KLOnhGrMpeHuKb64g8Ck+hYsCJIRwVRIJXHmb7s7Swqzt9hzKS1XHR/M1qi4sBlK8sTJ
 9lSLb1gLwGlvgfgAm3KzdpqB0xMgbGfF/ved3YBbIagst4x75D0kQhK1oP3CU5UNuH9Y
 /T91m9q9oYBNkm/pn6Kj1heTNgaAXrdFvH0Zf4S83jJQDWLE4CYoQrOIApXtzFMwGxln
 xPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Hd1sTJddOAEXNt6EvTLGETq0KW+NvG5jCzX8oMoecI=;
 b=Pf4C4TSkZAoQsBHmWJ7PKkfPekR+XxwSnh2+wm5PsM49exgUaN/M0QNyZnSHn4hLuS
 vr3+vlfR1lTcg3e67WN+1ZqEpw40l1rPds8DkGggZDMGQlCZTtRzcnvqb2fNMBV1U1ko
 CGAoOxM5hvDMWmf4ecVH6KDrhyoNSrdEiotOLPMUg+kqxxtwfFJoFn7MuzZ6VmQSr6XI
 cAI4vYUVNo3QP+SCmx7y7pNbsXcuIXFM4gkLb404A9mdMVbwsXSVKcUVfnsZKQg2/53q
 Qf76gGR0UHn77wAxFXNIzCZHNsW8zG+PE1p895UdLfaOTKRtNrHE5fCaLAXtGPZlOdOz
 n6Sg==
X-Gm-Message-State: AOAM530XgwD7gcHaZuYG2o/rQvioJPTieok/CEjoSiFYkgeZxKrsX7Ws
 ddmyzudFIalglKMgmGsXfjDZZQ==
X-Google-Smtp-Source: ABdhPJyMF8b0vtRVaaTcGo+OX6AMhUl4fH8CKTllWfdUoabPmtVG/ESsRLNyLWYzPgfdK/oHzrVH/g==
X-Received: by 2002:a63:7053:: with SMTP id a19mr2963908pgn.283.1641679125568; 
 Sat, 08 Jan 2022 13:58:45 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net.
 [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id g9sm2781258pfj.123.2022.01.08.13.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 13:58:44 -0800 (PST)
Date: Sat, 8 Jan 2022 13:26:21 -0800
From: Olof Johansson <olof@lixom.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic fixes for v5.17-rc
Message-ID: <YdoBffKeAvtOeRSe@lx2k>
References: <7e40328b-6645-4343-3050-73dcfb2cefcb@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e40328b-6645-4343-3050-73dcfb2cefcb@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_135849_347021_24859C68 
X-CRM114-Status: GOOD (  14.49  )
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

On Mon, Jan 03, 2022 at 04:13:44PM +0100, Neil Armstrong wrote:
> Hi,
> 
> Here's a couple of DT fixes for v5.17-rc1, they fix the UART compatibles of
> the ARMv7 Amlogic SoCs and by the way keep earlycon working after [1] has been
> applied by greg in the tty branch for 5.17.
> 
> I know it's early for 5.17-rc1, but at least it's in the pipe.
> 
> I based the changes on your dt-5.17 tag pushed to linus for 5.17-rc1,
> if necessary I can rebase on v5.16-rcX.

Hi Neil,

It looks like this branch is based on our arm/dt branch? Please don't base your
topics on our branches, it'll be awkward if we ever need to rebuild them (it's
happened a few times, but we try very hard to avoid it).

In this case, you should have based your contents on top of your latest dt
branch (if it would have had conflicts), not ours.

Mind rebuilding and send a new pull request?

Thanks,


-Olof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
