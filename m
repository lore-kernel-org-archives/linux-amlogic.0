Return-Path: <SRS0=Ikdi=X3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A8BC35280
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 07:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55BA520640
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 07:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nDKfBS9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55BA520640
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1IrzeuHE5cW5+jOIktktPn9c8lPC/tzr7wr8sjDGnQ=; b=nDKfBS9dI17xN+
	9ipeqjkanfFIyjTKVzkOgexWys+dDUUmifyPtuwAy+jmvRqmOSmfNH0Q0CWCmArdWU6uq5njMo3LH
	pnXFKGqOIRt6BfhoJxPK1vHVnpo63TVp2WZuiIsB58gj/s4pUL3UBFsitTJ/5vH6FGaEt4HFTxm45
	oTM0moPIqILzWcl4zv9azeXr8YR+fG1neUC6SKTsXnlvSYO4CrT3wS8f18d5MpgMuR1cJqwvsOaCi
	UaXPt5DztIsleRrZt8wrJty+0MQ0yfpmmqoF0h6WuFtKV5Vmor9S1lRecrdwrOfiiVpq6UGQApoyj
	rXfkNOuiByZU2QBv0YVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFZNL-0008PC-Cn; Wed, 02 Oct 2019 07:48:43 +0000
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFZNB-0008Gn-Hp; Wed, 02 Oct 2019 07:48:34 +0000
Received: by mail-wm1-f65.google.com with SMTP id f22so5821045wmc.2;
 Wed, 02 Oct 2019 00:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uUwiwhPBSc6eZHDkUDyAm/N9CoHzCdtlpM4L3BcW6Vs=;
 b=j0U5Zj2r3TTgvpmgegpoouCOGI/KM+ULkzGUMuo4VxlvAb5frB5rI+eQLLoHqm9/Ho
 o1IwSY3YXq2yX+85eHJfaPnd5WWje7ZDwb75yhWgzZcVrjEh+NNvSqBm5m8oOKI3dwXs
 M96vEaTMITRlqTRVrh5YSQ6CZuBR11E1hi5ya37zoiWZfcCbSW/ZwqVAfRwkWHwuasql
 ea3goeZxCjrv4+61nA4xCg3zJOBZq2qAQOTw4i3+pwUgk1sUm+SrCCvhOlRHEhKmdFSy
 6Nu6GQ5hoqWDNKXEXEawuSAEm6ErjRGaVuaWHYZwB9Hqq24djXey6MNH2sRtuzHmzYUS
 MXxg==
X-Gm-Message-State: APjAAAXkPalBAXDftHdG+CI41rP8j3CyWeeT0vTlhX02UFkQynM2fy40
 J/NYTmaNQnddg6L8fUlSMmFIlezc
X-Google-Smtp-Source: APXvYqw/hPJSvkHymOuwy555wjGEibmOYvrrxzqTT/bFUufzfpe7zbAT7CsUQbeP3t/GED9kDBYwtw==
X-Received: by 2002:a1c:a984:: with SMTP id s126mr1828304wme.26.1570002511763; 
 Wed, 02 Oct 2019 00:48:31 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id 207sm8289456wme.17.2019.10.02.00.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 00:48:31 -0700 (PDT)
Date: Wed, 2 Oct 2019 09:48:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
Message-ID: <20191002074828.GA6221@pi3>
References: <20190920162124.7036-1-krzk@kernel.org>
 <20191001222109.GA26050@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001222109.GA26050@bogus>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_004833_592318_B9D81247 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Oct 01, 2019 at 05:21:09PM -0500, Rob Herring wrote:
> On Fri, Sep 20, 2019 at 06:21:22PM +0200, Krzysztof Kozlowski wrote:
> > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > using json-schema.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. Indent example with four spaces (more readable),
> > 2. Remove unneeded timeout-sec description and include generic bindings.
> > ---
> >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> >  .../bindings/watchdog/samsung-wdt.yaml        | 65 +++++++++++++++++++
> >  2 files changed, 65 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Rob,

The generic watchdog YAML/DT schema is already in v5.4-rc1 so this can
go either trough you, or through watchdog tree.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
