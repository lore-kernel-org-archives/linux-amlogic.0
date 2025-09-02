Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69839CA1005
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Sep 2025 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaOcSyBY+LWPFcZefAiVYnwRBZGmSV0QoC9p/m+o14w=; b=0WqEsjb6nmWSfR
	IfWbY6XdiTnvZwMS4o8OBqHAmd6RQi6Nlkq4YJcqfTSqzEwPtdprumSQmpNQ5xDiTBkfm72EZrTV7
	bEVeeznkzFDR2OfflKF/U96BSCCsGfsLDqWO3xgKsHXEj54KfcXa+voM7z01Liqtlt037J7B3R6Pe
	UWsKX8Ey1qeOjLUvCBK3jAhnYC3RcN4sb9fLVBs6I3jq0lHMPPponh2S8Os5OdU8LUJCHeCuMhmsa
	WuVIQaea0WBoiNx+RujPm6ownVuw/4cmv+utR8up/kH1Xdi3Ow98hHdGvJmXJ6masBCX7Z3mCdMIk
	eLg1JHT59ply3VAJMGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMhn-0000000GAgu-2Lzi;
	Tue, 02 Sep 2025 08:49:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMSB-0000000G4Qu-2dDX;
	Tue, 02 Sep 2025 08:33:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00DD460210;
	Tue,  2 Sep 2025 08:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC295C4CEF7;
	Tue,  2 Sep 2025 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802002;
	bh=Hqr2PkWeqj78bgEo/ix/HnyM3/D2QqFTKb1SDJ42Iko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eexVNZZOyCZ752U7B0Hxcl7iDb0v3eqNyGVNEJNzf0PCN5A3mrQ0AScJt5LA06Hf8
	 a5sf4rqTHCA59xQlkbFYGFgseE5b3iaP3LEVm/20ZJspA8j5cy22VIF+SVI9igcSgz
	 0UlRax8yYiV6MUzZXJbGEAZWizY2Zbj39kpJnvfo8/I0NyNYCiVGbUpt2+IQaDmq0L
	 vc9Y3Prxj+tY0TBlksdY/5gts7JPJHy/mZCpxdYkUbWOgVxD7JuiK6wKZJbtvOYKwk
	 qPcfUTqYDxqxCBibyub+dc0VK8JsdVpshCG+MpMFB7DMdDvni4nEY0L6G7UG+G/O6F
	 AgY1n5wtbq6Aw==
Date: Tue, 2 Sep 2025 10:33:16 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 0/2] Configure root port MPS during host probing
Message-ID: <aLarzJZI3E_sb7_Y@flawful.org>
References: <20250620155507.1022099-1-18255117159@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250620155507.1022099-1-18255117159@163.com>
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

On Fri, Jun 20, 2025 at 11:55:05PM +0800, Hans Zhang wrote:
> Current PCIe initialization exhibits a key optimization gap: Root Ports
> may operate with non-optimal Maximum Payload Size (MPS) settings. While
> downstream device configuration is handled during bus enumeration, Root
> Port MPS values inherited from firmware or hardware defaults often fail
> to utilize the full capabilities supported by controller hardware. This
> results in suboptimal data transfer efficiency throughout the PCIe
> hierarchy.

(snip)

Gentle ping.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
