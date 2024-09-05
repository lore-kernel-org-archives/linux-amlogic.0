Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45920CD5BA6
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2024 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBD7fv0w/pYU3NIiwGqnHSs6rDDWKAC2eC3B0p7NTTU=; b=mOZgObEmlsFGfH
	fNqB2ouf28/TqBeuOQMlcHZ95HeMNKivNaNwaKF4EcQ0OTCyFa5afWalBfYWwP5+vGjgtMu57cn+U
	qjwa1rlgc1u3l7e9snIUEqF7Gb+7xMzapKaBQZdqlQoQq1UNx6srSvJK8dNHEz6L0F5+KqLGMSp6N
	M0YkDLA/1wkVVTn5Wvp+JzLkC76TKKu+h5pBrnwzJ2AOy41RyNI6exGQDgW50gGrOwelvxpL6AhNj
	86xOsxjfQd3OJ7ZaTB5UMLpIBV/ZrlSD0GeOIS47a41X9m++NXBcBZIGAIef9D2PGBhfyJb6dlwK0
	NeJ0dTwQGHVhn3uF/+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm9Xj-00000007uix-3QyZ;
	Thu, 05 Sep 2024 10:16:47 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm9XZ-00000007ug8-0ufp
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Sep 2024 10:16:46 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e1d0e1bffc8so699990276.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1725531395; x=1726136195; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
        b=EJ9SEMg9clSRO1Fo/N2fGGtaxql7c1gP8U5IbbYXW4iCCpxThVyu/bAgTke6pu8Ods
         g6RmJmqah15ZK4LvUItQRqslZGujjmMec1ukv0yf0C6jfIHRZd6ZW3JyWefTk6KYjvaK
         1MwmNBjFZXZ2Qb7VxPGG0nobfEW/YpWa3dGzYZbeFOFX0fL7K0jaVTDNP0C0/mnkzbWW
         JH23Tpqi2vGaNEBneDZ0A6rK4kn4KT8fmEASJGnp6lPHIJlRUJGjYq097IgYrBONhr8+
         u0SzcoYccb/6Qt46Jl3d82DYMk+exBBExPQLBHTZCUs+RGPeuqqLSpw0zRJiExPDvGN2
         FN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725531395; x=1726136195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
        b=GvGKxZEDs9YB3+ylMUOaKG2x22oQpgTzkh5luJpZEFfJ4SA/S9ZYV/kCcqFkemOb81
         1kNCUOKfs4kW9YHRxoE2Zy8vdX0oH3LTmIrXEt+iRUrw0n3k2/FrDZfCKq1ask/3Ooh/
         3aZg17y76JdSG332Uzp/b9pcKrWw7TH1hGLMiF+CtLMtGLPETm65zQEjtv36BfejwQoA
         TJbnrFvsQJyygTOpTOnDMk/A9dAtqi9lYn9PEOHq4cblZ2MEEfV2NW9Us1WhzfG0ijMj
         /vczr9SEuc/ipr5JefHxT96dT28YUYm/M5T23p/3VcLHF7JRwCqP5WzxtQI7RpQp6kpQ
         eufQ==
X-Forwarded-Encrypted: i=1; AJvYcCViiCYukCQa+jyi/7FVL9fiPbfbfJVNJs9uPDyxW0Lbkc27NPfR3NX7iWhjvXEzf/+AukmlwxZuzi/kuHdB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+um/iuCzL6+ony2qS2esk9emm7nrqi7EEW6RSyjALCRvgxO28
	gj8wLGXRwauT35QcWl1PKx5fXYGpnrX3n1K5iP4Xz8YwClSn0NP35IvnrdE4HP5VArYHGFnIUTv
	jBx3+YA5a1dyBt5WqWsprInDpGzC7bpw+gtOXgg==
X-Google-Smtp-Source: AGHT+IHOAa2WnFWM0m3QmtHGwmSzixacJsCBpWRBvguStq1YD37bVLj0/P6F5Iapvjw7xs8jP/X43ydPbq380G1rQQ4=
X-Received: by 2002:a05:6902:1547:b0:e1d:1b8a:ac4 with SMTP id
 3f1490d57ef6-e1d1b8a0cbemr3960625276.11.1725531395247; Thu, 05 Sep 2024
 03:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240905093935.2780632-1-vignesh.raman@collabora.com>
In-Reply-To: <20240905093935.2780632-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Sep 2024 11:16:23 +0100
Message-ID: <CAPj87rPCctE=iJKfQXR-PJdUHR+5f-t2bRA5Daq2fzUTNekzcg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: uprev IGT and deqp-runner
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_031637_780281_59D36FB5 
X-CRM114-Status: UNSURE (   5.85  )
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

Hi Vignesh,

On Thu, 5 Sept 2024 at 10:41, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Uprev IGT to the latest version and deqp-runner
> to v0.20.0. Also update expectation files.

Thanks! This is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
