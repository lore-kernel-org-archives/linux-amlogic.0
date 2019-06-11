Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF70C31E44
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B176A20872
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ceaqw36g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="myQGfU/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B176A20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zj9yeBP3/i9AbVYopSo3OGcZ/bMMpCQ+dayNTLFof9Y=; b=Ceaqw36gp98j5W
	MH67ylcuzW12/mblnQrVqz9BdG+3a8NhuUHcVJbXKyXig/lmDNCF84gDgid50mWMFG0ouTjQe7eU4
	okIQQKkrPnGxJ4gIZYxWFj6NzdcbhACuUvRVwkTISv5a9ciEU/iNrVQDTwwk5i5XNt2z+wBA4EC8a
	5P0Ew3JBZ29bJevWwUaOU1uvpSacVV2++rDNqu2b/LLsvk09v2rkiSsQPspYFmqIb3Sp2UVPq1UAA
	lXv97N3g0yW8x2T1bdmS/zjN1DxAUqbRHJwBHWeszLUSNXH4utiZBJZrGTZM86FBq9y6uaGrdpP2f
	NV7b3ENGn5jzdrWU82Uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hapq6-0000CH-Ni; Tue, 11 Jun 2019 23:06:02 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hapq3-0000Bi-Lw
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 23:06:01 +0000
Received: by mail-pg1-x544.google.com with SMTP id k187so7290886pga.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 16:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=OBwSPzkDdi1CMoAJXu3fdSCyBq/M09/6VhI4AMk4Xd0=;
 b=myQGfU/fQ9FotkLvkIP5napMe/OlFIpyYMu85C1/ME8ATNL3ykv9VzsgnRpn3SiXtB
 oK2zfgP4tp0UvDA43Eb5BnXfH2n9vFTf5ttK+jxUOAKg64WPZlvO+qYjypkNRx7fOELh
 +/kyBy9tyGhTsyAtSsjBgdhzvl7i8qU0vwi0bKaYntUUFQFSCK1PzG8coiWfRIHEs3F7
 mZnu+yaiZIil39fibfqN1W7CTlDjWG1/6hcssnbsnUUyZ07qAhXeSB6EJNLM4XK++Dw+
 hRmBU2Gnj+VniTueB2pa2vhiNaHtAg4oP5sZcjecADRWjA8Nh9VCSyaq5PBegpLoen9p
 oYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OBwSPzkDdi1CMoAJXu3fdSCyBq/M09/6VhI4AMk4Xd0=;
 b=sVfgJCI/M6jHxv8LpTRL8R6CQ3C1N6xXauLnNPDyCwKUZaEzwsogfJiKlza3JPMGrC
 B/jFEcNk9XJAs2JvmCsMP756JgzZ6om47huChIlCR+MzZOdqlUizbQK/vaNt+GMfmmRb
 V3s9NHl6pCFlpCBrVf+lTJVto0blGqxdF6ELw0mYMz+oDfp01B6cVfCShwediHq7RoNU
 /cHdvyYfbkjFQygcYus8/qfRk0Hzi0ybDcEcJ7EOqSOSitUQ4BaL93Wz+tAY6E9DzL1R
 UdpyhI1IEwQ/dEOJHqhvYWRNk6q6DaljZLWfMdyIzPhPt+2C0+ylnYXv8TCC4WRLgp6E
 ZiqQ==
X-Gm-Message-State: APjAAAUvTCgLyWQSjhnxvMKVKcVsw7oMeeBws3V7diz3tWvPI7dHDp04
 QWUOyAZuYp22F0WE+9Ive7jZpg==
X-Google-Smtp-Source: APXvYqxjdj5vYjUUy2sB0u9Tk6uxU+kfxuJmVI3vHyHL5GJvrsWFCoAFGf8gZgFCMu8WEUVcxUHFCg==
X-Received: by 2002:a17:90a:ba94:: with SMTP id
 t20mr15629024pjr.116.1560294357844; 
 Tue, 11 Jun 2019 16:05:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id x5sm4327928pjp.21.2019.06.11.16.05.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Jun 2019 16:05:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: sei510: add sound card
In-Reply-To: <20190524140318.17608-1-jbrunet@baylibre.com>
References: <20190524140318.17608-1-jbrunet@baylibre.com>
Date: Tue, 11 Jun 2019 16:05:56 -0700
Message-ID: <7himtb4t9n.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_160559_781244_DF0C300B 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the sound card of sei510 board.
>
> Note #1:
> The patchset (build) depends on the tohdmitx ASoC patch [0] for the dt
> bindings of the tohdmitx glue. It also (run) depends on the mpll clock
> series [1] to get a correct clock sources.
>
> Note #2:
> I would normaly prefer to use the HIFI pll dedicated to audio to provide
> the base rate for the 48kHz audio family. HIFI pll rate precision is a
> little bit better than the MPLL. However, the HIFI pll may sometimes,
> rarely, take a long time to report a lock. I'm still debugging this.
> In the mean time, let's use MPLL2 instead.
>
> [0]: e35f5ad6a965 ("ASoC: meson: add tohdmitx DT bindings")
> [1]: https://lkml.kernel.org/r/20190513123115.18145-1-jbrunet@baylibre.com

All dependencies are merged or queued for v5.3, so queuing this for v5.3
also,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
