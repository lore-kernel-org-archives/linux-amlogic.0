Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF3AC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Feb 2022 20:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAgYXB82MgwNP1iB+CpYjvaB0l37lpmPrYKtwWNnJp8=; b=vDuJhFq5GG77uy
	FBqS2aTeuWJqP0AAsDJ8MKMeL7PG94LNTzIFfSmHgjcVpT/4FeFjmXk6+WL+4SOBTUpa5yQfx5h9F
	YCtr+fNfwr/v+bAlqk49QisOKvn9vevDJUsOWIs0aQidrc+TXFAH6ON23wRfmzv44eDW08E2EcaGU
	qiEVKGiwJmWX7mI8qb/Z7CeX4a6Zq1RsEL+J0LYqNbtGY+YVDnWbVo+LOARjoFTg0gsk3jUSzBkdw
	eAm3G2mCGh0qeb3jY3up5JJ1MgAqAPxUneUVhtTq0WopfNtWrBteLTx9FgnaXgU11BVCKUGgbyDGo
	pBnvpsOJVCpN6vrDFFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHtrH-001cYf-N1; Wed, 09 Feb 2022 20:46:35 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHtr5-001cVY-7v
 for linux-amlogic@lists.infradead.org; Wed, 09 Feb 2022 20:46:26 +0000
Received: by mail-pf1-x430.google.com with SMTP id i21so4979683pfd.13
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Feb 2022 12:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=78nJXDfmr//iqkCpJCXmmDUOzZ8w2oIwGyGP9nLOEfc=;
 b=Vunja1WpaNu5p6wfFPAjyHKQ8YyGTJ6zeo0OoPoWTGhTqeSRtYhi4zvfqDseMj3UaW
 f84lAthwXw3UmvPfjk8ltUYN+JefaEAAuhJdgRwPHutOufpI+G0S6FKbZCIaBsXQfbq6
 NOLHolki2PKzt93ROK4Fj786sndwLxv4UVwArcIECjJ8Gu6H4LxHwMAT0wq3Nvz2Qjvw
 PvdCas6sjRqGl9+A1kZY31Y9t8HYwweJ4LlzpklB2wR6mNTB0J1CCIzM5BRCQWAGOGml
 PwNraH9ZBkJfm6V1UR7bFUixi9NJ7gwmInSV888GLX2Gia9BNowSFWJZMz90TiGIqWSV
 CQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=78nJXDfmr//iqkCpJCXmmDUOzZ8w2oIwGyGP9nLOEfc=;
 b=PQC1Vw6DvZSHx3cvVXsYGkiiBKkxKDFzOSr02vIHrEje+gtUL3ELbHjSz+Apk44XMG
 GeDaSryAY+D2Aspfx8k4014zdx082xyHCJ4rzeCyuCfpwhEezFUOI0qhYDy4lDoRlmQd
 y+uWdTWH3Frg7QEOqA7HUQmgXjGAT2VEBBN9iONQ+7FPXoLci0tN4PHtSx9/gtDkmw+Y
 naBBmwn/4Nc1Hdxq0E4MOf4QBOL7CeOyR4hs8rSTPG1lcYVNG7LDa9VmJX6s/qoskScT
 kUTAXWz4Lo9h71BUnt1Fz4pulK1gHyD75M7oMI97RCZm1X11n5mSeqonaKt4PJh6EvQZ
 S6fQ==
X-Gm-Message-State: AOAM532Pz/Qb137HawvkAoiupfpeZAivL6Lzg54v2r3hb39ctjfZII/y
 AZGatL54UBK8J88VVN2QiHZ7YO3++DXrWw==
X-Google-Smtp-Source: ABdhPJy1EPPPscPrTxELXF/O0JLfaezpMxmi2sVgyHAvQdoKK3cPB+OENHfWbpQDEBnNlosgsUtiKQ==
X-Received: by 2002:a63:3d85:: with SMTP id k127mr3361676pga.350.1644439582562; 
 Wed, 09 Feb 2022 12:46:22 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k14sm8399557pgt.73.2022.02.09.12.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:46:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Neil Armstrong
 <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: remove CPU opps below 1GHz for G12B/SM1
In-Reply-To: <20220209135535.29547-1-christianshewitt@gmail.com>
References: <20220209135535.29547-1-christianshewitt@gmail.com>
Date: Wed, 09 Feb 2022 12:46:21 -0800
Message-ID: <7ha6ezojj6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_124623_379732_1B869F1D 
X-CRM114-Status: GOOD (  16.13  )
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

Christian Hewitt <christianshewitt@gmail.com> writes:

> Amlogic G12B and SM1 devices experience CPU stalls and random board
> wedges when the system idles and CPU cores clock down to lower opp
> points. Recent vendor kernels include a change to remove 100-250MHz
> (with no explanation) [0] but other downstream sources also remove
> the 500/667MHz points (also with no explanation). Unless 100-667Mhz
> opps are removed or the CPU governor forced to performance, stalls
> are observed, so let's remove them an improve stability/uptime.
>
> [0] https://github.com/khadas/linux/commit/20e237a4fe9f0302370e24950cb1416e038eee03

hehe, not a very helpful changelog in that khadas kernel commit :(

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Numerous people have experienced this issue and I have tested with
> only the low opp-points removed and numerous voltage tweaks: but it
> makes no difference. With the opp points present an Odroid N2 or
> Khadas VIM3 reliably drop off my network after being left idling
> overnight with UART showing a CPU stall splat. With the opp points
> removed I see weeks of uninterupted uptime. It's beyond my skills
> to research what the cause of the stalls might be, but if anyone
> ever figures it out we can always restore things. NB: This issue
> is not too widely reported in forums, but that's largely because
> most of the Amlogic supporting distros have been including this
> change picked from my kernel patchset for some time.

Very interesting.  I've also noticed instability across suspend resume
on VIM3/VIM3L and only got as far in debugging to noticing it was
DVFS/OPP related, but didn't get much further yet.  I'll give this a try
to see if it helps.

Thanks for finding & posting!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
