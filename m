Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D224C10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 07:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88BBA206B1
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 07:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lUMkmRys";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEivLkFS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88BBA206B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmxRUIPGc/Bf6sUhT1srYYfKxAxzINWPiWeRMD8pwhg=; b=lUMkmRysOxjsPr
	18JP8hJMlhi4iJbbGTTJurdD10pAzZSXBv0Frvg0twCZXBfo0iILsp4Q6JKJ1Kml3awNOW+YBEMtx
	bNjx/RYBGHYdfHIy9RJpF/n+XuTcZGsuGMQEMJ5pGbvyyrmqy2SnCS2jrLnQHkPq2PLig3djTaDj7
	E6Cw9aWnvGhl+QfFPqwgGBxbOOOMD5g/EhTFCfn31dtaFfpnGac3iX3aL6y8Y0BTtn1UGf9Y3AncG
	5Zsny2i0/MdDM6yoCC99zjwo0yZBuLLiLBKgR16TtpLQv5D69uY6hQdKDh6feRtSykGl9vqb4TCgf
	oZ679C5gSWgshOHu7/YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCHyu-0002v6-9Q; Thu, 12 Mar 2020 07:10:12 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCHyr-0002t8-L7; Thu, 12 Mar 2020 07:10:10 +0000
Received: by mail-pg1-x543.google.com with SMTP id t3so2602864pgn.1;
 Thu, 12 Mar 2020 00:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ljw1ounoCZTVG+RnME8ZEWoXQjwz4MM2v65DKn4hE/c=;
 b=HEivLkFSubwB666Df2bxBcldTFyNFCcVeJlLB4IE3SXpNB+MYnRL5cmEKoaGnwdB6R
 5AkNJPZ5rOOl23MD0YeEH7MvuVXq+VUPa+LrQsLriASOMMX5Go6dFIBbdLm5rAZH83h2
 bp61TPv78yl6qw4W8Jeoc5NykErt4zo36Q2R4CvHHG0RjhQMTbtzqGz4EfuvYbv0/ZpM
 mGihoQP12Xn1+VwAqI/55fLE2YrIdLOyQuwqp7cbfbK57RF5s4prOe726uWlLI4vbnkA
 pZva6NJCRNH0hh8E6KdFBMwmwEBiVnLai38PfkOW5sm0Xok0E4jguOiTrXGJ/V1n3TsC
 OjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ljw1ounoCZTVG+RnME8ZEWoXQjwz4MM2v65DKn4hE/c=;
 b=qKKmYIDGcD4mBDDmBzIUzfVPKUnHCmAqsAFw8VUHJhmgQ0ahTj+45X5U8pG0xKtA3j
 SinUUqVIJ47wAYb9T4AeFKBORYBDFx3Xn0uilaYi2KpjKd/JQWmOqd8JEpI3dDnUjTKQ
 R+B9mbw5Sgm11TMqvBpT8XQqy+s3ZmHfiXNRrKJu02DbXDwRvNOJe4HwryvN5LWNtcGj
 Jgju5SH+nXRmnwaCATCDrLjXaEpwRGasUpkPtCWbipzZlIoxtNNDsnkjrn59iNGXidKo
 Mel/7IBR4IleMSk2hGNqVSaGekFfkok847mnXFqCgy0YFkSpOg3ISMhSEDnbLRih7OSg
 oUiQ==
X-Gm-Message-State: ANhLgQ3J857pccF3QhQAiInRZMH8n58VJ2C8RV1zQgfmad/mlCqS2BIA
 itYvqO20yeI8p+vCMRS+y4Y=
X-Google-Smtp-Source: ADFU+vsa8Kf3tsY8FS7mPDY4biE2SeexdcM7YCIk/K/oVtDeAHxnIOxoQhr5MChQiCBGU9DYXPmQ4g==
X-Received: by 2002:a63:f44d:: with SMTP id p13mr6613839pgk.113.1583997009092; 
 Thu, 12 Mar 2020 00:10:09 -0700 (PDT)
Received: from localhost ([106.51.232.35])
 by smtp.gmail.com with ESMTPSA id 134sm627049pfy.27.2020.03.12.00.10.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 00:10:08 -0700 (PDT)
Date: Thu, 12 Mar 2020 12:40:06 +0530
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: daniel.lezcano@linaro.org
Subject: Re: [PATCH v4] clocksource/drivers/timer-cs5535: request irq with
 non-NULL dev_id
Message-ID: <20200312071006.GA5415@afzalpc>
References: <e47ba222-bf4e-d13c-fbd3-6e7952097188@linaro.org>
 <20200312064817.19000-1-afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312064817.19000-1-afzal.mohd.ma@gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_001009_696983_4A33A62D 
X-CRM114-Status: UNSURE (   5.87  )
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
Cc: kstewart@linuxfoundation.org, linus.walleij@linaro.org, shawnguo@kernel.org,
 festevam@gmail.com, f.fainelli@gmail.com, khilman@baylibre.com,
 krzk@kernel.org, kgene@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 allison@lohutok.net, u.kleine-koenig@pengutronix.de, linux-imx@nxp.com,
 rjui@broadcom.com, s.hauer@pengutronix.de, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, baohua@kernel.org, sbranden@broadcom.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux@prisktech.co.nz, kernel@pengutronix.de, info@metux.net,
 nsaenzjulienne@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

subject was not supposed to have version info, happened by mistake, this
is an incremental patch on top of v3 that has been applied to the
timers/drivers/next branch.

Regards
afzal

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
