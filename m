Return-Path: <SRS0=WwkR=X4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E0FC32792
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 17:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB2C20830
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 17:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QpoHQbDr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XUFGIGD0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CB2C20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrAbzUyb53rLOuRjMoKqfm9uQaJKCvpgHOvbVX++dW8=; b=QpoHQbDrs2cSyl
	7S9TlNr/8y30WDU9TntfUBZ11LG1H2Hb+gbvbWr0i4dn5odV8OBa7vtfpW6P4nFRsa+pmZy4HyWqt
	OCMQKrLw8nov6wtq1RIXO1vZIftG6uTljTfQtfaWzG5J/BvvrAsEqcHxhMTO9S74guQEa4aXdx3VO
	g5GbEs99Z7OoGAQqn592Mh/jzCwklRSfh7KLmnDix7xPNbRcuDPCRQiK+Q8g1niTKoiEX23yZef0E
	IJ7Aysae9s6idLYAXWMcdjuF6jy1a7XWnrB28bSYQTHKe3n9NgEfEThf/K5WZx5AvqS34ZiwJSK34
	M18adgjNO5TibkJeZCgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG591-0005bs-St; Thu, 03 Oct 2019 17:44:03 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG58y-0005ar-Hw
 for linux-amlogic@lists.infradead.org; Thu, 03 Oct 2019 17:44:02 +0000
Received: by mail-pg1-x544.google.com with SMTP id s1so2188232pgv.8
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Oct 2019 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=wgtFkL/FFRFrlD7W9UDHQPj6n9N+/Wo8Jj+YzpO0YxI=;
 b=XUFGIGD09TqEqmkFIqlIZjHwCq9P4g6INXCLyMVZlHNV2VUniAmRCDbm/DbO9MxJ/f
 Zz/bwzmkRc+zW9SB0447I2PEhwobtbUQljlruZs7iTfvwGn9G0XLOJCQHq9PtHqLjzQV
 LiYGvocI4OuJKqOmXEJRNnd1SSCB9WRHEG/+RTmytroyvvq0d1PB47xtO+mku1c6NtXs
 6UxLj3dEpJH74J9al6AcBlchVPJl8vzA6hoLwRR1GNycQWp6rokCBTZz6l0QKpF4W2r0
 bIQe5SvvpEP2dBxQzb1s/NlLLZ3Tpfe0WZi7YxSzIZ+9QFngdw616BopzSIICdH569jY
 R1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=wgtFkL/FFRFrlD7W9UDHQPj6n9N+/Wo8Jj+YzpO0YxI=;
 b=hd6Ac4jqSaks0pl3MYcwJ7Zxtp0K+9YjXSx0n7vk3tDMNA7WUTM7O+PU7zbgYkdU5u
 48sW7VqJhJUYHq4er7pLnP5NhIFQ9x1S79F9BQHwGaDn+a4xiBKCoeTZZjghyeIXeRjL
 3Hk6hoXYHMl9VBjIMX1i9iEQWr8z0WKjBRdnD+OegV5UXHgnNCfYezGkhFevLpDDILde
 tVab8p3maDucIL5RiAGYhFOE5w1vHa5y3ioT9Nppmhun9x175yD7WVUb7wccO1hVpIQx
 +3a3Yq1RItMuWI8lHTPohm1Qwpz6Mp3ALbq0PZR9JR/r1Se+obC+68qFvun9UxqCuHD5
 p6QA==
X-Gm-Message-State: APjAAAULwdJML5bRybmcPWBObG06YyvWvWHmime8fPrA5M3IN85+yPkl
 wO8FtbFK9orByaldo0rV77bcsA==
X-Google-Smtp-Source: APXvYqy7J6/8YHbG5klC9QquF261ah07vKhRA9+K09kh9B/5jxv89MEbsHK/KpR4cl3xiNk3tmrOEQ==
X-Received: by 2002:a17:90a:30e8:: with SMTP id
 h95mr12035505pjb.44.1570124639543; 
 Thu, 03 Oct 2019 10:43:59 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:a084:116f:9da0:2d6c])
 by smtp.gmail.com with ESMTPSA id j22sm5289821pgg.16.2019.10.03.10.43.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Oct 2019 10:43:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCHv3 RESEND-next 0/3] Odroid c2 missing regulator linking
In-Reply-To: <20191001073901.372-1-linux.amoon@gmail.com>
References: <20191001073901.372-1-linux.amoon@gmail.com>
Date: Thu, 03 Oct 2019 10:43:58 -0700
Message-ID: <7hv9t5vi5d.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_104400_598636_C8ADBD84 
X-CRM114-Status: UNSURE (   5.04  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> Looks like this changes got lost so resend these changes again.

Yeah, sorry about that.  Your cover letter subjects were quite similar,
and several versions of this series and the previoius series arrived
close together, so some stuff fell through the cracks.  Sorry about
that.

Queued for v5.5 now,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
