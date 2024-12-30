Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FFCE77188
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Dec 2024 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozdOCRD0JzSHlwZkND7pay2KVnXsoLqpPbk50lLUDx0=; b=ClSDRNJovh9w0O
	qSQGSO450qhvDwNUtwM0sxYZ74Xjqk4xuOyE7M4NfF3JxgrbpfchVFvruV925VBsRenlxjqHAME2m
	DJxCabE2yCvlJSWyGBrxT69wXCPkkOJx+g9oxMnk+qMwivAaEZgJ0tAvLdQUn8xaT164TCP13cA67
	z0XR4cuoVy1tE518qqr4bYrBQUfpEuyMUqEqWJDDBQjsXjCVcueTGL0pbvvoH1kbMDei4NgLRIeuf
	TKH7+Lwal3JGK7jVCFYNCickEkUTwy9R3tNdxanO4nRnhH60T+rlR0eXub7o5J4ynx3Ez/e6nqAOF
	BzvecSOguRw8Uv/TESSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCac-00000004ziG-2Drq;
	Mon, 30 Dec 2024 10:01:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCZR-00000004zWh-3O0P
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Dec 2024 10:00:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38632b8ae71so6518961f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Dec 2024 02:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552820; x=1736157620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jfp9SmUDH518VNnaMu3qm3fIwFvpgmQiefan0yTgrM=;
        b=Ucjus2psg8RzMRUUXUyAOL4IobLBwV1WEQo9KwJHHl/bjZ25UvElP/v7GXsBUbOEYL
         +PUSrNCSedsqp8QgcBFjQMb8Pdi2z4msceQXqlTIb4x1uAMEbmBM5S40g3+GNqC+tVyA
         AZxF+sMWvLKHeBmPgp4Gn/t87PtUa4wsPlQQTRqS6khR9EgG75VUORTaO4AKLyTFzTPZ
         LvSYs2lAoAEusIIeHe0T1dDdzRK/Rca7KDjPwGFhQd7cWZrnFkOjzVmmCSVxqf+YbKx7
         V3YPg6nPJQozekBz7znig+TBl1SnB5CJe1f2AARhDphLPWrk83qShqGRgEQj9o8jhkkW
         uh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552820; x=1736157620;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jfp9SmUDH518VNnaMu3qm3fIwFvpgmQiefan0yTgrM=;
        b=tebaYQ85jkuoqKYf3I4IJejtzAPgWhZYq8NU+BRHJGEVxdYvWrQWYuUgt+gUZq0M6f
         P12acAlbXj+S3ulTdvkMwbRHw9Z5rBS/U55AOBxQyEfc1d3B+7drS9bsEYijDWDXmjbH
         VI7YP0r9O7K1OevhqkA2024cWqieroaodeoVcNiiDZRiRX2PuLqNMNyBr0dJEPdi/ope
         medg6+Jb98Z20X0ErKZZVDiV4u2T32fQTKP8wubFUiB49W47NKXJOY28YxUE0+0FulUB
         d13rhNZpERQicq4yi15Wdu5RWuQQJdvslLcPnYb77RcsRh2ykmRjhNlKKNOsFQSA6Z9D
         2w2w==
X-Gm-Message-State: AOJu0Yxe5sFghfsY6tzKaNsK4+IR+16QqcL1jRou3vW4CEB8VQ1mViWF
	0lFC1qck0COktk4dJu97skY0CN1/Pvk3AHklLq+15zc2KXSo+FwfGriFoIyVtbA=
X-Gm-Gg: ASbGncvPSejyz7QKdQRx6w6pCLbXssnFt97RHVJjf++2Wpa3RxHQCEss1lCGYprTaFz
	LEeLn9JFoRFRCkhxXneQUHLVu4BtVsUwdTLZJz+cu3IIbTKRl6Dcqwd4rjhnDdaPiNhAFm6RIGo
	wWEunJszI3UVbPt49h69vSGwtiqcuNLPLSuZ34C3w4o5H9wptDq1aSmyCNGqF39zymi2GCVW7q8
	ZMSBeaf73EHK14FogchE/RAMEZtCEgMff0Omj0HYFYbGoyEWlRu8WIMPIAACyms86eRNQ6dYK29
	gQ==
X-Google-Smtp-Source: AGHT+IEuGi6MCYipXIk5Q5oobmNxWaU1dKW0QbR9Td99CaPeqsk/klM4UWZLTAwld9MSa5fELHIXHw==
X-Received: by 2002:a5d:5e09:0:b0:37c:d23f:e464 with SMTP id ffacd0b85a97d-38a223f75bdmr31618551f8f.38.1735552820388;
        Mon, 30 Dec 2024 02:00:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365c08afcbsm360576575e9.21.2024.12.30.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 02:00:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20241226220352.965505-1-martin.blumenstingl@googlemail.com>
References: <20241226220352.965505-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ARM: dts: amlogic: meson: remove size and address
 cells from USB nodes
Message-Id: <173555281977.2076800.1598444993782802807.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 11:00:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_020021_921585_8F124331 
X-CRM114-Status: GOOD (  10.57  )
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

On Thu, 26 Dec 2024 23:03:52 +0100, Martin Blumenstingl wrote:
> The only board that actually requires these properties is
> meson8b-odroidc1.dts but that already sets it on it's own. Drop these
> properties from meson.dtsi because otherwise they can cause dtc
> warnings:
>   /soc/usb@c9040000: unnecessary #address-cells/#size-cells without
>   "ranges", "dma-ranges" or child "reg" property
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.14/arm-dt)

[1/1] ARM: dts: amlogic: meson: remove size and address cells from USB nodes
      https://git.kernel.org/amlogic/c/3a4bb81850662bebab74f1ad27071652b1825d58

These changes has been applied on the intermediate git tree [1].

The v6.14/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
