Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D86C31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:33:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4EC32147A
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c73yy7WU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uKaZA9Zx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4EC32147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jM74rM8pf2yeaRZKnIIXDqg+5ih2vRB7PpVjlGu94zs=; b=c73yy7WUerwedX
	Xte7K6tcayvZzJG0cgVuI/05wz1D7STmEofJ2oMChip+ukTDZAqcjBXnFCzKoJ7JObLl0dOg0FRSW
	JY52Js9m7gITKdbvOSQpg8zUwlwPj4TpP/Bkvf0LTnt3cieFAfnKz8uZKkO8bl2JKU3/z+Q9Nd4SB
	G+5mpyn1y6WQCpQs+ymB7TIzSjm17zlomOmS2xAesjaHE7b3RcNTAA/2aSxeqA1BqUnhfC6XQxEQT
	C32JFrk80+LDoZc9piLT/X3WsR70jPNSb/t4hvs3dzMXIFRC6mj4CyP7ZYbCBqndFJamN2i2rOQBG
	cfE81juYteusLOGeuRYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbVTr-00034k-Fv; Thu, 13 Jun 2019 19:33:51 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbVTo-00033z-K8
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 19:33:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id l19so75564pgh.9
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=do2ZI6AB84f51HhCgs64o/OwEByfbyhqfdO3MCEI11w=;
 b=uKaZA9Zxh7dZs0jS87LP/3uLU+Xx4ZfnKYpIumrpHzc+bsYNKjAsjwm4dlWaYMbD7m
 22QjRog6LAoPdR2/G1bQojmdqmL4Ntx9Jz/So2VnLCauxnDP6oA2oTkF7we+4p5fvcQy
 L0ON+ARGO7XZkiS8Pea48mu09SaNhyc4seHQmMiy+mnMxifwi9tYmShnOy5Sh09gfHD2
 Edp/RI1qtnwPJ9vZy5skTF9m7Dx953HC5jThN3FXUXTfmQBXXQtMOhciWDqUygwJ47kG
 2jkywOogcNcI+F+lVU1S2RSHBfR8H4GzBGvhWiJHfjKZdX0ERpswZ9sqhboY1N1i+tZJ
 A+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=do2ZI6AB84f51HhCgs64o/OwEByfbyhqfdO3MCEI11w=;
 b=kczhyEWfeAZMdoKnwvlqyxFF2l5P35xk5wBXLMct3yZ4L1mbsn1UYNrVF0+KRllvlu
 fQQAP9whFjjWrdRIGMlXeJ84Vl9Z0bolxNLgyMjKZZnOuaQMtnR4yO8AGexUGscaGAcH
 KmnJcOiEy3q+sYugBPVG8tklVg31/FI2jK0Qpk1R86Fz252sE88+NXvYGSDTX7+TpmR+
 rpB3rs0NXxSZIFB0lyb0PtFFdEaN+dI5ATNEdxRJwzOCgJ7buJI1R0YMw0GBjx7hscSa
 pVKL2tAQva6PVGQm/ehWfze26yxAZzSmwV0jr0iF7z00ExsD3KHLZ8QDYqc0PRXYSydW
 bqFQ==
X-Gm-Message-State: APjAAAV6VUEzkfK38ivXt4qptgnex7QHPs+1Ot6gsIf64sgZEC4guqwU
 1JHPNT9GMHquWLUYwkJ6lNUXVw==
X-Google-Smtp-Source: APXvYqxQMYR4H3vojZQSKEgSWAnX0V+23fNF0VDvBBd/zGvF3dlCJJBIKHc8Mt23k45dhtm2gAwWwg==
X-Received: by 2002:a63:2d0:: with SMTP id 199mr31768286pgc.188.1560454427686; 
 Thu, 13 Jun 2019 12:33:47 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id 135sm469175pfb.137.2019.06.13.12.33.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 12:33:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: sei510: add sound card
In-Reply-To: <20190524140318.17608-1-jbrunet@baylibre.com>
References: <20190524140318.17608-1-jbrunet@baylibre.com>
Date: Thu, 13 Jun 2019 12:33:46 -0700
Message-ID: <7hh88t46w5.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_123348_660912_7DC33151 
X-CRM114-Status: UNSURE (   7.16  )
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

Queuing this for v5.3, but it's pending a stable tag/branch from ASoC
maintainers.  If that doesn't work out, I'll queue it up after v5.3-rc1.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
