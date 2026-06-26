Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08847C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2026 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVusSvU2Fb6Da0ICQBi3o12pW6k1L9PU3yyZ5uL8ndY=; b=1+mYyS+wbZ4vVU
	Ml582qESMRH0P7IKNK7yrL/n96xwZKcaAneKZVZGwJo66/IB7OpRv0JNlavmf8ZCHaMLqiKWT1sYi
	iGb50cklwXZpFwr2yY7vk5aRJQj08Of2UehV4wgwOGcvv4o+/C/yHMXnIQBbiJDR0zA8rUA/3EYZi
	H5OITc5yYFTBNDLfc2R3nL1B1iAPuBdV6LXvmVk+3FF4ExiKK0wAsZ1HK19sjKzN3s6+uwkNLSimL
	pLZiB/DvurUZpXFHtAJRgrtIx0nmOz4VUEHzFYdIhE8o6StDyN+EKIPJwt7goHXQ07LM0H5qC/T8k
	LZEmumavi+mJ+5nSWrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDSw-0000000BpLe-33d6;
	Fri, 26 Jun 2026 20:47:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDSt-0000000BpL8-31b0
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jun 2026 20:47:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c99672293cso4500045ad.2
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jun 2026 13:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782506875; cv=none;
        d=google.com; s=arc-20260327;
        b=E93iqWK4uye0Lvbv4dMiFe4qdhnIl6iKjbJR6eEcmJdKzvHH29faWfwgE6pWRMP4ld
         2NLShVrwE/YKd5CvRzOHDRDi3FZzu6rjZ9PZeZuBDOfqwukICC+PL1YAAfF6+UbnpTDY
         Hivp7vYN+5DQSXROiqhuL/WEE1iliq9cDc85SxuzlJu2vWFqp+0D3j7vRNjEmNiZH5+d
         lMqLIhWdCQ12RPJdWPA1NkzoSXy/pRAl22vDGV9arQYAqWb6kPxEdQ3VPVNVLcpugHen
         +gu9h21AGLy6+lfAEo7zPJX7l+pduSSJsP1yTMlGoxpmQNPXD5cs26ss8aCQ21FnlPoZ
         2Shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sNLuqs8AENajSxrPRNeAARQCcGTvPkM88RwMuF6w8X4=;
        fh=bSwaZsfg+r79iVMTph4dkL84qcvOmJShp9pKNXcMADM=;
        b=eu4Ff39doU9tfnDZXF0l+w0EAmckHCs27B32SpRlGlG459OkfFFwgZf9tt8+WehiLZ
         Obl3/BuEj8WYyVbuFQJ+dBSmRtz4xbu0P0aaNUGL4GqwyP8Ue5NqerDh8mIcMdW4odSS
         Sjaza8U/INo1Rm7HZcqnAHLbw/DflmojEw0eCe7CGJV46se19asr1H9xOlr9mETi1tSz
         OI/vcePb2tCpkXglPw7SB/jWRpxxo/kzP1LBr2i5pwkw9/AwjC1jFxLXSLcunsasKv29
         JXMYLb7V9TWyLDTEN3Dh8gzJrNU3fZEPn8pMRC+Jx1GM5kw1WuqRKVeSlJS4PYilojyk
         nfgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782506875; x=1783111675; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sNLuqs8AENajSxrPRNeAARQCcGTvPkM88RwMuF6w8X4=;
        b=AMpLGNKMJjZ5pie7JI8EWc3eD5Rl/jpFUmQO0E/JGEdJUZfHXoDqreWo7MHlvHwuL2
         rwprGFoElgo0HdGD8vAttDPFqUL/PUHXE4G4hcucMBLRSMmbz1tbBHzOIS0qaOhrHjw5
         8s+Mfbos8EHT5yhEPrUFeuDYv7JjBIZJ97ycjc4jDRtLiyaOFUqrTWj7D3pxkPE2m5C5
         v2jjh7kAiHYek9J5FohsrTefWkLo3oRGTKvV7ssqWCr5NJ7U345bZJRJYyEK3ii92gVP
         U4WLdG5SFWF9V4PxyAnuxOTP98MpAyH6qn8lrlEqOxCxyGm331LoOoHJbuFMZVSEmiOs
         WEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506875; x=1783111675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNLuqs8AENajSxrPRNeAARQCcGTvPkM88RwMuF6w8X4=;
        b=S+cgaVMmIR4amdC5EkjHVVNPncOtVV2RC1KqUBR7aHc1T24xaBobcJZzz8kx/VGeSw
         2Mozahl4p5GsQCg1lJIqdhwms5sDaXtV5Hj7MNQJDhjmgZb0mU4PLgYlMXEEQz1rtxat
         jV+yRhS7yFz9++xe/ywaH2F8NjWZWGtYkD13qEZGmep9dsydWTWhDMO6YtbimaPJKXME
         3tHJNnzTZ3b8qo4rYYplQcriI36WD+Sz0xeTDeFpLtRV3oALlHS05l7N8G336NNC4PGn
         5tFx+B3Li6bO6ZJLb79YhriwJrcjuy5FUwfVQLfi6pSVQ8Hs4muS9eNG8PzB6OSl1kNP
         fsFw==
X-Forwarded-Encrypted: i=1; AHgh+RqbOR0TOrdIR7UDAxUxTvPF+cd68Rtp9G6yzDlQ9YFtg8IJzF2Oor3WDDlB9rUMgi4EjyTKNEpkMXoA3E3A@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0r83NtZ34LY/GCr2CABCYYoM4c37aZFulz8Elvf21DFTpB+W+
	cML3UbjO2rAofGzT/6pzRdPKcxIVf32PqQbv3w0Vm4yTPV9+c+HOWspHUJdszuPEBHdD4i5B4ua
	YilzdpflIRhQbkQXHUknefYPLPLIv7qU=
X-Gm-Gg: AfdE7ckKG4PUaJ8lVPn/Y7kKItPdzy5MhDsURQId/FwuefuC6Ewktyc06gUgx9kcpKK
	Qg/X5alSYWRuK1vRhScLoTQzDYDB3niFPkpbLY1MOZZEt9CCZmNeFy+9YgNm1Yc6flgbcTRJk1N
	WV9LMBm4IdyTEgKyxSkwy/C2BcCn1utrepPaygz10avcQ0QIvNx4hi88v9MBpSgtkBaIrkjpGdU
	fvskW1Mi3CIp1RqxjH8nVCE9day0pDlh1neTqaaM5h+6dnbjsFlyXwQkMnwsgqrl0WkzBb7UUMq
	8kgvQXUPh62dfDB6+xXqejXBDFvx3A==
X-Received: by 2002:a17:902:ec86:b0:2c0:bcb3:86f with SMTP id
 d9443c01a7336-2c7fc657921mr81245665ad.6.1782506874711; Fri, 26 Jun 2026
 13:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260626080422.4191435-1-christianshewitt@gmail.com> <20260626081559.6EDE41F000E9@smtp.kernel.org>
In-Reply-To: <20260626081559.6EDE41F000E9@smtp.kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 26 Jun 2026 22:47:43 +0200
X-Gm-Features: AVVi8CeetCkdMw8FSSJAzul0ZypuaM92e6F0OmO4razl-HqicBdqZsRoebx4nho
Message-ID: <CAFBinCA8bCvJ92refztTgZsA_PXCUi852B-3a5ytY4LSAncivQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
To: sashiko-reviews@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_134755_783916_A0FFB61F 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[ ... ]
>
> > @@ -68,12 +69,16 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
> >       case SNDRV_PCM_TRIGGER_START:
> >       case SNDRV_PCM_TRIGGER_RESUME:
> >       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > +             snd_soc_component_write(component, AIU_RST_SOFT,
> > +                                     AIU_RST_SOFT_958_FAST);
> [Severity: High]
> Does this introduce a race condition on start? In fifo_spdif_trigger(),
> aiu_fifo_trigger() is called before the switch statement, which starts the
> upstream DMA engine before we issue the downstream S/PDIF fast domain soft
> reset.
>
> Could this discard audio frames fetched by the DMA into the FIFO before the
> reset, causing left/right channel swapping and audio artifacts?
I don't think so. The sequence introduced by Christian matches the
vendor driver (see my other email with review notes).

> Additionally, the ALSA PCM trigger callback executes in atomic context with
> the stream spinlock held. Is it safe to call snd_soc_component_write() here?
My understanding is that ALSA uses mutex instead of spinlocks, meaning
this comment is incorrect.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
