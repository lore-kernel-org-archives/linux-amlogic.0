Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF5F106F309
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhcq5m0IEPRMY2Lw4dafGZ/zGLLfA9FvpLdZ4+lYgWo=; b=GeoLxB/zoZauNb
	9hl8C4GIVn93giFMEwG++XuxUx/iSP+rh39ADPX/lNHvkdS73TsOa6EW0oK2CROvQ764rtxhPXaLX
	xIgTcwXJDvAZ/GcgH1A1Cxz8ImIR6TNpElDcJ4Lna/hBxq1MnCvXwvhbRGvvkcslx6Pmo/OD/js7c
	U1WGUg4bjBrAs3P5/Ktha7MLkRstnNH+gD05I86K2HyyXwSXhB6GhugWKgRKvmQeFv9ZaBbsxtVgE
	3S9gSSAj3JCCM4+y8MPlH5BGNkNyWldG2zlUDiL5AiT6Pb7y4Gqr9/HWIYZEyYMg/3cZhfBGfZFAq
	TMwo5lRycS7Enn3qN5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gcL-000000055tn-349f;
	Thu, 26 Mar 2026 09:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gcK-000000055tC-0mBh
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=; b=hrcH6Z7XwcMbpVa/DLUBX6O7Zq
	Qw5/MvNOb4tdynSs9ZdOTarJu6bKqil4JQur7Qjgi1dGcgqurK1vD0C4AUMvkqgystGNdaf6AOhUd
	2cQMBkkb8z6Tu+PC4G53aBf6jAACIhFDtLm6BSi/QH3kfWUkVnMLVoxgmuyGSc9Hwss/wi/oigPk/
	aBXXBSG6U/NcAzKLIs6Hk2yZ3uykLqd3ESMn/MHjDoafVmS3AGcsOqlJ5RJXXWbOt1wrMJNyxATyR
	HhdAYxpBYLoDXraSTleDcpSIIbfcU4w/yoL6o/Gg/fQVAsD65pfoNgiSk7zsGgELvzkUCpjWxJ3P+
	krwiQNiQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gcH-00000007pMH-04lY
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 09:03:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486507134e4so8828225e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515779; x=1775120579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=;
        b=oRWHvYSkTtEVE3yLc3LX/iZX1HqTMEAzOLtYrc8lmoC9glFojDBuTd1FZ+DjJIRNIU
         hsFDKpQ8UqOifAsDUcrGPOexFM9iTRX4R+9uh7958WgrRRzaAcsVYRN+inRSe6lHiKtk
         gbbMNV+Py3bKulQRFD8HT8El/5ALfGDzhjhcEeYmSGgcoGLlETFFLn8sIN76Ujhg/gKd
         gckJPAbrY/PO2P/cWy91NlBf49yW+L1icL5VbvaYwGRtVRvy/hmVUB4z+6qHYZuPRIzH
         eGFkFU59rLzPKQg4tKJb4PC/8I5xwA66DXlvnLTdvwAX9J0+e2KZgLW0A3P36DnLD1fc
         2d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515779; x=1775120579;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=chfQa56N2VjG2v6F2IbXFU05HV/0k0eqizo1MsT+xd0=;
        b=UU9qQWVtUQCoVzc9sPcuMGC9QHawhaeBf1LbFWS/yts5gi27NvMm0JB1Eyn95yuWKL
         gbg6fmrlX57ifmH8Hu0kEVNDDf+wwnQsDoSfgfWJijXbuaIMH+HW37Mm9yOFbumVG1nf
         OmJ2OiYIM7jFjzvkpJhdH3LRcJAKg9qBT0fLuALkGfcpzZHN/3r/K3t7VQ7H0Q8D1fob
         ibcqDip/TE5uSoPCYDF/w646gjuySXsYnB/yc9AejBOmorOdZJrPrAKN99OpjReuO5PI
         PBS4eErkMqrRxzhAmbDDbZu0Rdc3ln51hTxqelKI8qe4R4VH28ZyV/gLYW8QwRTIXHS+
         c01A==
X-Forwarded-Encrypted: i=1; AJvYcCXj/KtGoru8Mu2Ovf/bQ7GpqlWW6RetOgbuuP89WVrEP2vpoTGcwH/iZS93o+MHvEESQL+j13cApzaQqNld@lists.infradead.org
X-Gm-Message-State: AOJu0YxfzrkhKaLb8944Py44z1YO9SNOF74Y6I68p1KZWQJFvzH7i6HE
	2CagqpY4E1QN/letn73YYZ9WIWSV1GIKwT4PI4LUD5BCQiHkwaFZCGN54WpAhYdM7fQ=
X-Gm-Gg: ATEYQzxgMyMWra7jnWnl4TiWwjQnxvyDdO16VNYgTfnk/tBZN4ekZRSPbFdOLtek/YW
	fvoXl1gBd6BMSlOxFXd5NWVq6Z+RrW4npfi9CiBkJT8117zg/vjr+p2ui5wFdbmgOkwE+Kqp6e2
	R3mNnOHLuaRTXOepL9YpnWh+mHJe8SMXDhyMeOAds5iUXQXF/v2RY/8WnrQnQ2EwITr9k66mIum
	1FJbSsOBRHGaWE420q+0ALT8lHeaRRJLxjsHWxKLX6yRUervTNdZRJfMTMIus5WFGdOpKD6Vvnk
	b8Og0zJJ7Rh0Nq4MwlsYaOaRX5XDpzJCgOw3GkVE9WlvV9U0ydIp++Y5sOt5B66UIs7HUKNnV+K
	p9u0jU5B6uSNKARnlqDbc9c+B4mX7wpC4AEzDRRfJnxwGbfFk23L8yrPBDI1CdF+0/ph5+5jxeB
	OAZVMwBQprY5hS037BT0RlgiV/ufScdE0uau/FPZ5vAk4PbkBWgrXVZvA=
X-Received: by 2002:a05:600c:1d02:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-4871605076fmr107817825e9.17.1774515779244;
        Thu, 26 Mar 2026 02:02:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722ca344dsm14612305e9.12.2026.03.26.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <20260319023446.3422695-1-nick@khadas.com>
References: <20260319023446.3422695-1-nick@khadas.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: fix memory
 layout for 8GB RAM
Message-Id: <177451577850.104526.16114207536960435176.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090301_224716_FB48069C 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, 19 Mar 2026 10:34:46 +0800, Nick Xie wrote:
> The Khadas VIM4 features 8GB of LPDDR4X RAM. The previous memory node
> mapped a single incorrect region. This caused the kernel to map MMIO
> and secure firmware (ATF/TrustZone) memory holes as standard RAM,
> leading to an Asynchronous SError Interrupt during early boot
> (paging_init) when the kernel attempted to clear those pages.
> 
> Fix this by splitting the 8GB memory layout into three separate
> regions to properly avoid the memory holes (e.g., 0xe0000000 -
> 0xffffffff):
> - 3.5GB @ 0x000000000
> - 3.5GB @ 0x100000000
> - 1.0GB @ 0x200000000
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
      https://git.kernel.org/amlogic/c/4b3917cd8492d72e576b837f78c0c398bda4ec27

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
