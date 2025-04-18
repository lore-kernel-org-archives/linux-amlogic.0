Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C90C369C9
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Apr 2025 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcJpyFeW8EFC+IAIBclA6VpLoYAFAo5fHvEIXsn8UlI=; b=WvR3U2PNTMM4cT
	3k18S3Ja6POsIR4d6Vh8Yjlztx5Je/scXM4Jysieap/Ae9jxl8R0WfV1aWPNknSCI8gcRh3GXGH5K
	mdSD/rxvqhqTb4RmTmFmp94m8MVaJIY2U/kbXQB9+IPxQt669ZfW4KsWpIpgqeyT+9Oqorh6UBVw7
	n7nZgR87nXb6K6vGZnD07QmEbDbew42bDcK7qG4mVovxYcDQ+eYaRf9QT5S2tvQxts5+Z1+pkafvf
	ZaZnFGjnsda89c8GS6ye65jazJ5f6a9YpRgNb3rzA6CtDxVwS38SRK1nWoxF8Zp52LFfMvcaOnDda
	infoN5ygzJKJhoFzmuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5isJ-0000000FqyJ-1D5V;
	Fri, 18 Apr 2025 10:23:11 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ir6-0000000Fqr7-1cA2
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Apr 2025 10:21:57 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so3191029a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Apr 2025 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744971715; x=1745576515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Brm5STyxzbguEtMeEkkW8xOR3kBb6To3TGxKet6+640=;
        b=LyTHeY9T3YbqgXyCxjjCMakHZ4+VxeQmphjS4EaY4ItbvmXhTbwy7bC16qMFp5bLXZ
         mxxKVKBC8yCesSu4QoAqDJo9mLrGp8baSw4vRdL857/y2S3m1tJSYfHVHCIlu8/rgIH8
         BitWVH9Jw21k/ySNnnbnF28uXDyjx7f8dazkQ02esGlY4657qR2hnFWtpkvTPED35pIc
         it1+pusBmmI8IotcU5SpnDALA84NMozbe9ZFcTerLNXWhB19JHF3Guvdjsam4FKYgR/+
         TSFn1fSChAmbd4iziPsYsIEF6twQfQOOCG2Jwc1ikxtR6KGY0fDeVNEV//d/gFuKYhl2
         t4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971715; x=1745576515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brm5STyxzbguEtMeEkkW8xOR3kBb6To3TGxKet6+640=;
        b=KoVoZ3Kvl2HFgJkyFgXy8WzVobQB7beUbHNZQkWaLWRNxLBPtKpvbnBrQVilgyVahO
         m2ZhOogVJzb26h16HzWE1nynsA+BA2GCxqwjU1FFVkc79LI57YUJgndKvQ5h3dYGi1hg
         jlN5seKXoyD2i/akzpbwlPXpZEW6oVc+0PnggMlHL9VtVkubtg+W6/wh6Upi4zisjmSO
         P33c/z1aleYc71W8/SngQ9yBffm7PJBuWG474A7xv2UOnpybKRZxmsu4ZjSdwf2LYTSX
         WXHtzQ5axVj+05/aL304ZnbCqBYqIl89c0oKEUeZrL9rBDbXBSWYexAzUGYsf3MqHyfM
         ucSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaOXeV+4TgkakKIAv9Y3inguB8nKC4S7REi8N9UC1PY40h7/PpRA6DlHYMR8Oxc1ag5x1du4ZwCp5YRBy0@lists.infradead.org
X-Gm-Message-State: AOJu0YzL5M17LWTHG0MRMXn7BJM6bHLsKymd9zyHobNy7OVuu2fb8qeh
	i6Yh9o9ceczPZ2RueecTMb9UOP6ZrBL2ls+Z5HVoUKUUJ24+ebZZXs8jFWUBW20IgOE+Nv5QRIh
	O
X-Gm-Gg: ASbGncsNxj/a9/HW2ikMse5lIXDw9+iL4mQiLjJM3nRriN4IL4bbSPP5++fCTqjrAkB
	mcDaftK8R6PoM0awxf/C9+OjE8MFGwqYhUeYLSJMhQ4h/CWpwPmVd6uVIFDVllfvR4o7u6cEG2p
	GJinMcte4ihXEQbzgiwXIwFQbAr6DL2AzQDQG/6MZVkA6I/VwQMOqdcHKzqDqvddkFB/WP8a2w1
	au0He/RTH5xUjQTJzejnGek/A0jSrJqWh/bf9Usu/Ms7Mo/aRFVVt4mLmRc+K8THGUdRJ8Ccqpe
	cmU/KtU2QD2pgbSEFOrXTU23GetTUJZYnIPM/fbGHZwxrNSKaoYdoHTyulzhNYiS65ahto5zuCj
	BF+I=
X-Google-Smtp-Source: AGHT+IEcKk9KGrLL6sDXqR3gMjy5WEdmXo67OfFx7M6ZB2w1ef+PTXxi1HWDOSvixA62VlDaDy3SRw==
X-Received: by 2002:a05:600c:4e8f:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-4406ab99521mr16674895e9.11.1744971303184;
        Fri, 18 Apr 2025 03:15:03 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4403605892fsm59513175e9.2.2025.04.18.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:15:02 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:15:00 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Enrique Isidoro Vazquez Ramos <kike.correo99.f@gmail.com>
Cc: glaroque@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal: amlogic: Rename Uptat to uptat to follow kernel
 coding style
Message-ID: <aAImJGYXFDx_q8D_@mai.linaro.org>
References: <Z-MEZNMLUmj75uxN@debian.debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z-MEZNMLUmj75uxN@debian.debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032156_424326_EC1F5816 
X-CRM114-Status: UNSURE (   7.22  )
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

On Tue, Mar 25, 2025 at 01:30:44PM -0600, Enrique Isidoro Vazquez Ramos wrote:
> The variable Uptat uses CamelCase, which violates the kernel's coding
> style that mandates snake_case for variable names. This is a purely
> cosmetic change with no functional impact.
> 
> Compilation tested with:
> - checkpatch.pl --strict passed (no new warnings/errors).
> 
> Signed-off-by: Enrique Isidoro Vazquez Ramos <kike.correo99.f@gmail.com>
> ---

Applied, thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
