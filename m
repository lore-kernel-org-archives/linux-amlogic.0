Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163F0C432C2
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36A3214AF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r9qd/UcY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C6+uN6EF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E36A3214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ts9LUfBd02NFbLG1rjzK0A7r8tR6mH5jWynojB5mkXA=; b=r9qd/UcYXUej42
	Joy78PpmQn+SqSDpObNFphv6XOfbB8+uMDBRe2tykJBWgU/2mtam/2MZMgzjXm0rW1RIo4hSW+n2I
	Pp7ai2VmbVyvS4L/AQo+pUYqv6fOx3iXjxJEYPXzKz/ygZSSSuH4Ix/N8yY1FB/3ZwaD+IdNokn4e
	RBPqEx6RdCm5zLzhRatJthOSinrWmS6Wrse6vQG2dEI/FYV8UVfc1aQ2Q5oBWNNYlGskYQ0FpubvU
	VCTyX7d/tqmHaYmdchKc15O8MkLBL/OCg7ORAjv8FVyoLVc4S8RFQIFh6O6gBrKGd/fndx/CM3+9e
	axyMiAOszuwIxObYnglw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCq2E-0006EM-9g; Tue, 24 Sep 2019 18:59:38 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCq20-0006Ch-19
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 18:59:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id t14so1382370pgs.3
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 11:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=S+NemDcyACE9qaE3AzZLyHri3U+LN0BbGdBBWP83xAQ=;
 b=C6+uN6EFptObBbReMx4otiZx5Z/xanbuyya/+Ka+EGaS1zvrzaICMGr1kf+Ke7gRpV
 PfQEj9G8xcA/t+Lqa7K71ZZ2bZOFxa7t6+gjOcc7MLayuBgYzbf/NUPAdFUEPH6PGn7n
 zpMaKwedE7HVNxymY+ZW7OR99yVBPJAXmjiR4xd4zHCObJuFL6e1foJNWo39kraazHHo
 fBoSH0k/r1oAbb3XqOfsq/2CUhpHAs47LcxEahsSFrCYlWrm6ICUE8YNl9ZJfU/IDm1Q
 v2N5MmSucHAsNvjrf9ivzpewivzKVtxO9zL+AbUZdMfpQUqTr1zU4YbYltuFYNLCh4R9
 pYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=S+NemDcyACE9qaE3AzZLyHri3U+LN0BbGdBBWP83xAQ=;
 b=TspdXG1j9/JODZJL/b0vVdH/19hdbCxzEaFUCxXRtBO62T96/z37utPyCidblStdKi
 qZirt5h6/wZzuQR801k7HqgnCZTkRviWGrcfcY63rgJMVgfdzV4TMWnnA6wA0x2giM/x
 Z2UA0hr/XKXnT7uWKwzFIoYNYvXKfeJ6AFLjiwJsW7vTPoBDBizhlFyshikpq3x/QoA3
 IAm50fuIMmMXNIl3kwiIlgbB1hOGLdglBexianawPvF5IPv5OoN4SdE/ScljrA/YV6RJ
 78jquZFPmjNkB5rcscOPykLGyUgYUBNANwMwcBUAzsVGMZUhDNoY/gqAoxDYK4OXgnbz
 k/3g==
X-Gm-Message-State: APjAAAVxqmWN3C/o7j80oPSJejlKi5phtKV3F5cu8/VsspyplGVx05QR
 1792cxn34pyOLUGl8e4/i7r24w==
X-Google-Smtp-Source: APXvYqwBoEwDBTyuhiKLpoZslSVm3448hn+4VMKYnLGOo9+/IWR6JjsrRaebH1qxvZxp8hANK6Y9FQ==
X-Received: by 2002:aa7:8e55:: with SMTP id d21mr4895272pfr.241.1569351563237; 
 Tue, 24 Sep 2019 11:59:23 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 69sm3370025pfb.145.2019.09.24.11.59.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 11:59:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, lorenzo.pieralisi@arm.com,
 kishon@ti.com, bhelgaas@google.com, andrew.murray@arm.com
Subject: Re: [PATCH v2 0/6] arm64: dts: meson-g12: add support for PCIe
In-Reply-To: <20190916125022.10754-1-narmstrong@baylibre.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
Date: Tue, 24 Sep 2019 11:59:21 -0700
Message-ID: <7h4l117c6u.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_115924_233720_19AE1DC1 
X-CRM114-Status: GOOD (  12.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: gouwa@khadas.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-pci@vger.kernel.org, nick@khadas.com, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, repk@triplefau.lt, maz@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patchset :
> - updates the Amlogic PCI bindings for G12A
> - reworks the Amlogic PCIe driver to make use of the
> G12a USB3+PCIe Combo PHY instead of directly writing in
> the PHY register
> - adds the necessary operations to the G12a USB3+PCIe Combo PHY driver
> - adds the PCIe Node for G12A, G12B and SM1 SoCs
> - adds the commented support for the S922X, A311D and S905D3 based
> VIM3 boards.
>
> The VIM3 schematic can be found at [1].
>
> This patchset is dependent on Remi's "Fix reset assertion via gpio descriptor"
> patch at [2].
>
> This patchset has been tested in a A311D VIM3 and S905D3 VIM3L using a
> 128Go TS128GMTE110S NVMe PCIe module.
>
> For indication, here is a bonnie++ run as ext4 formatted on the VIM3:
>      ------Sequential Output------ --Sequential Input- --Random-
>      -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
> Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP /sec %CP
>   4G 93865  99 312837  96 194487  23 102808  97 415501 21 +++++ +++
>
> and the S905D3 VIM3L version:
>      ------Sequential Output------ --Sequential Input- --Random-
>      -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
> Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
>   4G 52144  95 71766  21 47302  10 57078  98 415469  44 +++++ +++
>
> Changes since v1 at [3]:
>  - Collected Andrew's and Rob's Reviewed-by tags
>  - Added missing calls to phy_init/phy_exit
>  - Fixes has_shared_phy handling for MIPI clock
>  - Add comment in the DT concerning firmware setting the right properties
>  - Added SM1 Power Domain to PCIe node
>
> [1] https://docs.khadas.com/vim3/HardwareDocs.html
> [2] https://patchwork.kernel.org/patch/11125261/
> [3] https://patchwork.kernel.org/cover/11136927/
>
> Neil Armstrong (6):
>   dt-bindings: pci: amlogic,meson-pcie: Add G12A bindings
>   PCI: amlogic: Fix probed clock names
>   PCI: amlogic: meson: Add support for G12A
>   phy: meson-g12a-usb3-pcie: Add support for PCIe mode
>   arm64: dts: meson-g12a: Add PCIe node
>   arm64: dts: khadas-vim3: add commented support for PCIe

Queued the "arm64: dts" patches for v5.5,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
