Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079EAC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02A220828
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 09:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NaOfL9H/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2HDQVaSp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02A220828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAlfnURWA1cNdpsGf+RRWmtvMMXqR7usp+Wi1UAeK9Y=; b=NaOfL9H/0frbh9
	pl9fyVIk5fWi4/GQdbg8ja/DmpEXPKdA3PAANv73FQPpmgzNhkTU6MSQOgIDuWBRbBS+hT5fGqNAT
	8RgbJX/1HkMw1sfoRfDJu6aKwqWwEYqqaIPO40COfmYSm9SpX+ACFGWRhJcorFx5JC8dg1VnY0Dho
	TYfPnNEmHJ/60BaIcEdkoP7T/ipDhJWPWvRSKBp7AyoJmrAv3BZ7R6aH7XgvprDV+65cc043hhaS2
	xzLH9UQ5D9E/7H1ORww556qKokwVNxH+vRE/1DcCLQepKJvU+zNntpw2JVECDrvhmIrVj1/Jreqp+
	wbNZYgOH659HfF5xFQjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6AmN-0007YX-6a; Tue, 19 Mar 2019 09:11:27 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6AmK-0007Xt-4N
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 09:11:25 +0000
Received: by mail-wm1-x342.google.com with SMTP id o10so16185132wmc.1
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=OBhyq4n5SGWqCjrfChQye9qgetfLwZTxQxDkttOwm/Y=;
 b=2HDQVaSphB4nvyB/uQwhD9tnS7lpasSGWli592aXD4STjpWdylTeG1uPju1aZWUzNK
 liGTrB0DuRL6CP/F4Zp7w2Qw5L7UeajEJQHcjNqvAu9ZPiYNVRxOro2t/m0OcH6HJ7JX
 9+7lkQENacwneEr/25PR7/oqAtkKekGTQeVZf/H4M4bjBhWDPemZa8B7Q1qeAKTGc48q
 9lYBrpWGWGmG1RBcGZoxZkgcpkYyZ9Dvno/u8ThczTq0Xzc0m1TZQvMXlN3SPL0XnjCe
 hnfibX5oLAFcgbijQD96PWt8hlSKVwZQeBRmGNplkhZgZXZT0psmJU01x2klpV/0fcg+
 4s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=OBhyq4n5SGWqCjrfChQye9qgetfLwZTxQxDkttOwm/Y=;
 b=PaYxjiiUUqQ4Qlwc7vmx/I76XuPFwfgVykvpXPpKNskNhgGmMU2B6fIUZgF03Lf/N6
 br85kb9DAeDov8ql3ouxNBquwNwGxw5g62p8a7tdsyhCssEq4nuPK6zsXDduAsnxnOys
 BbWDyUTqPti3c7or+h+5w5vLKQuSo9tYDIFmAy1d+UQIq3OEVw7DTatk4yvxXjfYjref
 jiFpSJx7P7q/rtIV8yTLYsNkTMiyboPbIG+NKRn+0rFy+67Z+o8PZTIoyY7uxgl3Brpu
 04mIAxVMhXKq21Ui+zXyNk5IhCyqCw5n4TIfDfk1+kqpelgQOh0t+g4Nz3+pPl6oZ47i
 T+Yg==
X-Gm-Message-State: APjAAAU5sOL6FRIXPrnYdzz9PPDbh1ODZu4YZMN4pccEIRviHjR9Fs93
 c8WBiHDuShWPMPNTsQKXppT7Ng==
X-Google-Smtp-Source: APXvYqyi7fJAhGJdYC/s+9y4g4QBbh9uvb+AjHuL2QeXxI2vyzaZk3IBRQ+iqJNss5t6tLR9LCZjiQ==
X-Received: by 2002:a1c:7a03:: with SMTP id v3mr2564249wmc.59.1552986682564;
 Tue, 19 Mar 2019 02:11:22 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 r15sm9084274wrt.37.2019.03.19.02.11.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 19 Mar 2019 02:11:21 -0700 (PDT)
Message-ID: <3bebbae829d0a0e1e3ad26572e91ed141dbe5f20.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson-g12a: fix VPU clock parents
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 19 Mar 2019 10:11:20 +0100
In-Reply-To: <20190313135503.3198-1-narmstrong@baylibre.com>
References: <20190313135503.3198-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_021124_172832_DAA10FA5 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2019-03-13 at 14:55 +0100, Neil Armstrong wrote:
> First two VPU clock parents are wrong, fix it here.
> 
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
