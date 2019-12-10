Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3B9C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:34:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11BF920652
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CokG+ncR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+y5aLUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11BF920652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7Y7XrJX0NqmygLnrMKJtxmD9eKfkW+pZpj4w67IJcE=; b=CokG+ncRuMGAcf
	P/AfpmYFwWxHb2X4qPKhFH33rd6oh5cmx5JE9jXSOLDp6A3kUqkR/o7BDuSLn2QSn5NOKYGPfIKg1
	NzcqFzLfhayJpAcD02tXz59Z2SV0kz4RaLDObsdFNX1/uHh2AE0L1xLClGPUFzWwbuVjr1saJzG/l
	/VLFqPMEF6OSpwqv74UXU3ZSgc6kE8ic+YyqUxCtQz6kkveja8B48qHGFpF3PjHm5CCxkEmxgUeIe
	7g8AgsLDhC7Y6mGao9RCF8Eohc3/jeC6zd0m8NlRdOeCUNjd5m2xKwx7jWa9hQOG2ENW55z4mLxc+
	29JcPWH2f9w9xITDbduQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iemDQ-0003DW-DU; Tue, 10 Dec 2019 20:34:40 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iemD3-0002kl-HA; Tue, 10 Dec 2019 20:34:18 +0000
Received: by mail-il1-x141.google.com with SMTP id b15so17344027ila.7;
 Tue, 10 Dec 2019 12:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EINwPsE2o9b6h5y0t6kgOUNqky5nib0p/v1Xe6hDKmc=;
 b=I+y5aLUWv90/bs4wDnkJybJ03d3qqe40pF4WwlPECm7/Bk82PnjnB33hEe8jy8woEB
 zztHEiD2drxlz9mUkyz2bWQVt7/ee+xCb7eo1JNU69OsiTp5yFARbWF5QkNFGy3994Tc
 lSHROKTc+7JyW2dUH1uMe0hPPeZrtA8U5MfvmLZMC6oVHo675XWSNWqHkUJMQ3H84SWP
 4a1xrl/a7exXXUnOxl2BGMZvvCL12mKyF4MXsAfIzTGhN6E+HQ2YITU2+wR0OSfhKKfk
 B2kkfvGSnMhpLsEU5T8BaZTgG24un45JrYhgHVbotUyNW13Y/8w4Yn+tkGoSjmSu6yV6
 +DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EINwPsE2o9b6h5y0t6kgOUNqky5nib0p/v1Xe6hDKmc=;
 b=gf94G0Zc3glNxfZXwpsMuirN0i4zyHhF1qCMG1myud911UXlypxhnACtIDeY7G9AVa
 RsANawkL8vysgElJgNV6X90CRSzZGHA/YbzdULoZZUoz1mqPVPQ8fyV6l+x2debH+ma1
 CC5lvTbk5rldGCJT5qwDwemouVWwQ/dNOffLCK7cB4BHwYh/0ONOYA1+Q3b7nTNP1OD9
 b+7yZp4hmVCD5QRt6wFa2tUIT2XzCFMIViWGNiCq9JJ+9Y6Aa9w4znUgQU6DFYaqjmro
 eBtC2JxggahypT2H+r+5RFC7TkPxX48WeFJN1YpO2gsmSNhjV4zGZpnZb3O4D48UFiai
 YsRg==
X-Gm-Message-State: APjAAAWRyIykVDHFqDyCfaA5e5Z6oasOK6G4q5kQtOqbS9OkuY35Dl+N
 jJFE56tsHz1BTBZ3QRnruc4lCEcfvXqc2cN0uwY=
X-Google-Smtp-Source: APXvYqxzyYnXt1ev4ZSaP784KRn0QhAXKh+Y5dGO6ZcL+PEYLLJIMe9IZjwLGVd87ACUvB41iMQ8EMRIktW4tQDJ9D8=
X-Received: by 2002:a92:4698:: with SMTP id d24mr37036359ilk.104.1576010056697; 
 Tue, 10 Dec 2019 12:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20191210203149.7115-1-tiny.windzz@gmail.com>
 <20191210203149.7115-2-tiny.windzz@gmail.com>
In-Reply-To: <20191210203149.7115-2-tiny.windzz@gmail.com>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Wed, 11 Dec 2019 04:34:05 +0800
Message-ID: <CAEExFWtjUSWvgn=zrci=mVTTnqjOcc1WRGSkSSZgR_PbWMv7+A@mail.gmail.com>
Subject: Re: [PATCH 1/5] nvmem: sunxi_sid: convert to
 devm_platform_ioremap_resource
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, vz@mleia.com,
 khilman@baylibre.com, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 andriy.shevchenko@linux.intel.com, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, mans@mansr.com,
 treding@nvidia.com, 
 suzuki.poulose@arm.com, bgolaszewski@baylibre.com, tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_123417_599087_01BD38F2 
X-CRM114-Status: UNSURE (   4.26  )
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
Cc: linux-amlogic@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There is no 5/5 in this patchset, a small mistake.

Thx,
Yangtao

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
