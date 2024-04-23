Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F9DC4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmjP+0hNUldhS5PIdCTr0eSXJI/CrfriUJxa3SH1qgM=; b=v8g8GTc+Q8yldV
	4FkW9wJVCk1nJWTxvQmCUXqYsD4eHCOgTJfasRU2IYjfoWnISoHPQp1zFkMuBmN5zTAXqwzSoTX0I
	XzHa6ssvZZwgrP3VR84EmHwkJlllWjJ0SRt1fVMvo+RRypI23PxFp4uyBva1NXXIhtcxq1zYWD8cI
	R9ppSroNn7DjpbocrRyR8cWbT3vF1PyGfyTYM4SCkw9xqo5pC9NQrjz9xNfLvGMbiIjXo9Iq1Ol6i
	SpzwluWUzJxJdRKkrcf3w/KqDqblWD4DHK/tcjxz1l2yNdZ0TghZ6HNIgh+DK4/XJK536prArjYvb
	3mAo3N/dd2KFSd0cI4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBFO-0000000GPyD-26Lm;
	Tue, 23 Apr 2024 08:11:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBFJ-0000000GPux-45TX
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Apr 2024 08:11:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41a4f291f9dso14361955e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2024 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713859880; x=1714464680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ+VGtO+fOFVuAbHZpxEvkUMpJNeKyAzc1CintCGblA=;
        b=KqXeqrtJpRC2+0Ljw91H7Gy85RbGqo/8Lb+ljC7ERfkhCx03cG/9Z9zGtl4YRTvdxH
         JvJHTVINcWP3mqt/OT5eyLXCQQYEt5ja+bp81pSyj3JTga9SxhLzJOlWZ0kLxQwjlFsJ
         2P2a/Zq8rQ7GFKGenmFdc4/QRxlvVGZ2akARRpJGbPkInFyzselJcOnSwO1MXWEfUSBm
         as6djSgOa7rfrykKOuhOkzqEbxZ+jrC4QaboiTRUIZqw3ISfvHWqR7iceVwa8vO6Uhd3
         wHQYdVDOvgUsIxVR94cYbD8hnDu9hsCWms/buDvUztE5dl25r86IVoEDJzemYEak2O7D
         lfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713859880; x=1714464680;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ+VGtO+fOFVuAbHZpxEvkUMpJNeKyAzc1CintCGblA=;
        b=mk8d8yRT9xTpojz3mHOYbNoPtk8jibuWm+vxk4iNTQAMuwIkPmyB8kGfeQb4xcbXrj
         NutXf9A8hPWJi5bCZEj7lFZf9SFfIzPf7StN825M3RWS84J2kcgX01AF7D+Ns3TJK4op
         IT3xaaftPXUEyctrQQUnAqnS8PrvsIVjYPE04ouPsrNjoEtmFJ1XlZ2SIcn4jyGuZhV1
         lmPi/1GCMpR6N4GXT4Jk4jYp8BVS/21lbD5072p4Idl1VNceIqwaGT0316w1FqU8FMl8
         89mcZ3LeNNQMBWAofQ0KFxZJeZS935za4OaTf4HK51pfoOWCYEwffuFFNznvI7dXjk8l
         ErrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoveY9CgGF0VHo7ZaX/kuhwvNa36fgTNgBq9O5w9ovk+y67GHXAH1c0fowYWGh4n3anOt1u7EPCNzj6vPWtwYCsEJ7OXoenMremvDws5J+nIM=
X-Gm-Message-State: AOJu0Yzh80A1AG/CCEoWINM81Av0NS8pMxRdHPZUk9OCs9nb77+x5Eot
	m19P79fze/ofkW5I4frrIvORz+k7Eg05ZbMsf7WHsUwrXowotzNa4Ug/YDV6jmk=
X-Google-Smtp-Source: AGHT+IHl8ypHKhn33BZp55u9NftCZ1FXTUCMSM6KK2GjGZAhkYubM0WWb5a96YQkYliOQ47Zbeh5VA==
X-Received: by 2002:a05:600c:1c27:b0:419:f9ae:e50 with SMTP id j39-20020a05600c1c2700b00419f9ae0e50mr5822319wms.37.1713859879264;
        Tue, 23 Apr 2024 01:11:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fj3-20020a05600c0c8300b00416b2cbad06sm23179276wmb.41.2024.04.23.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 01:11:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>
In-Reply-To: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
References: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
Subject: Re: (subset) [PATCH v2 0/3] Add support for Amlogic T7 reset
 controller
Message-Id: <171385987846.629595.1742328591413260984.b4-ty@linaro.org>
Date: Tue, 23 Apr 2024 10:11:18 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_011122_490442_BC0608EF 
X-CRM114-Status: GOOD (  10.68  )
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

On Mon, 22 Apr 2024 19:11:42 +0800, Kelvin Zhang wrote:
> Add a new compatible and device node for Amlogic T7 reset controller.
> And modify the driver accordingly.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/arm64-dt)

[3/3] arm64: dts: amlogic: Add Amlogic T7 reset controller
      https://git.kernel.org/amlogic/c/a42f2e9ba13b8a4c556f43ed99e22ae14fb73130

These changes has been applied on the intermediate git tree [1].

The v6.10/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
