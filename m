Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FE2C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D5EB208C0
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5Jrh/7w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Zjen9v5W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D5EB208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2u5ivYTz/n4lbIsnzSv/sLq0Z/Cm7ZHKAGi/gd7gr5s=; b=o5Jrh/7wAemoLU
	q5ZerBfC509YvZVcfakLOHEqqTf+LxLQRHPeKu69gsk25nzIie7o2bciwiTiKNnl+ivshaVzyxQOh
	j4gLiCsd3vpp3YP3Lerw5iV5+yIUKLFXZPGWIRNPX1irwQa1z9obX74iErPg62fy7PwOKbx4J6/Ph
	kiJC2nLSnAvMK2fzEYBRj4QcSPXfEi3QTteR875ijUlVeFCMW2gbS7O3UDZtlL/sS4txHDcMkyZge
	iLKi7u/JwGTXK8AVfswJAfkObwireiE35pYT4vGZmtwFRLYpLqQ1asiQQfo3yrYzm5Sx4K047JwbR
	M2JugIPtko1LNXeyU+GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYyTZ-0007XE-7E; Thu, 06 Jun 2019 19:55:05 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYyTV-000764-J7; Thu, 06 Jun 2019 19:55:03 +0000
Received: by mail-oi1-x243.google.com with SMTP id m206so2463104oib.12;
 Thu, 06 Jun 2019 12:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZgQ7oCfy0nLOIQgW+qtzhKYHnPLM4G90MVyLVLrcIT0=;
 b=Zjen9v5WFHbtRW9yJ9xzSZos5uoDp8qd/oX0HBoxrwOTZSvc4VZmgc6r2noG3x7nHE
 GqDhM0AJ8WWEqYi4+YsGbvEXk9rsDrlm1nFpi/5dtmjQftCIHMGlln8olOp6fZjM//ZV
 an7yxQekTRd6yAj6Ez1F/EGiVDP7VC9n9RGrN46EkzOwZp6ICzKezZKBD8jQzm8n3F7M
 NbhZt01pEmMALS+NywkfPdFVeo9GM0+54kEusBGQHzeB3FMMFokK8+zP/6xrL8OcoiR6
 n3/sBlG7Bz+hWOz8eTC09BdjkIkvI3glWcbnnOQKjIhQ7pFSyicNfUBoYd01zgvzEE7R
 +bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZgQ7oCfy0nLOIQgW+qtzhKYHnPLM4G90MVyLVLrcIT0=;
 b=Kahv9o7BHjjmSomkmFjuDTnToER2tijNBiVAxVmEOAIQC2a9+w5Hlmc7kDJdWhYM3f
 nXsc0poVteAes3k9MqKx5a6BbIVcLg0QM+59DP5PlKJKnvY+lo61R64A1eELSaTc+tPo
 Mg6509Ej73r8R313EVLXbECucYDnXBHD0lOURLQMPT+NqfuW4C+5eR4aQQ9dqzuYNNDI
 IREr16O4mKih4/uKPpHRc1TPglzjcGONdJuOuchhz6Rpq3UG7+LDz8ndG/rpo8nsNs0w
 011dBrL8rAHqFzkS1dgcpMn0WZBfPgeCNc4K5wWZeLY8Smz0LXkETY0ZxvqyyTMMt7Ca
 aopw==
X-Gm-Message-State: APjAAAXaigcexxk0aW8lGFhnejKfrUXUhE8SMNzYL8JDK2P2LKXxpuo6
 tFUNRYrx2KqQfmnrnIsKgAaUF3JLItr+J7MI+ts=
X-Google-Smtp-Source: APXvYqxQZd19J2f5LW74+rVtS8VV6ptXZiXvMelvK9uglEv229O+9W6Z3u3WI/+oKete+6HD5UGS1SS/IP1ChQyS3F0=
X-Received: by 2002:aca:3545:: with SMTP id c66mr1303630oia.129.1559850900567; 
 Thu, 06 Jun 2019 12:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190603094740.12255-1-narmstrong@baylibre.com>
 <20190603094740.12255-5-narmstrong@baylibre.com>
In-Reply-To: <20190603094740.12255-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 21:54:49 +0200
Message-ID: <CAFBinCBaXgi8dRH+3O4847f1CdjUwQ4hspZMc5LJbJrVX3d59Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: meson-g12a-x96-max: bump bluetooth bus
 speed to 2Mbaud/s
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_125501_739512_BB5F82F9 
X-CRM114-Status: UNSURE (   8.17  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 3, 2019 at 11:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Setting to 2Mbaud/s is the nominal bus speed for common usages.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

I tested with this speed when I updated the meson_uart driver back
then to allow higher baud rates [0]
so I don't see a reason why this shouldn't work


[0] https://patchwork.kernel.org/patch/9517907/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
