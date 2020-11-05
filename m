Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB943C4741F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 19:32:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CDDD20728
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 19:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rBd841eF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rPWhiFSV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CDDD20728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOoVwoefFP+CF+5zVFjV9I65Y6byaD5EcNkiM9A/FNQ=; b=rBd841eFy53qmRxwUAz4Qv2HoY
	L2uojf5GihuPdXRgJ9Jpu1eRz1G1ndODGzbPxScR5LobRIVR7tddt+k/VDlzI0tzDScfZFCnlL069
	TBCERynV70/xV5kwcZld3A7yABKuHa+bJzE0Jj1p4r0rzveQbXtkZN5LG6DSe4NMhWiJUpnesSj5h
	U0HxlL1ws2hIaCq+fRL7MmHklt7uB5wEaRhL7FkIwnReMJBrMjtDPxpn6epTf7niMcJ2dhdLw4OwA
	MZXvoM7bzEtfXA02OgHFHo/4FdN1idHDyPE8dRCGuI/jA/tr+u/PI/5N+FVNnel0E7yBuWfs6kdYG
	bZh3583g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakzV-0008Ll-OD; Thu, 05 Nov 2020 19:32:13 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakzO-0008Ig-Sn
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 19:32:08 +0000
Received: by mail-pl1-x642.google.com with SMTP id g11so1260072pll.13
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2020 11:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Um0ao2Ro7HvzCNbvA5nAGZxuFgMy/MdwAFFYS8m+8Ho=;
 b=rPWhiFSV8Dc8dx/FYpos+Ff7DcqQ2OBPkYGAGxJbfShz2xOFP/yLk1pi9GsE7KXWDn
 oEHNrC1wLNzaGErZQ/y4zauaJPePzueggVrgs3KRefVBSMxrktIfYNfKbbIZKUOL+8Ue
 9l0MjFLkwJaX5vMMxLIn596bnZqeP1HkPEMRG5p9xOWG9MEdRnWv6IOkuml20ClgFlox
 FXI8RKUhxH3bWtv79aaFPMa1XwAg15HPOTi6TAORdlhaELK9KaOmrX2WdppZzaHkyiI5
 IRaDOdl8zTSDFZuWmf7qdWDvxdpus0P+Rv1uMoiOlAdUV/nIhL+IqfOrjzDdslzcv6Q9
 fMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Um0ao2Ro7HvzCNbvA5nAGZxuFgMy/MdwAFFYS8m+8Ho=;
 b=HdrjiAPU1SghYajOSHtABCI27661X5fWZ+irZyoubZO9NrvfeCczKcjvYpDvxWn+do
 6lZnoTqZc55zZlXUOaTIi8uVutl+eQ8K+OqGf+Gzm158axuqEXy+kr2SNrh7cKQLk/K7
 Abf6xgdupp0iCeFWF8AmoTVnzdIm1KQGseW52oadyzO5XndpluBgnIAcrEbtvduEwYCw
 s05GFVcctgpJhvCgsNBlbtIy7xKVH4azvBzD3rxZTutt0t8S6UTi7igotxmquqRoOTKw
 OAXlpLx7wcKQ8MYRSgRhHW+bgy1o0xV/3K77tjdZuGE0dT7elFOyrJnh+T17kS1d2FCy
 RmMg==
X-Gm-Message-State: AOAM5316RSWcTt7JrSfNQ3jyBO1aH1iunlzYswe/wcczSjIqju2fri9w
 TrGdICKKoq+/1iFnvEvLu5Ry3Q==
X-Google-Smtp-Source: ABdhPJwt1K7gChJrIWvazpJKOR3yDHs3rMBH25KsCSdXPhZY4Pbnpb7U1+slz1YvHWoj4Rz8IP2Phw==
X-Received: by 2002:a17:902:9b89:b029:d2:42a6:88f with SMTP id
 y9-20020a1709029b89b02900d242a6088fmr3711295plp.71.1604604724943; 
 Thu, 05 Nov 2020 11:32:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d11sm3500918pfo.198.2020.11.05.11.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:32:04 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, linux-amlogic@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: remove empty lines from aml-s905x-cc
 v2 dts
Date: Thu,  5 Nov 2020 11:32:02 -0800
Message-Id: <160460471585.10458.9400136193954173515.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026134101.10594-1-christianshewitt@gmail.com>
References: <20201026134101.10594-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_143206_967470_701B1373 
X-CRM114-Status: UNSURE (   8.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 26 Oct 2020 13:41:01 +0000, Christian Hewitt wrote:
> 


Applied, thanks!

[1/1] arm64: dts: meson: remove empty lines from aml-s905x-cc v2 dts
      commit: 8e9c052a483db5f9ae098d9b686ed80e2e98a8c5

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
