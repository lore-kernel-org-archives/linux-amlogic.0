Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD14C4727F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:46:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F5321775
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:46:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="znwNkKYZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNXJTlRN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F5321775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b+Ydzjb0eH428CF8Umt7XFmFMP3iwQGke9dCcyMfjxM=; b=znwNkKYZCzmha6RQyoGiuxZ9p
	NAygKDOk6oVGBjWj8SOyJTFJnPNqSOMVXEW0R4oZ1YPk4WXRtRaPRUB4CTuibUoK5XGazUjQ/3F/m
	CUimrNkAqqa0v44h7qGBotgq9GWYSDiTEQ6XsBjJqL2SjW7t3QvI6nUeI5rPFZvpbRk3KJeujcQ21
	eDrCBuUPqO7t/3DDQGVtE8aKL3RORPPty92JrjwAgnTM9uw2ybiOB6Rs63q9dTyg3ONheKpBECwLM
	j4Z3Td3k4IAlz50te8DciET+9SVLHXCqVL4dFGD7DsLlvywiLWlWWc8CHuRsH0/VjGP9BUtt7eTCk
	FSgcjf/9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLwTv-00042w-Ez; Fri, 25 Sep 2020 22:46:23 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLwTs-000427-7C; Fri, 25 Sep 2020 22:46:21 +0000
Received: by mail-ej1-x633.google.com with SMTP id q13so724606ejo.9;
 Fri, 25 Sep 2020 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lrVKWzlDcGFhCrWgMifQZRLCGQ0NtpunSOEi48viSH8=;
 b=aNXJTlRNvZq5vFI7352QqBShKwE+D0YCXNgufsf0zU5cxvnSadfe/RttWPBqBdSjlp
 w7VrhUPHAKSQmmFMTjSWmwUmsg9ZqoB1kdhzk3b5mIrhaLtdXNKyH+U20iyfTpYtSmim
 wcI/e7JPqPPaVYOTaiNfGgNSb9ff2rts5FTpbkhH5h+V72M6z4A3mhDT2HjGBdvAlY3g
 6y09YGie1G8Irk6wf5/Rzf3QCU5vwdQPzLDi/GWWgurYpYPUGMATQGC+C+09GUtcEglQ
 VhRnwgl8GCw1VPbqasMr0TjfEsA+6ajnzoeF3SDlwZJVQj+VdVAFvwQFzK1XXdAJlO5B
 k+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lrVKWzlDcGFhCrWgMifQZRLCGQ0NtpunSOEi48viSH8=;
 b=XOKETk0GHNyfZY7KgcNuzYJeTcOADZJGcM0Cy+2du/SHZCCfyPpqB7XDsh/FJxoaX3
 Ik3nEVLUh99QinoqhPpe9AGQA+MJg+1iZN5Z3ZyA7b137VsPFyRFX0rh64zvzzqqmL0D
 aBt4Z+YqI8KS0jY1k/MbgA8mdS6dlCoUGzhBPKFf2VwFh6EuNgS9AbLUB6c+MqzmXT8Y
 3dsSJ3Z30kGjl+cYPDyau8b1LMmbNAmsrbvqT2JcwJiSZp1oKp2I4LZDA7MZ32RIA0RJ
 sz62/lZ9aSEn0mc4kq9dRe0PBD+QijmlexORBYY1XjW8CMNZYjceWaU1QUGOGCw4H0na
 /KCQ==
X-Gm-Message-State: AOAM530j2DfRaPrDBlWdPdqTemcX8LRrisX4GUP5zbdehU/6rYBehz6a
 RRrSFAN93V/SLRdl067RHiI=
X-Google-Smtp-Source: ABdhPJwVwZ0jezDaQdRB6TwC5/deAJ5D6Lv5vjVPupgSdS91PARaHHgvQ06C6wY5XEH+1quAeU52Ug==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr4816511ejk.407.1601073979139; 
 Fri, 25 Sep 2020 15:46:19 -0700 (PDT)
Received: from skbuf ([188.25.217.212])
 by smtp.gmail.com with ESMTPSA id s7sm2744100ejd.103.2020.09.25.15.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 15:46:18 -0700 (PDT)
Date: Sat, 26 Sep 2020 01:46:16 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
Message-ID: <20200925224616.fetyq4aiiwpspe7g@skbuf>
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
 <20200925220329.wdnrqeauto55vdao@skbuf>
 <CAFBinCB4woR1sZfT3tvCkHiR2eRgQfXg3jsD+KO0iMzyQRAGDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCB4woR1sZfT3tvCkHiR2eRgQfXg3jsD+KO0iMzyQRAGDQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_184620_509459_84AF309B 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: f.fainelli@gmail.com, alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, kuba@kernel.org,
 joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Sep 26, 2020 at 12:15:59AM +0200, Martin Blumenstingl wrote:
> I do not need the auto-detection of the phy-mode nor any RX/TX delay
> (these are fixed values)
> however, from that patch-set I would need most of
> phy_rgmii_probe_interface() (and all of the helpers it's using)

So if it's not clock skews and it probably isn't equalization either,
since to my knowledge RGMII MACs won't have because they are parallel
and relatively low-speed interfaces, then we need to know what exactly
it is that you calibrate.

As you know, in a serial interface you are likely to find a BIST
function implemented in the SERDES, this would basically offload to
hardware the task of sending and decoding test patterns such as PRBS-11.
With RGMII, you are less likely to see a BIST in hardware, hence the
manual injection of packets that you need to do from software. Whatever
solution you end up choosing, it would be nice if it created a nicely
structured UAPI that could be extended in the future for other types of
electrical interface selftests.

> also I'm wondering if the "protocol" 0x0808 is recommended over ETH_P_EDSA

It probably doesn't make any difference.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
