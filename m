Return-Path: <SRS0=uJma=4F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B34C7619B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 08:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E2320725
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 08:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r5sxoT0+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4lTZKFk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82E2320725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mp68B7J7I3fWKsPTQB9Hw3xw4XJn0clm7JcLiYd7ys=; b=r5sxoT0+kNusew
	cGWFutppT/7+6JwfnUoI9XYpmdzbhuCZbcZw7ne5+PmQfY9Ce9ctIUQ7vPOHHh03MoCNU1ktUrJ+a
	O4Xh9t+yo4mm2uXLlVJ1s7DKthCUHjZ9Egt7q1O/YJO4em7wwmpMAfRvToBECS3NhJRwnLGm+mpfp
	9dc4qbI2ncZrjYvBUqDWEKWNTT8qbObvzPnACESAxYye/cnYIiStkVk9Kd4XMSeLeTJvnXKUmR3Na
	4jJDRedRZkPNpawsZJMVKAMo3W+yekP+tmaxHWWePPZ6B9tV5n++qHDao2TV8Br33H1pCu6JcQQ1L
	KQVbLNUtNPnFEbMy24iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3bQc-0007rN-Uu; Mon, 17 Feb 2020 08:06:55 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3bQG-0007aa-Tn; Mon, 17 Feb 2020 08:06:34 +0000
Received: by mail-io1-xd43.google.com with SMTP id h8so5035552iob.2;
 Mon, 17 Feb 2020 00:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p4iErZEeHdLP/k4A9lJOInup/YFd9m5dp1K6FqMWj0s=;
 b=r4lTZKFkelyQbz679rc7YQ8WGMITje3bKOmCHvs+Q5j/Rr1HBfh2kI1MHWyR+CSksT
 IzanKGI/HDGMH/3l958t+tHn+BQykhIVokans18248p9ouurocRZvMjmq/5G3NPDWjOc
 /K8JsCM4NbwFk8b7noddTFElZkQzGmDwdkdZFrY0/EDZTKKKXYdU67HPoh9P6Hux+qEJ
 a+36sUjN7ghK+0IiDs3yLD6ytmWt5JvLIm4OdaBEOGjpLihhDYEq6XqKjEBba+aRNRcv
 2J6D8scwACDFLfbvZrWxyDnYNrR23/PpbqLou5NNRQ6gZEKsHyfiXjnrT3Bljd3LAL22
 jbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p4iErZEeHdLP/k4A9lJOInup/YFd9m5dp1K6FqMWj0s=;
 b=kLpsBujiT14NO9p7A0URLe6DAXhyzbYL2Mcq6JmTnIA5IH1aWlBI9IP7O3QRdwcRKr
 St04+mNp83GSngj0dsU26iLm67aCzESXTaRbM2ixN77Q4FNiI37MRu1CL4TlFYaP2rbn
 C9V7HCP6tn4NBDRGeGnnej9RKkA9YdfDfu6nuc3vWzVsB7upsxGaA9U91NwcrsywaEBo
 bW29AsO2aQaApEGlQGiMAS66zxqdADmHJ5zGW6D1YEIMx8xkgA0vCvmR+IMfH5Hbk7T0
 6kqohl/F0GuTHEm1ZWQedoA2S8NUo550bh6Az55/I9A4KCgmP0gPyeZHZn+hRbksdOXB
 20pg==
X-Gm-Message-State: APjAAAVX19rdh24eyPwl7chpWN9cZYDX0dSziOl9D7fRZpYnrjLWzGbx
 /+GzxFs8vM3yEhe7xVmQCzNVJGHeMrd18sbAEoyvDQ==
X-Google-Smtp-Source: APXvYqwT6KOGaK3oTFNEspTWDTqsYMPcRLQVAN6wvSFTTlhryrCpMH7JZXDt+Ot+X/F8lBhIHH9/d+si6uF0Ts+z/C4=
X-Received: by 2002:a05:6638:1a3:: with SMTP id
 b3mr11936540jaq.84.1581926791843; 
 Mon, 17 Feb 2020 00:06:31 -0800 (PST)
MIME-Version: 1.0
References: <20200216202101.2810-1-linux.amoon@gmail.com>
 <1jpnedzmr2.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jpnedzmr2.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 17 Feb 2020 13:36:21 +0530
Message-ID: <CANAwSgR918Q3wGtJN_u9tjM+t1ZMod+PpZzJcBLT5jyqYEnP6g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: odroid-n2: set usb-pwr-en regulator
 always on
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_000632_984699_F07FA03E 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Mon, 17 Feb 2020 at 13:08, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sun 16 Feb 2020 at 21:21, Anand Moon <linux.amoon@gmail.com> wrote:
>
> > usb-pwr-en regulator is getting disable after booting, setting
> > regulator-alway-on help enable the regulator after booting.
>
> This explains what your patch does, not why it needs to be done.
> Why does this regulator need be on at all time ? What device needs it
> and cannot claim it properly ?
>

I missed this node is for micro usb, plz discard this patch.
I am relay sorry for this, sorry for the noise.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
