Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392A7C38147
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrkUv8fwgqApE8L/B5mt9xmHh/EhhzxccHL/nepvp8E=; b=rKdh/5yubR8hGD
	GWrqwhuwFAHB8umMxUt4zSuGiQ07K7KGToK4yDjhZc2o9kWkZNIO4BPLNae0VQw+WGTf+ncspCbGs
	xdbwpjEbAkOW1zcI1BJutDfa1dkbCmx1avZzsw9VIfPLYU8VP2ZarNfQIoHlj4+a7FNvBY0gY24ON
	qfrbYSHOUU0Bo/ay9J7JszL7Q8kMw+SMeQXWTiP2braMLAN5wweAuiGGlghIyQm0mlUNBneY787R+
	qTAO9znIZ8ss6c6G4tPAdlD6ncPIvy7gtcw1d4f60PqCEuf5RPoSIecigI2sx9O9cr6xbg8C77PK1
	jf3bx51odvjU25GKwfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIC5b-00205l-9I; Wed, 18 Jan 2023 17:19:07 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIC5Y-00203o-Rf
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 17:19:06 +0000
Received: by mail-il1-x133.google.com with SMTP id g2so17356202ila.4
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 09:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kUweEJsz1I+VstJe9YX0p17oDZgJR4Ui31/RYAe6tw=;
        b=FmE67VsAO0nj0Y4Qun6+he/g7nukglQR4r0mw+iUu2AfdP7RFN1Ut6i2nObVZJHCw+
         +DWRgzY9EgGEGKlXdejzp4ViO8lK/92r6ZSIpio58q5PfPfcGN75NBt5QP5OfniCWW3C
         uo+Yxz3hnS+frF2Ota62uYi+xnd9FpkdoPsDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kUweEJsz1I+VstJe9YX0p17oDZgJR4Ui31/RYAe6tw=;
        b=VKbmE0YNyfoSq+2leatY482JgxmB+sK86NK6T8JZ7l55AimEm4fZrpwx3zIiEQ8tMm
         OyvnLuwPHcpJeMRm9YOqsqryDjNw80xdkKd1qzdD1BYSvmvPOUvTi91Jx7P103TY3rSR
         vnCaTK3MT4EIAL3URXPWwL0Ic3OVhQdqpyva6ZW420HC/WF7hePRnH5HvM0ClNm+wo59
         SzfQPrK80NCbSUCnCR2d3P3Ff96bnJS71kZOl3DC84RGTQjp0it3XVqq4C/VfavEVF19
         FesfFhOv+LCvAoRGu7LLYkEJZSM0+Sg90PDybDtBqRI1pQrYL/keiqXjeIXpwLxMRjKs
         zKvg==
X-Gm-Message-State: AFqh2krLEzUg0jB7oNjXJXAlrdZJsZ2m08oJnnILMkgJA/Q6ihMAiPUN
	0HlzQsScohUKuCrqsHiP/JA7XQ==
X-Google-Smtp-Source: AMrXdXsHSHwWMRi7BEYSROOq8YpKIH8Ioxk083DipSTSjeRYtjmqTkFnhcMejKTCDWCDR0eCkrlO0g==
X-Received: by 2002:a05:6e02:de6:b0:30e:f36a:f24e with SMTP id m6-20020a056e020de600b0030ef36af24emr5125952ilj.11.1674062334964;
        Wed, 18 Jan 2023 09:18:54 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id m3-20020a923f03000000b00300b9b7d594sm10059003ila.20.2023.01.18.09.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 09:18:54 -0800 (PST)
Date: Wed, 18 Jan 2023 17:18:53 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] usb: misc: onboard_usb_hub: add Genesys Logic
 GL852G hub support
Message-ID: <Y8gp/Q9kpFLjQSiv@google.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-5-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118044418.875-5-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_091904_942688_80331020 
X-CRM114-Status: GOOD (  10.17  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jan 18, 2023 at 04:44:12AM +0000, Anand Moon wrote:
> Genesys Logic GL852G is a 4-port USB 2.0 STT hub that has a reset pin to
> toggle and a 5.0V core supply exported though an integrated LDO is
> available for powering it.
> 
> Add the support for this hub, for controlling the reset pin and the core
> power supply.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
