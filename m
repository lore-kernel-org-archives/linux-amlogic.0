Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13532C44507
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2026 05:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHzKAlDM6jgT/TdBQVmiWPb1s1SZx4V7U9Wjir5mu8k=; b=3byJBqubb6DWzq
	PKkE4H6fdjw4VnInABWO0DbQFxFNY2KO1ObDbtg/aJ4wGNClJNHxGMOLkjNT7Eab7mM75ksI+EInm
	+3unaB3rhPuG67wCjZbxP9JX2wiOsvtcefET8Jm2NZ69ROUolBqIbr3pirhTwc4lhFM5nMZdeZZBS
	a0G4++YXyKlheqwxwP3Z9iAJey7j56cLgCYrxNbEIhjgeV1XwCU8epeED08+ZM+/q61J6hwF1rKuf
	fD0vlwQHuNAZSbW0OOZbjEMTW4xp081Y5dQmErpRCvEr4NZF8gG/BLObC6FfcmZlJtDFCq9swI1RJ
	fmKpIbH6n1iTw2gxvpeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbU9-00000001Ca0-1AGd;
	Fri, 17 Jul 2026 05:51:45 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbU7-00000001CZZ-1fmW
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Jul 2026 05:51:44 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4960fb63c75so2395497b6e.2
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Jul 2026 22:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784267501; x=1784872301; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7GNJ2VsT/H/OoPywtw6dAhOceHxaw517jB295gP2NHc=;
        b=AlObS/h3IIH0GnUKQpO8H+kMTysueES7JiOEXGVRzF9JLInxsBxae2SM6IjpblyfIp
         3ZPtnMF91dynGPSVuPoOGeDvgVMRYxIdqpOhfPY5val+UVhsqQ4sq8L/73gnW+NJyfvv
         tnD5yqVWgmktI/QHtIcixc4hOP2xBLS8eCwdroYFEpgskyhVdfPKmlIaoDxl2JWZYUKJ
         +fFgVRt7ec9kNUcAQfZ45fboQEr60tvDwD9PFu7bRuTxnH0yjkuZri9spLU6e8p4B2Oe
         hmfLS3Gi1BnKNsvJ/gw/UiknTvr1psBY6+YA1GWr7kQyC1v7aZ8z++MLQ8sjtadWnRIq
         IJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784267501; x=1784872301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GNJ2VsT/H/OoPywtw6dAhOceHxaw517jB295gP2NHc=;
        b=Lkfdso3W90J8YKgR4Y35m8GdaCsfcQ7xL09S+Q8aL+c0L4OaBwGX36dac83vOLpwMV
         gUWNEQRgQkmwxk5dzeeq4g0RIy1h3u3OXMQeluaCEGV+JhfBr9gq0n7IctTpLmTd3mCW
         IJbGhHUPFduoTUaO/OVki47cpj9iWChEsTEb3iy6mKW09V3oPZ0TfIj6ctmLH5obbopY
         3SiJ6EjwO1rAfdTDabpSAgYIFOxQJoChEVI65irXVJUVUwsiIUUJmzr9zZUJCgILKVra
         AEkdUBXdChWoOJXQTa93QKPQ9SIJRRyxFLXnlijg5Fge6P0HMZrRoRbzCmRKU6OTLOsX
         rJjg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+aI8Z3JxxdGzAdbdNGSkxnoK+SKourvVn9Jlyq0ZMDPHy7oWq76z9tHkYx5cfWyNvCtI/NUcsnN9zSb8d@lists.infradead.org
X-Gm-Message-State: AOJu0YyC5ekmdMkHotixeeMUh3W+Hvxk7KMlOWbNf3ZVslmMxZ2iNCiI
	JvjGUmawKmnChDLowfBoknH2iS3RU/GrrY7QNr+gC9/FKV2l3D24Zppr
X-Gm-Gg: AfdE7ckR/apj396IffGrJ7clT44UPw+n9Q2PeUoC90JdBKsYsvgsmgT97yY8xQ4pyCw
	JN8+6kRmpNBlrrjIMH4AVt7g9mOtOE5pOWKJHUcGPJBs7+I13QNNI5K53f/wUbr2LPhKKT9ziJF
	ErCK3sJw0jNoxKD0WdCy8fDIZd5H7wGAORQhlv0M7vJuWXilInFCjXqVGVDItIVPua0hTpbeDd+
	baswZNMTijYAWhSdWn2gcBTudkDTjgVbPf/FYx8+rYNwIeUP9kfZDSFeFYpUqJIcf2mXhUaPTNP
	ihNS9ElGVEsbMXiaNz/gCDCaqmBFhRTR0xGnkKayn+4C614PIP5r8r85VqVS7N0TG0DnND8vlh5
	W/2DAm2B6gLr252y4WZYrfTCaIg8rKW3CCdGqyjh21N4pXyQiy5FCVatxEpiTMQrmHbZscA==
X-Received: by 2002:a05:6808:308c:b0:4a4:c12:46f6 with SMTP id 5614622812f47-4a4d01f55ebmr585102b6e.2.1784267501599;
        Thu, 16 Jul 2026 22:51:41 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cb035csm167035b6e.11.2026.07.16.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:51:39 -0700 (PDT)
Date: Fri, 17 Jul 2026 08:51:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v3] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alnC5GH7m84F-tnk@stanley.mountain>
References: <20260717030559.167-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717030559.167-1-alfievarghese22@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_225143_465806_EA2E5148 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 17, 2026 at 08:35:58AM +0530, Alfie Varghese wrote:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
> 
> Return PTR_ERR() instead to propagate the real error to the caller.
> 
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

There is supposed to be a note here under the --- cut off line which
says what changed.  Did you resend just to add my Reviewed-by line?

No need for that.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
