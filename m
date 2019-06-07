Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A174C2BCA1
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 22:31:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A5820449
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 22:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a1vwGpEl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SlklKlmB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09A5820449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IksA/l/MpjP7N+WaCuoqK8x0Miq8on8Wm4bzwCcQwhc=; b=a1vwGpElYL+JF0
	/3N065XQVBm8BnBB2GKddd+fQFSR+xwfCFrHg7itbUS7Ib+muauUdTM3avoseUKAY1KiuFUcMArjM
	eSCO3Rm60mBcYvSCEWTEAZuVSSPZ8hKFNXZGBSGCagSS5qUwPzPL4I3tJaLys6c9KhpE8xqt2+bSL
	FVqAz87eMueZMDvy7AJp9IPGoKesvXYF1xMfDXh0DdZ32tSTxgrmv6+W0Rbqorc4dAueJ3zmkX3aw
	6vPAH3dEd8g6nPl09g+Wjiz0Rkt2WI5s7Bf+YaBeqHTvh/1Spyuz21ehusjhT7mHA+VkUlRGijmLk
	1bWmC5UOlN1w6Y+8ySiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZNOE-0002qU-4A; Fri, 07 Jun 2019 22:31:14 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZNNz-0002cu-74
 for linux-amlogic@lists.infradead.org; Fri, 07 Jun 2019 22:31:01 +0000
Received: by mail-pf1-x443.google.com with SMTP id i189so1925073pfg.10
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2019 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=T+gmMrSV8LpU7puTEZ6kwYpFcqjKjofHEmL9rgK1UKo=;
 b=SlklKlmBBiFdZPIfe8yLVR3wMr0yt2NHj6Y+rR/RuvE70WJgfk3E5VAJqvEkCAOazw
 N2IC6i/JCQIMB1aAqezYbAAFLQ0w7SXRwMwCf2qex94hkdMHZ8hFG5M6oWSeXvsUkSKE
 +7TNpDMtSrdMz1LIRl6h62d1jWPGFVYPirYiUWeJMpg43N8YN9gZuatmaFQbzNB+/R/A
 lhAtKDBRKeEjFhVAR6/JVH43HLndE96qB6NoL+EQX/N4FEYnHZ6IbGUuAOSt7yOopIJ6
 T+5+RY2/P9l5SxchgzjL6w2E4HP2tDeePcYLIcQqP3CPEhVdPZE3dC2xoOA67HLHlVon
 lb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=T+gmMrSV8LpU7puTEZ6kwYpFcqjKjofHEmL9rgK1UKo=;
 b=AfJbyQ8iVG5rPL2m2/rcTyNtkXmVec18EBFu2NVp4pG/BPh/L8owRB6qKgFBS6pJ2M
 DspkjhLd+RzzqdPDhLjhkh6Y2KFuy6ovMImc8nShP9JpBtcEHdpZ/hBEDinWp5qie3Px
 7U+ZH4Wok8b5DNoMkOZlq8ovRzWuN5Ao6Y8L02jx139lzJdOdP2px7a6CIJLL9iRlJW8
 x+YuL4/qudnKrrDAhmz78fZT/xYaCTRMXbUzt/a5vaIEtOiPdSG8Z+n2ZHUc+YCWF97l
 4Q3GYErt0spvLxPakbt81SAlQwPyyBOeLr1JCNpeejco2ndEaYj5EqPhRekBajdHzrJK
 ByrA==
X-Gm-Message-State: APjAAAVexC5yrRTmAFqhi234KP0tSQAAq0tlFjm2iRs1HNRblMAgIvLG
 cOEj/5EI01LWDeyFfRVOhEuS4A==
X-Google-Smtp-Source: APXvYqygPMKbPrpvJslf3FYcxdtb3QVEH3xirov9jP5r9Se5JGvQK+yhNT57w9YN+pdO+FqSHHNraA==
X-Received: by 2002:a62:764d:: with SMTP id r74mr38588693pfc.110.1559946658401; 
 Fri, 07 Jun 2019 15:30:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id r64sm3822829pfr.58.2019.06.07.15.30.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 15:30:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: meson-g12a: bluetooth fixups
In-Reply-To: <20190607143618.32213-1-narmstrong@baylibre.com>
References: <20190607143618.32213-1-narmstrong@baylibre.com>
Date: Fri, 07 Jun 2019 15:30:56 -0700
Message-ID: <7hr285auzj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_153059_269059_C23B2ED8 
X-CRM114-Status: UNSURE (   5.91  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> These patches :
> - adds the 32khz low power clock to the bluetooth node, since this
>   clock is needed for the bluetooth part of the module to initialize
> - bumps the bus speed to 2Mbaud/s

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
