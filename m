Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10C2C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FN/yj0WuDSxBHbNqpu/i998pZzhZ4VPCop1qj3Fw/gU=; b=OVVR/gm0EN5s0o
	B050KtPW/RlJkzgJEo+y3fLhdUtmrH+1IgKFXrlGkS554WEgx0++xiJHrYEOX8YkULJo/uVpXheyC
	XdjoSR6GQA7/3Ja/nwcFRsrKRmThh9ogySRcA+oGCCe7Klal4clD8HRpsNse4DxgHzveXwmg58i3Q
	8MKRtFP29g38P2MuXCC9rSutWFW8yqlxuXFiEd+8IndYVPCJluMBgoQGLrbheL3S4IXjSVY3iUgLy
	u+K+OVKUmOSShkgXoKbuyzxqSfm4VjWMYPCbsqmT2KpbIN4VDJFWpmJGEl9C0Kd8jUwoWI8wXxox+
	5Go55j+Xs9AbTT6hXnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWV-0000000D3Hs-30wF;
	Fri, 26 Apr 2024 15:30:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWQ-0000000D3CX-1j7P
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 15:30:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-51ae315bb20so2804954e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145395; x=1714750195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUkLsSc4WA93wLtzN5OQsZNRMCNr0FDmpfgqlBr15OA=;
        b=tnmWyvGuX4uK9Jq3FmsaGoCRWchjzX/57YFLX8lxhcHdgPzio5+aQPnpJogKwev05p
         N2tXNcP+CkZbiE4bplU7D5qFhFhDjJ+1Am7U8MjVVHF51oFGbVl2xhlNfQjnfGhvggLM
         OBK/59Zk+DrKjVUTidEd31bW5a2oV4OHA00GF0zm0xtlAOZ3GCYvH1aELMT141r7V2IM
         F+9Qp/N8Z4n7Xw8inW8Q5DEC4VHX7g3N1dNaHlD+Ri7/RfwOwwZRik11xtLR0Ophzvth
         0sMA0YmQLV77J5e+zPDYK7JCGCEVTetkpEro+74HAAJ8ooLWl2TeRs23+2dNvHsY6gl2
         Nclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145395; x=1714750195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUkLsSc4WA93wLtzN5OQsZNRMCNr0FDmpfgqlBr15OA=;
        b=ab8yOZl74pvGslLvFF1LbV+miTxaljqJ3WPDhDQTtyF1I/zIEP/PYWMgftB24gomPh
         E4IpgV2jsfUD4DDEO4zbBv0OXibstcpZDKi3EyIB+JVWfLA2I8ueobz7T3Az1NwEoFZz
         PoW8yy/5uaEozixh3AC33RiOQf50jBorqzVMnlZBNnMLjuAAjLu29zun6DeILv0N1UM1
         XKCVi/QFm0kGKwHISoHDb/5kdTG811Z6MW0IQ87BbzmC5A2ZxKifGExlezUhsWT8QjlD
         rvXMJy3n3IuB3d7IMN+E6X1FxOBUP8Uy2irHrXizrQ/9A7AviB3kSDeUxWBxYqVenpZU
         BveQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRiTA+ikDmKUBeX+PqaIW37FcHL2uhBesMXMcMX0ZiKmb/H9fn9SPR5qHccex4Sh2Ee4mGeoBzvaKVLSHDgs9+tezo46X52lgU8jbOPHYQl2A=
X-Gm-Message-State: AOJu0Yw3YlP7kjsAqYYVyDs+UQmAamSqpD2QyVl1bsYZIvjUIoJRMUFt
	XvGGuI44u3FL4QP6FgFLAu3ssInsPffgeqqzyY4PKzbppnOOT9t24KkmMOCg+fQ=
X-Google-Smtp-Source: AGHT+IFMxlBhWe1Oje3VzHCy05U8U/CCJEV92z6GmGIYTbHCedgsiCSp+J0MWzhqi0Ldz9xuDlW6Sw==
X-Received: by 2002:a19:ac0b:0:b0:51a:f255:ade3 with SMTP id g11-20020a19ac0b000000b0051af255ade3mr1761882lfc.20.1714145395077;
        Fri, 26 Apr 2024 08:29:55 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/4] ASoC: meson: tdm fixes
Date: Fri, 26 Apr 2024 17:29:37 +0200
Message-ID: <20240426152946.3078805-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_082958_474902_A4CD10D7 
X-CRM114-Status: GOOD (  12.28  )
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

This patchset fixes 2 problems on TDM which both find a solution
by properly implementing the .trigger() callback for the TDM backend.

ATM, enabling the TDM formatters is done by the .prepare() callback
because handling the formatter is slow due to necessary calls to CCF.

The first problem affects the TDMIN. Because .prepare() is called on DPCM
backend first, the formatter are started before the FIFOs and this may
cause a random channel shifts if the TDMIN use multiple lanes with more
than 2 slots per lanes. Using trigger() allows to set the FE/BE order,
solving the problem.

There has already been an attempt to fix this 3y ago [1] and reverted [2]
It triggered a 'sleep in irq' error on the period IRQ. The solution is
to just use the bottom half of threaded IRQ. This is patch #1. Patch #2
and #3 remain mostly the same as 3y ago.

For TDMOUT, the problem is on pause. ATM pause only stops the FIFO and
the TDMOUT just starves. When it does, it will actually repeat the last
sample continuously. Depending on the platform, if there is no high-pass
filter on the analog path, this may translate to a constant position of
the speaker membrane. There is no audible glitch but it may damage the
speaker coil.

Properly stopping the TDMOUT in pause solves the problem. There is
behaviour change associated with that fix. Clocks used to be continuous
on pause because of the problem above. They will now be gated on pause by
default, as they should. The last change introduce the proper support for
continuous clocks, if needed.

[1]: https://lore.kernel.org/linux-amlogic/20211020114217.133153-1-jbrunet@baylibre.com
[2]: https://lore.kernel.org/linux-amlogic/20220421155725.2589089-1-narmstrong@baylibre.com

Jerome Brunet (4):
  ASoC: meson: axg-fifo: use threaded irq to check periods
  ASoC: meson: axg-card: make links nonatomic
  ASoC: meson: axg-tdm-interface: manage formatters in trigger
  ASoC: meson: axg-tdm: add continuous clock support

 sound/soc/meson/axg-card.c          |  1 +
 sound/soc/meson/axg-fifo.c          | 29 +++++++++++++--------
 sound/soc/meson/axg-tdm-formatter.c | 40 +++++++++++++++++++++++++++++
 sound/soc/meson/axg-tdm-interface.c | 38 +++++++++++++++++++--------
 sound/soc/meson/axg-tdm.h           |  5 ++++
 5 files changed, 93 insertions(+), 20 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
