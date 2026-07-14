Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41047C44508
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vsZhycBsuGwp5okW6CVD2fwounsb/gOKiQ5/gKNZ4g=; b=1uCsuJAQgG05As
	RcMyXF5Fuam59JDMdpNoOIVX6MIuGp4pzqDjdlMNX+1WHNW2QUCex3u0rLpgFtuHGWLj8jXKHW3LQ
	eMp8NoQI3WBg2JqKxDxhOD2dlE8w3O3ugg+SsjVJs4SjbiL0NBrjPemHSh3x9E6iBadYBs19SqExB
	vL1yREyMreYv1Bd8iVPqk4uNYSziAw0xN451R0t5syBWwGKbeQcIM9zLgifSoBzUXW4r++GzD4DYc
	BIIKvIX9NmT+8RbjqGSUBtpTkVbYzGQXde/zJCiXn16N/ZV9AYy9yE5OwRy5aeNPreMlYiMor9Iu2
	eycdMny6UHPO4c5mQ4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeRU-0000000CQtC-3Vzt;
	Tue, 14 Jul 2026 14:49:04 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeRQ-0000000CQsT-3p0T
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 14:49:03 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6a30bcadd95so546369eaf.1
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jul 2026 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784040540; x=1784645340; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k8/cdwxu0uottieq8qk96CFsJjE7R/FEoysB551YuTo=;
        b=jQ9jyhB3EfFi1uL/DncKWnobc8FcFB5T0GseHzu44Fc4dUHfFEO0e3bRUhmbcM2DQs
         2iGTIIbYe8z+gSlbObse40sjzbGhJWYX7QtEikmeZiyzv06R+hDfe6GqrWdlEkbqz4yR
         Oqc1nblBllqUvePFo+6pFTUPGlkN/uWCmpjAzNCGnUSFjgKp5lhUGE81RMp81zX/lBXl
         mf5+2hbCBeDtcoXFa/1BHXAnXC+wCM3B0lGufX1k1tUol61+Qrp42itjyWNvGt8EP+NE
         D/hx9qZ9iFu7q2YWjv298aR6HVFb5NMijdDX6mZPuv57Mx/VeJ2MJk/QuTQ1IRGe8rHc
         Umgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040540; x=1784645340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8/cdwxu0uottieq8qk96CFsJjE7R/FEoysB551YuTo=;
        b=Ind85gpuz8EwsazsLY9ZjuzuJ5YOV3W/zBQIeI8Iho/6158GKDxCLacLhVSHuCMZjq
         WmPUWSnSk8rGUxfMN1dxfrjVrbbJ45gT0SY6/MhpYdEjEQbHprGvwMEUXn6mS5/ZsL7Q
         bDstWua7FE/gc7I/G0F01AkCtBO5sjKBeFZnJhbXSln0duRVabFisUGwuxkvHQvEchl/
         z+GnqmN4biWBafFh6zn/Uebls9R48HZ0ddQe2jFsca5PtQiEHPBIGB68Zfd/R7ZZYbjp
         WqIok+WAg8+pQ1yQ14vdXMzH7pMVhDe1wPgZrZeA7f3RMLLZE4AVoyO3n1I3qCsoSrWK
         8RkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UNJLZK9puuTyBrpbeQ4Iw5BXeyVJlXbFkBL9CgDmehR2EJrLm5KpdZHuNGDPXmr1nIynJlvEGMpZwY43I@lists.infradead.org
X-Gm-Message-State: AOJu0YzuaDNCExqTY8raB5m/v8TzcSvlhJyEopNTXf73TurQR8jh5lhH
	PwmyoMcW+yaTaJATxHhYflv02gewRvXk5SSIiMcFixtaC9ml0yCxpDBr
X-Gm-Gg: AfdE7cm0Cl1MePq8HYXB1vH6Js/gv1XtfwjW0QK3cjnbdZdac7RlawDWq28OMuO3X3D
	12WGEpr8W+kNmM4v96cu4nuHQeVwhqcaueJTf4qkVP64NoYKkrI1OpWrTeN9mcnl5y+smPAGXnG
	MqUQ9Q6QC27nto5UfX0L7kBAyl+snwBMnzr0Mvf8819yAdwGH0unOioPIh0mW6LaIUY3t2SUFs5
	DrLHm/eAPvhueWTbhtn7cBmFaaOreuXYqbYFrlUMmZxmB0o1HrXNC0QEk9Mfudp/BahoA5GbKiy
	tbaDll1dip8f7bDk5oY1O2DeYsu5Hqr6RH4OUWTTMhtuxomaipCcvnMd3iZWkMhykXcKrd8jmY2
	uOPbupCyCn/KOHh/CECbxNZiPAP82wBKsTKj64IBrSRhRY7oE/vdYUEo8t/58RqdpgXF0DvYrIe
	6JX1J5
X-Received: by 2002:a05:6820:81cb:b0:6a3:73f7:18b3 with SMTP id 006d021491bc7-6a39be39be7mr6231360eaf.23.1784040539847;
        Tue, 14 Jul 2026 07:48:59 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a37b58f98csm11294977eaf.13.2026.07.14.07.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:48:59 -0700 (PDT)
Date: Tue, 14 Jul 2026 17:48:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alZMVMH5t9WI3iSC@stanley.mountain>
References: <20260714140458.1276-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714140458.1276-1-alfievarghese22@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_074900_985264_CFDFF051 
X-CRM114-Status: UNSURE (   9.09  )
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

On Tue, Jul 14, 2026 at 07:34:58PM +0530, Alfie Varghese wrote:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
> 
> Return PTR_ERR() instead to propagate the real error to the caller.
> 
> Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
