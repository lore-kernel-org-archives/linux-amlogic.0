Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F929C27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsawjykxO67XdJWEJ/6B4vFI4xbYd+afprlHkcc3hws=; b=40prGyyz/jIcMc
	vjz1OPs0rn6Io/Z7qU/mtV0oG+aT7F46HwlcK4IdWFsL5I7VN8WZJy9zUkkvyvlb6H9a4066x1Zfz
	KNbHopSHi1Y42o0/45sxMNpOlXEOvx59kVT5z2/KV5iRbZ+UwR6NRbEvVtZCAHhQ2UGUFKdCnzdIe
	1RahBn0GtqdPaYf3CZnSifF5RgDbRovMJUSYEKTDzkLTLNKfxZhe/NmWGK9kqxlCn+462emW64SGE
	gUICfGYyevrWfdqjxgwC0YeypnbmEp7JaJ41IjBs6xIelus3BngRY/QnB3U5HSychg3VMfDFCuEwq
	rR+SQz6Z4fd6psu+hccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Nb-0000000995E-0gRG;
	Thu, 06 Jun 2024 09:25:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9NX-0000000993R-47WE
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:25:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42138eadf64so8649855e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665950; x=1718270750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcqdEefUwbLDF0Q15e/COsQkexWvEaGN2lXHG6coCLo=;
        b=vl/yDM/dGprV2DM7n212WC87jHG0O22P7MMI7UT5oKGQvZeKRMkdku/wzqSjvd8j2E
         aN4FQSOmbUbc+KZLyFPr1H//VHn+Gw1d69pn4OafEivWsezLc0qdBcEcMSjZKwYJBafl
         lIBm0xTK3pH3xlxNjP5NWVGms52P9fI+ZIByZYeAX/G7UI0N2jAAKXpOjSUFI23q8IiV
         CHsib8eTzp7IWdoVnEcMoKGHDGlivLIdo816eB8iXkRqu1tlObWdgIbX/1YUkucNFE3U
         Frh7yTpbd4NwRMGQHQdQRQSx5Mldr99LFNHaDUxpUp1q9i2ST1jXhVDVap0nPmM0nnfT
         cMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665950; x=1718270750;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcqdEefUwbLDF0Q15e/COsQkexWvEaGN2lXHG6coCLo=;
        b=JCDxU/Ue6Ji2OW6o5j9ktmOS0n+aC+u5bW7JJBSU08nJs6KvNPpGTWpJO9DSBGhqVE
         ph9SY/C7RNvCXjuEm7bPoM9k9z183ltZEiNtzPeiL3C+O23F+c6wjpaE7AAJojZBrhmo
         syPTudgs/TKJPefZQDR5ALip7unPM2TH+cohqmlUloFt2gG1+Ej7Z62bnUTKrWZtHuhq
         AEXcgFkAfNYXRs4AtDag7xp/i/keUwk+3KjgAtKstn2jyqZHfvWlfUSgR26gi5rkccKd
         m1qI/47Lcq7HHHimtazen4Uxr9Rexpb+mR7a/gfGZqmHz8APDMOGrtCm7e0R+EIxXZUh
         HUVA==
X-Forwarded-Encrypted: i=1; AJvYcCUn4jtG/BZP69NK0vg+ixEgdRBvHDKM0vUClhIREjkGTQWktDTYBX9Bh7chL5l8rRCWdRqN9SWQSbLrDkff15Dwk8CWPS6LItbCtwNF0S8MW2I=
X-Gm-Message-State: AOJu0YxkArNtSqftzw1vOulaagPz2Vw/DQD1VE25hyAx4BZeMP/WIsCC
	GP8uhgJ2LwXfDzr7siYIzKfqHRbcN+aK8bnXdGH0ALwhPF8XfGYf/TeU+X6vrr0=
X-Google-Smtp-Source: AGHT+IFbB8BHHN2WaElCWWkVsvsXwSQADBUM+mKiyFDG++QWWYRhOyBsyMb0orv0Unm9/QUc/7vtrQ==
X-Received: by 2002:a05:600c:1c84:b0:41b:143b:5c2d with SMTP id 5b1f17b1804b1-4215633fce8mr44418375e9.28.1717665949760;
        Thu, 06 Jun 2024 02:25:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e719sm15426995e9.3.2024.06.06.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:25:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, Haoran Liu <liuhaoran14@163.com>
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231129113405.33057-1-liuhaoran14@163.com>
References: <20231129113405.33057-1-liuhaoran14@163.com>
Subject: Re: [PATCH v2] [drm/meson] meson_plane: Add error handling
 v2(re-aligned)
Message-Id: <171766594896.3953723.13432230473582313779.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:25:48 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_022552_033109_062ADD32 
X-CRM114-Status: UNSURE (   6.58  )
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

Hi,

On Wed, 29 Nov 2023 03:34:05 -0800, Haoran Liu wrote:
> This patch adds robust error handling to the meson_plane_create
> function in drivers/gpu/drm/meson/meson_plane.c. The function
> previously lacked proper handling for potential failure scenarios
> of the drm_universal_plane_init call.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] meson_plane: Add error handling v2(re-aligned)
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3c28b239620e249b68beeca17f429e317fa6b8d4

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
