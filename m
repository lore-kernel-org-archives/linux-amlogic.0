Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B336C04AAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4081C20657
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZRt7uu16";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QZgNI45D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4081C20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpbrvS3gbIwt2tKcvC09uhFWt91zoYwGyU4MGFLQqKA=; b=ZRt7uu16sNdDDa
	itoYdHEzvei+cxz4exCsBxLlKxe0oj6MA32LKZFFr4UwrT0i+WzUTUq6jBvQ0KUb0eMfOyY6EwByb
	GlVmSdwqzIoZbBAKycSqjEr2PDdZjcgFhfBjHcISvufJy66YXPwhmn44E6UdisI05shPBqCgYvF2j
	ybdVv0+OR15vveFWXUa/ANzibekunXMm1qWHWoM+l+Pt/IKB3ZkLlUQAfRikvHcSWPOM6gIHwsN6k
	+PdZO2UloT7TU23CGv5rgAu9DgD2DBH51jcnkZR1rLDj8tKZ3DWHV6DLbjzMfCzQvKx2dv8/91bYj
	catBeKKnibQwH3GlCOAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSlo0-0002FW-7I; Mon, 20 May 2019 17:10:32 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlns-00026r-Tk
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 17:10:26 +0000
Received: by mail-pg1-x542.google.com with SMTP id c13so7091585pgt.1
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=I7O1t0HTMIayhEjL+JB+8Z7qxurHkXoWUdusDgjI/aw=;
 b=QZgNI45DOAwYaDO1iHICnzp4zHKGESb3mm7wGS2JhmkSoAYChyrynGZrvsxv2RRwFV
 O5jOc+IVUU3xphkbgMuIIJBamG/nurDaVgvwodpNwYOXcQomCmQDTu5SpbYpzcNXuD9Y
 6P2mIgfpgnkVSVjWYL6H9vtosiFubgEEcgjE0fv5qHKs5AQ0Xf1efIiGcx62oznUyjIs
 AcSLpXr98N7w+pcE0juLeZxwWhIXxSf1wCbg58+6vO2cWDwaQ0xK6eXP1kOCR7sen0Oc
 WOCF1P4/bsM5Q6CIyzvQu2h1HQp/LP4ZLD0aBF+7YIVJmDzaLvHfXNQYCew9RFUjM+DO
 +DoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=I7O1t0HTMIayhEjL+JB+8Z7qxurHkXoWUdusDgjI/aw=;
 b=hoMEDJQPJRq69TgpkU3ExU7jxxoV7EVCuctw913qWD/4Yh3Vi6VdIrwINo5FJcRVCg
 0iXaUmQP8TMAmN60mvgi0lnwJ11HM53bl9KpAd5ldW0KamgRIxMj8MCN2Fsn4b3wHwKH
 9n6i5Ow5idMx5OvGtyDJ166yUQykws/Y4pu3ZfhuNofdXzLAoUM7wL2qaqfhE+DeBH1A
 kWWGFFbXXwm6UGyx343inJgAUPqQKvPrDJmx+1jWCXcq6Xv9Syk+tj9BhP0ulYj31Qfv
 h6erwZXCUqrqeXYWYMcbTyAhSeil75ythw7atFCHUEMdKdFGvDdQBuL7nrYCX9RZUuNq
 jEFA==
X-Gm-Message-State: APjAAAV4eGtq8lgw2xjVCndizOaDTvbkdn8zPmXQ5tkxVI/xWkaA/FJi
 f3fMXsceOdzekkkKu78d80pCEw==
X-Google-Smtp-Source: APXvYqzaOlQqLS/+QC42OQ5Qr8ZY2ncGO7QbGmE1r8wBifQgCAbuNUputplZ7iTSIWjw5VjtKCNaTQ==
X-Received: by 2002:aa7:92da:: with SMTP id k26mr36518157pfa.70.1558372222724; 
 Mon, 20 May 2019 10:10:22 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:e483:1cc0:e2c2:140d])
 by smtp.googlemail.com with ESMTPSA id
 e10sm37432545pfm.137.2019.05.20.10.10.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 10:10:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: Move 'amlogic,
 meson-gx-ao-secure' binding to its own file
In-Reply-To: <draft-7hsgt9842a.fsf@baylibre.com>
References: <draft-7hsgt9842a.fsf@baylibre.com>
Date: Mon, 20 May 2019 10:10:21 -0700
Message-ID: <7hmujh832a.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_101024_957769_878D9D75 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Rob Herring <robh@kernel.org> writes:
>
>> It is best practice to have 1 binding per file, so board level bindings
>> should be separate for various misc SoC bindings.
>>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Carlo Caione <carlo@caione.org>
>> Cc: Kevin Hilman <khilman@baylibre.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-amlogic@lists.infradead.org
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> It seems this one fell thru the cracks and didn't get applied.
>
> Feel free to apply directly.
>
> Acked-by: Kevin Hilman <khilman@baylibre.com>

On second that, we're going to have dependencies on that for the v5.3
cycle, so I'll queue these up.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
