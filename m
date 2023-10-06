Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F806E81DE8
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+mlGKPhx9mNf4ppNRMfm2rRzMq11O29UUQrEMKFZfM=; b=e4ScWR0PiBEBFF
	Oxu/BsPd2ktNppbwEETVoAPcTUBBno2JJXX9W4Tm/xRdnnUokMS+nxnn8c5AN4a4nHAj3xehDMrDI
	RiXWbpyEG5UV0WBQEPcGf6y1w0uzz1OfUApdENQIdHDfjQvzrVXj/h7Y5Wx9fF3qarWI6fpHMbpz/
	Yy59D3seTv2W2ixqWaadoLg6caJBz8lrD4kc19KaVyW7+pNXkuscsGw1wwrj2XWKqEAopOiNbVbOW
	+Qlza7IPoxBkLatMlMXkqDQQaThv9l1dTBwu0K/Jp0mkKPG7dsXjjBgqNydVYJbK7X8DCFQJzJSzR
	t7K78O/9DwVNBa6OS+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojAg-005hJZ-0W;
	Fri, 06 Oct 2023 11:39:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojAd-005hIl-2O
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 11:39:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso18017135e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Oct 2023 04:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696592341; x=1697197141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5BhJ9uSQO9qYOJdOfwm0O5npfsEid/Wd+Awk+KoQ5M=;
        b=CT81mxakRurBmPHs0n1pnxWWdV6Ras68gLvNu/8gcRxxfCBhpelfJhcEK6gwUQL7vq
         C/UxMIKvooS0Fuziq3XbHuUS4QMRkmjGN4mbSUpsiFx102yZWVH0C5ZxIr9iWwgWfIaS
         E07awu5fSOAplyJERpoAjnsYbT8W0XiURGj+s7NjzxlrjqqQkOHq/olv7uWUIAjytI7e
         p+JiqNQhNqcD+CL0Lu0VZIGLKhh566SJhCzudP6KEhYvjaSfakMgp+ENH9Tj5bUfffLr
         2QjpIXfx6zwEIG2jNBA7f+iYGLmAVQC+xxkL+HQPCYjp0He+xZLppZOqGI9IucoGpDkn
         8gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696592341; x=1697197141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5BhJ9uSQO9qYOJdOfwm0O5npfsEid/Wd+Awk+KoQ5M=;
        b=qkw5XGZhRNFQS7qxn6ZicfmRSAXwHngrTo38Dd8byJy9vxZTq8OgfhBRIEZJvkJ0GW
         tP1kpXuS+skk5VrrLp3KOff5JrZxdTyKiyDxStBk7FHfIUlPrCKhCJVRfF/Ri4advahw
         kW+gm6oX74rdLVJhPoyqEssVNWeWBsCGNRx9AXVMZHZBIiq2pg5dpSdt/QP8DJl1/56v
         198/We3Q+ImC2ogC8sAjMCZcPVwGGBckG612emuHHStYwoIksY5VuBfBHsFRnSMgdhHW
         NvQYx3L7oU5YgVcIiRSwmOZbtOST8XQruC5fsV5yekf2+TbECCSNeOyYY9UyvD+sfSzN
         0xiA==
X-Gm-Message-State: AOJu0YxIBByB799pieVX51uhiaO3ozb5hywqd7OH65v0iMO0ebELW5mD
	6uL4hNWWu3bz1KQ0DLZcMGCLfUNEf6Qiq4sXli0Z8ix1
X-Google-Smtp-Source: AGHT+IH2Qyo4a1/R1ZQkB8R4QL65Ez3OTj2edR2TDGOMlROq5wX4NlwWJHo9NCXv1A98e8n9iiO9vQ==
X-Received: by 2002:a5d:4a0b:0:b0:31a:b3aa:d19b with SMTP id m11-20020a5d4a0b000000b0031ab3aad19bmr6822802wrq.23.1696592340825;
        Fri, 06 Oct 2023 04:39:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d68cd000000b0031ae8d86af4sm1442191wrw.103.2023.10.06.04.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 04:39:00 -0700 (PDT)
From: neil.armstrong@linaro.org
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Da Xue <da.xue@libretech.co>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/2] arm64: dts: amlogic: add libretech cottonwood support
Date: Fri,  6 Oct 2023 13:38:56 +0200
Message-Id: <169659226646.1467422.12919977001849409965.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006103500.2015183-1-jbrunet@baylibre.com>
References: <20231006103500.2015183-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_043903_777965_995EFD14 
X-CRM114-Status: GOOD (  13.89  )
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Hi,

On Fri, 06 Oct 2023 12:34:58 +0200, Jerome Brunet wrote:
> This patchset adds support for the Libretech cottonwood board family.
> The 2 boards are based on the same PCB, with an RPi B form factor.
> 
> The "Alta" board uses an a311d while the "Solitude" variant uses an s905d3.
> 
> This patchset depends on the usb support for the gl3510 [1] and [6]
> Without it, there will be dt check warnings and usb may not come up properly.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[2/2] arm64: dts: amlogic: add libretech cottonwood support
      https://git.kernel.org/amlogic/c/9f841514c9c238ffd1513ff3a49ba662a54aabb4

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
