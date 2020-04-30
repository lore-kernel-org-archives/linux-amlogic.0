Return-Path: <SRS0=G+6o=6O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122CCC8300A
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 12:24:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1F32076D
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Apr 2020 12:24:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g1Nm+80L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xd8BJWpE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1F32076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EEeN4+066NnpO08/kfPqIwXUgNHixk/pGsIfHqvXQyQ=; b=g1Nm+80LG66C7Y
	04nQMp2H0+IlujCyX9Onij9VLsVxzefXn616xizE9p+NZHAyefvT2dCOOf3WppZSXagbtwuolUmsL
	gSk/PTBXJzTxfmrCQR5yLy17BVsSn7K/ePKp/LFP1zJzATxd8PJzZPpUcuU24kcpEIhwGNovs6sV4
	XApl2cJMrwYYsG7/z6nIU1K5w/7I0ur6tchXCS/GMvj5Wx+0dPrDd19vZEpNTSYFqHlZlXF1oMrkv
	S4G7dEZDH9Y3TvtBuwoRWSY+nayZR7YExu77vW3O4wDiMRAz1rOUstQGCCNe5MHnzxlYr+RCt+/BE
	p2ewKtMIhYq5DG7Dnh5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU8FE-0000gs-GQ; Thu, 30 Apr 2020 12:24:48 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU8FB-0000fx-BF
 for linux-amlogic@lists.infradead.org; Thu, 30 Apr 2020 12:24:47 +0000
Received: by mail-wr1-x442.google.com with SMTP id x18so6658176wrq.2
 for <linux-amlogic@lists.infradead.org>; Thu, 30 Apr 2020 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version;
 bh=0SsmCVXRnkXXPF3iwxgzfLk25Cg8yBecJWm6wm0A4gk=;
 b=xd8BJWpEAmPWknlFQI1p20/J4G6PE8GikQxXOWevEiuthufqNhA3cFrOo8YgIj2iJ2
 qF37zkSLPXCHKVtOIJr8D1csGe9h4K6aS56hvzBBoD5cElmh64URHRrJr64sBKtVW8/u
 jqZozKJR67XNrH5P8D4JUPrEsjBGvI/qbMNjxxjux+W+urdy/FSPpl8EChcqxbmyfi7V
 31a/X1bA8gH5Akql+mAQx0IBXql9YUBsNrGXwXf9Vru3c5O8pWD9eHHucsEGOqkN8KwV
 kzADn2HNkLXSlmkZDlmaOZs1hGfGKV9I8K1ydamIMlMo1ioXvVWKfkTKMX4tjWarVGWF
 yItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version;
 bh=0SsmCVXRnkXXPF3iwxgzfLk25Cg8yBecJWm6wm0A4gk=;
 b=KTtqTJ7sL/K1Cb0TZvnSHFu+EVjogsRZEIOUceh9KQMUdH27cfsG4Y87UgamuP+Nlk
 OILVSso1s8lCuutimJnpGTcHrsFTwn4aMbjTjXsEbQj+sJjri7doBT7N7L67o0/IrWfY
 MZxpbZb8OGomwzQDPCPraQ0HOWAbgho47A19uBV7D7fyLB1zspNZZVPi7WBLb6+kbHSz
 W+Zr98nGWBfHMEBDBmWgV7+W7pf24Z9ZDnLiSCZcnIDj5pJMhPJbmb+D7NeyenFTOYLM
 +NQ3yrEip8+5CtehfFje1NA9JdzfUg0NJpbzB4yUgbS4Kv4dC1zeziDo/EszrZJzMGQP
 PdZg==
X-Gm-Message-State: AGi0PuY3Je3+cceBWkSB9V/PQYpdO50Jk1jWyVEbl63cLBlbuhVd/OC5
 opI+Bzp5QQHk+WmwaR5YqvU3lA==
X-Google-Smtp-Source: APiQypJ5tpe4MZNXWxAc97GLCd8uPMJ/9ymBE2FrP7SAVu2s8iWKNUQSodKMKtfL4llzvGmNRkzVWw==
X-Received: by 2002:adf:fe87:: with SMTP id l7mr3863095wrr.360.1588249482859; 
 Thu, 30 Apr 2020 05:24:42 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id k6sm12640874wma.19.2020.04.30.05.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 05:24:42 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ulf.hansson@linaro.org
Subject: clk: clk_register is deprecated
Date: Thu, 30 Apr 2020 14:24:41 +0200
Message-ID: <1jftcli2k6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_052445_387460_5A7A77C6 
X-CRM114-Status: UNSURE (   6.49  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen,

We have a question regarding drivers which register clocks in CCF and
later need to use these clocks.

So far, these drivers had been using clk_register() to get a 'struct
clk*' they could later use with the linux/clk.h API.

Now that this clk_register() is deprecated in favor of
clk_hw_register(), how are these driver supposed to get the per-user
"struct clk*" they need ?

In this mmc thread [0] Martin proposed to go through a provider. I think
it is overkill, especially for a device which will not provide its clocks
to any other device.

They other way available is "hw->clk". I suspect it is not recommended
to do so, is it ?

If not, what would be the recommended way to get the "struct clk*" from
a newly registered "struct clk_hw *" ? Should we add something new to
clk-provider.h API ?

Cheers
Jerome

[0]: https://lore.kernel.org/linux-amlogic/20200428210229.703309-3-martin.blumenstingl@googlemail.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
